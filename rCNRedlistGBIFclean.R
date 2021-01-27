library(tidyverse)
library(readxl)
library(writexl)

#GBIF数据清理，将坐标系重复的同类物种点去掉
#读取GBIF中匹配的两类beast红色名录
sBeast <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_sCSISBeast.csv", col_types = 'cccccccccddddcccccddd')
usBeast <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_usCSISBeast.csv",col_types = 'cccccddddcccccddd')

#清理sBeast
# #获取发生记录为观测或者或活体标本
# soBeast <- sBeast %>%
#    filter(
#      basisOfRecord ==  "HUMAN_OBSERVATION" |  basisOfRecord == "OBSERVATION" | 
#        basisOfRecord ==  "MACHINE_OBSERVATION" | basisOfRecord == "LIVING_SPECIMEN"
#      )
   
#兽类-获取Beast发生记录为1980年以来,CSIS有坐标及无坐标两种
ysBeast1980 <- sBeast %>%
  filter(
    year > 1980
  )
yusBeast1980 <- usBeast %>%
  filter(
    year > 1980
  )

#查看物种名、经度和纬度重复行（发生记录为1980年以来的）
ysBeast1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数
yusBeast1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数

#去重,y YEAR s selected us unselected d distinct
ysBeast1980d <- distinct(ysBeast1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)
yusBeast1980d <- distinct(yusBeast1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)

#将每个物种每个点的出现次数作为一列，添加进GBIF物种列表
#计算重复点物种、坐标重复次数
ysBeast1980_repeat <- ysBeast1980 %>%
     group_by(Specie,decimalLatitude,decimalLongitude) %>%
     summarise(speice_repeat = n())

yusBeast1980_repeat <- yusBeast1980 %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

#将出现次数连接GBIF物种列表
ysBeast1980c <- ysBeast1980d %>%
  inner_join(ysBeast1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))
yusBeast1980c <- yusBeast1980d %>%
  inner_join(yusBeast1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))

#输出清理后的GBIF east红色名录
write_excel_csv(ysBeast1980c,"E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISBeast.csv")
write_csv(yusBeast1980c,"E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISBeast.csv")

#鸟类-读取GBIF中匹配的两类Bird红色名录
sBird <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_sCSISBird.csv", col_types = 'cccccccccddddcccccddd')
usBird <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_usCSISBird.csv",col_types = 'cccccddddcccccddd')

#获取Bird发生记录为1980年以来,CSIS有坐标及无坐标两种
ysBird1980 <- sBird %>%
  filter(
    year > 1980
  )
yusBird1980 <- usBird %>%
  filter(
    year > 1980
  )

#查看物种名、经度和纬度重复行（发生记录为1980年以来的）
ysBird1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数
yusBird1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数

#去重,y YEAR s selected us unselected d distinct
ysBird1980d <- distinct(ysBird1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)
yusBird1980d <- distinct(yusBird1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)

#将每个物种每个点的出现次数作为一列，添加进GBIF物种列表
#计算重复点物种、坐标重复次数
ysBird1980_repeat <- ysBird1980 %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

yusBird1980_repeat <- yusBird1980 %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

#将出现次数连接GBIF物种列表
ysBird1980c <- ysBird1980d %>%
  inner_join(ysBird1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))
yusBird1980c <- yusBird1980d %>%
  inner_join(yusBird1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))

#输出清理后的GBIF east红色名录
write_excel_csv(ysBird1980c,"E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISBird.csv")
write_csv(yusBird1980c,"E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISBird.csv")


#鱼类-读取GBIF中匹配的两类fish红色名录
sfish <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_sCSISfish.csv", col_types = 'cccccccccddddcccccddd')
usfish <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_usCSISfish.csv",col_types = 'cccccddddcccccddd')

#清理sfish
# #获取发生记录为观测或者或活体标本
# sofish <- sfish %>%
#    filter(
#      basisOfRecord ==  "HUMAN_OBSERVATION" |  basisOfRecord == "OBSERVATION" | 
#        basisOfRecord ==  "MACHINE_OBSERVATION" | basisOfRecord == "LIVING_SPECIMEN"
#      )

#获取fish发生记录为1980年以来,CSIS有坐标及无坐标两种
ysfish1980 <- sfish %>%
  filter(
    year > 1980
  )
