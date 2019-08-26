/*
===========================
Remove-WE_DatabaseBackupHistory.sql

.Description
    Clear backup history from MSDB. Should be done regularly to prevent the backup history logs from growing too large.
    By default, will clear the last thirty days of backup history.

.Examples
    EXEC Remove_WE_DatabaseBackupHistory 30

.Notes
    To do:
        -
    Tested
===========================
*/

CREATE PROCEDURE "Remove_WE_DatabaseBackupHistory"

    @oldest_date INT

AS

BEGIN TRY

    DECLARE @date DATETIME = GETDATE()-@oldest_date
    EXEC msdb.dbo.sp_delete_backuphistory @date;

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