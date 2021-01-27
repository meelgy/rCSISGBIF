library(tidyverse)
library(readxl)
library(writexl)
library(ggplot2)
library(maps)
library(mapdata)


#读取GBIF中匹配的两类amphibian红色名录
GBIFsamphibian <- readr::read_csv("E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISamphibian.csv", col_types = 'cccccccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(CSP_CODE,Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) 
#读取GBIF中匹配的amphibian红色名录
GBIFusamphibian <- readr::read_csv("E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISamphibian.csv",col_types = 'cccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) %>% 
  left_join(distinct(GBIFsamphibian,Specie),by="Specie") %>% 
  mutate(CSP_CODE="")
#读取CSIS中匹配的amphibian红色名录
CSISamphibian <- readr::read_csv("E:/LGY/biodiversity/CSIS/ListChina/clean/redlist_samphibian_cood.csv", col_types = 'ccccddd') %>%
  rename(year = INPUTYEAR) %>% 
  left_join(distinct(GBIFsamphibian,Specie,Family,cnSpecie,cnFamily)) %>%
  mutate(gbifID="",month=0,day=0,speice_repeat=1)
#合并数据
Allsamphibian <-  rbind(GBIFsamphibian,GBIFusamphibian,CSISamphibian) %>%
  arrange(Family,Specie,Status) 
#输出amphibian
write_csv(Allsamphibian,"E:/LGY/biodiversity/CSIS/BIOChina/Allsamphibian.csv")


#读取GBIF中匹配的两类Beast红色名录
GBIFsBeast <- readr::read_csv("E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISBeast.csv", col_types = 'cccccccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(CSP_CODE,Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) 
#读取GBIF中匹配的Beast红色名录
GBIFusBeast <- readr::read_csv("E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISBeast.csv",col_types = 'cccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) %>% 
  left_join(distinct(GBIFsBeast,Specie),by="Specie") %>% 
  mutate(CSP_CODE="")
#读取CSIS中匹配的Beast红色名录
CSISBeast <- readr::read_csv("E:/LGY/biodiversity/CSIS/ListChina/clean/redlist_sBeast_cood.csv", col_types = 'ccccddd') %>%
  rename(year = INPUTYEAR) %>% 
  left_join(distinct(GBIFsBeast,Specie,Family,cnSpecie,cnFamily)) %>%
  mutate(gbifID="",month=0,day=0,speice_repeat=1)
#合并数据
AllsBeast <-  rbind(GBIFsBeast,GBIFusBeast,CSISBeast) %>%
  arrange(Family,Specie,Status) 
#输出Beast
write_csv(AllsBeast,"E:/LGY/biodiversity/CSIS/BIOChina/AllsBeast.csv")

#读取GBIF中匹配的两类Bird红色名录
GBIFsBird <- readr::read_csv("E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISBird.csv", col_types = 'cccccccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(CSP_CODE,Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) 
#读取GBIF中匹配的Bird红色名录
GBIFusBird <- readr::read_csv("E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISBird.csv",col_types = 'cccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) %>% 
  left_join(distinct(GBIFsBird,Specie),by="Specie") %>% 
  mutate(CSP_CODE="")
#读取CSIS中匹配的Bird红色名录
CSISBird <- readr::read_csv("E:/LGY/biodiversity/CSIS/ListChina/clean/redlist_sBird_cood.csv", col_types = 'ccccddd') %>%
  rename(year = INPUTYEAR) %>% 
  left_join(distinct(GBIFsBird,Specie,Family,cnSpecie,cnFamily)) %>%
  mutate(gbifID="",month=0,day=0,speice_repeat=1)
#合并数据
AllsBird <-  rbind(GBIFsBird,GBIFusBird,CSISBird) %>%
  arrange(Family,Specie,Status) 
#输出Bird
write_csv(AllsBird,"E:/LGY/biodiversity/CSIS/BIOChina/AllsBird.csv")

#读取GBIF中匹配的两类fish红色名录
GBIFsfish <- readr::read_csv("E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISfish.csv", col_types = 'cccccccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(CSP_CODE,Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) 
#读取GBIF中匹配的fish红色名录
GBIFusfish <- readr::read_csv("E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISfish.csv",col_types = 'cccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) %>% 
  left_join(distinct(GBIFsfish,Specie),by="Specie") %>% 
  mutate(CSP_CODE="")
#读取CSIS中匹配的fish红色名录
CSISfish <- readr::read_csv("E:/LGY/biodiversity/CSIS/ListChina/clean/redlist_sfish_cood.csv", col_types = 'ccccddd') %>%
  rename(year = INPUTYEAR) %>% 
  left_join(distinct(GBIFsfish,Specie,Family,cnSpecie,cnFamily)) %>%
  mutate(gbifID="",month=0,day=0,speice_repeat=1)
#合并数据
Allsfish <-  rbind(GBIFsfish,GBIFusfish,CSISfish) %>%
  arrange(Family,Specie,Status) 
#输出fish
write_csv(Allsfish,"E:/LGY/biodiversity/CSIS/BIOChina/Allsfish.csv")

#读取GBIF中匹配的两类reptile红色名录
GBIFsreptile <- readr::read_csv("E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISreptile.csv", col_types = 'cccccccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(CSP_CODE,Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) 
#读取GBIF中匹配的reptile红色名录
GBIFusreptile <- readr::read_csv("E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISreptile.csv",col_types = 'cccccddddcccccdddd') %>%
  rename(YVAL = decimalLatitude) %>%
  rename(XVAL = decimalLongitude) %>%
  select(Specie,Family,cnSpecie,cnFamily,Status,YVAL,XVAL,gbifID,year,month,day,speice_repeat) %>% 
  left_join(distinct(GBIFsreptile,Specie),by="Specie") %>% 
  mutate(CSP_CODE="")
#读取CSIS中匹配的reptile红色名录
CSISreptile <- readr::read_csv("E:/LGY/biodiversity/CSIS/ListChina/clean/redlist_sreptile_cood.csv", col_types = 'ccccddd') %>%
  rename(year = INPUTYEAR) %>% 
  left_join(distinct(GBIFsreptile,Specie,Family,cnSpecie,cnFamily)) %>%
  mutate(gbifID="",month=0,day=0,speice_repeat=1)
#合并数据
Allsreptile <-  rbind(GBIFsreptile,GBIFusreptile,CSISreptile) %>%
  arrange(Family,Specie,Status) 
#输出reptile
write_csv(Allsreptile,"E:/LGY/biodiversity/CSIS/BIOChina/Allsreptile.csv")

#图中显示amphibian 
bio_map <- map_data(Allsamphibian)
ggplot(Allsreptile,aes(XVAL,YVAL)) +
  geom_point() +
  coord_fixed()

