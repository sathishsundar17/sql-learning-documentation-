/*RIGHT ANTI JOIN = Returns row form right 
that has no match in left */

/*get all orders without matching customers  */
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o 
ON c.id = o.customer_id 
WHERE c.id IS NULL

SELECT *
FROM orders AS o
LEFT JOIN customers AS c 
ON c.id = o.customer_id 
WHERE c.id IS NULL