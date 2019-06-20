
#set working directory 
setwd(dir = '/Users/farshad/Downloads')
#read the csv
tahoe <- read.csv("tahoe_interaction.csv")
#set seed and break it down
set.seed(42)
spec = c(train = .7, test = .15, validate = .15)
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
predict <- predict(tohoetestglm, type = 'response')
table(tahoetest$readmit30, predict > 0.25)

#train logisitcs glm

tahoetrainglm <- glm(readmit30 ~ .,
                    data = tahoetrain, family=binomial(link="logit"))
summary(tahoetrainglm)
predict <- predict(tahoetrainglm, type = 'response')
table(tahoetrain$readmit30, predict > 0.25)

#validate logisitcs glm

tahoevalidateglm <- glm(readmit30 ~ .,
                     data = tahoevalidate, family=binomial(link="logit"))
summary(tahoevalidateglm)
predict <- predict(tahoevalidateglm, type = 'response')
table(tahoevalidate$readmit30, predict > 0.25)

