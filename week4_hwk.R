library(sf) 
library(here) 
library(raster) 
library(tidyverse) 
library(fs) 
library(ggplot2) 
library(plotly) 
library(dplyr) 
library(janitor) 
library(maptools) 
library(RColorBrewer) 
library(classInt) 
library(sp) 
library(rgeos) 
library(tmap) 
library(tmaptools) 
library(rgdal) 
library(geojsonio) 
library(dplyr)

# load files --------------------------------------------------------------


GII <- read.csv("Gender Inequality Index (GII).csv",
                header = TRUE,
                sep = ",",
                encoding = "latin1")

world_country <- st_read(here::here("World_Countries_(Generalized).geojson"))

plot(world_country)


# add a new column in GII -------------------------------------------------


GII_1 <- GII %>%
  clean_names()

#Check the current type status
Datatypelist <- GII_1 %>% 
  summarise_all(class) %>%
  pivot_longer(everything(), 
               names_to="All_variables", 
               values_to="Variable_class")


# replace all the '..' to NA in GII ---------------------------------------
#naniar package: https://cran.r-project.org/web/packages/naniar/vignettes/replace-with-na.html

library(naniar)
GII_2 <- GII_1 %>% 
  replace_with_na_all(condition = ~.x == '..')

Datatypelist_2 <- GII_2 %>% 
  summarise_all(class) %>%
  pivot_longer(everything(), 
               names_to="All_variables", 
               values_to="Variable_class")


# Change GII from Char to Num ---------------------------------------------


GII_3 <- GII_2 %>% 
  mutate(year_1995 = as.numeric(x1995),
         year_2000 = as.numeric(x2000),
         year_2005 = as.numeric(x2005),
         year_2010 = as.numeric(x2010),
         year_2011 = as.numeric(x2011),
         year_2012 = as.numeric(x2012),
         year_2013 = as.numeric(x2013),
         year_2014 = as.numeric(x2014),
         year_2015 = as.numeric(x2015),
         year_2016 = as.numeric(x2016),
         year_2017 = as.numeric(x2017),
         year_2018 = as.numeric(x2018),
         year_2019 = as.numeric(x2019),
         )

Datatypelist_3 <- GII_3 %>% 
  summarise_all(class) %>%
  pivot_longer(everything(), 
               names_to="All_variables", 
               values_to="Variable_class")


# extract numeric columns -------------------------------------------------


GII_num <-GII_3 %>%
  dplyr::select(c(1,2,16,17,18,19,20,21,22,23,24,25,26,27,28))


# calculate average GII in the most recent 3 years ------------------------


GII_num <- GII_num %>% 
  #new column with average of male and female life expectancy
  mutate(average_GII_3_years = (`year_2019` + `year_2018` + `year_2017`)/3)


qtm(world_country)


