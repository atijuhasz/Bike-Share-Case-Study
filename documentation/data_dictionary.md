# 📘 Data Dictionary  
Cyclistic Bike-Share Analysis

This document describes the variables used in the cleaned dataset:  
`cc_tripdata_2025.csv`

Each row represents one bike trip.

---

## 🚲 Trip Information

| Column Name | Description |
|-------------|-------------|
| `ride_id` | Unique identifier for each trip |
| `rideable_type` | Type of bike used (e.g., classic bike, electric bike) |
| `member_casual` | Rider type: **member** (annual subscriber) or **casual** (single/day pass user) |

---

## ⏱ Time Variables

| Column Name | Description |
|-------------|-------------|
| `started_at` | Date and time when the ride started |
| `ended_at` | Date and time when the ride ended |
| `date` | Date of ride start (no time component) |
| `hour` | Hour of the day when the ride started (0–23) |
| `weekday` | Day of the week when the ride started (Monday–Sunday, ordered) |

---

## 📏 Ride Duration

| Column Name | Description |
|-------------|-------------|
| `duration_minutes` | Total ride duration in minutes |
| `duration_bin` | Ride duration grouped into time ranges: <br> `0–5`, `5–10`, `10–20`, `20–40`, `40–60`, `60–120`, `120+` |

---

## 📍 Station Information *(if included in dataset)*

| Column Name | Description |
|-------------|-------------|
| `start_station_name` | Name of station where ride began |
| `start_station_id` | ID of start station |
| `end_station_name` | Name of station where ride ended |
| `end_station_id` | ID of end station |

---

## 🌍 Location Data *(if included)*

| Column Name | Description |
|-------------|-------------|
| `start_lat` | Latitude of ride start location |
| `start_lng` | Longitude of ride start location |
| `end_lat` | Latitude of ride end location |
| `end_lng` | Longitude of ride end location |

---

## 🧠 Notes

- Records with invalid or unrealistic durations were removed during cleaning.
- All time-based variables were derived from `started_at`.
- This dataset is used to compare behavioral patterns between **casual riders** and **annual members**.
