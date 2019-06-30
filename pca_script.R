# Create PCS Variables Per the assignment Instruction

setwd("/Users/farshad/Documents/github/Dataregression-scripts") # this allows you to set a folder of your choice 

pcs <- pc$x
write.csv(x=pcs, file="principal_components.csv", row.names=FALSE)
