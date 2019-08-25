/*
===========================
Attach-WE_Database.sql

.Notes
To-do:
===========================
*/

DECLARE @database_name VARCHAR(50) = 'MyAdventureWorks'

BEGIN TRY

    EXEC sp_detach_db @database_name;

END TRY

BEGIN CATCH

    SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;

END CATCH

GO