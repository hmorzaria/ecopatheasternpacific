
.packages = c("tidyverse","devtools","readxl",
              "sp","sf","GISTools","rgdal",
              "rnaturalearth","RCurl","XML",
              "plyr","here", "raster", "exactextractr",
              "climateStability","robis","mgcv","lares",
              "car","Redmonder","metan","vegan","paran",
              "factoextra","gridExtra","corrplot","mgcViz")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()

if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst], )

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

remotes::install_github("iobis/robis")

# Load packages into session 
lapply(.packages, require, character.only=TRUE)
