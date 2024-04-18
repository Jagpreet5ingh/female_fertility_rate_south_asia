#### Preamble ####
# Purpose: Simple Linear Regression Model for relationship between female literacy rate and fertility rate in South Asia between 2000-2020
# Author: Jagpreet Singh
# Data: 17 April 2024
# Contact: jagpreetsingh.singh@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R and run install.packages("modelsummary")

#### Workspace setup ####
library(tidyverse)
library(modelsummary)

#### Read data ####
analysis_data <- read.csv("data/analysis_data/cleaned_data_south_asia_2000_2020.csv")

#### Create model ####

# Fit a linear model
model <- lm(fertility_rate_total ~ female_literacy_rate, data = analysis_data)

# Summary of the model to see results
modelsummary::modelsummary(
  list("Female Literacy Rate" = model),
  fmt = 2
)

#### Save model ####
saveRDS(model, "models/linear_model.rds")