queryGEO <- function(series){
  
  readr::local_edition(1)
  ###########################
  tmp <- getGEO(GEO = series)
  
  set <- tmp[[1]]
  
  pData <- phenoData(set)
  metadata <- pData@data
  
  aData <- assayData(set)
  matrix <- data.frame(aData$exprs)
  
  annotation <- fData(set)
  
  circRNA <- annotation$circRNA
  
  matrix <- matrix[annotation$ID,]
  row.names(matrix) <- circRNA
  ###########################
  list <- split(metadata[,c("geo_accession","source_name_ch1")],
                metadata$source_name_ch1)
  
  normal <- list$`adjacent non-tumor tissue`
  tumor <- list$`breast cancer tissue`
  
  normal <- normal[,"geo_accession"]
  tumor <- tumor[,"geo_accession"]
  
  data <- matrix[,c(normal,tumor)]
  
  ###########################
  # Remove dowloaded data
  unlink(series, recursive = TRUE)
  
  res <- list(data = data,
              case = tumor,
              control = normal)
  
  return(res)
}