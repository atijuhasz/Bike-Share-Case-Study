# ============================================================
# Cyclistic Bike-Share Analysis
# Step 3: Analysis and Visualization Data Preparation
# ============================================================

library(tidyverse)
library(readr)
library(lubridate)
library(scales)

# ------------------------------------------------------------
# 1. Load cleaned dataset
# ------------------------------------------------------------

cc_tripdata_2025 <- read_csv("data/cleaned_data/cc_tripdata_2025.csv")

# Remove records outside 2025
cc_tripdata_2025 <- cc_tripdata_2025 %>%
  filter(date >= as.Date("2025-01-01"))

# ------------------------------------------------------------
# 2. Ensure weekday order is correct
# ------------------------------------------------------------

cc_tripdata_2025 <- cc_tripdata_2025 %>%
  mutate(
    weekday = factor(
      weekday,
      levels = c("H", "K", "Sze", "Cs", "P", "Szo", "V"),
      ordered = TRUE
    )
  )

# ------------------------------------------------------------
# 3. Create ride duration bins
# ------------------------------------------------------------

cc_tripdata_2025 <- cc_tripdata_2025 %>%
  mutate(duration_bin = case_when(
    duration_minutes <= 5 ~ "0-5",
    duration_minutes <= 10 ~ "5-10",
    duration_minutes <= 20 ~ "10-20",
    duration_minutes <= 40 ~ "20-40",
    duration_minutes <= 60 ~ "40-60",
    duration_minutes <= 120 ~ "60-120",
    TRUE ~ "120+"
  )) %>%
  mutate(duration_bin = factor(
    duration_bin,
    levels = c("0-5", "5-10", "10-20", "20-40", "40-60", "60-120", "120+"),
    ordered = TRUE
  ))

# ------------------------------------------------------------
# 4. User type distribution plot
# ------------------------------------------------------------

p1 <- cc_tripdata_2025 %>%
  count(member_casual) %>%
  mutate(share = n / sum(n)) %>%
  ggplot(aes(x = "", y = share, fill = member_casual)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  geom_text(aes(label = percent(share)),
            position = position_stack(vjust = 0.5),
            color = "white", size = 6) +
  labs(title = "Ride Share: Casual vs Members", fill = "User Type") +
  theme_void()

ggsave("visuals/casual_vs_member_pie.png", p1, width = 8, height = 8, dpi = 300)

# ------------------------------------------------------------
# 5. Daily ride trends
# ------------------------------------------------------------

daily_rides <- cc_tripdata_2025 %>%
  group_by(date, member_casual) %>%
  summarise(rides = n(), .groups = "drop")

p2 <- ggplot(daily_rides, aes(date, rides, color = member_casual)) +
  geom_line(linewidth = 1) +
  labs(title = "Daily Rides by User Type", x = "Date", y = "Rides")

ggsave("visuals/daily_rides.png", p2, width = 8, height = 6, dpi = 300)

# ------------------------------------------------------------
# 6. Monthly trends
# ------------------------------------------------------------

monthly_rides <- cc_tripdata_2025 %>%
  mutate(month = floor_date(date, "month")) %>%
  group_by(month, member_casual) %>%
  summarise(rides = n(), .groups = "drop")

p3 <- ggplot(monthly_rides, aes(month, rides, color = member_casual)) +
  geom_line(linewidth = 1.2) +
  geom_point() +
  scale_x_date(date_labels = "%b", date_breaks = "1 month") +
  labs(title = "Monthly Ride Activity (2025)")

ggsave("visuals/monthly_rides.png", p3, width = 8, height = 6, dpi = 300)

# ------------------------------------------------------------
# 7. Export summary tables for dashboarding
# ------------------------------------------------------------

write_csv(
  cc_tripdata_2025 %>%
    group_by(rideable_type, member_casual) %>%
    summarise(rides = n(), .groups = "drop"),
  "data/processed/bike_types.csv"
)

write_csv(
  cc_tripdata_2025 %>%
    group_by(weekday, member_casual) %>%
    summarise(rides = n(), .groups = "drop"),
  "data/processed/wday_rides.csv"
)

write_csv(
  cc_tripdata_2025 %>%
    group_by(hour, member_casual) %>%
    summarise(rides = n(), .groups = "drop"),
  "data/processed/hourly_rides.csv"
)

write_csv(
  cc_tripdata_2025 %>%
    group_by(weekday, member_casual, duration_bin) %>%
    summarise(rides = n(), .groups = "drop"),
  "data/processed/wday_duration.csv"
)

# ------------------------------------------------------------
# End of Step 3
# Produces visualizations and summary datasets for reporting.
# ------------------------------------------------------------
