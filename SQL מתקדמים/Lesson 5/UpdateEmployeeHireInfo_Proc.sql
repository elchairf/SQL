USE [AdventureWorks2014]
GO

CREATE PROCEDURE [dbo].[UpdateEmployeeHireInfo]
    @BusinessEntityID [int], 
    @JobTitle [nvarchar](50), 
    @HireDate [datetime], 
    @RateChangeDate [datetime], 
    @Rate [money], 
    @PayFrequency [tinyint], 
    @CurrentFlag [dbo].[Flag] 
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [HumanResources].[Employee] 
        SET [JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;

        INSERT INTO [HumanResources].[EmployeePayHistory] 
            ([BusinessEntityID]
            ,[RateChangeDate]
            ,[Rate]
            ,[PayFrequency]) 
        VALUES (@BusinessEntityID, @RateChangeDate, @Rate, @PayFrequency);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback any active or uncommittable transactions before
        --ROLLBACK TRANSACTION to erase all data modifications made from the start of the transaction or to a savepoint
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        PRINT ('An error occurred in the stored procedure')
    END CATCH;
END;


--EXEC [dbo].[UpdateEmployeeHireInfo] 15,'Design Engineer','2011-01-18','2014-06-30 00:00:00.000',8.62,2,1
