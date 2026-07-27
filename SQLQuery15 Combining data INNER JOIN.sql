-- INNER JOIN = returns only matching rows form both tables

/* get all customers along with their orders, 
but only for customers who have placed on order */

SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id 

SELECT 
c.id,
c.first_name,
o.order_id, 
o.sales 
FROM orders AS o
INNER JOIN customers AS c
ON c.id = o.customer_id 

/* here c.id means 'c' is form which table 
to obtain data customers table and 
for our convinient we mentions as c , 
'id'  is coloum name form that table*/
