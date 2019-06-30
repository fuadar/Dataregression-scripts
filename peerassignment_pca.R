##############################------------PCA-----------##########################################

getwd() # Check the working directory. You should keep your data file in this folder
setwd("/Users/farshad/Documents/github/Dataregression-scripts") # this allows you to set a folder of your choice 
# as the working directory

# Universities data
university <- read.csv("Universities.csv") # read data from the file in the working directory
pca_univ <- prcomp(university[,c(2:6)], center = TRUE, scale. = TRUE) # selecting columns 2-7 for PCA
PCs <- pca_univ$x # all components are saved in the files PCs
university_pca <- cbind(university,PCs) # merge all data 

summary(pca_univ)
#> summary(pca_univ)
#Importance of components:
#  PC1    PC2     PC3    PC4     PC5
#Standard deviation     2.0019 0.7812 0.46793 0.3694 0.16265
#Proportion of Variance 0.8016 0.1221 0.04379 0.0273 0.00529
#Cumulative Proportion  0.8016 0.9236 0.96741 0.9947 1.00000
# Regression Model to predict Graduation Rate on all 5 variables (without PCA)
model <- lm(Grad~ SAT+Top10+Accept+SFRatio+Expenses, data = university_pca)
summary(model)
#My Multiple R Squared = 0.7104 
# My Adjusted R Square = 0.634


# Regression Model to predict Graduation Rate based on 1st, 2nd and 3rd components
model_pca3 <-lm(Grad~ PC1+PC2+PC3, data = university_pca)
summary(model_pca3)
# Multiple R-squared:  0.7034 # Three PCs explain close to 70% variance 
# Adjusted R-squared:  0.6617 # This model has even more Adj R Squared than the model with all the variables
# because it estimates only 4 paramaters (3 coeffciients for PC and 1 inetercept),  however the input 
# variables (3 PCs) carry almost 70% variance of the original 5 variables. 
#Call:
#  lm(formula = Grad ~ PC1 + PC2 + PC3, data = university_pca)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-4.7714 -0.9322 -0.1195  1.1915  3.4018 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  86.7200     0.4141 209.416  < 2e-16 ***
#  PC1          -3.4366     0.1968 -17.462 5.55e-14 ***
#  PC2          -4.6698     0.4765  -9.801 2.75e-09 ***
#  PC3           4.8230     0.7895   6.109 4.62e-06 ***
  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 2.071 on 21 degrees of freedom
##Multiple R-squared:  0.9543,	Adjusted R-squared:  0.9477 
#F-statistic: 146.1 on 3 and 21 DF,  p-value: 3.163e-14