/* EXCEPT =return all distinct rows from the first query
that are not found in the second query*/

-- find the employees who are not customers at the same time

SELECT 
FirstName,
LastName 
FROM Sales.Customers
EXCEPT
SELECT 
FirstName,
LastName
FROM Sales.Employees