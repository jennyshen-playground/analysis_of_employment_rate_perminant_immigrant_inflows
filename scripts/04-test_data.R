#### Preamble ####
# Purpose: Tests a dataset to ensure it's validity.
# Author: Jenny Shen
# Data: 04 April 2023
# Contact: jennycy.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: To have ran the cleaning script to test the cleaned datasets

#### Workspace setup ####
library(tidyverse)

#### Test data ####

## Test if there are 5 countries
merged_data$Country |> unique() |> length() >=1

## Test if there are 11 years
merged_data$Year |> min(na.rm = TRUE) >=11

## Test if the lowest Employment Rate is 71.50833
merged_data$Employment_Rate |> min() == 71.50833

## Test if the highest Employment Rate is 74.60000
merged_data$Employment_Rate |> max() == 74.60000

## Test if the lowest permanent immigrant inflows is 249292
merged_data$Permanent_Inflows |> min() == 249292

## Test if the highest permanent immigrant inflows is 341173
merged_data$Permanent_Inflows |> max() == 341173