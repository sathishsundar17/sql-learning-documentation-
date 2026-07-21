/*
WHERE = filters your data based on a condition
syntax 
	FROM table 
	WHERE condition

*/
-- task 1. Retrieve customers with a score not equal to 0 
SELECT *
FROM customers
WHERE score != 0

-- task 2. Retrieve customers form Germany 
SELECT *
FROM customers 
WHERE country = 'Germany' 
