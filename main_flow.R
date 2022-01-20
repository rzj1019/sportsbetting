####################################
####################################
# Main script to run Bet538: Sports Betting with Nate Silver
####################################
####################################

#### Load packages, source files ####

# clear environment, reset graphics
rm(list = ls())
graphics.off()


dir <- getwd()

# Initializing Code
source("system_init.R")

# Pull in most up to date FiveThirtyEight data
source("fivethirtyeight_data.R")

# Pull in Bet538 data
source("main_data.R")


#### Data Quality Control ####



#### Set Variables


# --------------------------
# Set Variables for ShinyApp
# --------------------------