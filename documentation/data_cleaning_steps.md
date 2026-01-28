# 🧹 Data Cleaning & Preparation Steps  
Cyclistic Bike-Share Analysis

This document describes how the raw ride data was cleaned and prepared before analysis. The goal was to ensure the dataset was accurate, consistent, and suitable for comparing casual riders and annual members.

---

## 📂 Data Source

- Historical Cyclistic trip data (2025)
- Each row represents one bike ride
- Multiple monthly CSV files were combined into a single dataset

---

## 🔗 Step 1 — Merging Data Files

All monthly CSV files were imported and combined into one table.

- Used a script to automatically detect all `.csv` files in the `raw_data` folder
- Added a `file` column to track which month each record came from

This ensures all rides from 2025 are analyzed together.

---

## 🗓 Step 2 — Date Validation

Some records contained invalid time values.

**Removed rides where:**
- `ended_at` was earlier than or equal to `started_at`

These records indicate data errors and cannot represent real trips.

---

## ⏱ Step 3 — Ride Duration Calculation

A new variable was created:

- `duration_minutes` = difference between end time and start time (in minutes)

This allows ride behavior to be analyzed based on trip length.

---

## 🚫 Step 4 — Removing Invalid and Extreme Rides

To avoid distorted results, unrealistic trips were removed.

**Filtered out:**

| Condition | Reason |
|-----------|--------|
| Duration ≤ 1 minute | Likely false starts or docking errors |
| Duration > 1,440 minutes (24 hours) | Likely data recording issues |

This ensures the analysis reflects normal rider behavior.

---

## 🗓 Step 5 — Time-Based Feature Creation

Additional variables were created for trend analysis:

| Variable | Description |
|----------|-------------|
| `date` | Ride date only (no time) |
| `weekday` | Day of week (Monday–Sunday) |
| `hour` | Hour of day ride started |
| `duration_bin` | Ride length grouped into time ranges |

These features allow comparisons of riding patterns by day, time, and trip length.

---

## 🧩 Step 6 — Categorical Formatting

To ensure correct ordering in analysis and charts:

- `weekday` was converted to an ordered factor (Monday → Sunday)
- `duration_bin` was converted to ordered time ranges

This improves readability and prevents sorting errors in visualizations.

---

## 📤 Step 7 — Final Cleaned Dataset

After cleaning:

- All valid rides were stored in  
  `data/cleaned_data/cc_tripdata_2025.csv`
- Summary tables for visualization were exported to  
  `data/processed/`

---

## ✅ Outcome

The cleaned dataset:

- Removes errors and unrealistic trips  
- Contains consistent time and duration measures  
- Includes new variables for behavioral analysis  

This prepared dataset supports reliable comparisons between **casual riders** and **annual members**.
