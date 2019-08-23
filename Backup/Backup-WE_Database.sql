/*
===========================
Backup-WE_Database.sql

For more backup options, refer to: https:
//docs.microsoft.com/en-us/sql/t-sql/statements/
backup-transact-sql?view=sql-server-2017
===========================
*/

DECLARE @database_name VARCHAR(50) = 'HUB'
DECLARE @path VARCHAR(256) = 'C:\temp\'
DECLARE @file_date VARCHAR(20) = CONVERT(VARCHAR(20),GETDATE(),112)
DECLARE @file_name VARCHAR(256)
SET @file_name = @path + @database_name + '_' + @file_date + '.BAK'

BEGIN TRY

    BACKUP DATABASE @database_name

    TO DISK = @file_name

    WITH
        --DIFFERENTIAL
        --COPY_ONLY
        --COMPRESSION
        --ENCRYPTION AES_256 SERVER CERTIFICATE = @encryptor_name SERVER ASYMETRIC KEY = @encryptor_name
        CHECKSUM,
        NAME = @database_name

    RESTORE VERIFYONLY

    FROM DISK = @file_name

    WITH
    CHECKSUM

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
    ERROR_MESSAGE() AS ErrorMessage

END CATCH