/* ORDER BY = sort your data by asc or desc 
syntax 
	SELECT *
	FORM table 
	ORDER BY score

*/

/* task 1. retrieve all customers and 
sort the results by the hightest score first. */

SELECT * 
FROM customers
ORDER BY score DESC

/* task 2. retrieve all customers and 
sort the result by the lowest score first. */

SELECT *
FROM customers
ORDER BY score ASC

/* task 3. retrieve all customers and 
sort the results by the country and then by the highest score.*/

SELECT *
FROM customers 
ORDER BY 
	country ASC,
	score DESC 


