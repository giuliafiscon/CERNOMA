ExploratoryDataAnalysis <- function(biotype,computeLog){
  
  ########################################
  # input parameters
  
  correction_method <- input_parameter$correction_method
  
  if(biotype == "RNA"){
    
    data <- input_file$data_RNA
    control <- input_file$control_RNA
    case <- input_file$case_RNA
    
    threshold_prc_iqr <- input_parameter$threshold_prc_iqr_RNA
    threshold_perc_zeros <- input_parameter$threshold_perc_zeros_RNA
    threshold_fc <- input_parameter$threshold_fc_RNA
    threshold_pval_adj <- input_parameter$threshold_pval_adj_RNA
    paired <- input_parameter$paired_test_RNA
    type <-  input_parameter$test_type_RNA
    
    filename_DEG <- output_file$filename_DEG_RNA
    
    filename_VolcanoPlot <- output_file$filename_volcanoPlot_RNA
    filename_heatmap <- output_file$filename_heatmap_RNA
    
  }else if(biotype == "miRNA"){
    
    data <- input_file$data_miR
    control <- input_file$control_miR
    case <- input_file$case_miR
    
    threshold_prc_iqr <- input_parameter$threshold_prc_iqr_miR
    threshold_perc_zeros <- input_parameter$threshold_perc_zeros_miR
    threshold_fc <- input_parameter$threshold_fc_miR
    threshold_pval_adj <- input_parameter$threshold_pval_adj_miR
    paired <- input_parameter$paired_test_miR
    type <-  input_parameter$test_type_miR
    
    filename_DEG <- output_file$filename_DEG_miR
    
    filename_VolcanoPlot <- output_file$filename_volcanoPlot_miR
    filename_heatmap <- output_file$filename_heatmap_miR
    
  }else if(biotype == "circRNA"){
    
    data <- input_file$data_circRNA
    control <- input_file$control_circRNA
    case <- input_file$case_circRNA
    
    threshold_prc_iqr <- input_parameter$threshold_prc_iqr_circRNA
    threshold_perc_zeros <- input_parameter$threshold_perc_zeros_circRNA
    threshold_fc <- input_parameter$threshold_fc_circRNA
    threshold_pval_adj <- input_parameter$threshold_pval_adj_circRNA
    paired <- input_parameter$paired_test_circRNA
    type <-  input_parameter$test_type_circRNA
    
    filename_DEG <- output_file$filename_DEG_circRNA
    
    filename_VolcanoPlot <- output_file$filename_volcanoPlot_circRNA
    filename_heatmap <- output_file$filename_heatmap_circRNA
    
  }
  ########################################
  
  M <- ncol(data)
  N <- length(control)
  
  res_data <- getLogData(data,N,M,computeLog)
  
  data.preProcessed <- getPreprocessing(res_data,threshold_prc_iqr,threshold_perc_zeros,biotype)
  
  data.Filtered <- getFiltering(data.preProcessed,N,M,paired,type,
                                correction_method,threshold_fc,threshold_pval_adj,
                                biotype,filename_VolcanoPlot,filename_DEG)
  
  DEG <- data.Filtered$df_stat
  
  getHeatmap(data.Filtered,filename_heatmap,biotype)
  
  return(DEG)
  
}