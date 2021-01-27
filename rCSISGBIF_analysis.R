library(tidyverse)
library(readxl)
library(writexl)
library(ggplot2)
library(maps)
library(mapdata)


# Allamphibian <- read_csv("E:/LGY/biodiversity/CSIS/BIOChina/Allsamphibian.csv")
# 
# 
# nSpecie <- Allamphibian %>%
#   group_by(cnSpecie) %>%
#   summarise(n(),cnSpecie) %>%
#   distinct_all()
# 
# write_csv(nSpecie,"E:/LGY/biodiversity/CSIS/BIOChina/a_Allsamphibian.csv")

##读取同一目录下的所有文件
path <- "E:/LGY/biodiversity/CSIS/BIOChina"
fileNames <- dir(path,"*.csv") 
filePath <- sapply(fileNames, function(x){ 
  paste(path,x,sep='/')})   

data <- lapply(filePath, function(x){
  read_csv(x,col_names = TRUE) %>%
    group_by(cnSpecie) %>%
    summarise(n(),cnSpecie) %>%
    distinct_all()  
})  

#批量输出文件
outPath <- "E:/LGY/biodiversity/CSIS/BIOChina/a" ##输出路径
out_fileName <- sapply(names(data),function(x){
  paste(x, sep='')}) ##csv格式
out_filePath  <- sapply(out_fileName, function(x){
  paste(outPath,x,sep='/')}) ##输出路径名
##输出文件
for(i in 1:length(data)){
  write_csv(data[[i]], file=out_filePath[i]) 
}
