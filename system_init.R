############################
# Environment loader
###########################

#### check working directory and set if needed; set additional directories ####
if(Sys.info()[1] == "Linux"){
  if(getwd() == "~/R/sportsbetting"){
    message("Working directory not set appropriately. Changing working directory to: ")
    message(getwd())
  } else{
    setwd("~/R/sportsbetting")
    message("Working directory is: ", getwd())

  }
}


#### Helpful Functions ####
namediff <- function(x, y) {
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


##### Loading Needed packages ####
# Require and install pacman for loading all needed packages
if (!require("pacman", character.only = TRUE)) {
   install.packages("pacman")
   library(pacman)
}

# List of packages to be loaded
pkgs <- c("assertable",
          "data.table",
          "installr",
          "shiny",
          "tidyverse")

p_load(pkgs, character.only = TRUE)
p_loaded()


