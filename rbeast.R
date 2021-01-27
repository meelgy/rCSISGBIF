
library(tidyverse)
library(readxl)
library(writexl)


#读取红色名录兽类beast，提取物种、科列
beast <- read_xlsx("E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlistVertebrate.xlsx",sheet="beast")
sbeast <- beast %>% 
  select(Specie,Family, cnSpecie,cnFamily,Status)

#读取物种分类信息taxo_list.csv,#提取物种分类主键、中文名、科、科名列
taxo_list <- readr::read_csv('E:\\LGY\\biodiversity\\CSIS\\CSIS_csv\\taxo_list.csv',col_types = "ccccccccccccccccccc")
staxo_list <- taxo_list  %>%
  select(CSP_CODE,NAME_CH,NAME_LA,FAMILY_CH,FAMILY_LA)

#连接红色名录兽类beast和物种分类表,获取主键CSP_CODE
redlist_sbeast <- sbeast %>%
  inner_join(staxo_list,c('Specie'='NAME_LA'))
#输出带CSP_CODE红色名录
write_csv(redlist_sbeast, "E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_sbeast.csv")

#连接红色名录兽类beast和物种分类表,获取物种名录没有的红色物种
redlist_usbeast <- sbeast %>%
  anti_join(staxo_list,c('Specie'='NAME_LA'))

#输出CSIS中没有的物种
write_csv(redlist_usbeast, "E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_usbeast.csv")

#统计匹配数量
count(redlist_sbeast)
count(redlist_usbeast)


#读取物种分布地点信息spec_dist.csv
spec_dist <- read_csv('E:\\LGY\\biodiversity\\CSIS\\CSIS_csv\\spec_dist.csv',col_types = "ccccccccc")
s_spec_dist <- spec_dist %>%
  select(CSP_CODE,LOC_CODE,INPUTYEAR)

#读取地点信息
loca_deta <- read_csv('E:\\LGY\\biodiversity\\CSIS\\CSIS_csv\\loca_deta.csv')
loca_deta

#红色物种分布坐标
redlist_sbeast_cood <- redlist_sbeast %>%
  select(CSP_CODE,Specie,cnSpecie,Status) %>%
  left_join(s_spec_dist,by = 'CSP_CODE') %>%
  left_join(loca_deta,by = 'LOC_CODE')

redlist_sbeast_cood
write_excel_csv(redlist_sbeast_cood,"E:\\LGY\\biodiversity\\CSIS\\ListChina\\redlist_sbeast_cood.csv")

