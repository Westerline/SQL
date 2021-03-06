﻿/*
===========================
Test-WE_DatabaseBakup.sql

.Description
    Tests the integrity of a backup/backupset.
    Adjust the @file_name variable to the required path of your database backup.
    For more restore verifyonly options, refer to: https:
    //docs.microsoft.com/en-us/sql/t-sql/statements/
    restore-statements-verifyonly-transact-sql?view=sql-server-2017

.Examples
    -EXEC Test_WE_DatabaseBackup 'C:\temp\HUB_20190822.bak'

.Notes
    -To do:
    Tested
===========================
*/

CREATE PROCEDURE "Test_WE_DatabaseBackup"

    @file_name NVARCHAR(MAX)

AS

BEGIN TRY

    RESTORE VERIFYONLY
    FROM DISK = @file_name;

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