
library(tidyverse)
library(readxl)
library(writexl)

# setwd('E:/LGY/biodiversity/CSIS/ListChina')
# myexcelfile = list.files(pattern = "*csv") 
# list2env(
#   lapply(setNames(myexcelfile, make.names(gsub("*_cood.csv$", "", myexcelfile))),
#          read_csv), envir = .GlobalEnv)  

#对CSIS数据进行提取,去除重复点的

##读取同一目录下的所有文件
path <- "E:/LGY/biodiversity/CSIS/ListChina"
fileNames <- dir(path,"*_cood.csv") 
filePath <- sapply(fileNames, function(x){ 
  paste(path,x,sep='/')})   

data <- lapply(filePath, function(x){
      distinct(filter(read_csv(x,col_names = TRUE),XVAL>0 & YVAL>0),
           CSP_CODE,Specie,cnSpecie,Status,YVAL,XVAL,INPUTYEAR)  
  })  

#批量输出文件
outPath <- "E:/LGY/biodiversity/CSIS/ListChina/clean" ##输出路径
out_fileName <- sapply(names(data),function(x){
  paste(x, sep='')}) ##csv格式
out_filePath  <- sapply(out_fileName, function(x){
  paste(outPath,x,sep='/')}) ##输出路径名
##输出文件
for(i in 1:length(data)){
  write_csv(data[[i]], file=out_filePath[i]) 
}

