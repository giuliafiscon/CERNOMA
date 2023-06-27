getFiltering <- function(data.preProcessed,N,M,paired,type,method,threshold_fc,threshold_pval_adj,biotype,filename_VolcanoPlot,filename_DEG){
  
  ########################################
  # input parameters
  
  data <- data.preProcessed$data
  data_control <- data.preProcessed$data_control
  data_case <- data.preProcessed$data_case
  
  IQR <- data.preProcessed$IQR
  perc_zeros <- data.preProcessed$perc_zeros
  ########################################
  
  logFC <- rowMeans(data_case) - rowMeans(data_control)
  
  if(type == "t.test"){
    pval <- apply(data, 1, function(data){
      t.test(data[1:N], data[(N+1):M], paired = paired)$p.value
    })
  }else{
    pval <- apply(data, 1, function(data){
      wilcox.test(data[1:N], data[(N+1):M], paired = paired)$p.value
    })
  }
  
  pval_adj <- p.adjust(pval, method = method)
  
  getVolcanoPlot(logFC,pval_adj,threshold_fc,threshold_pval_adj,biotype,filename_VolcanoPlot)
  ########################################

  ind_pval_adj <- which(pval_adj > threshold_pval_adj)
  
  if(length(ind_pval_adj) > 0){
    
    data  <- data[-ind_pval_adj,]
    data_control <- data_control[-ind_pval_adj,]
    data_case <- data_case[-ind_pval_adj,]
    
    IQR <- IQR[-ind_pval_adj]
    perc_zeros <- perc_zeros[-ind_pval_adj]
    logFC <- logFC[-ind_pval_adj]
    pval <- pval[-ind_pval_adj]
    pval_adj <- pval_adj[-ind_pval_adj]
    
  }
  ########################################

  ind_logfc <- which(abs(logFC) <= log2(threshold_fc))
  
  if(length(ind_logfc) > 0){
    
    data  <- data[-ind_logfc,]
    data_control <- data_control[-ind_logfc,]
    data_case <- data_case[-ind_logfc,]
    
    IQR <- IQR[-ind_logfc]
    perc_zeros <- perc_zeros[-ind_logfc]
    logFC <- logFC[-ind_logfc]
    pval <- pval[-ind_logfc]
    pval_adj <- pval_adj[-ind_logfc]
    
  }
  ########################################
  
  genes <- row.names(data)
  
  if(biotype == "RNA") genes <- getSymbol_Ensembl(genes)

  df_stat <- data.frame(IQR = IQR,
                        perc_zeros = perc_zeros,
                        logFC = logFC,
                        pval = pval,
                        pval_adj = pval_adj,
                        row.names = NULL)
  
  df_stat <- cbind(genes,df_stat)
  
  write.table(df_stat, filename_DEG, row.names = F, col.names = T, sep = "\t", quote = F)
  
  res <- list(data = data,
              data_control = data_control,
              data_case = data_case,
              df_stat = df_stat)
  
  return(res)
  
}