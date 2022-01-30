####################################
# Main script to run Bet538: Sports Betting with Nate Silver
####################################


#### Load packages, source files ####

# clear environment, reset graphics
rm(list = ls())
graphics.off()

# Set directories
dir <- getwd()
data.dir <- paste0(dir, "/data")

# Initializing Code
source("system_init.R")

# Pull in most up to date FiveThirtyEight data
source("fivethirtyeight.R")

# Pull in Bet538 data
source("main_data.R")


#### Data QC and More ####
# Soccer

#MLB

# NBA
nba.data[ , ':=' (result = score1 - score2)]

# NFL
nfl.data[ , ':=' (result = score1 - score2)]

# NHL
nhl.data[ , ':=' (result = home_team_score - away_team_score)]




#### Set Variables


# --------------------------
# Set Variables for ShinyApp
# --------------------------