#### Preamble ####
# Purpose: Gather the relevant points, clean up the column names and refine their values
# Author: Jenny Shen
# Data: 04 April 2023
# Contact: jennycy.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to the OECD employment rate and Permanent Immigrants Inflows to understand the recoding of values.

#### Workspace setup ####
library(tidyverse)
library(haven)
library(here)
library(dplyr)

#### Clean data ####

### First, select variables corresponding to total population, location, time, numbers of permanent inflows.
total_population <- read_csv(here::here("inputs/data/DP_LIVE_17042023200042939.csv"))
total_population_cleaned <- total_population %>%
  select(LOCATION, TIME, Value) %>% 
  mutate(Value = Value * 1000000)

total_population_cleaned <- total_population_cleaned |> rename(
  Country = LOCATION,
  Year = TIME,
  Population = Value
)

### Then, select variables corresponding to perminant immigrant, location, time, numbers of permanent inflows.
permanent_immigrant <- read_csv(here::here("inputs/data/DP_LIVE_04042023230723620.csv"))
  permanent_immigrant_inflows_cleaned <- permanent_immigrant %>%
  filter(!LOCATION %in% c("DEU","ITA","FRA","USA", "AUS", "GBR", "JPN")) %>%
  filter(TIME > 2008 & TIME < 2020) %>%
  select(LOCATION,TIME, Value)
  
### Rename columns so they are easier to read ###
  permanent_immigrant_inflows_cleaned <- permanent_immigrant_inflows_cleaned |> rename(
    Country = LOCATION,
    Year = TIME,
    Permanent_Inflows = Value
  )

# Join the two data frames based on country and year
merged_population_immigrants <- left_join(permanent_immigrant_inflows_cleaned, total_population_cleaned, by = c("Country", "Year"))
  
# Calculate the Permanent_Inflows_Rate column
merged_population_immigrants <- merged_population_immigrants %>%
    mutate("Permanent Inflows Rate" = (Permanent_Inflows / Population) * 100) %>%
    select(Country, Year, "Permanent Inflows Rate")

# Read in the employment rate data
employment_rate_table <- read_csv(here::here("inputs/data/DP_LIVE_04042023230450558.csv"))
employment_rate_cleaned <- employment_rate_table %>%
  filter(!LOCATION %in% c("OECD","DEU","ITA","FRA", "USA", "AUS", "GBR", "JPN")) %>%
  filter(TIME > 2008 & TIME < 2020) %>%
  select(LOCATION, TIME, Value)

### Rename columns so they are easier to read ###
employment_rate_cleaned <- employment_rate_cleaned |> rename(
  Country = LOCATION,
  Year = TIME,
  Employment_Rate = Value
)

## Create a master merged data frame ##
merged_data <- left_join(employment_rate_cleaned, merged_population_immigrants, by = c("Country", "Year"))

#### Save data ####
write_csv(permanent_immigrant_inflows_cleaned, here::here("inputs/data/permanent_immigrant_inflows_cleaned.csv"))
write_csv(employment_rate_cleaned, here::here("inputs/data/employment_rate_cleaned.csv"))
write_csv(total_population_cleaned, here::here("inputs/data/total_population_cleaned.csv"))
write_csv(merged_data, here::here("inputs/data/merged_data.csv"))