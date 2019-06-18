
# This will plot the diamonds Slide that Professor Ashish and Sreedhar Showed in Live Session Module 1
# A few tips

# run getwd() to get the working directory # keep your datafile file here to read easily
# setwd("path") if you want to change the working directory - need to provide path
# Change the below to  where your file is
setwd('/Users/farshad/OneDrive - University of Illinois - Urbana/Education/MBA/High-Engagement/DataAnalyticsandregression/Week1')
#Put the file name below
data_file <- read.csv('diamonds.csv')
# read a csv file in R by writing the file name
# remember to keep this file in the working directory before running the above command.

# Drag the console screen to the left to leave enough area for plotting, else will get an error.

#

# This will plot the diamonds scatter plot per the chart in the live session
plot(data_file$Weight..carats.,data_file$Price..Rs..Carat , main = "Diamond Prices", # here mpg is the y variable, "wt" is the x variable, and mtcars in the dataset name
     xlab = "Weight(Carats)", ylab = "Price(RS)/Carat")
abline(lm(data_file$Price..Rs..Carat~data_file$Weight..carats.), col ="red") # change color from red to blue if you like

################################################################################################################
