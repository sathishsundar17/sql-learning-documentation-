-- AGGREGATION AND ANALYTICAL FUNCTIONS 
-- mainly used by data analyst


/*aggregate functions 
count()
sum()
avg() 
max()
min() 
*/
 
/* WINDOW FUNCTIONS or called as analytic fuctions 

perform calculations (eg. aggregation) on specific subset of data 
without losing the level of details of rows 

the granularity stays the same, ruturns a result for each row 

group by - returns a single row for each group , 
changes the granularity

aggregate functions 
rank functions 
value functions are in window functions -- advanced data analysis

but in group by, only have  aggregate functions  -- simple data analyis
*/

-- task 1. find the total Scales across all orders 
SELECT
SUM(Sales) TotalSales
FROM Sales.Orders

--task 2. find the total sales for each product   
SELECT 
	ProductID,
	SUM(sales) total_sale
FROM Sales.Orders
GROUP BY ProductID

/* task 3. find the total sales for each product,
additonally provide details such order id & and order date*/
SELECT 
	ProductID,
	SUM(sales) total_sale,
	OrderID,
	OrderDate
FROM Sales.Orders
GROUP BY ProductID

--error - because all columns in SELECT must be included in group by

SELECT 
	ProductID,
	SUM(sales) total_sale,
	OrderID,
	OrderDate
FROM Sales.Orders
GROUP BY 
	OrderID,
	OrderDate,
	ProductID
/*
error - sales value not aggregated 

group by limits - can't do aggregations and 
provide details at same time 

so we have to use windows funtions ,
syntax - aggregate fn() OVER( PARTITION BY )
here partition is like group by 
*/

SELECT
	ProductID,
	OrderID,
	OrderDate,
	SUM(Sales) OVER(PARTITION BY ProductID) totalsalesbyProducts
	
FROM Sales.Orders

/* 
syntax
window function- over clause [partition clause-order clause - frame clause]

window function 
1. aggregate function
2. rank function 
3. value function 

window function expression 
empty
column
number
multiple arguments 
conditional logic 

over clause tells SQL that the fuction used is a window function
it defines a window or subset of data

partition by - divdes the row into groups based on the columns,
column name u have the define 
*/

-- task 4. find the total sales across all orders 
--and for each product 
-- find the total sales for each combination of product and order status 
-- additonally provide details such orders ID, order date 
SELECT 
OrderID,
OrderDate,
ProductID,
sales,
SUM(Sales) OVER () TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSales_byProduct,
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) TotalSalesByProductandStatus
FROM Sales.Orders


--here, order by - sort the data within a window 

/* task . rank each order based on  thier sales from highest to lowest
additionally provide details such orderID, order date */
SELECT 
OrderID,
OrderDate,
sales,
RANK() OVER(ORDER BY Sales DESC ) rank_sales
FROM Sales.Orders


/* window frame - defines a subset or rows within each window 
that is relevant for the calculation

frame clause syntax 
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
ROW			CURRENT ROW				CURRENT ROW
RANGE		N PRECEDING				N FOLLOWING
			UNBOUNDED PRECEDIGN		UNBOUNDING FOLLOWING 


defaut frame clause would be 
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 

*/

--rule 1 . window function only in SELECT, ORDER BY
--rule 2 . nesting window function is not allowed 
--rule 3 . sql execute window function after WHERE 
--rule 4 . window fn can be used together with GROUP BY
--			only if the same clause are used 