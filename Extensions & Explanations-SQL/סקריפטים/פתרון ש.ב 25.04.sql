--	����� �.� �� ����

--���� 5- 
--����� ���� �����. ��� ���� ����� �� ��� �����
select *
from Orders
where ShipVia  in (1,3)

--���� 6
--�� ������� �� ������ ������ �� ������ �� �����, �� ��� ���� �� �� ������ ���� ����� ��� ���� ���
select *
from Orders 
where OrderDate between '1996-01-01 00:00:00.000' and '1996-12-31 00:00:00.000'

--���� 7
select [ShipName] , *
from Orders
where [ShipName] like 'ernst%'


--���� 13
select a.CustomerID, a.EmployeeID, COUNT (orderid) as 'count'
from Orders a
where a.CustomerID like 'AN%'
group by a.CustomerID, a.EmployeeID