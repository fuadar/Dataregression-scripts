############################################--------START------------#############################################################
#if (!require("pacman")) install.packages("pacman") # this package helps in installing(if not already) and load the packages
#p_load(leaps, caTools) # install(if not already) and load the packages

# "leaps" for best subset regresison
# "caTools" for train test split
# library(leaps)
# library(caTools)
#############################

#getwd('/Users/farshad/Downloads'Housing_windosr.csv) # Check the working directory. You should keep your data file in this folder
setwd("/Users/farshad/Downloads") # this allows you to set a folder of your choice as the working directory

file.exists("Housing_windsor.csv") # check whether the file exists in the working directory, should return TRUE
# [1] TRUE

# read data
windsor <- read.csv("Housing_windsor.csv") 

set.seed(42)
sample = sample.split(windsor, SplitRatio = 0.80) # splititng the data into 80 and 20%
train = subset(windsor, sample==TRUE) # select the observations to be in training dataset wherever sample ==True 
test = subset(windsor, sample==FALSE) # select the observations to be in testing dataset wherever sample ==FALSE

# Run the best subset model- This allows you to find the best set of predictors based on some criteria such as "Adj_RSq","CP", "BIC", etc.  
models <- regsubsets(price~., data = windsor, nvmax = 6, method = "exhaustive")# nvmax represents the maximum number of predictors to incorporate in the model
# method represents the procedure you want to implement for selection: "exhaustive", "backward", "forward"

summary(models) # get the results from your model
# The selected 6 variables are: lotsize, bathrms, stories, airco, garagepl, and  prefarea # Note that I removed Yes from aircoyes and prefareayes

reg_6 <- lm(price ~ lotsize + bathrms + stories + airco + garagepl +  prefarea, data=train)

summary(reg_6) # get the coefficients and R squared from the above fitted model.

##############################################-------------END---------####################################################


