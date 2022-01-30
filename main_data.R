###################################
# Main data script to pull in data from betting Googlesheet
# https://docs.google.com/spreadsheets/d/16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg/edit#gid=2081509076
###################################

# --- Pull in Google Sheets Data ---
# authorize account
googlesheets4::gs4_auth(email = TRUE)

# Bet538 sheets
bet538 <- "16RhAnUcACgKTYaJZKT7JzWDd57zcFNzMkXL29KGo9rg"
pointspread.new <- read_sheet(bet538, sheet = "PointSpread") %>% data.table()
moneyline.new <- read_sheet(bet538, sheet = "Moneyline") %>% data.table()
parlays.new <- read_sheet(bet538, sheet = "Parlays") %>% data.table()


#### Save and Update Data ####
# Point Spread
if (!file.exists(paste0(data.dir, "/point_spread.RDS"))) {
   saveRDS(pointspread.new, file = paste0(data.dir, "/point_spread.rds"))
   pointspread.data <- pointspread.new
}else{
   # check old data against new data
   pointspread.data <- readRDS(paste0(data.dir, "/point_spread.rds"))

   if(nrow(setdiff(pointspread.new, pointspread.data))>0){
      saveRDS(pointspread.new, file = paste0(data.dir, "/point_spread.rds"))
      message("Point Spread data has changed, updated to new data")
   }else{
      message("Point Spread data has not updated.")
   }
}

# Moneyline
if (!file.exists(paste0(data.dir, "/moneyline.RDS"))) {
   saveRDS(moneyline.new, file = paste0(data.dir, "/moneyline.rds"))
   moneyline.data <- moneyline.new
}else{
   # check old data against new data
   moneyline.data <- readRDS(paste0(data.dir, "/moneyline.rds"))

   if(nrow(setdiff(moneyline.new, moneyline.data))>0){
      saveRDS(moneyline.new, file = paste0(data.dir, "/moneyline.rds"))
      message("Moneyline data has changed, updated to new data")
   }else{
      message("Moneyline data has not updated.")
   }
}

# Parlays
if (!file.exists(paste0(data.dir, "/parlays.RDS"))) {
   saveRDS(parlays.new, file = paste0(data.dir, "/parlays.rds"))
   parlays.data <- parlays.new
}else{
   # check old data against new data
   parlays.data <- readRDS(paste0(data.dir, "/parlays.rds"))

   if(nrow(setdiff(parlays.new, parlays.data))>0){
      saveRDS(parlays.new, file = paste0(data.dir, "/parlays.rds"))
      message("Parlays data has changed, updated to new data")
   }else{
      message("Parlays data has not updated.")
   }
}


#### Get gameday dates ####
ps.dates <- pointspread.data[ ,unique(gameday)] %>% as.Date()
ml.dates <- moneyline.data[ ,unique(gameday)] %>% as.Date()
par.dates <- parlays.data[ ,unique(gameday)] %>% as.Date()

bet_dates <- c(ps.dates, ml.dates, par.dates) %>%
   unique() %>%
   sort()
