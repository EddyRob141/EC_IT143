/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_rme
PURPOSE: Answer eight AdventureWorks questions: business user questions (marginal, moderate, increased
         complexity) and metadata questions that use the INFORMATION_SCHEMA views.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/12/2026   RME           1. Built this script for EC IT143 W3.4


RUNTIME: 
0m 1s

NOTES: 
Answers eight AdventureWorks questions using the Production, Sales and Person tables and the
INFORMATION_SCHEMA views. Run against AdventureWorks2022; change the USE statement if your database
is named differently. Author: Robert Miracle Ezikpe.
 
******************************************************************************************************************/

USE AdventureWorks2022;
GO

/*****************************************************************************************************************
 BUSINESS USER QUESTIONS - MARGINAL COMPLEXITY
******************************************************************************************************************/

-- Q1: What are the ten most expensive products based on list price?
-- Question author: Robert Miracle Ezikpe
-- A1: Sort Production.Product by ListPrice in descending order and keep the top 10.

SELECT TOP (10)
       ProductID
     , Name
     , ProductNumber
     , ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;


-- Q2: How many products are currently marked as finished goods?
-- Question author: Robert Miracle Ezikpe
-- A2: Count the products where FinishedGoodsFlag = 1.

SELECT COUNT(*) AS finished_goods_count
FROM Production.Product
WHERE FinishedGoodsFlag = 1;


/*****************************************************************************************************************
 BUSINESS USER QUESTIONS - MODERATE COMPLEXITY
******************************************************************************************************************/

-- Q3: Which five product categories contain the highest number of products? Please include the category names
--     and product counts.
-- Question author: Robert Miracle Ezikpe
-- A3: Products link to categories through subcategories. Products without a subcategory are not counted.
--     Note: AdventureWorks has only four product categories, so this returns four rows, not five.

SELECT TOP (5)
       pc.Name AS category_name
     , COUNT(p.ProductID) AS product_count
FROM Production.ProductCategory AS pc
INNER JOIN Production.ProductSubcategory AS ps
    ON pc.ProductCategoryID = ps.ProductCategoryID
INNER JOIN Production.Product AS p
    ON ps.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY pc.Name
ORDER BY product_count DESC;


-- Q4: Which five customers have placed the most sales orders? Please show each customer's name and total
--     number of orders.
-- Question author: Robert Miracle Ezikpe
-- A4: Count orders per customer. Store customers use the store name; individual customers use the person name.

SELECT TOP (5)
       c.CustomerID
     , COALESCE(s.Name, p.FirstName + ' ' + p.LastName) AS customer_name
     , COUNT(soh.SalesOrderID) AS total_orders
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
LEFT JOIN Sales.Store AS s
    ON c.StoreID = s.BusinessEntityID
LEFT JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
GROUP BY c.CustomerID
       , COALESCE(s.Name, p.FirstName + ' ' + p.LastName)
ORDER BY total_orders DESC;


/*****************************************************************************************************************
 BUSINESS USER QUESTIONS - INCREASED COMPLEXITY
******************************************************************************************************************/

-- Q5: Which ten products generate the most sales revenue? Include the product name, total quantity sold, and
--     total revenue.
-- Question author: Robert Miracle Ezikpe
-- A5: Join order details to products, total the quantity and line revenue per product, and keep the top 10.

SELECT TOP (10)
       p.ProductID
     , p.Name AS product_name
     , SUM(sod.OrderQty) AS total_quantity_sold
     , SUM(sod.LineTotal) AS total_revenue
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
GROUP BY p.ProductID
       , p.Name
ORDER BY total_revenue DESC;


-- Q6: Which five territories have the highest bicycle sales revenue during 2013? Include the territory name,
--     number of orders, and total revenue.
-- Question author: Robert Miracle Ezikpe
-- A6: Keep only products in the Bikes category and orders placed in 2013. Count distinct orders because one
--     order can contain several bicycle lines.

SELECT TOP (5)
       t.Name AS territory_name
     , COUNT(DISTINCT soh.SalesOrderID) AS order_count
     , SUM(sod.LineTotal) AS total_revenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Sales.SalesTerritory AS t
    ON soh.TerritoryID = t.TerritoryID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
  AND soh.OrderDate >= '2013-01-01'
  AND soh.OrderDate <  '2014-01-01'
GROUP BY t.Name
ORDER BY total_revenue DESC;


/*****************************************************************************************************************
 METADATA QUESTIONS - SYSTEM INFORMATION SCHEMA VIEWS
******************************************************************************************************************/

-- Q7: Can you use INFORMATION_SCHEMA.COLUMNS to list all tables in the Production schema that contain a column
--     named ProductID?
-- Question author: Robert Miracle Ezikpe
-- A7: Filter COLUMNS on schema and column name, then join to TABLES so views are left out.

SELECT c.TABLE_SCHEMA
     , c.TABLE_NAME
     , c.COLUMN_NAME
     , c.DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS AS c
INNER JOIN INFORMATION_SCHEMA.TABLES AS t
    ON c.TABLE_SCHEMA = t.TABLE_SCHEMA
   AND c.TABLE_NAME = t.TABLE_NAME
WHERE c.TABLE_SCHEMA = 'Production'
  AND c.COLUMN_NAME = 'ProductID'
  AND t.TABLE_TYPE = 'BASE TABLE'
ORDER BY c.TABLE_NAME;


-- Q8: Can you use INFORMATION_SCHEMA.TABLES to list all base tables available in the Sales schema of
--     AdventureWorks?
-- Question author: Robert Miracle Ezikpe
-- A8: Filter TABLES on the Sales schema and on TABLE_TYPE = 'BASE TABLE'.

SELECT TABLE_SCHEMA
     , TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Sales'
  AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
