--����� ��� ������- JOIN
use Northwind

--���� �� �����
--����� ��� ������- �� ������ ���� �������
select  *
from Orders a
join [Order Details] b
on a.OrderID = b.OrderID 

--����� ��� ������- ����
select  *
from Orders a
right join [Order Details] b
on a.OrderID = b.OrderID 
where a.OrderID is null

--����� ��� ������- ����
select  *
from Orders a
left join [Order Details] b
on a.OrderID = b.OrderID 
where a.OrderID is null

--����� ��� ������- ���
select  *
from Orders a
full outer join [Order Details] b
on a.OrderID = b.OrderID 
where a.OrderID is null

--���� �� ����,���� ����� ������ �����
select  a.OrderID, a.OrderDate,b.FirstName + ' ' +b.LastName as 'name'
from Orders a
 join [Employees] b
on a.EmployeeID = b.EmployeeID
where a.EmployeeID is null

--���� ���� ������ �2 �������
select  top 1*
from Orders a

select  top 1 *
from Employees a

delete from [Order Details] where OrderID > 10990

--������ ��� ������� �ordere �����
select *
from Orders a
full outer join [Order Details] b
on a.OrderID = b.OrderID
where a.OrderID is null
--where b.OrderID is null


--������ ���� ������
--���� �� ������ ���� �������
select *
from 
(select a.*, b.OrderID as OrderID_B
from Orders a
full outer join [Order Details] b
on a.OrderID = b.OrderID
where a.Freight >10) c

--����� ���� �� �� �����
/*
select *
from [Order Details] a
*/
select  a.OrderID,sum( a.Quantity * a.UnitPrice) as '���� �����'
from [Order Details] a
group by a.OrderID

--�� ��� ������ �� ����� ��� ����?
select od.OrderId ,c.CompanyName ,
 SUM(od.Quantity*od.UnitPrice) as '���� �����'
from Customers as c left join orders as o left join [Order Details] as od 
on od.OrderID=o.OrderID on o.CustomerID=c.CustomerID
group by od.OrderID,c.CompanyName 
order by SUM(od.Quantity*od.UnitPrice) desc 
 



--����� ��� ���
select  a.UnitPrice, a.ProductName
from Products a
order by  a.UnitPrice asc


 --���� 23
 select a.CustomerID, sum (b.Quantity*b.Quantity) as 'tashlum'
 from Orders a
      join
      [Order Details] b on a.OrderID = b.OrderID
      left join
      Products p on p.ProductID = b.ProductID
	  where p.ProductName in ('Tofu','Chang ')
 group by a.CustomerID
 order by 1

 --���� 24
  select c.CompanyName
 from  Customers c
     left join
	 Orders o  
	 join
	 [Order Details] od 
	 on od.OrderID= o.OrderID
	 on o.CustomerID = c.CustomerID
	  where o.OrderID is null


