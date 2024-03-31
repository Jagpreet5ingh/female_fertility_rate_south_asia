
library(tidyverse)

# Define file paths
fertility_file <- "input/data/unedited_data_fertility_rate.csv"
literacy_file <- "input/data/unedited_data_literacy_rate.csv"
output_file <- "output/data/edited_data.csv"

# Read the CSV files and select two columns
fertility_data <- read_csv(fertility_file) %>%
  select(Time, `South Asia [SAS] - Fertility rate, total (births per woman) [SP.DYN.TFRT.IN]`)

literacy_data <- read_csv(literacy_file) %>%
  select(Time, `South Asia [SAS] - Literacy rate, adult female (% of females ages 15 and above) [SE.ADT.LITR.FE.ZS]`)

# Combine the selected columns into a single data frame
selected_data <- bind_cols(fertility_data, literacy_data)

# Write the selected columns to a third file
write_csv(selected_data, output_file)
