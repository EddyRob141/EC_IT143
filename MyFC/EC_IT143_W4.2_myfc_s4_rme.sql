/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s4_rme
PURPOSE: Step 4: turn the ad hoc query into a view.

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

CREATE OR ALTER VIEW dbo.v_myfc_salary_by_month
AS
SELECT as_of_date
     , CAST(SUM(mtd_salary) AS decimal(18,2)) AS total_salary
FROM MyFC.dbo.tblPlayerFact
WHERE as_of_date IS NOT NULL
GROUP BY as_of_date;
GO

SELECT * FROM dbo.v_myfc_salary_by_month ORDER BY as_of_date;
