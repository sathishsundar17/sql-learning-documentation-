/* FULL ANTI JOINT = returns only rows that don't 
match with either tables */

/* find customers without orders and orders without customers*/

SELECT *
FROM orders AS o
FULL JOIN customers AS c 
ON c.id = o.customer_id 
WHERE c.id IS NULL OR o.customer_id IS NULL