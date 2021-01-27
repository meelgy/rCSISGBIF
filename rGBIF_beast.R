library(tidyverse)
library(readxl)
library(writexl)

#读取RGBIF兽类beast
# bioChina <- readr::read_csv("E:\\GBIFGrid\\Merge_coordinates.csv")
# pbioChina <- bioChina %>%
#   select(species,decimalLatitude,decimalLongitude,stateProvince,locality,basisOfRecord,year,month,day)
# write_excel_csv(pbioChina,"E:\\GBIFGrid\\GBIFpro\\pbioChina.csv")

pbioChina <- readr::read_csv("E:\\GBIFGrid\\GBIFpro\\pbioChina.csv")

#分别提取CSIS中存在和不存在的beast
#不存在的beast，在GBIF中匹配
usCSISBeast <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_usbeast.csv')
usCSISBeast
GBIF_redlist_usCSISBeast <- usCSISBeast %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_usCSISBeast)

#存在的beast，在GBIF中匹配
sCSISBeast <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_sbeast.csv')
sCSISBeast
GBIF_redlist_sCSISBeast <- sCSISBeast %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_sCSISBeast)
#输出主要数据列
write_csv(GBIF_redlist_usCSISBeast,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_usCSISBeast.csv")
write_csv(GBIF_redlist_sCSISBeast,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_sCSISBeast.csv")


#分别提取CSIS中存在和不存在的bird
#不存在的bird，在GBIF中匹配
usCSISBird <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_usbird.csv')
usCSISBird
GBIF_redlist_usCSISBird <- usCSISBird %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_usCSISBird)

#存在的bird，在GBIF中匹配
sCSISBird <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_sbird.csv')
sCSISBird
GBIF_redlist_sCSISBird <- sCSISBird %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_sCSISBird)

#输出主要数据列
write_excel_csv(GBIF_redlist_usCSISBird,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_usCSISBird.csv")
write_excel_csv(GBIF_redlist_sCSISBird,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_sCSISBird.csv")

#分别提取CSIS中存在和不存在的fish
#不存在的fish，在GBIF中匹配
usCSISfish <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_usfish.csv')
usCSISfish
GBIF_redlist_usCSISfish <- usCSISfish %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_usCSISfish)

#存在的fish，在GBIF中匹配
sCSISfish <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_sfish.csv')
GBIF_redlist_sCSISfish <- sCSISfish %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_sCSISfish)
#输出主要数据列
write_csv(GBIF_redlist_usCSISfish,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_usCSISfish.csv")
write_csv(GBIF_redlist_sCSISfish,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_sCSISfish.csv")

#分别提取CSIS中存在和不存在的reptile
#不存在的reptile，在GBIF中匹配
usCSISreptile <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_usreptile.csv')
usCSISreptile
GBIF_redlist_usCSISreptile <- usCSISreptile %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_usCSISreptile)

#存在的reptile，在GBIF中匹配
sCSISreptile <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_sreptile.csv')
GBIF_redlist_sCSISreptile <- sCSISreptile %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_sCSISreptile)
#输出主要数据列
write_csv(GBIF_redlist_usCSISreptile,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_usCSISreptile.csv")
write_csv(GBIF_redlist_sCSISreptile,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_sCSISreptile.csv")

#分别提取CSIS中存在和不存在的amphibian
#不存在的amphibian，在GBIF中匹配
usCSISamphibian <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_usamphibian.csv')
usCSISamphibian
GBIF_redlist_usCSISamphibian <- usCSISamphibian %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_usCSISamphibian)

#存在的amphibian，在GBIF中匹配
sCSISamphibian <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_samphibian.csv')
GBIF_redlist_sCSISamphibian <- sCSISamphibian %>%
  inner_join(pbioChina,c('Specie' ="species"))
count(GBIF_redlist_sCSISamphibian)
#输出主要数据列
write_csv(GBIF_redlist_usCSISamphibian,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_usCSISamphibian.csv")
write_csv(GBIF_redlist_sCSISamphibian,"E:\\GBIFGrid\\GBIFpro\\GBIF_redlist_sCSISamphibian.csv")
 
