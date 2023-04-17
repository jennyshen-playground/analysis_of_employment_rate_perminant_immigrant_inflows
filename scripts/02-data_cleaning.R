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

### First, select variables corresponding to perminant immigrant, location, time, numbers of permanent inflows.
permanent_immigrant <- read_csv(here::here("inputs/data/DP_LIVE_04042023230723620.csv"))
permanent_immigrant_inflows_cleaned <- permanent_immigrant |> select(LOCATION,TIME, Value)

# Read in the employment rate data
employment_rate_table <- read_csv(here::here("inputs/data/DP_LIVE_04042023230450558.csv"))
employment_rate_cleaned <- employment_rate_table %>%
  filter(!LOCATION %in% c("OECD","DEU","ITA","FRA")) %>%
  filter(TIME < 2019) %>%
  select(LOCATION, TIME, Value)

### Rename columns so they are easier to read ###
permanent_immigrant_inflows_cleaned <- permanent_immigrant_inflows_cleaned |> rename(
  Country = LOCATION,
  Year = TIME,
  Permanent_Inflows = Value
)

employment_rate_cleaned <- employment_rate_cleaned |> rename(
  Country = LOCATION,
  Year = TIME,
  Employment_Rate = Value
)

## Create a master merged data frame ##
merged_data <- merge(employment_rate_cleaned, permanent_immigrant_inflows_cleaned, by = c("Country", "Year"))