#
# A UFC (Ultimate Fighting Championship) Statistical Analysis
# Spencer Shaw (JSSHAW@clemson.edu)
# November 19, 2021
#
# A statistical analysis of UFC trends... 
#

rm(list = ls())
library(ggplot2)
setwd("/Users/spencershaw/OneDrive\ -\ Clemson\ University/desktop/math4020/finalproject/")

# Create a data frame
data <- read.csv("data/data.csv")

# Data Cleaning (Only male 2021 fights)
data <- subset(data, date > 2015)
fights_2021 <- subset(data, weight_class < "WomenBantamweight")
fights_2021 <- na.omit(fights_2021)

# Write the subset to a file
write.csv(fights_2021, "data/subset.csv")


# Exploratory data analysis 
names(fights_2021)
ncol(fights_2021)
nrow(fights_2021)

# Create a subset to determine the average significant strikes per winner
winner_b <- subset(fights_2021, Winner == "Blue")
winner_r <- subset(fights_2021, Winner == "Red")
winner_sig_strikes <- c(winner_b$B_avg_SIG_STR_landed, winner_r$R_avg_SIG_STR_landed)
winner_dummy <- rep(c(""),each=1931)
winners.data <- data.frame(winner_sig_strikes, winner_dummy)

# Plot average significant strikes by winner
ggplot(winners.data, aes(x = winner_sig_strikes, y = winner_dummy)) + 
  geom_boxplot(fill = "#2ecc71", width = 0.3) + ggtitle("Average Significant Strikes by Winners") + 
  xlab("Avg Significant Strikes Landed") + ylab("Winners") + xlim(0, 150)

# Create a subset for knockdowns and age
age <- c(fights_2021$B_age, fights_2021$R_age)
kd <- c(fights_2021$B_avg_KD, fights_2021$R_avg_KD)
age.kd <- data.frame(age, kd)

# Plot average KD vs age
ggplot(age.kd, aes(x = age, y = kd)) + geom_point(color = "#8e44ad") +
  ggtitle("Average Knockdowns by Age") + 
  xlab("Age") + ylab("Average Knockdowns") +
  theme(panel.background = element_rect(fill = "#7f8c8d"))



