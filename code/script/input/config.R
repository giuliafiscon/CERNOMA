config <- function(){
  
  #################################
  # input files
  
  disease <- "BRCA"
  
  #path <- paste0("G:/Il mio Drive/Giulia-Fede/MATRICI_TCGA_2021/",disease,"/")
  path <- paste0("input/dataset/",disease,"/")
  
  filename_data_RNA <- paste0(path,"matrix/matrix_RNAseq_BRCA.txt")
  filename_data_miR <- paste0(path,"matrix/matrix_miRNAseq_BRCA.txt")
  
  filename_list_RNA_CTRL <- paste0(path,"list/List_Normal_BRCA_RNAseq_4wayData.txt")
  filename_list_miR_CTRL <- paste0(path,"list/List_Normal_BRCA_miRNAseq_4wayData.txt")
  filename_list_RNA_CASE <- paste0(path,"list/List_Tumor_BRCA_RNAseq_4wayData.txt")
  filename_list_miR_CASE <- paste0(path,"list/List_Tumor_BRCA_miRNAseq_4wayData.txt")
  
  filename_annotation_circRNA <- paste0("input/Homo_sapiens_circ.txt")
  
  #################################
  # input parameters
  
  correction_method <- "fdr"
  
  # RNA
  threshold_prc_iqr_RNA <- 0.1
  threshold_perc_zeros_RNA <- 75
  threshold_fc_RNA <- 3
  threshold_pval_adj_RNA <- 0.05
  paired_test_RNA <- T 
  test_type_RNA <- "t.test"

  # miRNA
  threshold_prc_iqr_miR <- 0.1
  threshold_perc_zeros_miR <- 75
  threshold_fc_miR <- 1.5
  threshold_pval_adj_miR <- 0.05
  paired_test_miR <- T 
  test_type_miR <- "t.test"
  
  # circRNA
  GEOseries <- "GSE182471" # GEO accession number
  threshold_prc_iqr_circRNA <- 0.1
  threshold_perc_zeros_circRNA <- 75
  threshold_fc_circRNA <- 1.5
  threshold_pval_adj_circRNA <- 0.11
  paired_test_circRNA <- T
  test_type_circRNA <- "wilcoxon.test"
  #################################
  input_parameter <- list(disease = disease,
                          filename_data_RNA = filename_data_RNA,
                          filename_data_miR = filename_data_miR,
                          filename_list_RNA_CTRL = filename_list_RNA_CTRL,
                          filename_list_miR_CTRL = filename_list_miR_CTRL,
                          filename_list_RNA_CASE = filename_list_RNA_CASE,
                          filename_list_miR_CASE = filename_list_miR_CASE,
                          filename_annotation_circRNA = filename_annotation_circRNA,
                          correction_method = correction_method,
                          threshold_perc_zeros_RNA = threshold_perc_zeros_RNA,
                          threshold_prc_iqr_RNA = threshold_prc_iqr_RNA,
                          threshold_fc_RNA = threshold_fc_RNA,
                          threshold_pval_adj_RNA = threshold_pval_adj_RNA,
                          paired_test_RNA = paired_test_RNA,
                          test_type_RNA = test_type_RNA,
                          threshold_perc_zeros_miR = threshold_perc_zeros_miR,
                          threshold_prc_iqr_miR = threshold_prc_iqr_miR,
                          threshold_fc_miR = threshold_fc_miR,
                          threshold_pval_adj_miR = threshold_pval_adj_miR,
                          paired_test_miR = paired_test_miR,
                          test_type_miR = test_type_miR,
                          GEOseries = GEOseries,
                          threshold_perc_zeros_circRNA = threshold_perc_zeros_circRNA,
                          threshold_prc_iqr_circRNA = threshold_prc_iqr_circRNA,
                          threshold_fc_circRNA = threshold_fc_circRNA,
                          threshold_pval_adj_circRNA = threshold_pval_adj_circRNA,
                          paired_test_circRNA = paired_test_circRNA,
                          test_type_circRNA = test_type_circRNA)

  return(input_parameter)
  
}