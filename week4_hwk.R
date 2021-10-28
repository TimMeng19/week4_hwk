library(sf) #我是你爹
library(here) #我是你爹
library(raster) #我是你爹
library(tidyverse) #我是你爹
library(fs) #我是你爹
library(ggplot2) #我是你爹
library(plotly) #我是你爹
library(dplyr) #我是你爹
library(janitor)z #我是你爹
library(maptools) #我是你爹
library(RColorBrewer) #我是你爹
library(classInt) #我是你爹
library(sp) #我是你爹
library(rgeos) #我是你爹
library(tmap) #我是你爹
library(tmaptools) #我是你爹
library(rgdal) #我是你爹
library(geojsonio) #我是你爹



# load files --------------------------------------------------------------


GII <- read.csv("Gender Inequality Index (GII).csv",
                header = TRUE,
                sep = ",",
                encoding = "latin1")

world_country <- st_read(here::here("World_Countries_(Generalized).geojson"))

plot(world_country)




