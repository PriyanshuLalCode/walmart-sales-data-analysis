# 🛒 Walmart Sales Intelligence & Forecasting Project

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

## 📄 Project Overview
This project is a full-stack data analysis solution designed to predict sales trends and optimize inventory planning for Walmart. It evolves from a raw SQL database into a dynamic, AI-powered business intelligence dashboard.

**The Goal:** To transform 420,000+ raw sales records into actionable insights using predictive modeling and interactive visualization.

---

## 📊 Phase 2: The Advanced Dashboard (Power BI)
*The front-end application built for stakeholders to view real-time metrics and future predictions.*

### 1. Executive Overview & KPIs
**Key Features:**
* **Dynamic KPI Cards:** Real-time calculation of Total Revenue ($6.74bn), Active Stores (45), and Economic Indicators (CPI).
* **State-Aware Navigation:** Custom app-style buttons with active-state logic for seamless page switching.
* **Smart Slicing:** "Yes/No" toggle for Holiday analysis and Store Type segmentation.

![Overview Page](Overview.png)

### 2. AI Sales Forecasting (Machine Learning)
**Key Features:**
* **10-Week Prediction Model:** Utilizes exponential smoothing to forecast sales for the upcoming quarter.
* **Seasonality Awareness:** The model accounts for a 52-week seasonal cycle to predict holiday spikes accurately.
* **Confidence Intervals:** Visualizes a 95% confidence cone (grey area) to show potential variance.

![Forecast Page](Forecast.png)

---

## 💾 Phase 1: Data Engineering (SQL)
*The backend work ensuring data quality and structure before visualization.*

**Key Technical Steps:**
1.  **ETL Process:** Built a robust schema (`walmart_db`) and imported data from CSV to MySQL.
2.  **Feature Engineering:**
    * Created `Holiday_Label` logic to convert Boolean `True/False` into User-Friendly `Yes/No`.
    * Standardized Date formats for time-series compatibility.
3.  **Data Cleaning:** Handled `NULL` values and optimized column types (`VARCHAR` to `DATE`) for performance.

*(Check the `Walmart_Analysis.sql` file in this repo to see the raw queries)*

---

## 🛠️ Tech Stack & Skills Demonstrated
| Component | Tools & Techniques |
| :--- | :--- |
| **Database** | MySQL, Schema Design, Data Normalization |
| **ETL** | Data Cleaning, Type Conversion, Null Handling |
| **Visualization** | Power BI, DAX Measures, Conditional Formatting |
| **Advanced Analytics** | Time-Series Forecasting, Statistical Analysis (95% CI) |
| **UI/UX Design** | Grid Layouts, Shadow Effects, Interactive Navigation |

---
*Project created by Priyanshu*
