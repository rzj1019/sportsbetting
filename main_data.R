###################################
# Main data script to pull in data from betting Googlesheet
# https://docs.google.com/spreadsheets/d/16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg/edit#gid=2081509076
###################################

# --- Pull in Google Sheets Data ---
# authorize account
googlesheets4::gs4_auth(email = TRUE)

# Bet538 sheets
bet538_id <- "16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg"
PointSpread <- read_sheet(ss = bet538_id, sheet = "PointSpread") %>% data.table()
Moneyline <- read_sheet(ss = bet538_id, sheet = "Moneyline") %>% data.table()
Parlays <- read_sheet(ss = bet538_id, sheet = "Parlays") %>% data.table()


# --- Get gameday dates ---
ps_dates <- PointSpread[,unique(gameday)] %>% as.Date()
ml_dates <- Moneyline[,unique(gameday)] %>% as.Date()
par_dates <- Parlays[,unique(gameday)] %>% as.Date()

bet_dates <- c(ps_dates, ml_dates, par_dates) %>%
   unique() %>%
   sort()
