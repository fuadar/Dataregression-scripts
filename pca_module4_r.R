##############################------------PCA-----------##########################################

getwd() # Check the working directory. You should keep your data file in this folder
#setwd("C:\Users\Yogesh\Downloads\Universities.csv") # this allows you to set a folder of your choice 
# as the working directory

# Universities data
university <- read.csv("Universities.csv") # read data from the file in the working directory
pca_univ <- prcomp(university[,c(3:7)], center = TRUE, scale. = TRUE) # selecting columns 3-7 for PCA
PCs <- pca_univ$x # all components are saved in the files PCs
university_pca <- cbind(university,PCs) # merge all data 
summary(pca_univ)# output of PCA model 

# Regression Model to predict Graduation Rate on all 5 variables (without PCA)
model <- lm(GradRate~ SAT+Top10+Accept+SFRatio+Expenses, data = university_pca)
summary(model)
# Multiple R-squared:  0.7104 - Around 71 % variance in Grad rate is explained by this model. 
# Adjusted R-squared:  0.6342 - The diff between R and adj R squared is 8% as there are 66 parameters being estimated with total
# observations being quite low i.e., 25


# Regression Model to predict Graduation Rate based on 1st component only
model_pca1 <-lm(GradRate~ PC1, data = university_pca)
summary(model_pca1)
# Multiple R-squared:  0.5414 # using just 1 PC the % variance epxlained comes down from 71 % to 54%
# Adjusted R-squared:  0.5215 # The difference between R and adjusted R Squared is lower (2%) because there are only
# 2 parameters ( 1 coefficient for pC and 1 intercept) to be estimated. 

# Regression Model to predict Graduation Rate based on 1st and 2nd components
model_pca2 <-lm(GradRate~ PC1+PC2, data = university_pca)
summary(model_pca2)
# Multiple R-squared:  0.6705 # Two PCs explain close to 67% variance 
# Adjusted R-squared:  0.6405 # This model has more Adj R Squared than the model with all the variables
# because it estimates only 3 paramaters (2 coeffciients for PC and 1 inetercept) however the input variables (3 PCs) 
# carry almost 92.3% varianceof the original 5 variables. 


# We see that adjusted R Sq is higher using just 2 components (PC1 and PC2) than using all five variable. 
######################################XXXXXXXXXXXXXXXXXXX#########################################

# Regression Model to predict Graduation Rate based on 1st, 2nd and 3rd components
model_pca3 <-lm(GradRate~ PC1+PC2+PC3, data = university_pca)
summary(model_pca3)
# Multiple R-squared:  0.70 # Three PCs explain close to 70% variance 
# Adjusted R-squared:  0.66 # This model has even more Adj R Squared than the model with all the variables
# because it estimates only 4 paramaters (3 coeffciients for PC and 1 inetercept),  however the input 
# variables (3 PCs) carry almost 92.3% variance of the original 5 variables. 
