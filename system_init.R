############################
# Environment loader
###########################

# check working directories and set if needed
if(getwd()==paste0("C:/Users/",Sys.info()[6],"/Documents/R/Bet538")){
   message(paste0("Current working directory: ", getwd()))
} else{
   setwd(paste0("C:/Users/",Sys.info()[6],"/Documents/R/Bet538"))
   message(paste0("Directory changed, set to: ", getwd()))
}

# Loading Needed packages

# Checks for needed package [pacman] and then loads other packages [pkgs]
if(!require("pacman", character.only = T)){
   install.packages("pacman")
}

pkgs <- c("assertable",
          "data.table",
          "googledrive",
          "googlesheets4",
          "installr",
          "shiny",
          "tidyverse")

pacman::p_load(pkgs, character.only = T)


# system initialized message
message("Directories changed and loaded packages:
      assertable
      data.table
      googledrive
      googlesheets4
      installr
      shiny
      tidyverse")