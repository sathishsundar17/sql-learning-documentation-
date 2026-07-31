/* 
SET operator use to combine the rows of two 
different tables into one table 

set operator can be used almost in all clauses 
order by only used at end of the query 

number of coloumn must be equal 

data types of columns in each query must be comptible ( matching )

the column names in the result set are determined by the 
column names specified in  the first query.

 rule 1 . order by can be used only once
 rule 2 . same number of columns 
 rule 3 . matching data types 
 rule 4 . same ordre of columns 
 rule 5 . first query controls aliases
 rule 6 . mapping correct columns  

 UNION = combine every rows and remove the duplicate
 */

 -- combine the data from employees and customers into one table
SELECT 
FirstName,
LastName 
FROM Sales.Customers
UNION
SELECT 
FirstName,
LastName
FROM Sales.employees

/* UNION ALL = returns all rows including the duplicates 
*/