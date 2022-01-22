###################################
# Main data script to pull in data from betting Googlesheet
# https://docs.google.com/spreadsheets/d/16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg/edit#gid=2081509076
###################################

# --- Pull in Google Sheets Data ---
# authorize account
googlesheets4::gs4_auth(email = TRUE)

# Bet538 sheets
bet538 <- "16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg"
PointSpread <- read_sheet(bet538, sheet = "PointSpread") %>% data.table()
Moneyline <- read_sheet(bet538, sheet = "Moneyline") %>% data.table()
Parlays <- read_sheet(bet538, sheet = "Parlays") %>% data.table()


# --- Get gameday dates ---
ps.dates <- PointSpread[,unique(gameday)] %>% as.Date()
ml.dates <- Moneyline[,unique(gameday)] %>% as.Date()
par.dates <- Parlays[,unique(gameday)] %>% as.Date()

bet_dates <- c(ps.dates, ml.dates, par.dates) %>%
   unique() %>%
   sort()
