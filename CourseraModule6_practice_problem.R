if (!require("pacman")) install.packages("pacman") # this package helps in installing(if not already) and load the packages
p_load(rsample, dplyr, caTools, caret, e1071, FNN) # install(if not already) and load the packages

# Read the data file

dim(iris) # tells us the diemnsions of the data; Rows and columns are: 150 and 5
# Define input variables
X = iris[,1:4] # choose first four columns as input variables 
# Define target variable
y = iris[,5] # choose the target variable

set.seed(101) # set random seed for replicating the results 

# Normalize the inputs 
norm.values <- preProcess(X, method=c("center", "scale")) # Normalizing the data is important for distance based algorithms such as KNN
X.norm <- predict(norm.values, X) # Normalized input 
head(X.norm) # checking first 5 rows of the data

# train test split for making out of sample predictions.
sample = sample.split(iris$Species, SplitRatio = 0.80)# seelect a random sample of 80%
X_train = subset(X.norm, sample==TRUE) # input for training
X_test = subset(X.norm, sample==FALSE) # input for prediction accuracy
dim(X_train) # 120   4
dim(X_test) #30  4

y_train = subset(y,sample==TRUE) # labels for training
y_test = subset(y, sample==FALSE)# labels for prediction accuracy

# Fitting KNN model for K=2 
nn_model <- knn(train = X_train, test=X_test, cl = y_train, k=2)
summary(nn_model)
confusionMatrix(nn_model, y_test)$overall[1]# accuracy of prediction on test data 
# Accuracy 
# 0.97


confusionMatrix(nn_model, y_test)

########################################################################################