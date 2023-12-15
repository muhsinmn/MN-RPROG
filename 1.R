## Logistic Regression
## Install dplyr package to load data of MTCARS
install.packages("dplyr")
library(dplyr)
summary (mtcars)
logit_data = mtcars
logit_data
install.packages("caTools")
library(caTools)
logit_model = glm (vs ~ wt +disp,
                   data = logit_data,
                   family = "binomial")
summary(logit_model)



logistic2 =  read_excel("E://R 2/regression/Logistic - Regression.xlsx")
logit_model2 = glm (logistic2$status ~ logistic2$degree_t + logistic2$workex +
                      logistic2$specialisation + logistic2$ssc_p +logistic2$hsc_p
                    +logistic2$CGPA, 
                    data = logistic2,
                    family = "binomial")

summary(logit_model2)

logit_model3 = glm (vs ~ mpg + gear + cyl + hp,
                    data = logit_data,
                    family = "binomial")
summary(logit_model3)

library(readxl)
Documents_SM_Logistics <- read_excel("E://R 2/regression/SM Logistics.xlsx")
View(Documents_SM_Logistics)

logit_model4 = glm (Documents_SM_Logistics$Purchase ~ Documents_SM_Logistics$`Number of Likes` + 
                      Documents_SM_Logistics$`Number of Share` + Documents_SM_Logistics$`Number of Comments`,
                    data = Documents_SM_Logistics,
                    family = "binomial")
summary(logit_model4)
