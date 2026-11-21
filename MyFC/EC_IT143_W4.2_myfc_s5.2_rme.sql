/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s5.2_rme
PURPOSE: Step 5.2: refine the table architecture.

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

CREATE TABLE dbo.t_myfc_salary_by_month
(
      as_of_date   varchar(30)   NOT NULL
    , total_salary decimal(18,2) NOT NULL CONSTRAINT DF_t_myfc_total_salary DEFAULT (0)
    , CONSTRAINT PK_t_myfc_salary_by_month PRIMARY KEY (as_of_date)
);
GO
