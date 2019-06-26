install.packages('caret', dependencies = TRUE,type="mac.binary.el-capitan")
library(caret)
#set working directory 
setwd(dir = '/Users/farshad/Downloads')
#read the csv
tahoe <- read.csv("tahoe_interaction.csv")
#set seed and break it down
set.seed(42)
spec = c(train = .7, validate = .15, test = .15)
g = sample(cut(
  seq(nrow(tahoe)), 
  nrow(tahoe)*cumsum(c(0,spec)),
  labels = names(spec)
))
res = split(tahoe, g)
#check values
sapply(res, nrow)/nrow(tahoe)
res$train
#create 2 new variables for easy access 
tahoetrain <- res$train
tahoevalidate <- res$validate
tahoetest <- res$test
#test logististic linear 
tohoetestglm <- glm(readmit30 ~ .,
                data = tahoetest, family=binomial(link="logit"))
summary(tohoetestglm)
predicttest <- predict(tohoetestglm, type = 'response')
table(tahoetest$readmit30, predicttest > 0.25)

#train logisitcs glm

tahoetrainglm <- glm(readmit30 ~ .,
                    data = tahoetrain, family=binomial(link="logit"))
summary(tahoetrainglm)
predicttrain <- predict(tahoetrainglm, type = 'response')
table(tahoetrain$readmit30, predicttrain > 0.25)

 
 #confusionMatrix(table(predict(tahoetrainglm, type="response") >= 0.5,
 #                    tahoetrain$readmit30 == 0))
#validate logisitcs glm

tahoevalidateglm <- glm(readmit30 ~ .,
                     data = tahoevalidate, family=binomial(link="logit"))
summary(tahoevalidateglm)
predictvalidate <- predict(tahoevalidateglm, type = 'response')
table(tahoevalidate$readmit30, predictvalidate >=0.50)
#confusionMatrix(table(predict(tahoevalidateglm, type="response") >= 0.5))
#ConfusionMatrix(data = as.numeric(predict>0.5),reference=tahoevalidate$readmit30)

#counts of data
count(tahoe,tahoe$readmit30,tahoe(age))
