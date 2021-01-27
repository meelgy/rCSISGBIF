

library(tidyverse)
library(readxl)
library(writexl)
library(ggplot2)

#读取GBIF中匹配的两类beast红色名录
GBIFsamphibian <- readr::read_csv("E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISamphibian.csv", col_types = 'cccccccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(CSP_CODE,Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) 

GBIFusamphibian <- readr::read_csv("E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISamphibian.csv",col_types = 'cccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) %>% 
  left_join(distinct(GBIFsamphibian,Specie),by="Specie") %>% 
  mutate(CSP_CODE="")

CSISamphibian <- readr::read_csv("E:/LGY/biodiversity/CSIS/ListChina/clean/redlist_samphibian_cood.csv", col_types = 'ccccddd') %>%
 rename(year = INPUTYEAR) %>% 
 left_join(distinct(GBIFsamphibian,Specie,Family,cnSpecie,cnFamily)) %>%
 mutate(gbifID="",month=0,day=0,speice_repeat=1)

Allsamphibian <-  rbind(GBIFsamphibian,GBIFusamphibian,CSISamphibian) %>%
  arrange(Family,Specie,Status) 

write_csv(Allsamphibian,"E:/LGY/biodiversity/CSIS/BIOChina/Allsamphibian.csv")

#图中显示amphibian 
Allsamphibian <- readr::read_csv('E:/LGY/biodiversity/CSIS/BIOChina/Allsamphibian.csv') 

bio_map <- map_data(Allsamphibian)
ggplot(Allsamphibian,aes(XVAL,YVAL)) +
  geom_point() +
  coord_fixed()

  