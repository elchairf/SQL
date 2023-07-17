use Northwind

--שאלה 1 יצירת טבלה זמנית
select *
into ##temp
from Customers

--שאלה 2- הוספת 3 שורות לטבלה הזמנית עם נתונים
insert into ##temp( CustomerID, CompanyName	,ContactName,ContactTitle)
values ('12345','elia','bensoussan','et')

insert into ##temp( CustomerID, CompanyName	,ContactName,ContactTitle)
values ('2345','natan','goshen','za')

insert into ##temp( CustomerID, CompanyName	,ContactName,ContactTitle)
values ('3456','noam','naym','rf')

 --הצגת הטבלה הזמנית
select *
from ##temp

--שאלה 3- מחיקת שורות מהטבלה
delete from ##temp
where City= 'London' or Fax is null


--שאלה 7
//*
drop table ##order1
drop table ##order2
drop table ##order3
*/
select o.*
into ##order1
from Orders o
join
[Order Details] od
on o.OrderID= od.OrderID 
where o.OrderDate <= CONVERT (datetime, '1997-12-18')

select o.*
into ##order2
from Orders o
join
[Order Details] od
on o.OrderID= od.OrderID 
where o.OrderDate >= CONVERT (datetime, '1997-12-18')


select o.*
into ##order3
from Orders o
join
[Order Details] od
on o.OrderID= od.OrderID 

select *
from ##order1
select *
from ##order2
select *
from ##order3

--שאלה 8-איחוד טבלאות
select OrderID	,CustomerID,	EmployeeID,	OrderDate,	RequiredDate	,ShippedDate	,ShipVia	,Freight	,ShipName,ShipAddress,	ShipCity	,ShipRegion	,ShipPostalCode,	ShipCountry
from ##order1

union all
select OrderID	,CustomerID,	EmployeeID,	OrderDate,	RequiredDate	,ShippedDate	,ShipVia	,Freight	,ShipName,ShipAddress,	ShipCity	,ShipRegion	,ShipPostalCode,	ShipCountry
from ##order2


INTERSECT
SELECT * FROM ##order3

