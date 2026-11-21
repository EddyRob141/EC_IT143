/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s2_rme
PURPOSE: Record the journey toward the answer.

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
-- A1: Planet_Express holds one row per card transaction, with Card_Member and Amount.
--     Sub-answer 1: group the rows by Card_Member.
--     Sub-answer 2: add up Amount for each group with SUM().
