-- Total Revenue from Approved transaction 
WITH approved_claims AS (
  SELECT *
  FROM healthcare_dataset_clean
  WHERE claim_status = 'approved'
)
SELECT SUM(treatment_cost_usd)
from approved_claims;


-- Average revenue by visit type
SELECT visit_type, AVG(treatment_cost_usd)
FROM approved_claims
GROUP BY visit_type;


-- No of Patient by gender
SELECT gender, COUNT(*) AS gender_count 
FROM healthcare_dataset_clean
GROUP by gender
ORDER by gender DESC;

-- percentage of denial rate 
SELECT COUNT(*) * 100  / (SELECT COUNT(*) FROM healthcare_dataset_clean) as denied_percent 
FROM healthcare_dataset_clean
WHERE claim_status = 'denied';



-- Satisfaction response rate by gender
SELECT gender,
       SUM(CASE WHEN satisfaction_provided = 'yes' THEN 1 ELSE 0 END) * 1.0
       / COUNT(*) AS response_rate
FROM healthcare_dataset_clean
GROUP BY gender;

-- chronic condition by gender 
SELECT chronic_condition, gender, COUNT(*) as no_count
FROM healthcare_dataset_clean
GROUP BY chronic_condition, gender;
