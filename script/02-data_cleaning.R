#### Preamble ####
# Purpose : Clean and merging the raw data from unedited_data_fertility_rate.csv and input/data/unedited_data_literacy_rate.csv
# Author : Jagpreet Singh
# Date : 31 March, 2024
# Contact : jagpreetsingh.singh@mail.utoronto.ca
# License : MIT
# Prerequisite : install.packages("tidyverse") should be run if not pre-existing

#### Workspace Setup ####

library(tidyverse)
options(warn = -1)

# Define file paths
fertility_file <- "input/data/unedited_data_fertility_rate.csv"
literacy_file <- "input/data/unedited_data_literacy_rate.csv"
output_file <- "output/data/edited_data.csv"

# Suppressing message while reading CSV files
suppressMessages({
  # Read the CSV files, selecting the Time and respective columns
  fertility_data <- read_csv(fertility_file) %>%
    filter(Time <= 2020) %>%
    select(Time, `South Asia [SAS] - Fertility rate, total (births per woman) [SP.DYN.TFRT.IN]`) %>%
    rename(Year = Time, Fertility_rate = `South Asia [SAS] - Fertility rate, total (births per woman) [SP.DYN.TFRT.IN]`)
  
  literacy_data <- read_csv(literacy_file) %>%
    filter(Time <= 2020) %>%
    select(Time, `South Asia [SAS] - Literacy rate, adult female (% of females ages 15 and above) [SE.ADT.LITR.FE.ZS]`) %>%
    rename(Year = Time, Literacy_Rate = `South Asia [SAS] - Literacy rate, adult female (% of females ages 15 and above) [SE.ADT.LITR.FE.ZS]`)
})

# Merge the datasets on the "Year" column
consolidated_data <- merge(fertility_data, literacy_data, by = "Year")

# Write the consolidated data to a third file
write_csv(consolidated_data, output_file)


