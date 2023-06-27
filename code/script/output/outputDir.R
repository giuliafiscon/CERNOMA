outputDir <- function(disease){
  
  ########################################
  dirRes <- "../Results/"
  if(!file.exists(dirRes)){
    dir.create(dirRes, showWarnings = F)
  }
  
  dirDataset <- paste0(dirRes,"dataset/")
  if(!file.exists(dirDataset)){
    dir.create(dirDataset, showWarnings = F)
  }
  
  dirDisease <- paste0(dirDataset,disease,"/")
  if(!file.exists(dirDisease)){
    dir.create(dirDisease, showWarnings = F)
  }
  ########################################
  # output
  
  dirTxt <- paste0(dirDisease,"txtFile/")
  if(!file.exists(dirTxt)){
    dir.create(dirTxt, showWarnings = F)
  }
  
  dirFigure <- paste0(dirDisease,"figure/")
  if(!file.exists(dirFigure)){
    dir.create(dirFigure, showWarnings = F)
  }
  ########################################
  
  output_directory <- list(dirTxt = dirTxt,
                           dirFigure = dirFigure)
  
  return(output_directory)
}
