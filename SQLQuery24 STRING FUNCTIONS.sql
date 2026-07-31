--concatenete first name and country into one column 
SELECT
first_name,
country,
CONCAT( first_name, '-', country) AS name_country
FROM customers

--transform the customer's first name to lowercase
SELECT
first_name,
country,
CONCAT( first_name, '-', country) AS name_country,
LOWER( first_name) AS low_name
FROM customers

--transform the customer's first name to uppercase\
SELECT
first_name,
country,
CONCAT( first_name, '-', country) AS name_country,
UPPER( first_name ) AS UPPER_name
FROM customers

--find customers whose first name contains leading or trailing spaces
SELECT 
first_name
FROM customers
WHERE first_name != TRIM(first_name)

SELECT 
first_name,
LEN(first_name) length_name,
LEN(TRIM (first_name) ) trim_length_name
FROM customers
WHERE LEN( first_name) != LEN( TRIM(first_name))

-- remove dashes form a phone number 
SELECT 
'123-456-7890' AS phone,
REPLACE ('123 -456- 7890', '-', '/') AS clean_phone

--replace file extence from txt to csv
SELECT 
'report.txt' AS old_filename,
REPLACE('report.txt', '.txt', '.csv')

--calculate the length of each customer's first name.
SELECT
first_name,
LEN(first_name) AS length_first_name
FROM customers

--retrieve the first two characters of each first name .
-- and last two characters of each first name
SELECT 
first_name,
LEFT(first_name, 2) first_2_char,
RIGHT(first_name, 2) last_2_char
FROM customers

--retireve a list of customer's first names removing the first character
SELECT
first_name,
SUBSTRING( first_name, 2, LEN(first_name))
FROM customers