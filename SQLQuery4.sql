/* GROUP BY = combines rows with the same value 
	aggregates a coloumn by another coloumn 

syntax 
	SELECT 
		country,
		SUM(score),
	FORM table
	GROUP BY country
 
 here , country is category
		score is need to aggregated 
*/

/*  task 1. Find the total score for each country */

SELECT 
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country

/*  task 1. Find the total score and
total number of customers for each country */

SELECT 
	country,
	SUM(score) AS total_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY country


