/* INTERSECT = return only common rows */

-- find the employees, who are also customers.

SELECT 
FirstName,
LastName 
FROM Sales.Customers
INTERSECT
SELECT 
FirstName,
LastName
FROM Sales.Employees