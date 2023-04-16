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

#### Download data ####

##Data was downloaded from https://data.oecd.org/emp/employment-rate.htm, from the individual data sets.
##Data sets from years 2008 - 2019 were downloaded manually.

#### Save data ####

permanent_immigrant <- read_csv(here::here("inputs/data/DP_LIVE_04042023230723620.csv"))
employment_rate <- read_csv(here::here("inputs/data/DP_LIVE_04042023230450558.csv"))


         