/*
HAVING = Fiters data after aggregation 
			can be used only with GROUP BY
SYNTAX 
	SELECT 
		SUM(score)
		FROM table 
		GROUP BY country
		HAVING condition
WHERE filter before GROUP BY , HAVING filter used 
after aggregation 
*/

/* 
task 1. Find the average score for each country 
considering only customers with a score not equal to 0
and return only those countries with an 
average score greather than 430
*/
SELECT
	country,
	AVG(score) AS avg_score

FROM customers
WHERE score != 0
GROUP BY country 
HAVING AVG(score) > 430







