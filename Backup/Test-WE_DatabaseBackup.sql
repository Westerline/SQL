/*
===========================
Test-WE_DatabaseBakup.sql

.Description
Tests the integrity of a backup/backupset.
Adjust the @file_name variable to the required path of your database backup.

For more restore verifyonly options, refer to: https:
//docs.microsoft.com/en-us/sql/t-sql/statements/
restore-statements-verifyonly-transact-sql?view=sql-server-2017
===========================
*/

DECLARE @file_name VARCHAR(256) = 'C:\temp\HUB_20190822.bak'

BEGIN TRY

    RESTORE VERIFYONLY

    FROM DISK = @file_name
    --WITH CHECKSUM

END TRY

BEGIN CATCH

    SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage

END CATCH