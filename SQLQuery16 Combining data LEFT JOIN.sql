/*LEFT JOIN = returns all rows from left and 
only matching from  right */

/* get all customers along eiht their orders,
including those without orders.*/

SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o 
ON c.id = o.customer_id