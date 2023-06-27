inputFile <- function(){
  
  ########################################
  # input parameters
  
  filename_data_RNA <- input_parameter$filename_data_RNA
  filename_list_RNA_CTRL <- input_parameter$filename_list_RNA_CTRL
  filename_list_RNA_CASE <- input_parameter$filename_list_RNA_CASE
  
  filename_data_miR <- input_parameter$filename_data_miR
  filename_list_miR_CTRL <- input_parameter$filename_list_miR_CTRL
  filename_list_miR_CASE <- input_parameter$filename_list_miR_CASE
  
  GEOseries <- input_parameter$GEOseries
  
  filename_annotation_circRNA <- input_parameter$filename_annotation_circRNA
  ########################################
  # RNA
  data_RNA <- data.frame(fread(filename_data_RNA, header = T, sep = '\t', quote = "", na.strings = c(NULL,"-")), 
                     check.names = F, row.names = 1)
  data_RNA[is.na(data_RNA)] <- 0
  
  control_RNA <- read.table(filename_list_RNA_CTRL, header = F, sep = '\t', check.names = F, quote = "")
  case_RNA <- read.table(filename_list_RNA_CASE, header = F, sep = '\t', check.names = F, quote = "")
  
  control_RNA <- control_RNA$V1
  case_RNA <- case_RNA$V1
  
  data_RNA <- data_RNA[,c(control_RNA,case_RNA)]
  
  # miR
  data_miR <- data.frame(fread(filename_data_miR, header = T, sep = '\t', quote = ""), check.names = F, row.names = 1)
  data_miR[is.na(data_miR)] <- 0
  
  control_miR <- read.table(filename_list_miR_CTRL, header = F, sep = '\t', check.names = F, quote = "")
  case_miR <- read.table(filename_list_miR_CASE, header = F, sep = '\t', check.names = F, quote = "")
  
  control_miR <- control_miR$V1
  case_miR <- case_miR$V1
  
  data_miR <- data_miR[,c(control_miR,case_miR)]
  
  # circRNA
  res_circRNA <- queryGEO(GEOseries)
  
  data_circRNA <- res_circRNA$data
  
  control_circRNA <- res_circRNA$control
  case_circRNA <- res_circRNA$case
  
  # annotation circRNA
  annotation_circRNA <- read.table(filename_annotation_circRNA, quote = "", header = T, sep = "\t", 
                                   check.names = F)
  
  ########################################
  input_file <- list(data_RNA = data_RNA,
                     control_RNA = control_RNA,
                     case_RNA = case_RNA,
                     data_miR = data_miR,
                     control_miR = control_miR,
                     case_miR = case_miR,
                     data_circRNA = data_circRNA,
                     control_circRNA = control_circRNA,
                     case_circRNA = case_circRNA,
                     annotation_circRNA = annotation_circRNA)
  
  return(input_file)
  
}