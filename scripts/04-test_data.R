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
merged_data$Country |> unique() |> length() >=5

## Test if there are 11 years
merged_data$Year |> min(na.rm = TRUE) >=11

## Test if the lowest Employment Rate is 66.64754
merged_data$Employment_Rate |> min() == 66.64754

## Test if the highest Employment Rate is 77.16330
merged_data$Employment_Rate |> max() == 77.16330

## Test if the lowest permanent immigrant inflows is 55675.0
merged_data$Permanent_Inflows |> min() == 55675.0

## Test if the lowest permanent immigrant inflows is 1183505.0
merged_data$Permanent_Inflows |> max() == 1183505.0