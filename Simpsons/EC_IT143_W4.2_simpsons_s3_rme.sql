/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s3_rme
PURPOSE: Ad hoc query for the Step 1 sub-answer.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/19/2026   RME           1. Built this script for EC IT143 W4.2


RUNTIME: 
0m 1s

NOTES: 
Data source: Simpsons_Import database (Planet_Express). Objects are created in EC_IT143_DA.
 
******************************************************************************************************************/

-- Q1: What is the total amount spent per card member?
-- A1: Group the transactions by card member and total the Amount.

USE EC_IT143_DA;
GO

SELECT Card_Member
     , SUM(Amount) AS total_spent
FROM Simpsons_Import.dbo.Planet_Express
GROUP BY Card_Member
ORDER BY total_spent DESC;
