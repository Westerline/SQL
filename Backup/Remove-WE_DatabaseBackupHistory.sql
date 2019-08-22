/*
===========================
Remove-WE_DatabaseBackupHistory.sql

Clear backup history from MSDB. Should be done regularly to prevent the backup history logs from growing too large.
By default, will clear the last thirty days of backup history.
===========================
*/

USE MSDB;
GO

BEGIN TRY

    DECLARE @OLDEST_DATE INT = 30
    DECLARE @DATE DATETIME
    SET @DATE = GETDATE()-@OLDEST_DATE
    EXEC SP_DELETE_BACKUPHISTORY @DATE

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