rm(list=ls())

options(stringsAsFactors = F)

setwd("~/CERNOMA/code")
######################################
source("script/getLibrary.R")
source("script/getSource.R")
######################################
getLibrary()
getSource()
input_parameter <- config()
input_file <- inputFile()
output_file <- outputFile()
######################################

DEG_RNA <- ExploratoryDataAnalysis("RNA",computeLog = TRUE)
DEG_miR <- ExploratoryDataAnalysis("miRNA",computeLog = TRUE)
DEG_circRNA <- ExploratoryDataAnalysis("circRNA",computeLog = FALSE)

net <- NetworkBuilding()
