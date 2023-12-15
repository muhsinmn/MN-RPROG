
## Correlation 
## Load readr package to support CSV files
library(readr)
chap02e3bGuppyFatherSonAttractiveness <- read_csv("E://R 2/Corelation and regression/FSA.csv")
View(chap02e3bGuppyFatherSonAttractiveness)
FSA = chap02e3bGuppyFatherSonAttractiveness
View(FSA)
## plot a scatterplot to view the relationship of the two variables
library(ggplot2)
ggplot(FSA, aes(x=fatherOrnamentation, 
                y=sonAttractiveness)) +
  geom_point() +
  theme_minimal() +
  xlab("Father's ornamentation") +
  ylab("Son's attractiveness")

## Calculate the Correlation using cor() 
## defauult is Pearson correlation
cor (FSA$fatherOrnamentation, FSA$sonAttractiveness)

## Correlation of Determination by squaring the values
cor (FSA$fatherOrnamentation, FSA$sonAttractiveness)^2

## To know the significnace of correlation test 
cor.test (FSA$fatherOrnamentation, FSA$sonAttractiveness)

## To test Spearman or Rank Correlation
cor (FSA$fatherOrnamentation, FSA$sonAttractiveness, method = "spearman")


## Linear Regression
sr =  lm (FSA$sonAttractiveness  ~ FSA$fatherOrnamentation, data = FSA)
sr
# This means 
sonAttractiveness = 0.005084 + (0.982285 * fatherOrnamentation).

summary(sr)

## Scatterplot 
ggplot(FSA, aes(x=fatherOrnamentation, 
                y=sonAttractiveness)) +
  geom_point() +
  theme_minimal() +
  xlab("Father's ornamentation") +
  ylab("Son's attractiveness") +    
  stat_smooth(method = lm)

## Plot without Grey Shaded area
ggplot(FSA, aes(x=fatherOrnamentation, 
                y=sonAttractiveness)) +
  geom_point() +
  theme_minimal() +
  xlab("Father's ornamentation") +
  ylab("Son's attractiveness") +    
  stat_smooth(method = lm, se = FALSE)
## PLoting residuals

plot(residuals(sr) ~ FSA$fatherOrnamentation, data = FSA)
abline(h=0)
res = residuals(sr)
mean(res)    
median (res)
mode = function(){
  return(sort(-table(FSA))[1])
}

mode()
## Install package to use Mode function

install.packages("modeest")
library(modeest)
mode = mfv (res)
mode

## test normality of residuals
install.packages("dgof")
library("dgof")
ks = ks.test(res, "pnorm")
ks