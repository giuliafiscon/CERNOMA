getSymbol_Ensembl <- function(genes){
  
  tmp <- lapply(genes, function(x){
    
    geneSymbol <- strsplit(x,"\\|")[[1]][1]
    
    ensemblGeneID <- strsplit(x,"\\|")[[1]][2]
    
    df <- data.frame(geneSymbol = geneSymbol, 
                     ensemblGeneID = ensemblGeneID)
  })
  
  df <- rbindlist(tmp)

  return(df)
  
}