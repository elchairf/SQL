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

	--Dynamic column
SET @cols =  STUFF((SELECT distinct ',' + QUOTENAME(c.Date_Month) 
            FROM #Orders_Per_Month c
--			where MONTH(c.OrderDate) <='05' AND YEAR(c.OrderDate)>'1997'
            FOR XML PATH('')), 
    1, 1, '')