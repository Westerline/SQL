/*
===========================
Set-WE_SQLCredential.sql

.Description
    Sets the credentials used for a specified SQL user. Alter the
    statement with the required username and password.
    Use the [adventureworks\username] syntax for domain users.

.Notes
    -To-Do
        -Accept password input as secure string (New-SQLCredential sqlps command?)
===========================
*/

BEGIN TRY

    ALTER LOGIN Username WITH PASSWORD = 'SQL_Credential';

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