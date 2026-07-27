/* Retrieve all customers who are from USA and 
have a score greather tahn 500. */

SELECT *
FROM customers
WHERE country = 'USA' AND score > 500

/* Retrieve all customers who are either from USA or 
having a score greather than 500*/ 

SELECT *
FROM customers
WHERE country = 'USA' OR score > 500 

/* Retrieve all customers with a score not less than 500*/ 

SELECT *
FROM customers
WHERE NOT score < 500 

