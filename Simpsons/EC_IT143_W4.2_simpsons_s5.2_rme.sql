/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s5.2_rme
PURPOSE: Re-create the table with a primary key, NOT NULL and a default.

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

CREATE TABLE dbo.t_simpsons_spend_by_member
(
      Card_Member nvarchar(50)  NOT NULL
    , total_spent decimal(14,2) NOT NULL CONSTRAINT DF_t_simpsons_total_spent DEFAULT (0)
    , CONSTRAINT PK_t_simpsons_spend_by_member PRIMARY KEY (Card_Member)
);
GO
