#### Preamble ####
# Purpose: Tests the structure and validity of the analysis polling results data set
# Author: Krishna Kumar
# Date: October 19 2024
# Contact: krishna.kumar@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - 00-install_packages.R
# - 00-simulate_data.R

#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)
library(readr)
library(here)

# Load analysis data
analysis_data <-
  read_parquet(here("data/02-analysis_data/analysis_data.parquet"))

# Check if data is loaded and is a data frame
test_that("Data load and structure", {
  expect_true(exists("analysis_data"))
  expect_true(is.data.frame(analysis_data))
})

# Check for missing values
test_that("No missing values in the dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Define valid states
valid_states <-
  c(
    "Not Applicable",
    "Washington",
    "Oregon",
    "Florida",
    "Arizona",
    "Georgia",
    "Michigan",
    "Nevada",
    "North Carolina",
    "Pennsylvania",
    "Wisconsin",
    "Maryland",
    "Ohio",
    "Texas",
    "California",
    "Minnesota",
    "New Mexico",
    "Montana",
    "Nebraska",
    "Utah",
    "Massachusetts",
    "New Hampshire",
    "Iowa",
    "Nebraska CD-2",
    "New York",
    "Virginia",
    "Connecticut",
    "Rhode Island",
    "Colorado",
    "Missouri",
    "Indiana",
    "Alaska",
    "Vermont",
    "Maine",
    "Maine CD-1",
    "Maine CD-2"
  )

# Validate state names in 'state' column
test_that("State names are valid", {
  expect_true(all(analysis_data$state %in% valid_states))
})

# Population type validation
test_that("Population column contains valid types", {
  expect_true(all(analysis_data$population %in% c("lv", "rv", "a", "v")))
})

# Test for valid values in the national column
test_that("National column contains valid values (0 or 1)", {
  expect_true(all(analysis_data$national %in% c(0, 1)))
})