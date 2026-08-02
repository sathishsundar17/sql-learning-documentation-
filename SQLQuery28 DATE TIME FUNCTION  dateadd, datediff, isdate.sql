--syntax	DATEADD(part, interval,date)
SELECT
OrderID,
OrderDate,
DATEADD(Year, 3, OrderDate) AS [three years later],
DATEADD(month, -3, OrderDate) AS [three months before]
FROM Sales.Orders

-- syntax	DATEDIFF( part, start_date, end_date)
--calculate the age of employees
SELECT
EmployeeID,
BirthDate,
DATEDIFF(year,BirthDate, GETDATE()) Age
FROM Sales.Employees

--find the average shipping duration in days for each month

SELECT
OrderID,
OrderDate,
ShipDate,
DATEDIFF (day, OrderDate, ShipDate) shipping_duration_in_days
FROM Sales.Orders;

SELECT 
DATENAME (month, OrderDate) Order_month,
AVG(DATEDIFF (day, OrderDate, ShipDate)) avg_ship
FROM Sales.Orders
GROUP BY DATENAME (month, OrderDate)

--Time Gap analysis 
-- find the number of days between each order and the previous order



--ISDATE(Value)

SELECT
ISDATE('123') DAECHECK1,
ISDATE('2023-03-02') DATECKECK2

SELECT
