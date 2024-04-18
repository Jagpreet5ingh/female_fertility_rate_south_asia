#### Preamble ####
# Purpose: Tests a dataset to ensure it's validity.
# Author: Jagpreet Singh
# Data: 17 April 2024
# Contact: jagpreetsingh.singh@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Read data ####
cleaned_data_south_asia_2000_2020 <- read.csv("data/analysis_data/cleaned_data_south_asia_2000_2020.csv")

#### Test data ####

# Test if there are 21 years
cleaned_data_south_asia_2000_2020$Year |> min(na.rm = TRUE) >=21


# Test for zero or blank values in the fertility_rate_total column
zero_blank_test <- cleaned_data_south_asia_2000_2020 %>%
  filter(!is.na(fertility_rate_total) & fertility_rate_total != 0) %>%
  nrow() == nrow(cleaned_data_south_asia_2000_2020)

# Output the result
print(zero_blank_test)

# Test for zero or blank values in the female_literacy_rate column
zero_blank_test <- cleaned_data_south_asia_2000_2020 %>%
  filter(!is.na(female_literacy_rate) & female_literacy_rate != 0) %>%
  nrow() == nrow(cleaned_data_south_asia_2000_2020)

# Output the result
print(zero_blank_test)

# Test for matching values between fertility_rate_total and female_literacy_rate columns for each year
matching_values <- cleaned_data_south_asia_2000_2020 %>%
  group_by(Year) %>%
  filter(!is.na(fertility_rate_total) & !is.na(female_literacy_rate)) %>%
  filter(fertility_rate_total == female_literacy_rate) %>%
  ungroup()

# Output the result
if (nrow(matching_values) > 0) {
  print("Test Failed: Some values in fertility_rate_total match female_literacy_rate for one or more years.")
} else {
  print("Test Passed: No values in fertility_rate_total match female_literacy_rate for any given year.")
}