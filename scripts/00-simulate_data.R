#### Preamble ####
# Purpose: Gather the relevant points, clean up the column names and refine their values
# Author: Jenny Shen
# Data: 04 April 2023
# Contact: jennycy.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to the OECD employment rate and Permanent Immigrants Inflows to understand the recoding of values.

#### Workspace setup ####
library(tidyverse)
set.seed(383)

#### Simulate data ####
## Simulate a table with 
## Focused on simulating a data set that covers United States, Canada, United Kingdom, Australia, and Japan
## and the numbers of permanent inflows
## and year (2008-2019)
## and the in numbers of employed persons aged 15 to 64 as a percentage of working age population

simulated_perm_employed_data <- tibble(
  country = rep(c("United States", "Canada", "United Kingdom", "Australia", "Japan"), each = 12),
  year = rep(2008:2019, times = 5),
  employment_rate = c(
    runif(n = 60, min = 50, max = 70) |> floor()
  ),
  permanent_inflows = c(
    round(runif(60, 500000, 700000))
  )
)








