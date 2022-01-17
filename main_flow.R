####################################
# Main script to run Bet538: Sports Betting with Nate Silver
####################################

# clear environment, reset graphics
rm(list = ls())
graphics.off()


dir <- getwd()

# Initializing Code
source("system_init.R")

# Pull in Bet538 data
source("Data.R")
