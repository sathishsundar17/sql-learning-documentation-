
-- FORMAT (value, format [,culture])
SELECT
orderID,
CreationTime,
FORMAT(CreationTime, 'dd') dd,
FORMAT(CreationTime, 'ddd') ddd,
FORMAT(CreationTime, 'dddd') dddd,
FORMAT(CreationTime, 'MM') MM,
FORMAT(CreationTime, 'MMM') MMM,
FORMAT(CreationTime, 'MMMM') MMM,
FORMAT(CreationTime, 'MM-dd-yyyy') USA_Format
FROM Sales.Orders

-- show creationTime using the following format:
--Day Wed Jan Q1 2025 12:34:56 PM

SELECT
OrderID,
CreationTime,
FORMAT(CreationTime,'dd ') +
FORMAT(CreationTime,'ddd ') +
FORMAT(CreationTime,'MMM ') + 
'Q' +
DATENAME(quarter,CreationTime) + ' '+
FORMAT(CreationTime, 'yyyy hh:mm:ss tt') as CustomFormat
FROM Sales.Orders

--how many orders have been placed in each month
SELECT
FORMAT(OrderDate, 'MMM yyyy') AS [month YEAR],
COUNT(*) AS TotalOrder
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yyyy') 

--CONVERT(data_type, value [,style])
 
SELECT
CreationTime,
CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
CONVERT(VARCHAR, CreationTime, 32) AS [Datetime to varchar - USA Std. Style:32],
CONVERT(VARCHAR, CreationTime, 34) AS [Datetime to EU Std. Style:34]
FROM Sales.Orders

--CAST() = converts a value to a specified data type 
--CAST(value AS data_type)


SELECT 
CreationTime,
CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders