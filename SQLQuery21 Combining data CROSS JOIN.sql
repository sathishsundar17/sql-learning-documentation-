/*generate all possivle combinations of customers and orders. */

SELECT *
FROM customers 
CROSS JOIN  orders

/* task ( by using all u learnt before)

using SalesDB. retrieve a list of all orders, along 
with the related customers, product, and employee details.
for each order, display:
order ID, customer's anme, product name,
saled amount, product price, salesperson's name  */
