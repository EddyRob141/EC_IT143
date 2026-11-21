/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s3_rme
PURPOSE: Step 3: ad hoc SQL query.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/19/2026   RME           1. Built this script for EC IT143 W4.2


RUNTIME: 
0m 1s

NOTES: 
Source data is in the MyFC database (tblPlayerFact). Objects are created in EC_IT143_DA.
mtd_salary = month-to-date salary per player; as_of_date identifies the month it belongs to.
 
******************************************************************************************************************/

-- Q1: What is the total player salary per month?
-- A1: tblPlayerFact has one row per player per as_of_date, with the player's mtd_salary.
--     Sub-answer 1: group the rows by as_of_date (one date per month).
--     Sub-answer 2: add up mtd_salary for each group with SUM().

USE EC_IT143_DA;
GO

SELECT as_of_date
     , SUM(mtd_salary) AS total_salary
FROM MyFC.dbo.tblPlayerFact
WHERE as_of_date IS NOT NULL
GROUP BY as_of_date
ORDER BY as_of_date;
