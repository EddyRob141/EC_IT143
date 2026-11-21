/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s6_rme
PURPOSE: Step 6: load the table from the view.

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

USE EC_IT143_DA;
GO

-- 1) Reload data
TRUNCATE TABLE dbo.t_myfc_salary_by_month;

INSERT INTO dbo.t_myfc_salary_by_month (as_of_date, total_salary)
SELECT as_of_date
     , total_salary
FROM dbo.v_myfc_salary_by_month;

-- 2) Review results
SELECT * FROM dbo.t_myfc_salary_by_month ORDER BY as_of_date;
