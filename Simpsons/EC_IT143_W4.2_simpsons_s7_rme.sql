/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s7_rme
PURPOSE: Stored procedure that reloads t_simpsons_spend_by_member.

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

CREATE OR ALTER PROCEDURE dbo.usp_load_simpsons_spend_by_member
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.t_simpsons_spend_by_member;

    INSERT INTO dbo.t_simpsons_spend_by_member (Card_Member, total_spent)
    SELECT Card_Member
         , total_spent
    FROM dbo.v_simpsons_spend_by_member;
END;
GO
