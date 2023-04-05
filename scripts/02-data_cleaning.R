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

#### Clean data ####
permanent_immigrant <- read_csv(here::here("inputs/data/DP_LIVE_04042023230723620.csv"))
employment_rate <- read_csv(here::here("inputs/data/DP_LIVE_04042023230450558.csv"))

permanent_immigrant_inflows_cleaned <- permanent_immigrant |> select(LOCATION,TIME, Value)
employment_rate_cleaned <- employment_rate |> select(LOCATION,TIME, Value)

#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

