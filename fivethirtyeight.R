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

soccer.data.new <-fivethirtyeight.urls[1,2] %>% fread()
mlb.data.new <- fivethirtyeight.urls[2,2] %>% fread()
nba.data.new <- fivethirtyeight.urls[3,2] %>% fread()
nfl.data.new <- fivethirtyeight.urls[4,2] %>% fread()
nhl.data.new <- fivethirtyeight.urls[5,2] %>% fread()


#### Check if data has updated; if so, update ####

# Club Soccer
if (!file.exists(paste0(data.dir, "/soccer_data.rds"))) {
   saveRDS(soccer.data.new, file = paste0(data.dir, "/soccer_data.rds"))
   soccer.data <- soccer.data.new
}else{
   # check old data against new data
   soccer.data <- readRDS(paste0(data.dir, "/soccer_data.rds"))

   if(nrow(setdiff(soccer.data.new, soccer.data))>0){
      saveRDS(soccer.data.new, file = paste0(data.dir, "/soccer_data.rds"))
      message("Club soccer data has changed, updated to new data")
   }else{
      message("Club soccer data has not updated.")
   }
}

# MLB
if (!file.exists(paste0(data.dir, "/mlb_data.rds"))) {
   saveRDS(mlb.data.new, file = paste0(data.dir, "/mlb_data.rds"))
   mlb.data <- mlb.data.new
}else{
   # check old data against new data
   mlb.data <- readRDS(paste0(data.dir, "/mlb_data.rds"))

   if(nrow(setdiff(mlb.data.new, mlb.data))>0){
      saveRDS(mlb.data.new, file = paste0(data.dir, "/mlb_data.rds"))
      message("MLB data has changed, updated to new data")
   }else{
      message("MLB data has not updated.")
   }
}

# NBA
if (!file.exists(paste0(data.dir, "/nba_data.rds"))) {
   saveRDS(nba.data.new, file = paste0(data.dir, "/nba_data.rds"))
   nba.data <- nba.data.new
}else{
   # check old data against new data
   nba.data <- readRDS(paste0(data.dir, "/nba_data.rds"))

   if(nrow(setdiff(nba.data.new, nba.data))>0){
      saveRDS(nba.data.new, file = paste0(data.dir, "/nba_data.rds"))
      message("NBA data has changed, updated to new data")
   }else{
      message("NBA data has not updated.")
   }
}

# NFL
if (!file.exists(paste0(data.dir, "/nfl_data.rds"))) {
   saveRDS(nfl.data.new, file = paste0(data.dir, "/nfl_data.rds"))
   nfl.data <- nfl.data.new
}else{
   # check old data against new data
   nfl.data <- readRDS(paste0(data.dir, "/nfl_data.rds"))

   if(nrow(setdiff(nfl.data.new, nfl.data))>0){
      saveRDS(nfl.data.new, file = paste0(data.dir, "/nfl_data.rds"))
      message("NFL data has changed, updated to new data")
   }else{
      message("NFL data has not updated.")
   }
}

# NHL
if (!file.exists(paste0(data.dir, "/nhl_data.rds"))) {
   saveRDS(nhl.data.new, file = paste0(data.dir, "/nhl_data.rds"))
   nhl.data <- nhl.data.new
}else{
   # check old data against new data
   nhl.data <- readRDS(paste0(data.dir, "/nhl_data.rds"))

   if(nrow(setdiff(nhl.data.new, nhl.data))>0){
      saveRDS(nhl.data.new, file = paste0(data.dir, "/nhl_data.rds"))
      message("NHL data has changed, updated to new data")
   }else{
      message("NHL data has not updated.")
   }
}


#### Get Teams/Leagues  names for Current Season ####
soccer.teams <- soccer.data[season == curr.season,unique(team1)]
soccer.leagues <- soccer.data[season == curr.season,unique(league)]
mlb.teams <- mlb.data[season == curr.season, .(unique(team1))]
nba.teams <- nba.data[season == curr.season, .(unique(team1))]
nfl.teams <- nfl.data[season == curr.season, .(unique(team1))]
nhl.teams <- nhl.data[season == curr.season, .(unique(home_team))]

#### Data Calculations ####






#### Current Season ####
# Grab data for this season
club.season <- soccer.data[season == as.numeric(curr.season) - 1]
mld.season <- mlb.data[season == as.numeric(curr.season)]
nba.season <- nba.data[season == as.numeric(curr.season)]
nfl.season <- nfl.data[season == as.numeric(curr.season)]
nhl.season <- nhl.data[season == as.numeric(curr.season)]


