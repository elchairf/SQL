--����� ������ ���� ������ 2 ����� ����� �� SQL

--����� ����

--���� ������� ������ ���� �� ���� ������ ������� ������ (��� ��� ���� 1 ���� ���� 3.6 ���)
CREATE FUNCTION [dbo].[Amount_Conversion]
(
	--Add the parameters for the function here
	@Rate money,
	@Local_Currency money
)
RETURNS nvarchar (50)
AS
BEGIN
	--Declare the return variable here
	DECLARE @result nvarchar (50)
	--Add the SQL statements to compute the return value here
	IF @Rate IS NULL OR @Rate = ''
		BEGIN
			SET @result = 'Error- no value found for rate'
		END
	ELSE IF @Local_Currency IS NULL OR @Local_Currency = ''
		BEGIN
			SET @result = 'Error- no value found for currency'
		END
	ELSE
		BEGIN
			SET @result = @Rate * @Local_Currency
		END
		
	--Return the result of the function
	RETURN @result

END
GO

--����� �� ����� ��������
DECLARE @result NVARCHAR (50), @PARA1 MONEY=50, @PARA2 MONEY=2000
SELECT @result = [dbo].[Amount_Conversion] (@PARA1, @PARA2)
PRINT @result
;

--����� ���� 1
--��� �������� ������ �� ���� ������� ��� �����
CREATE PROCEDURE "Ten Most Expensive Products" AS
SET ROWCOUNT 10
SELECT	Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
FROM	Products
ORDER BY Products.UnitPrice DESC

GO

--����� ���������
EXEC [Ten Most Expensive Products] 



--����� ���� 2
--��� �������� ������ �� ������� ��� ���
CREATE VIEW "Order Subtotals" AS
SELECT	OrderID, SUM(CONVERT(MONEY,(UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal
FROM	Order_Details
GROUP BY OrderID

GO

CREATE PROCEDURE "Sales by Year" @Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT	Orders.ShippedDate, Orders.OrderID, [Order Subtotals].Subtotal, DATENAME(yy,ShippedDate) AS Year
FROM	Orders
		INNER JOIN
		[Order Subtotals] ON Orders.OrderID=[Order Subtotals].OrderID
WHERE	ShippedDate BETWEEN @Beginning_Date AND @Ending_Date

GO

--����� ���������
EXEC [Sales by Year] '1996-07-05 00:00:00.000', '1997-07-05 00:00:00.000'