## Working With Time Series Data
library(readxl)
Time_Series <- read_excel("E://R 2/time series/Time Series.xlsx")
View(Time_Series)

Exp=Time_Series$`Total Expenses`    
##to extract the column named 'Total Expenses' from the data frame named 'Time_Series'.

mts <- ts(Exp, frequency =365.25/7)

plot(Exp, xlab ="Yearly Data",
     ylab ="Total Expenses",
     main ="Company Expenses",
     col.main ="darkred",
     type = "l")
##The plot() function is used to create a graphical display of the time series

## Multiple Plots

reve = Time_Series$`Total Revenue`
mts <- ts(cbind(Exp, reve), start = 2011, end = 2021, frequency =1)

plot(mts, xlab ="Yearly Data",
     ylab =c("Total Expenses", "Total REvenue"),
     main ="Company Income & Expenses",
     col.main ="darkgreen",
     type = "b",col = "darkgreen", 
     pch =21, 
     bg = "red")

## Matplot

year = (2012 : 2021)
year
time = Time_Series
time
matplot(year, time[2:3],  type="b", pch=c(21:22), 
        cex=1, bg=c("red", "green"),
        xlab= "year", 
        ylab= "Revenue & Expenditure", 
        cex.lab=0.75)
title (main = "Income & Expenditure", cex.main = 2, font.main = 1)