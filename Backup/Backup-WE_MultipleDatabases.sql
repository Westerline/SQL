/*
===========================
Backup-WE_MultipleDatabases.sql

.Description
Backs up all databases found in master.dbo.sysdatabases (excludes master, model, msdb,
and tempdb).
Convert style 112 converts the current date/time to a NVARCHAR yyyymmdd.
Opens a cursor for each database name in an instance.
Increments the cursor and performs a database backup for each database name.

.Resources
For more backup options, refer to: https:
//docs.microsoft.com/en-us/sql/t-sql/statements/
backup-transact-sql?view=sql-server-2017

.Examples
EXEC Backup_WE_MultipleDatabases 'C:\temp'

.Notes
   To-do:
      -Add parameter to exclude additonal databases
      -Check if pointer already exists, if so close pointer.
   Tested
===========================
*/

CREATE PROCEDURE "Backup_WE_MultipleDatabases"

   @path NVARCHAR(256)

AS

DECLARE @database_name NVARCHAR(50)
DECLARE @file_name NVARCHAR(256)
DECLARE @file_date NVARCHAR(20) = CONVERT(NVARCHAR(20),GETDATE(),112)
DECLARE db_cursor CURSOR READ_ONLY FOR

SELECT
   name

FROM
   master.dbo.sysdatabases

WHERE
name NOT IN ('master','model','msdb','tempdb');

OPEN db_cursor

FETCH NEXT
FROM db_cursor
INTO @database_name;

WHILE @@FETCH_STATUS = 0

   BEGIN TRY

      SET @file_name = @path + '\' + @database_name + '_' + @file_date + '.BAK'
      BACKUP DATABASE @database_name
      TO DISK = @file_name
      WITH
         CHECKSUM;

      RESTORE VERIFYONLY
      FROM DISK = @file_name
      WITH
         CHECKSUM;

      FETCH NEXT
      FROM db_cursor
      INTO @database_name;

   END TRY

   BEGIN CATCH

      PRINT 'Error detected, unable to backup:';
      PRINT @database_name;

      SELECT
   ERROR_NUMBER() AS ErrorNumber,
   ERROR_SEVERITY() AS ErrorSeverity,
   ERROR_STATE() AS ErrorState,
   ERROR_PROCEDURE() AS ErrorProcedure,
   ERROR_LINE() AS ErrorLine,
   ERROR_MESSAGE() AS ErrorMessage;

      FETCH NEXT
      FROM db_cursor
      INTO @database_name;

   END CATCH

CLOSE db_cursor
DEALLOCATE db_cursor

GO