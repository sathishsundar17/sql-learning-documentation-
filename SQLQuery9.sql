-- task 1. insert values new into table "customers"lllllllllllll 
INSERT INTO customers (id, first_name, country, score)
VALUES	
(6,'anna','USA', NULL),
(7,'Sam',NULL, 100),

INSERT INTO customers (id, first_name, country, score)
VALUES
(8, 'USA', 'Max', NULL)

INSERT INTO customers
VALUES
(9,'andrea', 'germany', NULL)

INSERT INTO customers(id, first_name)
VALUES 
(10, 'sara')


SELECT * 
FROM customers




 --task 2. Insert data from 'customers' into 'persons'

 INSERT INTO persons (id, person_name, birth_date, phone)
 SELECT
 id,
 first_name,
 NULL,
 'unknown'
 from customers

 select* from persons


 -- change the score of customer 6 to 0
 UPDATE customers
 SET score = 0
 WHERE id = 6
 

 /*update all customers with a NULL score 
 by setting their score to 0 */

 -- delete all customers with an ID greater than 5.
 DELETE FROM customers
 WHERE id>5

 -- Delete all data from table persons 
 TRUNCATE TABLE persons 




 