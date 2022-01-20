##############################
# Data from FiveThirtyEight
##############################

fivethirtyeight.dir <- paste0(dir, "/538_data")

#### Season #####
curr.season <- format(Sys.Date(), "20%y")

#### Pull in newest data ####
fivethirtyeight.dir <- "C:/Users/johns/Documents/R/fivethirtyeight/data"

# NHL Forecasts
nhl.url <- paste0(fivethirtyeight.dir, "/nhl-forecasts/README.md") %>%
   readr::read_file() %>%
   stringr::str_extract("https://.+csv")
nhl.data.new <- fread(nhl.url)

# NBA Forecasts
nba_url <- paste0(fivethirtyeight.dir, "/nba-forecasts/README.md") %>%
   readr::read_file() %>%
   stringr::str_extract("https://.+csv")
nba.data.new <- fread(nba_url)

# NBA Forecasts
nfl.url <- paste0(fivethirtyeight.dir, "/nfl-elo/README.md") %>%
   readr::read_file() %>%
   str_extract("https://.+csv")
nfl.data.new <- fread(nfl.url)

# Soccer Forecasts
soccer.url <- paste0(fivethirtyeight.dir, "/soccer-spi/README.md") %>%
   readr::read_file() %>%
   str_extract("https://.+csv")
soccer.data.new <- fread(soccer.url)


#### Check if data has updated; if so, update ####
# NHL
if (!file.exists(paste0(fivethirtyeight.dir, "/nhl_data.RDS"))) {
   saveRDS(nhl.data.new, file = paste0(fivethirtyeight.dir, "/nhl_data.rds"))
}else{
   # check old data against new data
   nhl.data <- readRDS(paste0(fivethirtyeight.dir, "/nhl_data.rds"))

   if(nrow(setdiff(nhl.data.new, nhl.data))>0){
      saveRDS(nhl.data.new, file = paste0(fivethirtyeight.dir, "/nhl_data.rds"))
      message("Data has changed, updated to new data")
   }else{
      message("Data has not updated.")
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
nhl.season <- nhl.data[season == is.integer(curr_season)]
nba.season <- nba.data[season == is.integer(curr_season)]
nfl.season <- nfl.data[season == is.integer(curr_season)]
