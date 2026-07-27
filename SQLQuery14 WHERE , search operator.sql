-- LIKE = search for a pattern in text

-- find all customers whose first name starts with 'M'

SELECT *
FROM customers
WHERE first_name LIKE 'M%'

-- find all customers whose first name end with 'n'

SELECT *
FROM customers 
WHERE first_name LIKE '%n'

-- find all customers whose first name contains 'r'

SELECT *
FROM customers
WHERE first_name LIKE '%r%'

-- find all customers whose first name has 'r' in the 3 rd position

SELECT *
FROM customers 
WHERE first_name LIKE '__r%'

