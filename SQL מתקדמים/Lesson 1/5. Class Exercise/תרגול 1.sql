--Sales per Quarter
select datepart(YYYY,o.OrderDate) as 'Year',datepart(qq,o.OrderDate)as 'Quarter',sum((od.UnitPrice*od.Quantity)*(1- od.Discount)) as 'Sales'
from [Order_Details] od
inner join Products p on od.ProductID = p.ProductID
inner join orders o on o.OrderID = od.OrderID 
group by datepart(YYYY,o.OrderDate) ,datepart(qq,o.OrderDate)

--Sales per Seller
select s.FirstName,s.LastName,sum((od.UnitPrice*od.Quantity)*(1- od.Discount)) as 'Sales'
from [Order_Details] od
inner join Products p on od.ProductID = p.ProductID
inner join orders o on o.OrderID = od.OrderID
inner join[dbo].[Employees] s on s.EmployeeID = o.EmployeeID
group by s.EmployeeID,s.FirstName,s.LastName




---------------------------CTE AND RANK-----------------------------
--Rank
--1
select s.CompanyName,p.ProductName,sum(p.UnitsInStock*p.UnitPrice) 'Product_Value'
	   ,rank() over(partition by s.CompanyName order by sum(p.UnitsInStock*p.UnitPrice) desc) AS RANK
from [dbo].[Suppliers] s
inner join [dbo].[Products] p on p.SupplierID = s.SupplierID
group by s.CompanyName,p.ProductName

--2
with tempTbl AS
(
select s.CompanyName,p.ProductName,sum(p.UnitsInStock*p.UnitPrice) 'Product_Value'
	   ,rank() over(partition by s.CompanyName order by sum(p.UnitsInStock*p.UnitPrice) desc) AS RANK
from [dbo].[Suppliers] s
inner join [dbo].[Products] p on p.SupplierID = s.SupplierID
group by s.CompanyName,p.ProductName

)
select * from tempTbl where rank<3


--3
with Invent_Max
as
(
select s.CompanyName,p.ProductName,sum(p.UnitsInStock*p.UnitPrice) 'Product_Value'
	   ,rank() over(order by sum(p.UnitsInStock*p.UnitPrice) desc) AS RANK
from [dbo].[Products] p
inner join [dbo].[Suppliers] s on p.SupplierID = s.SupplierID
group by s.CompanyName,p.ProductName
)
select * from Invent_Max where rank<11



--4 Grouping sets
with tempTbl AS
(
select s.CompanyName,p.ProductName,sum(p.UnitsInStock*p.UnitPrice) 'Product_Value'
	   ,rank() over(partition by s.CompanyName order by sum(p.UnitsInStock*p.UnitPrice) desc) AS RANK
from [dbo].[Suppliers] s
inner join [dbo].[Products] p on p.SupplierID = s.SupplierID
group by s.CompanyName,p.ProductName
)
select CompanyName,ProductName,sum(Product_Value) 
from tempTbl where rank=2 
group by grouping sets((CompanyName,ProductName),())


--PIVOT
SELECT City,A.CustomerID
--INTO #TEMP2
FROM [dbo].[Customers] A
WHERE A.City LIKE 'M%'

SELECT DISTINCT City
--INTO #TEMP2
FROM [dbo].[Customers] A
WHERE A.City LIKE 'M%'

SELECT *
--INTO #TEMP3
FROM (
SELECT [Madrid],[Mannheim],[Marseille],[México D.F.],[Montréal],[München],[Münster]
FROM (SELECT *
	  FROM #TEMP2
	  ) A
	  PIVOT
	  (count(CustomerID)
	  FOR CITY in ([Madrid],[Mannheim],[Marseille],[México D.F.],[Montréal],[München],[Münster])
	  ) B
) DD


--UNPIVOT
SELECT CITY,CustomerID
FROM #TEMP3
UNPIVOT
	(
	  CustomerID
	  FOR CITY in ([Madrid],[Mannheim],[Marseille],[México D.F.],[Montréal],[München],[Münster])
	 ) V








