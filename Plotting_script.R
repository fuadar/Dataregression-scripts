# A few tips

# run getwd() to get the working directory # keep your datafile file here to read easily
# setwd("path") if you want to change the working directory - need to provide path  

data_file <- read.csv("filename.csv") # read a csv file in R by writing the file name 
# remember to keep this file in the working directory before running the above command. 

# Drag the console screen to the left to leave enough area for plotting, else will get an error. 

# use $ to access a variable from a datafile.
# data_file$variablename - This is how you access a variable from a data_file in R. This file should be visible in 
# environment tab in the right panel. 

# Histogram for one numerical variables 
# This code will not run
hist(datasetname$variablename, main= "whatever you want to name your figure as. this comes on the top", 
     ylab="whatever you want to show written to the left of y axis")

# Example - This code will run
hist(mtcars$mpg, main="Car Milage Data", # mtcars is the name of the dataset, mpg is the name of the variable
        ylab="Miles Per Gallon")

# If you want separate histograms for one numerical variable, broken up for various values of a categorical variable"
par(mfrow=c(1,3)) # here you tell R that I need 3 plots togther - this divides the plotting area into 1 row and 3 columns 
hist(mtcars$mpg[mtcars$cyl==4],ylim =c(0,8)) # histogram for mpg for cars with 4 cylinders 
hist(mtcars$mpg[mtcars$cyl==6],ylim =c(0,8)) # histogram for mpg for cars with 6 cylinders 
hist(mtcars$mpg[mtcars$cyl==8],ylim =c(0,8)) # histogram for mpg for cars with 8 cylinders 

# here ylim is the range in which you want the y values to be plotted in the histogram. These could be the min and max values. 
##########################################################################################################

par(mfrow=c(1,1)) # here you tell R that I need only 1 plot in the figure 

# Boxplot for one variable - This code will not run
boxplot(datasetname$variablename, main= "whatever you want to name your figure as. this comes on the top", 
        ylab="whatever you want to show written to the left of y axis")

#example - This code will run
boxplot(mtcars$mpg, main="Car Milage Data", # mtcars is the name of the dataset, mpg is the name of the variable
         ylab="Miles Per Gallon")

# If you want separate boxplots for one numerical variable, broken up for various values of a categorical variable"

# This code will not run
boxplot(numerical_variable_name~categorica_variable_name,data=datasetname, main= "whatever you want to name your figure as. this comes on the top",
        xlab = "whatever you want to show written below x axis", 
        ylab="whatever you want to show written to the left of y axis")

# Example - This code will run
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", # This boxplot shows sperate distribution of mpg for cars with 4 cylinders, 6 cyliners, and 8 cylinders
        xlab="Number of Cylinders", ylab="Miles Per Gallon")

#############################################################################################################


# Scatter plot (regression), with the line

# This code will not run
plot(x, y, main = "Main title", # x is the variable on x axis - this is the predictor variable, and y is the resposne variable.
     xlab = "X axis title", ylab = "Y axis title")
# Adding a line - run this after having the plot command above
abline(lm(y~x), col = "red")

# Example - This code will run
plot(mtcars$wt,mtcars$mpg , main = "Weight vs MPG", # here mpg is the y variable, "wt" is the x variable, and mtcars in the dataset name 
     xlab = "Weight", ylab = "MPG")
abline(lm(mtcars$mpg~mtcars$wt), col ="red") # change color from red to blue if you like 

################################################################################################################
