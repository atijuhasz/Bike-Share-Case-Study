# ============================================================
# Cyclistic Bike-Share Analysis
# Step 2: Data Merging and Cleaning (All 2025 Datasets)
# ============================================================

# Load libraries
library(tidyverse)
library(readr)
library(lubridate)
library(skimr)

# ------------------------------------------------------------
# 1. Import all monthly datasets
# ------------------------------------------------------------

# Identify all CSV files in raw data folder
files <- list.files(
  path = "data/raw_data",
  pattern = "\\.csv$",
  full.names = TRUE
)

# Combine all files into one dataset
combined_tripdata_2025 <- lapply(files, read_csv) %>%
  bind_rows(.id = "file_id")

# Add filename reference column
combined_tripdata_2025$file <- basename(files)[as.integer(combined_tripdata_2025$file_id)]

# ------------------------------------------------------------
# 2. Initial data inspection
# ------------------------------------------------------------

head(combined_tripdata_2025)
str(combined_tripdata_2025)
skim_without_charts(combined_tripdata_2025)

# Check number of records per month
count(combined_tripdata_2025, file)

# ------------------------------------------------------------
# 3. Remove invalid date records
# ------------------------------------------------------------

date_errors <- combined_tripdata_2025 %>%
  filter(ended_at <= started_at)

# ------------------------------------------------------------
# 4. Create ride duration variable
# ------------------------------------------------------------

combined_tripdata_2025 <- combined_tripdata_2025 %>%
  mutate(duration_minutes = as.numeric(difftime(ended_at, started_at, units = "mins")))

summary(combined_tripdata_2025$duration_minutes)

# ------------------------------------------------------------
# 5. Remove outliers and invalid rides
# ------------------------------------------------------------

# Remove rides with:
# - Negative or zero duration
# - Extremely long durations (> 24 hours)
combined_tripdata_2025 <- combined_tripdata_2025 %>%
  filter(duration_minutes > 1,
         duration_minutes <= 1440)

summary(combined_tripdata_2025$duration_minutes)

# ------------------------------------------------------------
# 6. Create additional time-based features
# ------------------------------------------------------------

combined_tripdata_2025 <- combined_tripdata_2025 %>%
  mutate(
    date = as.Date(started_at),
    weekday = wday(started_at, label = TRUE, week_start = 1),
    hour = hour(started_at)
  )

# ------------------------------------------------------------
# 7. Export cleaned dataset
# ------------------------------------------------------------

write_csv(
  combined_tripdata_2025,
  "data/cleaned_data/cc_tripdata_2025.csv"
)

# ------------------------------------------------------------
# End of Step 2
# This script merges all raw datasets, cleans invalid rides,
# creates analysis features, and exports the cleaned dataset.
# ------------------------------------------------------------
