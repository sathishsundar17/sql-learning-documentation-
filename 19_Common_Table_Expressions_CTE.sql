/* ==============================================================================
   SQL Common Table Expressions (CTEs)
-------------------------------------------------------------------------------
  CTE - temporary, named result set (virtual Table), stored in CTE query, that can be used
  multiple times within your query to simplify and organize complex 
  query
  CTE query stores a virtual table that can be used in main query like a normal table 
  stored in database, dedicated only to the same main query not available globally like
  stored in database
  
  looks same like sub query . right.....?
  
  diff 
  order of syntax
  1.main query           1. cte query
  2.sub query            2. main query
  only once             virtual table can be used more than once in main query 
  
  advantages 
  1.readability - breaks down complex queries into smaller pieces  
  2.modularity - pieces are easy to manage, develop, and self contained
  3.reusability - reduce redundancy in query
  4.recursive - iterations and looping in sql 

  result of CTE is like table but can't be used form multiple queries 

  tip : don't create more than 5 CTE in one query 

  This script demonstrates the use of Common Table Expressions (CTEs) in SQL Server.
   It includes examples of non-recursive CTEs for data aggregation and segmentation,
   as well as recursive CTEs for generating sequences and building hierarchical data.

   Table of Contents:
     1. NON-RECURSIVE CTE
            is executed only once without any repeiton 
     2. RECURSIVE CTE | GENERATE SEQUENCE
            self-referencing query that repeatedly processes data 
            until a specific met
     3. RECURSIVE CTE | BUILD HIERARCHY
=============================================================================== */

/* ==============================================================================
   NON-RECURSIVE CTE
===============================================================================*/


-- Step1: Find the total Sales Per Customer (Standalone CTE)
WITH CTE_Total_Sales AS
(
    SELECT
        CustomerID,
        SUM(Sales) AS TotalSales
    FROM Sales.Orders
    GROUP BY CustomerID
)
-- Step2: Find the last order date for each customer (Standalone CTE)
, CTE_Last_Order AS
(
    SELECT
        CustomerID,
        MAX(OrderDate) AS Last_Order
    FROM Sales.Orders
    GROUP BY CustomerID
)
-- Step3: Rank Customers based on Total Sales Per Customer (Nested CTE)
, CTE_Customer_Rank AS
(
    SELECT
        CustomerID,
        TotalSales,
        RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
    FROM CTE_Total_Sales
)
-- Step4: segment customers based on their total sales (Nested CTE)
, CTE_Customer_Segments AS
(
    SELECT
        CustomerID,
        TotalSales,
        CASE 
            WHEN TotalSales > 100 THEN 'High'
            WHEN TotalSales > 80  THEN 'Medium'
            ELSE 'Low'
        END AS CustomerSegments
    FROM CTE_Total_Sales
)
-- Main Query
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    cts.TotalSales,
    clo.Last_Order,
    ccr.CustomerRank,
    ccs.CustomerSegments
FROM Sales.Customers AS c
LEFT JOIN CTE_Total_Sales AS cts
    ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_Order AS clo
    ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Rank AS ccr
    ON ccr.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Segments AS ccs
    ON ccs.CustomerID = c.CustomerID;

/* ==============================================================================
   RECURSIVE CTE | GENERATE SEQUENCE
===============================================================================*/

/* TASK 2:
   Generate a sequence of numbers from 1 to 20.
*/
WITH Series AS (
    -- Anchor Query
    SELECT 1 AS MyNumber
    UNION ALL
    -- Recursive Query
    SELECT MyNumber + 1
    FROM Series
    WHERE MyNumber < 20
)
-- Main Query
SELECT *
FROM Series

/* TASK 3:
   Generate a sequence of numbers from 1 to 1000.
*/
WITH Series AS
(
    -- Anchor Query
    SELECT 1 AS MyNumber
    UNION ALL
    -- Recursive Query
    SELECT MyNumber + 1
    FROM Series
    WHERE MyNumber < 1000
)
-- Main Query
SELECT *
FROM Series
OPTION (MAXRECURSION 5000);

/* ==============================================================================
   RECURSIVE CTE | BUILD HIERARCHY
===============================================================================*/

/* TASK 4:
   Build the employee hierarchy by displaying each employee's level within the organization.
   - Anchor Query: Select employees with no manager.
   - Recursive Query: Select subordinates and increment the level.
*/
WITH CTE_Emp_Hierarchy AS
(
    -- Anchor Query: Top-level employees (no manager)
    SELECT
        EmployeeID,
        FirstName,
        ManagerID,
        1 AS Level
    FROM Sales.Employees
    WHERE ManagerID IS NULL
    UNION ALL
    -- Recursive Query: Get subordinate employees and increment level
    SELECT
        e.EmployeeID,
        e.FirstName,
        e.ManagerID,
        Level + 1
    FROM Sales.Employees AS e
    INNER JOIN CTE_Emp_Hierarchy AS ceh
        ON e.ManagerID = ceh.EmployeeID
)
-- Main Query
SELECT *
FROM CTE_Emp_Hierarchy;