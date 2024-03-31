#### Preamble ####
# Purpose: Gather the relevant points, clean up the column names and refine their values
# Author: Jagpreet Singh
# Data: 31 March, 2024
# Contact: jagpreetsingh.singh@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to the World Bank Literacy rate, adult female (% of femaleas ages 15 and above) and Fertility rate, total (births per woman) data.

#### Workspace setup ####
library(tidyverse)

#### Download data ####

##Data was downloaded from https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=8S&name_desc=true&view=map and https://genderdata.worldbank.org/indicators/sp-dyn-tfrt-in/ from the individual data sets.
##Data sets for years 2000 - 2020 were downloaded manually.

#### Save data ####

fertility_rate <- read_csv(here::here("input/data/unedited_data_fertility_rate.csv"))
literacy_rate <- read_csv(here::here("input/data/unedited_data_literacy_rate.csv"))