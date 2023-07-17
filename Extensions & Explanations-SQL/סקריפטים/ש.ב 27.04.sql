------------------ש.ב.---------------------

use Northwind

--שאלה 14
select DATEDIFF(yy, a.HireDate,GETDATE())
from Employees a

select a.EmployeeID,a.HireDate,GETDATE()
from Employees a

--שאלה 15
select DATEDIFF(yy, a.BirthDate,GETDATE())
from Employees a

--שאלה 16
select DATEDIFF(yy, a.BirthDate ,a.HireDate)
from Employees a



--שאלה 17

select a.HomePhone
from Employees a

--שיטה א
--מציאת מיקום הרווח, ולפי זה לחתוך
select a.HomePhone as 'מספר כולל קידומת',
       SUBSTRING(a.HomePhone,2,CHARINDEX(' ',a.HomePhone)-3) as 'קידומת',
       RIGHT (A.HomePhone,8) as 'מספר טלפון'
from Employees a

SELECT a.HomePhone,CHARINDEX(' ',a.HomePhone)
from Employees a

--שיטה ב
--הוספת 0 לתחילת המספר, הוספת עמודה ועדכון העמודה עם 0. לאחר מכן לחתוך ולפצל ל2 עמודות

select replace( REPLACE (A.HomePhone,'(',''), ')','')
from Employees a

-- הוספת ספרה 0 בהתחלה
select  right ('0' + replace( REPLACE (A.HomePhone,'(',''), ')',''),12), a.HomePhone
from Employees a


--מציאת מספר תוים
select len (A.HomePhone)
from Employees a

--חיתוך מספר וקידומת
select a.HomePhone as 'מספר כולל קידומת',
       SUBSTRING(a.HomePhone,1,4) as 'קידומת',
       RIGHT (A.HomePhone,8) as 'מספר טלפון'

from Employees a

alter table Employees
add HomePhoneFix nvarchar (255)

update Employees 
set HomePhoneFix = right ('0' + replace( REPLACE (HomePhone,'(',''), ')',''),12)

select HomePhoneFix as 'מספר כולל קידומת',
       SUBSTRING(HomePhoneFix,1,4) as 'קידומת',
       RIGHT (HomePhoneFix,8) as 'מספר טלפון'

from Employees a


--שאלה 18
select a.CustomerID, RIGHT (a.CustomerID,3)
from Customers a


--שאלה 19
 select a.OrderDate as 'תאריך מקורי',
  EOMONTH (a.OrderDate) as 'סוף חודש',
  DATEADD (d,1,eomonth (a.OrderDate)) 'תחילת חודש הבא',
   DATEADD(month, DATEDIFF(month, 0,OrderDate), 0) AS 'תחילת חודש'
 from Orders a
 

 