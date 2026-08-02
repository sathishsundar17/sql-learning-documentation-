--null functions

--ISNULL(value, repacement_value)
--COALESCE( value1, value2, value3)

-- find the average score of the customers 
SELECT 
customerID,
Score,
COALESCE(score,0) score2,
AVG(score) OVER() avgscores,
AVG(COALESCE(score, 0)) OVER() avgscore2
FROM Sales.customers

-- display the full name of customers in a single field
--by merging their first and last names,
-- and add 10 bonus points to each customer's score.
SELECT 
customerid,
firstname,
lastname,
firstname + ' ' + COALESCE(lastname,'') AS FullName,
score,
COALESCE(Score,0) +10 AS scorewithBonus
FROM sales.customers

--sort the customers from lowest to highest scores,
--with nulls appearing last

SELECT 
CustomerID,
score,
CASE WHEN score IS NULL THEN 1 ELSE 0 END Flag
FROM sales.customers
ORDER BY CASE WHEN score IS NULL THEN 1 ELSE 0 END

--NULLIF(Value1,value2)
-- compares two value1 and value2
--are two values equal?
-- yes , null
-- no, value1

-- find the sales price for each by dividing sales by quantity
SELECT 
OrderID, 
Sales,
Quantity,
Sales/ NULLIF(Quantity,0) AS Price
FROM Sales.Orders

-- IS NULL = Returns true if the value is null else false
-- IS NOT NULL = Returns true if the value is not null else false 
-- syntax = value IS NULL
-- value IS NOT NULL  
-- so it returns boolean output


--Identify the customers who have no scores 
SELECT
*
FROM Sales.customers
WHERE score IS NULL

-- list all details for customers who have not placed any orders
SELECT 
c.*,
o.OrderID
FROM Sales.customers c
LEFT JOIN Sales.Orders o
ON c.customerID = o.CustomerID
--WHERE o.OrderID IS NULL
WHERE o.customerID IS NULL



