# Thanks ot niranjants  for worting this in pdf
# Install packages car to get vif function
install.packages('car')
library('car')
# Set the working directory 
setwd(dir = '/Users/farshad/OneDrive - University of Illinois - Urbana/Education/MBA/High-Engagement/DataAnalyticsandregression/Week1')
#read the file in  
wage <- read.csv("wage.csv")
#get a linear regression
print(summary(wagerg))
vif(wagerg)
