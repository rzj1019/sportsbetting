###################################
# Main data script to pull in data from betting Googlesheet
# https://docs.google.com/spreadsheets/d/16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg/edit#gid=2081509076
###################################

# Authentication
googlesheets4::gs4_auth() # Google Sheets

# Bet538 sheet ids
bet538_id <- "16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg"
PointSpread <- read_sheet(ss = bet538_id, sheet = "PointSpread")
Moneyline <- read_sheet(ss = bet538_id, sheet = "Moneyline")
Parlays <- read_sheet(ss = bet538_id, sheet = "Parlays")

