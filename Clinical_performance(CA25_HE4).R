library(dplyr)
library(data.table)
library(readxl)
library(mcr)
library(ggplot2)

CA125 <- read_excel("ROMA_CA125.xlsx", sheet = 1)
HE4 <- read_excel("ROMA_HE4.xlsx", sheet = 1)

CA125_PB.reg <- mcreg(CA125$xdata,CA125$ydata, method.reg = "PaBa",
                      mref.name="Elecsys CA125 II (U/mL)",
                      mtest.name="PCLOK II CA125/HE4 (U/mL)", na.rm=TRUE)

CA125_PB.reg@para

MCResult.plot(CA125_PB.reg, equal.axis=TRUE, identity = TRUE,
              x.lab = "Elecsys CA125 II (U/mL)", y.lab = "PCLOK II CA125/HE4 (U/mL)", 
              points.col = "#FF7F5060", points.pch = 19, 
              ci.area = TRUE, ci.area.col = "#0000FF50", 
              main = "CA125", sub = "", 
              add.grid = FALSE, points.cex = 1)

includeLegend(place="topleft",models=list(CA125_PB.reg),
              colors=c("darkblue"), design="1", digits=2)


HE4_PB.reg <- mcreg(HE4$Roche,HE4$`PCLOK II`, mref.name="Elecsys HE4 (pmol/L)",
                    mtest.name="PCLOK II CA125/HE4 (pmol/L)", method.reg = "PaBa", 
                    na.rm=TRUE)

HE4_PB.reg@para

MCResult.plot(HE4_PB.reg, equal.axis = TRUE, identity = TRUE,
              x.lab = "Elecsys HE4 (pmol/L)", y.lab = "PCLOK II CA125/HE4 (pmol/L)", 
              points.col = "#FF7F5060", points.pch = 19, 
              ci.area = TRUE, ci.area.col = "#0000FF50", 
              main = "HE4", sub = "", add.grid = FALSE, points.cex = 1)

includeLegend(place="topleft",models=list(HE4_PB.reg),
              colors=c("darkblue"), design="1", digits=2)