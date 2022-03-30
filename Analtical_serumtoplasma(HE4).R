library(dplyr)
library(readxl)
library(data.table)
library(mcr)
library(writexl)

install.packages("writexl")

he4 <- read.table("he4_normal.txt", header = T)
he4 %>% head(10)
str(he4)


he4_serum <- he4 %>% select(1)
he4_serum

shapiro.test(he4$Serum)
shapiro.test(he4$K3EDTA)
shapiro.test(he4$Na.He)
shapiro.test(he4$Li.He)

he4_edta_pbreg <- mcreg(he4$Serum, he4$K3EDTA, method.reg ='PaBa',
                        mref.name = "Serum", mtest.name = "Plasma_1",
                        na.rm=TRUE)
he4_edta_pbreg@para

he4_na_pbreg <- mcreg(he4$Serum, he4$Na.He, method.reg ='PaBa',
                        mref.name = "Serum", mtest.name = "Plasma_1",
                        na.rm=TRUE)
he4_na_pbreg@para

he4_Li_pbreg <- mcreg(he4$Serum, he4$Li.He, method.reg ='PaBa',
                      mref.name = "Serum", mtest.name = "Plasma_1",
                      na.rm=TRUE)
he4_Li_pbreg@para
