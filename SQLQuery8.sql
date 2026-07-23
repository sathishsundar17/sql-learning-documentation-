/* task 1. Create a new table called persons 
with columns: id, person_name, birth_date, and phone*/

CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY(id)

	)

-- task 2. add a new column caled email to the persons table 
 ALTER TABLE persons
 ADD email VARCHAR(50) NOT NULL
 SELECT * FROM persons

-- task 3. remove the column phone from the persons table
ALTER TABLE persons
DROP COLUMN phone 
SELECT * FROM persons

-- task 4. delete the table persons form the database
DROP TABLE persons