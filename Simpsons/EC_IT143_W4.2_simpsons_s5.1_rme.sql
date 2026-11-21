/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s5.1_rme
PURPOSE: Create the table from the view with SELECT ... INTO.

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

DROP TABLE IF EXISTS dbo.t_simpsons_spend_by_member;
GO

SELECT *
INTO dbo.t_simpsons_spend_by_member
FROM dbo.v_simpsons_spend_by_member;
GO

SELECT * FROM dbo.t_simpsons_spend_by_member;
