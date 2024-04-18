#### Preamble ####
# Purpose : Clean and merging the raw data to gather relevant data for analysis 
# Author : Jagpreet Singh
# Date : 17 April, 2024
# Contact : jagpreetsingh.singh@mail.utoronto.ca
# License : MIT
# Prerequisite : Download the global Literacy rate (adult female) and Fertility rate (total) from World Bank Open Data.


#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####

# Read the fertility rate, total data
fertility_rate_data <- read_csv("data/raw_data/API_SP.DYN.TFRT.IN_DS2_en_csv_v2_43477.csv", skip = 4)
south_asia_fertility_rate <- fertility_rate_data %>% 
  filter(`Country Name` == "South Asia") %>% 
  select(`2000`:`2020`) %>% 
  pivot_longer(cols = everything(), names_to = "Year", values_to = "fertility_rate_total")

# Read the literacy rate, adult female data
female_literacy_rate_data <- read_csv("data/raw_data/API_SE.ADT.LITR.FE.ZS_DS2_en_csv_v2_58000.csv", skip = 4)
south_asia_literacy_rate <- female_literacy_rate_data %>% 
  filter(`Country Name` == "South Asia") %>% 
  select(`2000`:`2020`) %>% 
  pivot_longer(cols = everything(), names_to = "Year", values_to = "female_literacy_Rate")

# Combine the datasets
combined_data <- left_join(south_asia_fertility_rate, south_asia_literacy_rate, by = "Year")

# Save the combined data to a new CSV file
write_csv(combined_data, "data/analysis_data/south_asia_2000_2020.csv")

write_parquet(combined_data, "data/analysis_data/south_asia_2000_2020.parquet")


