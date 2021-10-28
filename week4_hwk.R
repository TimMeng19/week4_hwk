library(sf) 
library(here) 
library(raster) 
library(tidyverse) 
library(fs) 
library(ggplot2) 
library(plotly) 
library(dplyr) 
library(janitor)z 
library(maptools) 
library(RColorBrewer) 
library(classInt) 
library(sp) 
library(rgeos) 
library(tmap) 
library(tmaptools) 
library(rgdal) 
library(geojsonio) 


# load files --------------------------------------------------------------


GII <- read.csv("Gender Inequality Index (GII).csv",
                header = TRUE,
                sep = ",",
                encoding = "latin1")

world_country <- st_read(here::here("World_Countries_(Generalized).geojson"))

plot(world_country)




