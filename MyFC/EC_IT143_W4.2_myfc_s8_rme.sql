/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s8_rme
PURPOSE: Step 8: call the stored procedure.

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

EXEC dbo.usp_load_myfc_salary_by_month;

SELECT * FROM dbo.t_myfc_salary_by_month ORDER BY as_of_date;
