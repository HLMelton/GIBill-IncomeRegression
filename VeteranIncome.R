# This code and instructions on how to create the regression results can be found at the following
# https://github.com/HLMelton/GIBill-IncomeRegression

setwd("~/Documents/100W/Research Paper")

popData <- read.csv("100WRPDS1.csv")
popData <- data.frame(popData)

# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("car")
# install.packages("nlme")
# install.packages("mgcv")

library(dplyr)
library(ggplot2)
library(car)
library(nlme)
library(mgcv)

# Codebook: https://live.usa.datadownload.ipums.org/web/extracts/usa/2132789/usa_00017.cbk

preData <- filter(popData, YEAR < 2000)
summary(preData)

popData <- filter(popData, YEAR > 1990)
summary(popData)


# This line will define vetData as a filtered set of individuals with veteran status
vetData <- filter(popData, VETSTAT == "2")    #Refine by Veteran Status
vetData <- filter(vetData, SEX == 1)          #Filtering by Sex to normalize 
summary(vetData)

# This line will define civPopData as a filtered set of individuals who do not have veteran status
civData <- filter(popData, VETSTAT != "2")    #Filter by Non Veterans
civData <- filter(civData, SEX == 1)          #Filter by Gender
civData <- filter(civData, AGE > 17)          #Filter by Mature Age
civData <- filter(civData, INCTOT != 9999999) # Filter Extrenious Values
summary(civData)


## --Core R Plots-- NOTE: Slow to Load
# Not Used due to innefficiencies in generation
plot(vetData$INCTOT ~ vetData$AGE, data=vetData, pch=20, main="Veteran Age vs Income", xlab="Age", ylab="Income")
plot(civData$INCTOT ~ civData$AGE, data=civData, pch=20, col="#0073C2FF", main="Civilian Age vs Income", xlab="Age", ylab="Income")


## --GGPlot Graphs--
#Veteran Plot
ggplot(vetData, aes(AGE,INCTOT)) + geom_point(color="Blue") + coord_cartesian(ylim = c(0, 1200000)) + labs(title="Veteran Income",y="Income", x="Age")
ggplot(vetData, aes(AGE,INCTOT)) + geom_smooth() + coord_cartesian(ylim = c(0, 100000)) + labs(title="Veteran Income",y="Income", x="Age")

#Civilian Plot
ggplot(civData, aes(AGE, INCTOT)) + geom_point() + coord_cartesian(ylim=c(0,1200000)) + labs(title="Civilian Income",y="Income", x="Age")
ggplot(civData, aes(AGE, INCTOT)) + geom_smooth() + coord_cartesian(ylim=c(0,100000)) + labs(title="Civilian Income",y="Income", x="Age")

## --OLS Regressions--
# Civilian Regression
civRegression = lm(civData$INCTOT ~ civData$AGE + civData$EDUC)
civRegression = gam(civData$INCTOT ~ civData$AGE + civData$EDUC)

vif(civRegression) #Checking for Multicolinearity
summary(civRegression)

#Veteran Regression
vetRegression = lm(vetData$INCTOT ~ vetData$AGE + vetData$EDUC)
vetRegression = gam(vetData$INCTOT ~ vetData$AGE + vetData$EDUC)

vif(vetRegression) #Checking for Multicolinearity
summary(vetRegression)
