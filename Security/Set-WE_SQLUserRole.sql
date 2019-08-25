/*
===========================
Set-WE_SQLUserRole.sql

.Description
    Sets the role type (sysadmin, public, etc.)
    for a specified SQL user. Set the specified
    server role and username you'd like to configure.
    Use the [adventureworks\username] syntax for
    domain users.

.Notes
    -To-do
        -Accept variable input for statement.
===========================
*/

USE AdventureWorks
GO

BEGIN TRY

    ALTER SERVER ROLE denydatawriter ADD MEMBER username;

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