getPreprocessing <- function(res_data,threshold_prc_iqr,threshold_perc_zeros,biotype){
  
  ########################################
  # input parameters
  
  data <- res_data$data
  data_control <- res_data$data_control
  data_case <- res_data$data_case
  ########################################
  
  IQR <- apply(data,1,IQR,type=5)
  
  perc_zeros <- apply(data, 1, function(x){ length(which(x == 0)) / length(x) * 100 })
  
  threshold_iqr <- quantile(IQR,threshold_prc_iqr)
  
  getHistogram(IQR,threshold_iqr,biotype,"Interquartile Range (IQR)")
  
  getScatterPlot(IQR,perc_zeros,threshold_prc_iqr,threshold_perc_zeros,biotype)
  ########################################
  
  ind_iqr <- which(IQR <= threshold_iqr)
  
  if(length(ind_iqr) > 0){
    
    data  <- data[-ind_iqr,]
    data_control <- data_control[-ind_iqr,]
    data_case <- data_case[-ind_iqr,]
    
    IQR <- IQR[-ind_iqr]
    perc_zeros <- perc_zeros[-ind_iqr]
    
  }
  ########################################
  
  ind_perc_zeros <- which(perc_zeros > threshold_perc_zeros)
  
  if(length(ind_perc_zeros) > 0){
    
    data  <- data[-ind_perc_zeros,]
    data_control <- data_control[-ind_perc_zeros,]
    data_case <- data_case[-ind_perc_zeros,]
    
    IQR <- IQR[-ind_perc_zeros]
    perc_zeros <- perc_zeros[-ind_perc_zeros]
    
  }
  ########################################
  
  res <- list(data = data,
              data_control = data_control,
              data_case = data_case,
              IQR = IQR, 
              perc_zeros = perc_zeros)
  
  return(res)
  
}