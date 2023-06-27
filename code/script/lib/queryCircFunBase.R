queryCircFunBase <- function(annotation_circRNA,DEG_circRNA){
  
  circRNA_annotated <- annotation_circRNA$circRNA
  
  circRNA_DEG <- DEG_circRNA$genes
  
  circRNA_common <- intersect(circRNA_annotated,circRNA_DEG)
  
  list <- lapply(circRNA_common, function(x){
    
    filename <- paste0("http://bis.zju.edu.cn/CircFunBase/Api/Public/circfunapi/?service=CircRNA.getinfo&circRNAname=",x)
    res = GET(filename)
    data = fromJSON(rawToChar(res$content))
    miR <- data$data$data$Interaction$miRNA
    
    if(length(miR) == 0 ) miR <- NA
    
    df <- data.frame(circRNA = x, miR = miR)
    
  })
  
  df <- rbindlist(list)
  df <- df[complete.cases(df),] # remove NA

  return(df)
  
}

