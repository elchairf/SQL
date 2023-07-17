/*
Home work - 1 05/05/2021
*/
USE Northwind_SQL
----------------------Question 1-----------------------
With [Product Sales for 1996] 
AS
(
select c.CategoryName,p.ProductName,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Net_Price'
from Orders o
inner join Order_Details od on o.OrderID    = od.OrderID
inner join Products p		on od.ProductID = p.ProductID
inner join Categories c		on c.CategoryID = p.CategoryID
where year(o.OrderDate) = '1996'
group by c.CategoryName,p.ProductName
)
select * from [Product Sales for 1996] 

----------------------Question 2-----------------------
With [Product Sales for 1998] 
AS
(
select c.CategoryName,p.ProductName,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Net_Price'
from Orders o
inner join Order_Details od on o.OrderID    = od.OrderID
inner join Products p		on od.ProductID = p.ProductID
inner join Categories c		on c.CategoryID = p.CategoryID
where year(o.OrderDate) = '1998'
group by c.CategoryName,p.ProductName
)
select * from [Product Sales for 1998] 
----------------------Question 3-----------------------
With [Product Sales for 1996] (CategoryName,ProductName,Net_Price)
AS
(
select c.CategoryName,p.ProductName,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Net_Price'
from Orders o
inner join Order_Details od on o.OrderID    = od.OrderID
inner join Products p		on od.ProductID = p.ProductID
inner join Categories c		on c.CategoryID = p.CategoryID
where year(o.OrderDate) = '1996'
group by c.CategoryName,p.ProductName
)
,
[Product Sales for 1998] (CategoryName,ProductName,Net_Price)
AS
(
select c.CategoryName,p.ProductName,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Net_Price'
from Orders o
inner join Order_Details od on o.OrderID    = od.OrderID
inner join Products p		on od.ProductID = p.ProductID
inner join Categories c		on c.CategoryID = p.CategoryID
where year(o.OrderDate) = '1998'
group by c.CategoryName,p.ProductName
)
select a.*
from [Product Sales for 1996] a 
inner join [Product Sales for 1998] b on a.CategoryName = b.CategoryName and a.ProductName = b.ProductName
where a.Net_Price>b.Net_Price
----------------------Question 4-----------------------
select e.FirstName,e.LastName
	   ,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Sales'
	   ,rank() over(order by sum((od.UnitPrice*od.Quantity)*(1-od.Discount))desc ) RANK
from Employees e
inner join Orders o on o.EmployeeID = e.EmployeeID
inner join Order_Details od on od.OrderID = o.OrderID
group by e.FirstName,e.LastName
order by 4

----------------------Question 5-----------------------
select e.FirstName,e.LastName
	   ,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Sales'
	   ,rank() over(order by sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) ) RANK
from Employees e
inner join Orders o on o.EmployeeID = e.EmployeeID
inner join Order_Details od on od.OrderID = o.OrderID
group by e.FirstName,e.LastName
order by 4

----------------------Question 6-----------------------
select e.FirstName,p.ProductName
	   ,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Sales'
	   ,rank() over(order by sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) desc ) RANK
from Employees e
inner join Orders o			on o.EmployeeID = e.EmployeeID
inner join Order_Details od on od.OrderID   = o.OrderID
inner join Products p		on od.ProductID = p.ProductID 
group by e.FirstName,e.LastName,p.ProductName
order by 4

----------------------Question 7-----------------------
select c.CompanyName,p.ProductName,sum((od.UnitPrice*od.Quantity)*(1-od.Discount)) 'Sales'
from Orders o	
inner join Customers c		on o.CustomerID = c.CustomerID
inner join Order_Details od on od.OrderID   = o.OrderID
inner join Products p       on p.ProductID  = od.ProductID
group by grouping sets ((c.CompanyName,p.ProductName),c.CompanyName,())

----------------------Question 8-----------------------

--------Part 1
--drop table #Orders_Per_Month
select format(OrderDate,'MMyyyy') 'Date_Month'
	   ,p.ProductName
	   ,OrderDate
into #Orders_Per_Month
from Orders o
inner join Order_Details od on od.OrderID = o.OrderID
inner join Products      p  on p.ProductID = od.ProductID
order by OrderDate

/*
select  '['+Date_Month +']'+','
from #Orders_Per_Month
*/
--------Part 2
select ProductName, [071996],
					[081996],
					[091996],
					[101996],
					[111996],
					[121996],
					[011997],
					[021997],
					[031997],
					[041997],
					[051997],
					[061997],
					[071997],
					[081997],
					[091997],
					[101997],
					[111997],
					[121997],
					[011998],
					[021998],
					[031998],
					[041998],
					[051998]

from 
	(
select ProductName,Date_Month,1 as 'Counting'
from #Orders_Per_Month
	) A
PIVOT
	(
	sum(Counting)
	for Date_Month in(
						[071996],
					[081996],
					[091996],
					[101996],
					[111996],
					[121996],
					[011997],
					[021997],
					[031997],
					[041997],
					[051997],
					[061997],
					[071997],
					[081997],
					[091997],
					[101997],
					[111997],
					[121997],
					[011998],
					[021998],
					[031998],
					[041998],
					[051998])
	) B
order by ProductName

---------Another Way to solve Pivot Question -Using Dynamic Pivot
--drop table #Orders_Per_Month
select format(OrderDate,'MMyyyy') 'Date_Month'
	   ,p.ProductName
	   ,OrderDate
into #Orders_Per_Month
from Orders o
inner join Order_Details od on od.OrderID = o.OrderID
inner join Products      p  on p.ProductID = od.ProductID
order by OrderDate

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX);

SET @cols =  STUFF((SELECT distinct ',' + QUOTENAME(c.Date_Month) 
            FROM #Orders_Per_Month c
			where MONTH(c.OrderDate) <='05' AND YEAR(c.OrderDate)>'1997'
            FOR XML PATH('')) 
        ,1,1,'')

set @query = 'SELECT ProductName, ' + @cols + ' from 
            (
                select ProductName
                    , Date_Month
                    ,1 as ''Counting''
                from #Orders_Per_Month
           ) x
            pivot 
            (
                 sum(Counting)
                for Date_Month in (' + @cols + ')
            ) p '

execute(@query)
----------------------Question 9-----------------------

declare @x as numeric
declare @y as numeric

set @x = RAND()*9+1
set @y = RAND()*9+1

select @x as 'X',@y as 'Y',(@x*@y) as 'Price',(@x*@y)*0.1 as 'Discount',(@x*@y)*0.9 as 'Net_Price'

