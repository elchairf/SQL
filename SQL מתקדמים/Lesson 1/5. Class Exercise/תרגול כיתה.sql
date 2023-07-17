USE [Northwind_SQL]

--תשובות לשאלות חזרה
SELECT	Order_Quarter, SUM(Price) Price
FROM	(
		SELECT	CONCAT(DATEPART(QQ,a.OrderDate),'-',DATEPART(YY,a.OrderDate)) AS Order_Quarter,
				SUM(b.UnitPrice*b.Quantity*(1-b.Discount)) AS Price
		FROM	dbo.[Orders] a--נתוני ההזמנה
				JOIN
				dbo.Order_Details b--חיבור לטבלת מוצרים
				ON a.OrderID=b.OrderID
		GROUP BY OrderDate
		)C
GROUP BY Order_Quarter
ORDER BY 1

SELECT	CONCAT(DATEPART(QQ,a.OrderDate),'-',DATEPART(YY,a.OrderDate)) AS Order_Quarter,
		SUM(b.UnitPrice*b.Quantity*(1-b.Discount)) AS Price
FROM	dbo.[Orders] a--נתוני ההזמנה
		JOIN
		dbo.Order_Details b--חיבור לטבלת מוצרים
		ON a.OrderID=b.OrderID
GROUP BY CONCAT(DATEPART(QQ,a.OrderDate),'-',DATEPART(YY,a.OrderDate))



--PIVOT Syntax

--collect data in temp table
select	distinct TOP 5 CustomerID, Phone
--into	#temp
from	dbo.Customers
order by 6

--using pivot to show as columns using static PIVOT
SELECT	[ALFKI],[ANATR],[ANTON],[AROUT],[BERGS]
FROM	(SELECT	CustomerID, Phone
		 FROM	#temp
		)A
		PIVOT
		(COUNT(Phone) 
			FOR CustomerID IN ([ALFKI],[ANATR],[ANTON],[AROUT],[BERGS])
		)B
		

--תרגיל כיתה pivot
select	City, CustomerID
into	#temp2
from	dbo.Customers
where	LEFT(City,1)='M'
order by 1

SELECT	[M?nchen],[M?nster],[M?xico D.F.],[Madrid],[Mannheim],[Marseille],[Montr?al]
FROM	(SELECT	City, CustomerID
		 FROM	#temp2
		)A
		PIVOT
		(COUNT(CustomerID) 
			FOR City IN ([M?nchen],[M?nster],[M?xico D.F.],[Madrid],[Mannheim],[Marseille],[Montr?al])
		)B		


--תרגיל כיתה unpivot
SELECT	City, CustomerID
FROM	(
		SELECT	[M?nchen],[M?nster],[M?xico D.F.],[Madrid],[Mannheim],[Marseille],[Montr?al]
		FROM	(SELECT	City, CustomerID
				 FROM	#temp2
				)A
				PIVOT
				(COUNT(CustomerID) 
					FOR City IN ([M?nchen],[M?nster],[M?xico D.F.],[Madrid],[Mannheim],[Marseille],[Montr?al])
				)B
		)PVT1
		UNPIVOT
		(CustomerID FOR City IN ([M?nchen],[M?nster],[M?xico D.F.],[Madrid],[Mannheim],[Marseille],[Montr?al])
		)PVT2
		
		
--תשובות לשאלות התרגול

--שאלות 1 ו 2
WITH tempTbl
AS	(
	SELECT	[CompanyName], [ProductName], SUM([UnitPrice]*[UnitsInStock]) erech_mlai,
			rank () over (partition by [CompanyName] order by SUM ([UnitPrice]*[UnitsInStock]) desc) as RANK
	FROM	[Northwind_SQL].[dbo].[Products] a
			JOIN
			[Northwind_SQL].[dbo].[Suppliers] b on a.SupplierID=b.SupplierID
	GROUP BY [CompanyName], [ProductName]
	)
	
SELECT	[CompanyName], [ProductName], RANK, erech_mlai
FROM	tempTbl
WHERE	RANK <=2
ORDER BY [CompanyName], RANK

--שאלה 3
SELECT	[CompanyName], [ProductName], erech_mlai, RANK
FROM	(
		SELECT	[CompanyName], [ProductName], SUM([UnitPrice]*[UnitsInStock]) erech_mlai,
				rank () over (order by SUM ([UnitPrice]*[UnitsInStock]) desc) as RANK
		FROM	[Northwind_SQL].[dbo].[Products] a
				JOIN
				[Northwind_SQL].[dbo].[Suppliers] b on a.SupplierID=b.SupplierID
		GROUP BY [CompanyName], [ProductName]
		)RNK1
WHERE	RANK<=10
ORDER BY 4

--שאלה 4
WITH tempTbl
AS	(
	SELECT	[CompanyName], [ProductName], SUM([UnitPrice]*[UnitsInStock]) erech_mlai,
			rank () over (partition by [CompanyName] order by SUM ([UnitPrice]*[UnitsInStock]) desc) as RANK
	FROM	[Northwind_SQL].[dbo].[Products] a
			JOIN
			[Northwind_SQL].[dbo].[Suppliers] b on a.SupplierID=b.SupplierID
	GROUP BY [CompanyName], [ProductName]
	)
	
SELECT [CompanyName], [ProductName], SUM(erech_mlai) as erech_mlai
FROM	tempTbl
WHERE	RANK=2
GROUP BY GROUPING SETS ( ([CompanyName], [ProductName]),  () )
ORDER BY 1, 2 
