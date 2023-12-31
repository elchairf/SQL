USE [AdventureWorks2014]
GO

CREATE PROCEDURE [UpdateEmployeePersonalInfo] (@BusinessEntityID [int], @NationalIDNumber [nvarchar](15), @BirthDate [date], @MaritalStatus [nchar](1), @Gender [nchar](1))

AS
BEGIN

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [NationalIDNumber] = @NationalIDNumber 
            ,[BirthDate] = @BirthDate 
            ,[MaritalStatus] = @MaritalStatus 
            ,[Gender] = @Gender 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        PRINT ('An error occurred in the stored procedure')
    END CATCH;
END;

--EXEC [UpdateEmployeePersonalInfo] 15,'245797967','1971-08-01','S','F'

