outputFile <- function(){
  
  ########################################
  # input parameter
  
  disease <- input_parameter$disease
  
  output_dir <- outputDir(disease)
  ########################################
  # output directories
  
  dirTxt<- output_dir$dirTxt
  dirFigure <- output_dir$dirFigure
  ########################################
  # output files
  
  filename_DEG_RNA <- paste0(dirTxt,"DEG_RNA.txt")
  filename_DEG_miR <- paste0(dirTxt,"DEG_miRNA.txt")
  filename_DEG_circRNA <- paste0(dirTxt,"DEG_circRNA.txt")
  filename_network <- paste0(dirTxt,"network.txt")
  filename_network_miR_target <- paste0(dirTxt,"network_miR_target.txt")
  filename_attribute <- paste0(dirTxt,"attribute.txt")
  
  filename_volcanoPlot_RNA <- paste0(dirFigure,"VolcanoPlot_RNA.pdf")
  filename_volcanoPlot_miR <- paste0(dirFigure,"VolcanoPlot_miRNA.pdf")
  filename_volcanoPlot_circRNA <- paste0(dirFigure,"VolcanoPlot_circRNA.pdf")
  
  filename_heatmap_RNA <- paste0(dirFigure,"heatmap_RNA.pdf")
  filename_heatmap_miR <- paste0(dirFigure,"heatmap_miRNA.pdf")
  filename_heatmap_circRNA <- paste0(dirFigure,"heatmap_circRNA.pdf")
  ########################################
  
  output_file <- list(filename_DEG_RNA = filename_DEG_RNA,
                      filename_DEG_miR = filename_DEG_miR,
                      filename_DEG_circRNA = filename_DEG_circRNA,
                      filename_network = filename_network,
                      filename_network_miR_target = filename_network_miR_target,
                      filename_attribute = filename_attribute,
                      filename_volcanoPlot_RNA = filename_volcanoPlot_RNA,
                      filename_volcanoPlot_miR = filename_volcanoPlot_miR,
                      filename_volcanoPlot_circRNA = filename_volcanoPlot_circRNA,
                      filename_heatmap_RNA = filename_heatmap_RNA,
                      filename_heatmap_miR = filename_heatmap_miR,
                      filename_heatmap_circRNA = filename_heatmap_circRNA)
  
  return(output_file)
  
}



