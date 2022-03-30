library(dplyr)
library(reaxl)
library(data.table)
library(mcr)

ca125 <- read.table("ca125_normal.txt", header=T)
ca125 %>% head()
str(ca125)

shapiro.test(ca125$Serum)
shapiro.test(ca125$K3EDTA)
shapiro.test(ca125$Na.He)
shapiro.test(ca125$Li.He)


ca125_edta_pbreg <- mcreg(ca125$Serum, ca125$K3EDTA, method.reg = "PaBa", mref.name = "Serum", mtest.name ="Plasma_1" ,na.rm = TRUE)

ca125_edta_pbreg@para

ca125_na_pbreg <- mcreg(ca125$Serum, ca125$Na.He, method.reg="PaBa",
                          mref.name = "Serum", mtest.name = "Plasma_1", na.rm = TRUE)

ca125_na_pbreg@para

ca125_Li_pbreg <- mcreg(ca125$Serum, ca125$Li.He, method.reg="PaBa",
                          mref.name = "Serum", mtest.name = "Plasma_1", na.rm = TRUE)

ca125_Li_pbreg@para
