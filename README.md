# Healthcare Claims Analytics

## Business Context

Healthcare providers face increasing pressure to control costs, reduce claim denials, and improve patient experience while operating with incomplete and inconsistent data. This project simulates a real-world healthcare claims dataset and demonstrates how data cleaning, exploratory analysis, and KPI-driven analytics can be used to uncover financial, operational, and patient behavior insights that support better decision-making.

---

## Project Objective

The goal of this project is to:

* Clean and normalize messy healthcare data
* Define business-relevant KPIs
* Analyze revenue, claim denials, visit patterns, and patient satisfaction
* Prepare the dataset for SQL analysis and BI dashboarding

This project is designed to mirror the type of work expected from a **Junior Data Analyst / BI Analyst** in a healthcare or consulting environment.

---

## Examples 

### SQL 
```
WITH approved_claims AS (
  SELECT *
  FROM healthcare_dataset_clean
  WHERE claim_status = 'approved'
)
SELECT SUM(treatment_cost_usd)
from approved_claims;
```

```
SELECT COUNT(*) * 1.0  / (SELECT COUNT(*) FROM healthcare_dataset_clean) as denied_percent 
FROM healthcare_dataset_clean
WHERE claim_status = 'denied';
```

### Panda

```
plt.figure(figsize=(12, 6))
chronic_condition_by_gender_2 = df_clean.groupby('gender')['chronic_condition'].value_counts().reset_index(name='count')
sns.barplot(data=chronic_condition_by_gender_2, x='gender', y='count', hue='chronic_condition')
plt.title('Chronic Condition by Gender')

plt.xlabel('Gender')
plt.ylabel('Count')
plt.show()
```
---
## Dataset Overview

* **Rows:** ~1,000 patient visits
* **Columns:** Patient demographics, insurance, visit type, claim status, costs, satisfaction, and chronic conditions

### Key Fields

* `patient_id`
* `age`, `gender`
* `insurance_type`
* `visit_type` (outpatient, inpatient, emergency)
* `claim_status` (approved, denied)
* `treatment_cost_usd`
* `patient_satisfaction_score`
* `chronic_condition`

---

## Data Cleaning Summary

Key cleaning steps performed:

* Converted numeric fields using safe coercion
* Removed invalid ages and extreme length-of-stay values
* Normalized categorical values (case, spelling, consistency)
* Handled missing values using **business logic**, not blanket imputation
* Created **missingness flags** for:

  * `patient_satisfaction_score`
  * `treatment_cost_usd`
* Removed duplicate records

> Important design choice: Missing satisfaction scores and treatment costs were **not blindly imputed**, preserving signal around non-response and incomplete billing.

---

## Key KPIs

### Financial Performance

* Total Revenue (Approved Claims Only)
* Revenue by Insurance Type
* Average Treatment Cost by Visit Type

### Claims & Operations

* Claim Denial Rate (%)
* Visit Type Distribution
* Average Length of Stay

### Patient Insights

* Gender Distribution
* Satisfaction Response Rate by Gender
* Chronic Conditions by Gender and Age

---

## Key Insights

* Approved claims generated **$1.79M** in total revenue
* Claim denial rate was **~16.7%**, significantly above industry benchmarks
* Outpatient visits were most common, but inpatient visits generated the highest average revenue
* Female patients were more likely to submit satisfaction feedback
* Diabetes showed a noticeably higher prevalence among female patients

---

## Tools & Technologies

* **Python:** pandas, numpy, matplotlib, seaborn
* **SQL:** KPI queries, aggregations, business filters
* **BI:** Tableau (dashboard-ready dataset)

---

## Repository Structure

```
healthcare-claims-analytics/
├── data/
│   ├── raw/
│   └── processed/
├── notebook/
│   └── healthcare_analysis.ipynb
├── sql/
│   └── sql_queries.sql
├── tableau/
│   └── healthcare_dashboard.twb
├── images/
│   └── dashboard_snapshot.png
└── README.md
```

---
<img width="1242" height="404" alt="Screenshot 2026-01-28 at 13 18 33" src="https://github.com/user-attachments/assets/3f9835c7-9787-47bb-b2c7-a07850b6c4d3" />
<img width="1155" height="605" alt="Screenshot 2026-01-28 at 13 18 53" src="https://github.com/user-attachments/assets/ca6e02e5-09a1-46c9-a216-5183f174d3b6" />

---
## How to Use

1. Start with `healthcare_data_cleaning.ipynb`
3. Run SQL queries from the `/sql` folder
4. Load `healthcare_dataset_clean.csv` into Tableau for dashboarding

---

## Next Steps

* Add time-series analysis (monthly trends)
* Build predictive model for claim denial risk
* Extend SQL with window functions and cohort analysis

---

## Author

Taiwo Tolulope Sheriff
