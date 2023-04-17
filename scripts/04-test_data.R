#### Preamble ####
# Purpose: Gather the relevant points, clean up the column names and refine their values
# Author: Jenny Shen
# Data: 04 April 2023
# Contact: jennycy.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to the OECD employment rate and Permanent Immigrants Inflows to understand the recoding of values.

#### Workspace setup ####
library(tidyverse)

#### Test data ####

## Test if Employment_Rate is less than 75
merged_data$Employment_Rate |> min(na.rm = TRUE) > 75
