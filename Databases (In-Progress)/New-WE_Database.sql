/*
===========================
Attach-WE_Database.sql

.Notes
To-do:
    -Allow for variables as input using template strings: https:
//stackoverflow.com/questions/727788/how-to-
use-a-variable-for-the-database-name-in-t-sql/727815
Resources: Modified from code found on: https:
//www.quackit.com/sql_server/t-sql/examples/create_database.cfm
===========================
*/

USE Master;
GO

BEGIN TRY

    CREATE DATABASE Temp
    ON
    ( NAME = Temp_dat,
        FILENAME = 'C:\temp\Temp_dat.mdf',
        SIZE = 10000KB,
        MAXSIZE = UNLIMITED,
        FILEGROWTH = 5000KB )
    LOG ON
    ( NAME = Temp_log,
        FILENAME = 'C:\temp\Temp_log.ldf',
        SIZE = 5000KB,
        MAXSIZE = UNLIMITED,
        FILEGROWTH = 5000KB );

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