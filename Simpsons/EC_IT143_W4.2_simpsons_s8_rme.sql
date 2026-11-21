/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s8_rme
PURPOSE: Run the stored procedure and check the result.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/19/2026   RME           1. Built this script for EC IT143 W4.2


RUNTIME: 
0m 1s

NOTES: 
Data source: Simpsons_Import database (Planet_Express). Objects are created in EC_IT143_DA.
 
******************************************************************************************************************/

USE EC_IT143_DA;
GO

EXEC dbo.usp_load_simpsons_spend_by_member;

SELECT * FROM dbo.t_simpsons_spend_by_member ORDER BY total_spent DESC;
