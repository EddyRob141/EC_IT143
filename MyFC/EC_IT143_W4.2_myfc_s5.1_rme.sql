/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s5.1_rme
PURPOSE: Step 5.1: turn the view into a table.

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

DROP TABLE IF EXISTS dbo.t_myfc_salary_by_month;
GO

SELECT *
INTO dbo.t_myfc_salary_by_month
FROM dbo.v_myfc_salary_by_month;
GO

SELECT * FROM dbo.t_myfc_salary_by_month ORDER BY as_of_date;
