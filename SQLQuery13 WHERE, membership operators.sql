-- IN = checks if a value exists in a list 

/* retrieve all customers form either germany or USA.*/

SELECT * 
FROM customers 
WHERE country IN ( 'Germany' , 'USA')