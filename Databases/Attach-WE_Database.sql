/*
===========================
Attach-WE_Database.sql

.Notes
To-do:
    -Allow for variables as input using template strings: https:
//stackoverflow.com/questions/727788/how-to-
use-a-variable-for-the-database-name-in-t-sql/727815
===========================
*/

USE Master;
GO

BEGIN TRY

    CREATE DATABASE MyAdventureWorks

    ON (FILENAME = 'C:\MySQLServer\MyAdventureWorks_Data.mdf'),
        (FILENAME = 'C:\MySQLServer\MyAdventureWorks_Log.ldf')

    FOR ATTACH;

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