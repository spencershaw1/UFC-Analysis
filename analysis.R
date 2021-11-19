#
# A UFC (Ultimate Fighting Championship) Statistical Analysis
# Spencer Shaw (JSSHAW@clemson.edu)
# November 19, 2021
#
# A statistical analysis of UFC trends... 
#

rm(list = ls()

library("ggplot2")


# Create a data frame
data <- read.csv("data/data.csv")
fights_2021 <- subset(data, date > 2021)
write.csv(fights_2021, "test.csv")

  
pairs(fights_2021[,9:19], data = fights_2021, pch = 19)
names(fights_2021)
ncol(data)
nrow(data)