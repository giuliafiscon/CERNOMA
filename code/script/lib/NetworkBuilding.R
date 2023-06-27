NetworkBuilding <- function(){
  
  ##########################################################
  # input
  
  annotation_circRNA <- input_file$annotation_circRNA
  
  filename_network <- output_file$filename_network
  filename_network_miR_target <- output_file$filename_network_miR_target
  filename_attribute <- output_file$filename_attribute
  ##########################################################
  
  miR_circRNA_target <- queryCircFunBase(annotation_circRNA,DEG_circRNA)
  miR_mRNA_target <- queryTargetScan()
  
  df <- merge(miR_circRNA_target,miR_mRNA_target, by = "miR")
  
  net <- merge(df, DEG_RNA, by.x = "mRNA", by.y = "geneSymbol")
  net <- net[,c("mRNA","ensemblGeneID","miR","circRNA","logFC","pval","pval_adj")]
  colnames(net) <- c("mRNA_geneSymbol","mRNA_ensemblGeneID","miR","circRNA","logFC_mRNA","pval_mRNA","pval_adj_mRNA")
  
  net <- merge(net, DEG_miR, by.x = "miR", by.y = "genes")
  net <- net[,c("mRNA_geneSymbol","mRNA_ensemblGeneID","miR","circRNA",
                "logFC_mRNA","pval_mRNA","pval_adj_mRNA",
                "logFC","pval","pval_adj")]
  colnames(net) <- c("mRNA_geneSymbol","mRNA_ensemblGeneID","miR","circRNA",
                     "logFC_mRNA","pval_mRNA","pval_adj_mRNA",
                     "logFC_miR","pval_miR","pval_adj_miR")
  
  net <- merge(net, DEG_circRNA, by.x = "circRNA", by.y = "genes")
  net <- net[,c("mRNA_geneSymbol","mRNA_ensemblGeneID","miR","circRNA",
                "logFC_mRNA","pval_mRNA","pval_adj_mRNA",
                "logFC_miR","pval_miR","pval_adj_miR",
                "logFC","pval","pval_adj")]
  colnames(net) <- c("mRNA_geneSymbol","mRNA_ensemblGeneID","miR","circRNA",
                     "logFC_mRNA","pval_mRNA","pval_adj_mRNA",
                     "logFC_miR","pval_miR","pval_adj_miR",
                     "logFC_circRNA","pval_circRNA","pval_adj_circRNA")
  
  net$direction_mRNA <- ifelse(net$logFC_mRNA>0,"UP","DOWN")
  net$direction_miR <- ifelse(net$logFC_miR>0,"UP","DOWN")
  net$direction_circRNA <- ifelse(net$logFC_circRNA>0,"UP","DOWN")
  
  ind <- which(net$direction_mRNA == net$direction_circRNA & net$direction_mRNA != net$direction_miR)
  net <- net[ind,]
  
  write.table(net, filename_network, row.names = F, col.names = T, quote = F, sep ="\t")
  ##########################################################
  # other network with: target node circRNA or mRNA, source node miR
  
  df1 <- net[,c("miR","mRNA_geneSymbol")]
  colnames(df1) <- c("source","target")
  
  df2 <- net[,c("miR","circRNA")]
  colnames(df2) <- c("source","target")
  
  net_miR_target <- unique(rbind(df1,df2))
  
  write.table(net_miR_target, filename_network_miR_target, row.names = F, col.names = T, quote = F, sep ="\t")
  ##########################################################
  
  attribute_mRNA <- unique(data.frame(node = net$mRNA_geneSymbol, biotype = "mRNA", 
                                      logFC = net$logFC_mRNA, 
                                      pval = net$pval_mRNA, 
                                      pval_adj = net$pval_adj_mRNA))
  
  attribute_miR <- unique(data.frame(node = net$miR, biotype = "miRNA", 
                                     logFC = net$logFC_miR, 
                                     pval = net$pval_miR, 
                                     pval_adj = net$pval_adj_miR))
  
  attribute_circ <- unique(data.frame(node = net$circRNA, biotype = "circRNA", 
                                      logFC = net$logFC_circRNA, 
                                      pval = net$pval_circRNA, 
                                      pval_adj = net$pval_adj_circRNA))
  
  attribute <- rbind(attribute_circ,attribute_miR,attribute_mRNA)
  
  write.table(attribute, filename_attribute, row.names = F, col.names = T, quote = F, sep ="\t")
  ##########################################################
  
  return(net)
  
}
  
  
 

  