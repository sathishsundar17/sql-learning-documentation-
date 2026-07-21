/*
SELECT * = retrieves all coumuns(everthing)
FROM = tells sql where to find yout data

*/

-- task 1. retrieve all customers data 

SELECT *
FROM customers

-- task 2. retrieve each customer's name, country, and score
SELECT
	first_name,
	country,
	score
FROM customers
