# ============================================================
# Cyclistic Bike-Share Analysis
# Step 1: Initial Data Exploration (January 2025 Dataset)
# ============================================================

# Load required libraries
library(tidyverse)
library(readr)
library(skimr)
library(lubridate)

# ------------------------------------------------------------
# 1. Import dataset
# ------------------------------------------------------------

tripdata_202501 <- read_csv("data/raw_data/202501-divvy-tripdata.csv")

# Preview the dataset
head(tripdata_202501)
str(tripdata_202501)
colnames(tripdata_202501)

# ------------------------------------------------------------
# 2. Data quality and structure check
# ------------------------------------------------------------

# Summary of missing values, distributions, and data types
skim_without_charts(tripdata_202501)

# ------------------------------------------------------------
# 3. Feature Engineering
# ------------------------------------------------------------

# Create ride duration in minutes
mut_tripdata_202501 <- tripdata_202501 %>%
  mutate(
    duration_minutes = as.numeric(difftime(ended_at, started_at, units = "mins"))
  ) %>%
  arrange(desc(duration_minutes))  # Helps identify outliers

# Create weekday variable (Monday = 1)
mut_tripdata_202501 <- mut_tripdata_202501 %>%
  mutate(
    weekday = wday(started_at, week_start = 1)
  )

# ------------------------------------------------------------
# End of Step 1
# This file explores structure and prepares features
# used later in cleaning and analysis.
# ------------------------------------------------------------
