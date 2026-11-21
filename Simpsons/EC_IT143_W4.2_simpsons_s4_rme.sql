/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s4_rme
PURPOSE: View: total amount spent per card member.

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

CREATE OR ALTER VIEW dbo.v_simpsons_spend_by_member
AS
-- Views cannot use ORDER BY without TOP, so sort when you query the view.
SELECT Card_Member
     , SUM(Amount) AS total_spent
FROM Simpsons_Import.dbo.Planet_Express
GROUP BY Card_Member;
GO

SELECT * FROM dbo.v_simpsons_spend_by_member ORDER BY total_spent DESC;
