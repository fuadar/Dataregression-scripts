if (!require("pacman")) install.packages("pacman") # this package helps in installing(if not already) and load the packages
p_load(rsample,dplyr, caTools, caret, e1071, FNN) # install(if not already) and load the packages
install.packages('rsample',dependencies = TRUE)
library(rsample)

dim(attrition)# there are 31 variable, we will use only 10 variables, 1 target and 9 input - these all are numerical inputs 

# Subsetted dataframe 
attrition.df <- attrition[,c("Age", "MonthlyIncome", "DistanceFromHome", "TotalWorkingYears", "TrainingTimesLastYear", "YearsAtCompany","YearsInCurrentRole", 
                             "YearsSinceLastPromotion", "YearsWithCurrManager", "Attrition")] 

### Since KNN is a distance based algorithm, we need to scale it so that different variables can be brought to the same scale
# get all the input variables in one dataframe X
X <- attrition.df[,1:9]   # selecting all input variables 

# Normalize the inputs 
norm.values <- preProcess(X, method=c("center", "scale")) 
X.norm <- predict(norm.values, X) # Normalized input 
#Build the target variable
y <- attrition.df$Attrition 
#set seed as asked for randomaization
set.seed(101)

# train test split for assesing prediction accuracy
sample = sample.split(attrition.df$Attrition, SplitRatio = 0.80)# seelect a random sample of 80% 
X_train = subset(X.norm, sample==TRUE) # input for training
X_test = subset(X.norm, sample==FALSE) # input for prediction accuracy

y_train = subset(y,sample==TRUE) # labels for training
y_test = subset(y, sample==FALSE)# labels for prediction accuracy

# Use k =5 # A total random number 
nn <- knn(train = X_train, test=X_test, cl = y_train, k=5)
summary(nn)
confusionMatrix(nn, y_test)$overall[1]# accuracy of prediction on test data 
confusionMatrix(nn, y_test)
# Accuracy 
# 0.81


confusionMatrix(nn, y_test) # evaluate other metrics

# To select the best K, we will check accuracy as various values of K between 1 and 20. 

# define a dataframe in which we will save accuracy for different values of K
accuracy.df <- data.frame(k = seq(1, 20, 1), accuracy = rep(0, 20))
accuracy.df # right now we have filled accurcay to be 0 for all values of K

# compute knn for different k on validation by looping 
for(i in 1:20) { # we will loop through K= 1 to 20
  knn.pred <- knn(train = X_train, test=X_test, cl = y_train, k = i)
  accuracy.df[i, 2] <- confusionMatrix(knn.pred, y_test)$overall[1]
}

plot(accuracy.df) # plot accuracy for different values of K 
lines(accuracy.df)

which.max(accuracy.df$accuracy) # optimal K
# K = 20
# Evaluate model at K =20
accuracy.df[20,] # read 11th row
# accuracy 0.840

# The accuracy increases as we use k=20 instead of randomly chosen k =5 
