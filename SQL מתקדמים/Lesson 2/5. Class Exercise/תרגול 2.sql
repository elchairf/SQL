---Function
USE Northwind_SQL

--drop function Change
create function dbo.Change
( @Dolars as float)
returns float
as
begin return (@Dolars*3.6)
end

DECLARE @Convert FLOAT
select @Convert = dbo.Change(43)
PRINT @Convert


----Stored Procedures
--10 Most expensive products
create procedure Most_Expensive
as
set rowcount 10
select top(10) a.ProductName ,UnitPrice from Products a order by 2 desc

exec Most_Expensive

--Sales per Year
create procedure [Sales per Year]
as
select  year(a.OrderDate) as 'Year'
	,sum((b.UnitPrice*b.Quantity)* (1-b.Discount)) as 'Sales' 
	 from Orders a inner join Order_Details b on a.OrderID = b.OrderID
	 group by year(a.OrderDate)
GO
exec [Sales per Year]

--Sales By Worker by State
create procedure [Sales per Worker]
as
select  e.EmployeeID
		,e.Country
	,sum((b.UnitPrice*b.Quantity)* (1-b.Discount)) as 'Sales' 
	 from Orders a
	 inner join Order_Details b on a.OrderID = b.OrderID
	 inner join Employees e on e.EmployeeID = a.EmployeeID
	 group by e.EmployeeID,e.Country
	 order by 1

exec [Sales per Worker]

