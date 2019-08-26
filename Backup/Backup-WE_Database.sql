/*
===========================
Backup-WE_Database.sql

.Description
For more backup options, refer to: https:
//docs.microsoft.com/en-us/sql/t-sql/statements/
backup-transact-sql?view=sql-server-2017

.Examples
    -EXEC Backup_WE_Database Adventureworks 'C:\temp'

.Notes
    To do:
        -Add, if then logic to allow for backup options.
    Tested
===========================
*/

CREATE PROCEDURE "Backup_WE_Database"
    @database_name NVARCHAR(50),
    @path NVARCHAR(MAX)
AS

DECLARE @file_date NVARCHAR(20) = CONVERT(NVARCHAR(20),GETDATE(),112)
DECLARE @file_name NVARCHAR(256) = @path + '\' + @database_name + '_' + @file_date + '.BAK'

BEGIN TRY

    BACKUP DATABASE @database_name
    TO DISK = @file_name
    WITH
        CHECKSUM,
        NAME = @database_name;

    RESTORE VERIFYONLY
    FROM DISK = @file_name
    WITH
        CHECKSUM;

END TRY


BEGIN CATCH

    PRINT 'Error detected, unable to backup:'
    PRINT @database_name
    SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;

END CATCH

GO