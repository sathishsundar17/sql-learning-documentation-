/* CASE STATEMENT - evalutate a list of conditions and returns 
--a value when the first conditon is met  
-- syntax = CASE	
				WHEN condition1 THEN result1
				WHEN condition1 THEN result2
				

				ELSE result 
			END
*/

/* generate a report showing the total sales for each category:
high : if the sales higher than 50 
medium : if the sales between 20 and 50
low : if the sales equal or lower than 20
sort the categories from highest sales to lowest*/

SELECT 
OrderID,
Sales
FROM Sales.Orders


/* find the average scores of customers amd treat nulls as 0
Additionally provide details such customerID and lastname*/

SELECT 
avg(score),

/* conditional aggregation 
apply aggregate functions only on 
subset of data that fulfill certains conditions */ 

-- count how many times each customer has made on order with sales \
-- greater than 30
SELECT 
	OrderID,
	CustomerID,
	Sales,
	CASE 
	WHEN Sales > 30 THEN 1 
	ELSE 0 
	END SalesFlag 
FROM Sales.Orders
Order by customerid