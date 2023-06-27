getLogData <- function(data,N,M,computeLog){
  
  if(computeLog == TRUE){
    data <- log2(data + 1)
  }
  
  data_control <- data[,1:N]
  data_case <- data[,(N+1):M]
  
  res_data <- list(data = data,
               data_control = data_control,
               data_case = data_case)
  
  return(res_data)
  
}