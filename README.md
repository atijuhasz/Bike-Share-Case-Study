# Cyclistic Bike-Share Analysis  
**Google Data Analytics Capstone Case Study**

This project analyzes bike-share ride data to understand **how casual riders and annual members use Cyclistic bikes differently**. The goal is to provide data-driven marketing recommendations to help convert casual riders into annual members.

---

## Business Task

Cyclistic wants to increase profitability by converting more **casual riders** into **annual members**, since members are more profitable long-term.

**Objective:**  
Identify key differences in how casual riders and annual members use Cyclistic bikes to support smarter marketing decisions.

---

## About Cyclistic

Cyclistic is a fictional Chicago bike-share company (based on the real system Divvy).

- Over **5,800 bikes** and **600+ stations**
- Offers:
  - Single-ride passes  
  - Day passes  
  - Annual memberships  

Rider types:
- **Casual riders** → short-term passes  
- **Annual members** → subscription users  

---

## Data Sources

- [Historical Cyclistic trip data (2025)](https://divvy-tripdata.s3.amazonaws.com/index.html)
- Each file represents ride data for the given month
- Each record represents one bike trip

**Key fields used:**
- Rider type (casual or member)
- Bike type (classic or electric)
- Start & end date & time  

The dataset is reliable but does not include personal or demographic information.

---

## Data Cleaning & Preparation

Before analysis, the dataset was cleaned and prepared:

- Removed rides with:
  - Missing values
  - Duplicates
  - Negative or zero ride duration
  - Duration of over 24 hours

- Standardized column names, date and time formats  
- Created new variables:
  - Ride duration (minutes)  
  - Month 
  - Day of Week
  - Starting Hour
  - Ride duration brackets

Full cleaning steps are documented here:  
`documentation/data_cleaning_steps.md`

---

## Analysis Focus

I compared **casual riders vs annual members** based on:

- Overall Distribution
- Seasonal Trends
- Type of bike used
- Weekly activity patterns
- Daily activity patterns
- Ride Duration

---

## Key Findings

1. **Casual riders take longer, Members take shorter trips**  
   → Casuals: Likely leisure or tourist use
   → Members: Likely commuters
   
2. **Members ride more on weekdays, Casuals ride more on weekends**  
   → Casuals: Further suggesting leisure usage
   → Members: Indicates commuting or routine travel

3. **Casual ridership peaks in summer**  
   → Usage is more seasonal and recreational  

**Example visualizations:**

![Ride Duration](visuals/ride_duration.pdf)  
![Rides by Day](visuals/weekday_rides.pdf)

---

## Recommendations

**1. Summer Conversion Campaign**  
Target casual riders during peak summer activity with discounted annual memberships.

**2. Weekend Pricing Strategy**  
Increase weekend prices for casual rides while keeping member pricing stable to highlight membership value.

**3. Premium pricing for Casual Ebike rides**  
Leverage strong casual demand for e-bikes to drive revenue and memberships by introducing an ebike premium fee.


---

## Tools & Skills Demonstrated

**Skills:**
- Data cleaning and preparation  
- Exploratory data analysis  
- Data visualization  
- Business-focused storytelling  

**Tools:**
- SQL / R / Excel / Google Sheets  
- Google Slides / Canva 

---

## Repository Structure

data/ → Raw and cleaned datasets
analysis/ → SQL/R/Python analysis files
visuals/ → Charts used in the presentation
documentation/ → Cleaning steps and data dictionary
presentation/ → Final slide deck (PDF)


---

## Presentation

The full 24-slide case study presentation is available here:  
`presentation/cyclistic_case_study_slides.pdf`

---

## Project Outcome

This project demonstrates my ability to:

- Work with real-world datasets  
- Clean and prepare messy data  
- Extract meaningful insights  
- Translate analysis into business recommendations  

---

**Author:** Attila Juhász 
**Role:** Aspiring Data Analyst  
**LinkedIn:** ([My profile](https://www.linkedin.com/in/attila-juhasz-989613194/)  
**GitHub:** ([My profile](https://github.com/atijuhasz)

