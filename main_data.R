###################################
# Main data script to pull in data from betting Googlesheet
# https://docs.google.com/spreadsheets/d/16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg/edit#gid=2081509076
###################################

# Authentication
googlesheets4::gs4_auth(email = TRUE)

# Bet538 sheet ids
bet538_id <- "16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg"
PointSpread <- read_sheet(ss = bet538_id, sheet = "PointSpread") %>% data.table()
Moneyline <- read_sheet(ss = bet538_id, sheet = "Moneyline") %>% data.table()
Parlays <- read_sheet(ss = bet538_id, sheet = "Parlays") %>% data.table()

