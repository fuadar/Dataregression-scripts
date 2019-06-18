#########################################################################################################
install.packages("leaps")# for best subste regresison
install.packages("caTools")# for train test split
library(leaps)
library(caTools)
#############################

getwd() # Check the working directory. You should keep your data file in this folder
# setwd("mention the path of your folder") # this allows you to set a folder of your choice as the working directory

# read data
Toyota <- read.csv("Toyota.csv") # remember this file "Toyota.csv" must be in your working directory

sample = sample.split(Toyota, SplitRatio = 0.80) # splitting the data into 80 and 20%
train = subset(Toyota, sample==TRUE) 
test = subset(Toyota, sample==FALSE)

# Run the best subset model- This allows you to find the best set of predictors based on some criteria such as "Adj_RSq","CP", "BIC", etc.  
models <- regsubsets(Price~., data = Toyota, nvmax = 9, method="forward")# nvmax represents the maximum number of predictors to incorporate in the model
# method represents the procedure you want to implement for selection: "exhaustive", "backward", "forward"
summary(models) # get the results from your model

res.sum <- summary(models) # select the best model based on the adjusted R Sqr
which.max(res.sum$adjr2)

##########################################################################################################



