############################
# Environment loader
###########################

#### check working directory and set if needed; set additional directories ####
if(getwd()==paste0("C:/Users/",Sys.info()[6],"/Documents/R/sportsbetting")){
   message(paste0("Current working directory: ", getwd()))
} else{
   setwd(paste0("C:/Users/",Sys.info()[6],"/Documents/R/sportsbetting"))
   message(paste0("Directory changed, set to: ", getwd()))
}


##### Loading Needed packages ####

# Checks for needed package [pacman] and then loads other packages [pkgs]
if(!require("pacman", character.only = T)){
   install.packages("pacman")
}

pkgs <- c("assertable",
          "data.table",
          "googledrive",
          "googlesheets4",
          "installr",
          "rvest",
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
      rvest
      shiny
      tidyverse")

#### Helpful Functions ####
namediff <- function(x, y){
   message("Columns in ", deparse(substitute(x)), " that are not in ", deparse(substitute(y)), ":")
   xdiff <- setdiff(names(x), names(y))
   for (x in 1:length(xdiff)) {
      cat(xdiff[x], "\n")
   }
   message("Columns ", deparse(substitute(y)), " that are not in ", deparse(substitute(x)), ":")
   ydiff <- setdiff(names(y), names(x))
   for (y in 1:length(ydiff)) {
      cat(ydiff[x], "\n")
   }
}
