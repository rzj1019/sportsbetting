#############################
# Function to pull in data from https://github.com/fivethirtyeight/data
# check with currently stored data, and update as needed
###############################

pull.and.check <- function(sport, address) {

   message("Pulling ", sport, " data")
   temp.data <- address %>% data.table::fread()

   # Check if data updated
   if (!file.exists(paste0(data.dir, "/", sport, "_data.rds"))) {
      saveRDS(temp.data, file = paste0(data.dir, "/", sport, "_data.rds"))
   }else{
      # check old data against new data
      sys.data <- readRDS(paste0(data.dir, "/", sport, "_data.rds"))

      if(nrow(setdiff(temp.data, sys.data))>0){
         saveRDS(temp.data, file = paste0(data.dir, "/", sport, "_data.rds"))
         message(sport, " data has changed, updated to new data")
      }else{
         message(sport, " data has not updated.")
      }
   }

   assign(paste0(sport,".data"), temp.data, envir = .GlobalEnv)
}
