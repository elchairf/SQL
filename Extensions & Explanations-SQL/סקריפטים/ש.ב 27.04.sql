------------------�.�.---------------------

use Northwind

--���� 14
select DATEDIFF(yy, a.HireDate,GETDATE())
from Employees a

select a.EmployeeID,a.HireDate,GETDATE()
from Employees a

--���� 15
select DATEDIFF(yy, a.BirthDate,GETDATE())
from Employees a

--���� 16
select DATEDIFF(yy, a.BirthDate ,a.HireDate)
from Employees a



--���� 17

select a.HomePhone
from Employees a

--���� �
--����� ����� �����, ���� �� �����
select a.HomePhone as '���� ���� ������',
       SUBSTRING(a.HomePhone,2,CHARINDEX(' ',a.HomePhone)-3) as '������',
       RIGHT (A.HomePhone,8) as '���� �����'
from Employees a

SELECT a.HomePhone,CHARINDEX(' ',a.HomePhone)
from Employees a

--���� �
--����� 0 ������ �����, ����� ����� ������ ������ �� 0. ���� ��� ����� ����� �2 ������

select replace( REPLACE (A.HomePhone,'(',''), ')','')
from Employees a

-- ����� ���� 0 ������
select  right ('0' + replace( REPLACE (A.HomePhone,'(',''), ')',''),12), a.HomePhone
from Employees a


--����� ���� ����
select len (A.HomePhone)
from Employees a

--����� ���� �������
select a.HomePhone as '���� ���� ������',
       SUBSTRING(a.HomePhone,1,4) as '������',
       RIGHT (A.HomePhone,8) as '���� �����'

from Employees a

alter table Employees
add HomePhoneFix nvarchar (255)

update Employees 
set HomePhoneFix = right ('0' + replace( REPLACE (HomePhone,'(',''), ')',''),12)

select HomePhoneFix as '���� ���� ������',
       SUBSTRING(HomePhoneFix,1,4) as '������',
       RIGHT (HomePhoneFix,8) as '���� �����'

from Employees a


--���� 18
select a.CustomerID, RIGHT (a.CustomerID,3)
from Customers a


--���� 19
 select a.OrderDate as '����� �����',
  EOMONTH (a.OrderDate) as '��� ����',
  DATEADD (d,1,eomonth (a.OrderDate)) '����� ���� ���',
   DATEADD(month, DATEDIFF(month, 0,OrderDate), 0) AS '����� ����'
 from Orders a
 

 