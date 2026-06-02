create database HR_analysis;
use HR_analysis;

SELECT * FROM hr_analysis;

-- What's the overall attrition rate?
SELECT ROUND(
SUM(
CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END )
*100/COUNT(*),2) 
AS attrition_rate 
FROM hr_analysis;

-- department wise arrititon
SELECT Department,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY Department
;

-- are people satisfies with the job?
SELECT JobSatisfaction,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction
;

-- how overtime is affecting??
SELECT OverTime,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY OverTime
ORDER BY OverTime
;

-- which educated sector people are leaving ??
SELECT EducationField,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY EducationField
ORDER BY employees
;


-- what is the average salary of people who are leaving?
SELECT AVG(MonthlyIncome) AS avg_salary
FROM hr_analysis
WHERE Attrition='Yes';


-- Average number of years employees stayed before leaving
SELECT
ROUND(AVG(YearsAtCompany),2) AS Avg_Years
FROM hr_analysis
WHERE Attrition='Yes'
;


-- Which job has most attrition
SELECT JobRole,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY employees DESC
;

-- Age slab wise attrition count
SELECT
CASE
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 40 THEN '30-40'
    ELSE 'Above 40'
END AS Age_Group,
COUNT(*) AS Employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY Age_Group;

-- Gender wise attrition count
SELECT Gender,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY Gender
ORDER BY Gender
;

-- Is Marital Status affecting attrition?
SELECT MaritalStatus,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY MaritalStatus
ORDER BY MaritalStatus
;

-- department wise attrition rate
SELECT Department,ROUND(
SUM(
CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END )
*100/COUNT(*),2) 
AS attrition_rate 
FROM hr_analysis
GROUP BY Department;

-- worklifebalance attrition rate
SELECT WorkLifeBalance,ROUND(
SUM(
CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END )
*100/COUNT(*),2) 
AS attrition_rate 
FROM hr_analysis
GROUP BY WorkLifeBalance;

-- Is business travel affecting attrition?
SELECT BusinessTravel,COUNT(*) AS employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY BusinessTravel
ORDER BY employees;


-- Job role wise attrition
SELECT JobRole,ROUND(
SUM(
CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END )
*100/COUNT(*),2) 
AS attrition_rate 
FROM hr_analysis
GROUP BY JobRole
ORDER BY attrition_rate DESC;

-- Avg salary per department
SELECT Department,
ROUND(AVG(MonthlyIncome),2) AS Avg_Income
FROM hr_analysis
GROUP BY Department;


-- Are employees leaving because they are not getting promoted?
SELECT YearsSinceLastPromotion,
COUNT(*) AS employees,
 SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS Attrition_Rate
FROM hr_analysis
GROUP BY YearsSinceLastPromotion
ORDER BY Attrition_Rate DESC;

-- Does commute distance influence employee attrition?
SELECT
CASE
WHEN DistanceFromHome <= 5 THEN 'Near'
WHEN DistanceFromHome <= 15 THEN 'Medium'
ELSE 'Far'
END AS Distance_Group,
COUNT(*) AS Employees
FROM hr_analysis
WHERE Attrition='Yes'
GROUP BY Distance_Group;

