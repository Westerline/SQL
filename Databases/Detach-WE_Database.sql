/*
===========================
Attach-WE_Database.sql

.Examples
    -EXEC Detach_WE_Database Adventureworks

.Notes
    To do:
    Tested
===========================
*/

CREATE PROCEDURE "Detach_WE_Database"

    @database_name NVARCHAR(50)

AS

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