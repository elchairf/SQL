USE [AdventureWorks2014]
GO

CREATE PROCEDURE [dbo].[ProductListPrice] (@ProductID [int], @OrderDate [datetime])

AS 
BEGIN
    DECLARE @ListPrice money;

    SELECT @ListPrice = plph.[ListPrice] 
    FROM [Production].[Product] p 
        INNER JOIN [Production].[ProductListPriceHistory] plph 
        ON p.[ProductID] = plph.[ProductID] 
            AND p.[ProductID] = @ProductID 
            AND @OrderDate BETWEEN plph.[StartDate] AND COALESCE(plph.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!

SELECT @ListPrice

END;

--exec  [dbo].[ProductListPrice] 723,'2011-07-31 00:00:00.000'