#### Preamble ####
# Purpose : Simulate the adult female literacy rate data and the fertility rate, total (births per woman) data for South Asia from year 2000-2020
# Author : Jagpreet Singh
# Date : 31 March, 2024
# Contact : jagpreetsingh.singh@mail.utoronto.ca
# License : MIT
# Prerequisite : install.packages("tidyverse") should be run if this package is not pre-installed


# Load necessary libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Generate simulated data
simulated_data <- tibble(
  Year = seq(2000, 2020, by = 1),
  fertility_rate_total = round(seq(3.572, 2.267, length.out = 21) + rnorm(21, mean = 0, sd = 0.1),5),
  female_literacy_rate = round(seq(44.928, 64.607, length.out = 21) + rnorm(21, mean = 0, sd = 0.1),5)
)

# Save the simulated data to a CSV file
write.csv(simulated_data, file = "data/analysis_data/simulated_data.csv", row.names = FALSE)
