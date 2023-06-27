queryTargetScan <- function(){
  
  ##########################################################
  # Query miRBase
  
  fileURL <- "https://www.mirbase.org/ftp/CURRENT/mature.fa.zip"
  destfile <- "mature.fa.zip"
  download.file(fileURL, destfile, method="auto")
  unzip(destfile)
  
  fastaFile <- readRNAStringSet("mature.fa")
  
  ID <- unlist(lapply(names(fastaFile),function(x){strsplit(x," ")[[1]][1]}))
  sequence <- paste(fastaFile)
  
  ind <- grep('hsa-', ID)
  
  ID <- ID[ind]
  sequence <- sequence[ind]
  
  seed  <- sapply(sequence, function(x){substr(x, 2, 8)})
  
  miRBase <- data.frame(ID, seed, row.names = NULL)
  
  unlink("mature.fa", force = TRUE)
  file.remove(destfile)
  ##########################################################
  # Query TargetScan
  
  fileURL <- "http://www.targetscan.org/vert_72/vert_72_data_download/Summary_Counts.default_predictions.txt.zip"
  destfile <- "Summary_Counts.default_predictions.txt.zip"
  download.file(fileURL, destfile, method="auto")
  unzip(destfile)
  filename <- gsub(".zip", "", destfile)
  
  TargetScan <- read.table(filename, sep = "\t", header = T, quote = "", check.names = F)
  
  TargetScan <- TargetScan[grep('9606', TargetScan$`Species ID`), c('Gene Symbol', 'miRNA family')]
  TargetScan <- unique(TargetScan)
  rownames(TargetScan) <- NULL
  
  file.remove(destfile)
  file.remove(filename)
  ##########################################################
  
  df <- merge(TargetScan,miRBase, by.x  = "miRNA family", by.y = "seed", all = F)
  df <- df[,-1]
  colnames(df) <- c("mRNA","miR")
    
  return(df)
  
}