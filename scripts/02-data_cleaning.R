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

### First, select variables corresponding to perminant immigrant, location, time, numbers of permanent inflows.
permanent_immigrant <- read_csv(here::here("inputs/data/DP_LIVE_04042023230723620.csv"))
permanent_immigrant_inflows_cleaned <- permanent_immigrant |> select(LOCATION,TIME, Value)

### First, select variables corresponding to employment rate, location, time, in numbers of employed persons aged 15 to 64 as a percentage of working age population..
employment_rate <- read_csv(here::here("inputs/data/DP_LIVE_04042023230450558.csv"))
employment_rate_cleaned <- employment_rate |> select(LOCATION,TIME, Value)

#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

