--	פתרון ש.ב עם יוסי

--שאלה 5- 
--בחירה מתוך רשימה. טוב כשיש בחירה של כמה ערכים
select *
from Orders
where ShipVia  in (1,3)

--שאלה 6
--אם מעתיקים את הכותרת מהטבלא עם הערכים של האריך, זה כבר נותן לי את הפורמט שאני צריכה וזה חוסך זמן
select *
from Orders 
where OrderDate between '1996-01-01 00:00:00.000' and '1996-12-31 00:00:00.000'

--שאלה 7
select [ShipName] , *
from Orders
where [ShipName] like 'ernst%'


--שאלה 13
select a.CustomerID, a.EmployeeID, COUNT (orderid) as 'count'
from Orders a
where a.CustomerID like 'AN%'
group by a.CustomerID, a.EmployeeID