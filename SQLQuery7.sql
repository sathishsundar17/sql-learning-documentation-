-- task 1. retrieve the top 3 customers with the highest scores 
SELECT TOP 3 *
FROM  customers
ORDER BY  score DESC

-- task 2. get the two most recent orders 
SELECT TOP 2*
FROM orders
ORDER BY order_date desc

