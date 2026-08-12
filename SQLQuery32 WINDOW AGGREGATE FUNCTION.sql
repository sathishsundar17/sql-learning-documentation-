-- WINDOW AGGREAGATE FUNCTION 
/*  COUNT () - returns no of rows if we specfy coloum and it 
has null it will not count that row */

-- find the total number of orders 
--find the total number of orders for each customers
-- additionally provide details such order ID, order date

use SalesDB
SELECT 
orderID, 
orderDate,
COUNT(*) OVER() TotalOrders,
COUNT(*) OVER(PARTITION BY customerID) order_by_customer
FROM Sales.Orders

--find the total number of customers 
--Find the total number of scores for the customers
--additonally provide all customers deails 

SELECT *, 
COUNT(customerID) OVER() TotalNoOfCusotmers,
COUNT(score) OVER() TotalNoOfScore
FROM Sales.Customers

--check whether the table 'orders' contains any duplicate rows 
SELECT
orderID,
COUNT(*) OVER(PARTITION BY orderID) checkPK
FROM Sales.Orders










