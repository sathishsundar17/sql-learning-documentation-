--  retrieve all customers form germany 
SELECT * 
FROM customers
WHERE country = 'germany'

-- retrieve all customers not equal germany 
SELECT *
FROM customers 
WHERE country != 'germany'
-- retrieve all customers with a score greater than 500
--retrieve all customers with a score 500 or more 
-- retrieve all customers with a score less tha 500
-- retrieve all customers with a score 500 or less 