yusfish1980 <- usfish %>%
  filter(
    year > 1980
  )

#查看物种名、经度和纬度重复行（发生记录为1980年以来的）
ysfish1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数
yusfish1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数

#去重,y YEAR s selected us unselected d distinct
ysfish1980d <- distinct(ysfish1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)
yusfish1980d <- distinct(yusfish1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)

#将每个物种每个点的出现次数作为一列，添加进GBIF物种列表
#计算重复点物种、坐标重复次数
ysfish1980_repeat <- ysfish1980 %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

yusfish1980_repeat <- yusfish1980 %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

#将出现次数连接GBIF物种列表
ysfish1980c <- ysfish1980d %>%
  inner_join(ysfish1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))
yusfish1980c <- yusfish1980d %>%
  inner_join(yusfish1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))

#输出清理后的GBIF east红色名录
write_excel_csv(ysfish1980c,"E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISfish.csv")
write_csv(yusfish1980c,"E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISfish.csv")

#两栖类：读取GBIF中匹配的两类amphibian红色名录
samphibian<- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_sCSISamphibian.csv", col_types = 'cccccccccddddcccccddd')
usamphibian<- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_usCSISamphibian.csv",col_types = 'cccccddddcccccddd')

#获取amphibian发生记录为1980年以来,CSIS有坐标及无坐标两种
ysamphibian1980 <- samphibian%>%
  filter(
    year > 1980
  )
yusamphibian1980 <- usamphibian%>%
  filter(
    year > 1980
  )

#两栖类-查看物种名、经度和纬度重复行（发生记录为1980年以来的）
ysamphibian1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数
yusamphibian1980 %>%
  distinct(Specie,decimalLatitude,decimalLongitude) %>%
  glimpse() %>%
  anyDuplicated()  # 查看重复行数

#去重,y YEAR s selected us unselected d distinct
ysamphibian1980d <- distinct(ysamphibian1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)
yusamphibian1980d <- distinct(yusamphibian1980, Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)

#将每个物种每个点的出现次数作为一列，添加进GBIF物种列表
#计算重复点物种、坐标重复次数
ysamphibian1980_repeat <- ysamphibian1980 %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

yusamphibian1980_repeat <- yusamphibian1980 %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

#将出现次数连接GBIF物种列表
ysamphibian1980c <- ysamphibian1980d %>%
  inner_join(ysamphibian1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))
yusamphibian1980c <- yusamphibian1980d %>%
  inner_join(yusamphibian1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))

#输出清理后的GBIF east红色名录
write_excel_csv(ysamphibian1980c,"E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISamphibian.csv")
write_csv(yusamphibian1980c,"E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISamphibian.csv")


#爬行类：读取GBIF中匹配的两类reptile红色名录
sreptile <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_sCSISreptile.csv", col_types = 'cccccccccddddcccccddd')
usreptile <- readr::read_csv("E:/GBIFGrid/GBIFpro/GBIF_redlist_usCSISreptile.csv",col_types = 'cccccddddcccccddd')

#去重,y YEAR s selected us unselected d distinct
ysreptile1980d <- distinct(filter(sreptile,year > 1980), Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)
yusreptile1980d <- distinct(filter(usreptile,year > 1980), Specie,decimalLatitude,decimalLongitude,.keep_all = TRUE)

#将每个物种每个点的出现次数作为一列，添加进GBIF物种列表
#计算重复点物种、坐标重复次数
ysreptile1980_repeat <- filter(sreptile,year > 1980) %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n()) 

yusreptile1980_repeat <- filter(usreptile,year > 1980) %>%
  group_by(Specie,decimalLatitude,decimalLongitude) %>%
  summarise(speice_repeat = n())

#将出现次数连接GBIF物种列表
ysreptile1980c <- ysreptile1980d %>%
  inner_join(ysreptile1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))
yusreptile1980c <- yusreptile1980d %>%
  inner_join(yusreptile1980_repeat,by=c("Specie","decimalLatitude","decimalLongitude"))

#输出清理后的GBIF east红色名录
write_excel_csv(ysreptile1980c,"E:/GBIFGrid/GBIFpro/ys1980c_GBIF_redlist_sCSISreptile.csv")
write_csv(yusreptile1980c,"E:/GBIFGrid/GBIFpro/yus1980c_GBIF_redlist_usCSISreptile.csv")



