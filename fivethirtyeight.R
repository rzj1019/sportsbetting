##############################
# Data from FiveThirtyEight
# https://github.com/fivethirtyeight/data
##############################

#### Season #####
curr.season <- format(Sys.Date(), "20%y")


#### Pull in newest data ####
fivethirtyeight.urls <- data.frame("LeagueData" = c("Club Soccer", "MLB", "NBA", "NFL", "NHL"),
                                   "URLS" = c("https://projects.fivethirtyeight.com/soccer-api/club/spi_matches.csv",
                                              "https://projects.fivethirtyeight.com/mlb-api/mlb_elo.csv",
                                              "https://projects.fivethirtyeight.com/nba-model/nba_elo.csv",
                                              "https://projects.fivethirtyeight.com/nfl-api/nfl_elo.csv",
                                              "https://projects.fivethirtyeight.com/nhl-api/nhl_elo.csv"))

# Soccer, MLB, NHL, NBA, NFL Tables
soccer.data.new <- fivethirtyeight.urls[1,2] %>% fread()
mlb.data.new <- fivethirtyeight.urls[2,2] %>% fread()
nba.data.new <- fivethirtyeight.urls[3,2] %>% fread()
nfl.data.new <- fivethirtyeight.urls[4,2] %>% fread()
nhl.data.new <- fivethirtyeight.urls[5,2] %>% fread()


#### Check if data has updated; if so, update ####
fivethirtyeight.data <- paste0(dir, "/538_data")

# Club Soccer
if (!file.exists(paste0(fivethirtyeight.data, "/soccer_data.RDS"))) {
   saveRDS(soccer.data.new, file = paste0(fivethirtyeight.data, "/soccer_data.rds"))
   soccer.data <- soccer.data.new
}else{
   # check old data against new data
   soccer.data <- readRDS(paste0(fivethirtyeight.data, "/soccer_data.rds"))

   if(nrow(setdiff(soccer.data.new, soccer.data))>0){
      saveRDS(soccer.data.new, file = paste0(fivethirtyeight.data, "/soccer_data.rds"))
      message("Club soccer data has changed, updated to new data")
   }else{
      message("Club soccer data has not updated.")
   }
}

# MLB
if (!file.exists(paste0(fivethirtyeight.data, "/mlb_data.RDS"))) {
   saveRDS(mlb.data.new, file = paste0(fivethirtyeight.data, "/mlb_data.rds"))
   mlb.data <- mlb.data.new
}else{
   # check old data against new data
   mlb.data <- readRDS(paste0(fivethirtyeight.data, "/mlb_data.rds"))

   if(nrow(setdiff(mlb.data.new, mlb.data))>0){
      saveRDS(mlb.data.new, file = paste0(fivethirtyeight.data, "/mlb_data.rds"))
      message("MLB data has changed, updated to new data")
   }else{
      message("MLB data has not updated.")
   }
}

# NBA
if (!file.exists(paste0(fivethirtyeight.data, "/nba_data.RDS"))) {
   saveRDS(nba.data.new, file = paste0(fivethirtyeight.data, "/nba_data.rds"))
   nba.data <- nba.data.new
}else{
   # check old data against new data
   nba.data <- readRDS(paste0(fivethirtyeight.data, "/nba_data.rds"))

   if(nrow(setdiff(nba.data.new, nba.data))>0){
      saveRDS(nba.data.new, file = paste0(fivethirtyeight.data, "/nba_data.rds"))
      message("NBA data has changed, updated to new data")
   }else{
      message("NBA data has not updated.")
   }
}

# NFL
if (!file.exists(paste0(fivethirtyeight.data, "/nfl_data.RDS"))) {
   saveRDS(nfl.data.new, file = paste0(fivethirtyeight.data, "/nfl_data.rds"))
   nfl.data <- nfl.data.new
}else{
   # check old data against new data
   nfl.data <- readRDS(paste0(fivethirtyeight.data, "/nfl_data.rds"))

   if(nrow(setdiff(nfl.data.new, nfl.data))>0){
      saveRDS(nfl.data.new, file = paste0(fivethirtyeight.data, "/nfl_data.rds"))
      message("NFL data has changed, updated to new data")
   }else{
      message("NFL data has not updated.")
   }
}

# NHL
if (!file.exists(paste0(fivethirtyeight.data, "/nhl_data.RDS"))) {
   saveRDS(nhl.data.new, file = paste0(fivethirtyeight.data, "/nhl_data.rds"))
   nhl.data <- nhl.data.new
}else{
   # check old data against new data
   nhl.data <- readRDS(paste0(fivethirtyeight.data, "/nhl_data.rds"))

   if(nrow(setdiff(nhl.data.new, nhl.data))>0){
      saveRDS(nhl.data.new, file = paste0(fivethirtyeight.data, "/nhl_data.rds"))
      message("NHL data has changed, updated to new data")
   }else{
      message("NHL data has not updated.")
   }
}


#### Get Teams/Leagues ####
nhl.teams <- nhl.data[,.(unique(home_team))]
nba.teams <- nba.data[,unique(team1)]
nfl.teams <- nfl.data[,unique(team1)]
soccer.teams <- soccer.data[,unique(team1)]
soccer.leagues <- soccer.data[,unique(league)]


#### Dates ####
# Grab all days for this season
nhl.season <- nhl.data[season == is.integer(curr.season)]
nba.season <- nba.data[season == is.integer(curr.season)]
nfl.season <- nfl.data[season == is.integer(curr.season)]
