SELECT
OrderID,
CreationTime,
YEAR(CreationTime) year,
MONTH(Creationtime) month,
DAY(CreationTime) day,
DATEPART(year, CreationTime) year_dp,
DATEPART(month, CreationTime) month_dp,
DATEPART(hour, CreationTime) hour_dp,
DATEPART(quarter, CreationTime) quarter_dp,
DATEPART(week, CreationTime) weak_dp,
DATENAME(month, CreationTime) month_dn,
DATENAME(weekday, CreationTime) weekday_dn,
DATENAME(day, CreationTime) day_dn,
DATETRUNC(minute, CreationTime) minute_dt,
DATETRUNC(day, CreationTime) day_dt,
DATETRUNC(month, CreationTime) month_dt,
DATETRUNC(year, CreationTime) year_dt,
EOMONTH(CreationTime)  EndOfMonth
FROM Sales.Orders

--
-- how many orders were placed each year?
SELECT
YEAR(OrderDate),
COUNT(*) NrOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)

--show all orders that were placed duting the month of february
SELECT*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2