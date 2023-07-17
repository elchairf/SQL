
use [Northwind]
--הצגת מספר הזמנה
select OrderID
from Orders

-- הצגת שדות מתוך טבלת עובדים
select EmployeeID, FirstName, LastName
from Employees

--הצגת כל השדות מטבל מוצרים
select *
from Products


--הצגת כל השדות למספר עובד 7
select *
from Employees
where EmployeeID = '7'

--בחירת עמודות מסויימות מטבלה, והצגה בסדר יורד
select EmployeeID,	LastName,	FirstName,	Title,	TitleOfCourtesy,	BirthDate	,HireDate, *	
from Employees
order by 1, 2 ,3 desc

--הצגת כרל השדות מטבלה כשאר השדה לא ריק
select *
from Orders
where ShipRegion is not null

--הצגת כל השדות מטבלה כאשר השדה גדול או שווה 27.5
select  *
from   Orders
where  Freight >= 27.5
order by Freight asc

-- ספירת כמות מוצרים לפי קטגוריה
select   [CategoryID] , count (ProductID) ProductID_counter
from  Products
group by CategoryID 

 --שאלה 5
 select *
 from Orders
 where ShipVia = 1 or ShipVia =  3

 --שאלה 6
 select *
 from Orders
 where OrderDate  between '1996.1.1'  and '1996.12.31'

 select OrderDate
 from Orders

 --שאלה 7
 select *
 from Orders
 where  [ShipName] like 'Ernst%'

 -- שאלה 11
 select [CategoryID] ,
 sum (UnitPrice) as 'sum_UnitPrice' , 
 avg (UnitPrice) as 'avg_UnitPrice'
 from Products
 group by [CategoryID]

 --שאלה 12
 select [CustomerID],[EmployeeID],
 min (OrderDate) as 'min_OrderDate' ,
 max (OrderDate) as 'max_OrderDate'
 from Orders
 group by [CustomerID],[EmployeeID]

 --שאלה 13
 select a.CustomerID, a.EmployeeID, count(*) 'Count'
 from Orders a
 where a.CustomerID like 'AN%'
 group by a.CustomerID, a.EmployeeID
 order by a.CustomerID


 --החזרת מספר תווים מצד שמאל
select left (ShipName,3)
from Orders

--החזרת מספר תווים מצד ימין
select RIGHT (ShipName,3)
from Orders

select SUBSTRING (cast(ShippedDate as nvarchar), 1,3)
from Orders

--שאלה 17
select HomePhone, SUBSTRING (HomePhone ,2,5), len (HomePhone)

from Employees


select  distinct left (customerid,1) 
from Customers

select case when left (CustomerID ,1) like 'A%' then 'A'
 when left (CustomerID ,1) like 'B%' then 'B'
else 'other'
end as [group] , CustomerID
from Customers

