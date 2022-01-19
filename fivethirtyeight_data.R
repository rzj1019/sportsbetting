##############################
# Web Scraping Script for Sports Data
##############################

#### Pull in newest data ####
fivethirtyeight_dir <- "C:/Users/johns/Documents/R/fivethirtyeight/data"

# NHL Forecasts
nhl_url <- paste0(fivethirtyeight_dir, "/nhl-forecasts/README.md") %>%
   readr::read_file() %>%
   stringr::str_extract("https://.+csv")
nhl_data <- fread(nhl_url)

# NBA Forecasts
nba_url <- paste0(fivethirtyeight_dir, "/nba-forecasts/README.md") %>%
   readr::read_file() %>%
   stringr::str_extract("https://.+csv")
nba_data <- fread(nba_url)

# NBA Forecasts
nfl_url <- paste0(fivethirtyeight_dir, "/nfl-elo/README.md") %>%
   readr::read_file() %>%
   str_extract("https://.+csv")
nfl_data <- fread(nfl_url)

# Soccer Forecasts
soccer_url <- paste0(fivethirtyeight_dir, "/soccer-spi/README.md") %>%
   readr::read_file() %>%
   str_extract("https://.+csv")
soccer_data <- fread(soccer_url)


#### Get Teams/Leagues ####
nhl_teams <- nhl_data[,unique(home_team)]
nba_teams <- nba_data[,unique(team1)]
nfl_data <- nfl_data[,unique(team1)]
soccer_names <- soccer_data[,unique(team1)]
soccer_leagues <- soccer_data[,unique(league)]


#### Dates ####
