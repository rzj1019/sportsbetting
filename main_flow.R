####################################
# Main script to run Bet538: Sports Betting with Nate Silver
####################################


#### Load packages, source files ####

# clear environment, reset graphics
rm(list = ls())
graphics.off()

# Initializing Code
source("system_init.R")

# Set directories
dir <- getwd()
data.dir <- paste0(dir, "/data")
funcs.dir <- paste0(dir, "/functions")

#### FiveThiryEight Data ####
source(paste0(funcs.dir, "/538_data_pullncheck.R"))
curr.season <- format(Sys.Date(), "20%y")
sports.list <- c("soccer",
                 "mlb",
                 "nba",
                 "nfl",
                 "nhl")

fivethirtyeight.urls <- c("https://projects.fivethirtyeight.com/soccer-api/club/spi_matches.csv",
                          "https://projects.fivethirtyeight.com/mlb-api/mlb_elo.csv",
                          "https://projects.fivethirtyeight.com/nba-model/nba_elo.csv",
                          "https://projects.fivethirtyeight.com/nfl-api/nfl_elo.csv",
                          "https://projects.fivethirtyeight.com/nhl-api/nhl_elo.csv")

# Grab data
mapply(pull.and.check, sport = sports.list, address = fivethirtyeight.urls) %>% invisible()

# Get list of current season teams
soccer.teams <- soccer.data[season == curr.season, unique(team1)]
soccer.leagues <- soccer.data[season == curr.season,unique(league)]
mlb.teams <- mlb.data[season == curr.season, .(unique(team1))]
nba.teams <- nba.data[season == curr.season, .(unique(team1))]
nfl.teams <- nfl.data[season == curr.season, .(unique(team1))]
nhl.teams <- nhl.data[season == curr.season, .(unique(home_team))]

# Grab data for this season
club.season <- soccer.data[season == as.numeric(curr.season) - 1]
mld.season <- mlb.data[season == as.numeric(curr.season)]
nba.season <- nba.data[season == as.numeric(curr.season)]
nfl.season <- nfl.data[season == as.numeric(curr.season)]
nhl.season <- nhl.data[season == as.numeric(curr.season)]


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