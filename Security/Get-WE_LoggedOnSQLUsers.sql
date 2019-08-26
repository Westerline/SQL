/*
===========================
Get-WE_LoggedOnSQLUsers.sql

.Description
    Queries the SQL Server to see which users are logged in.
    Can filter based on database name or other fields by adding a
    WHERE statement.

.Examples
    -EXEC Get_WE_LoggedOnSQLUsers

.Notes
    To do:
        -WHERE statement with proceedure parameter that accepts individual, multiple, or wildcard input for database names.
    Tested
===========================
*/

CREATE PROCEDURE "Get_WE_LoggedOnSQLUsers"

AS

SELECT
    processes.status AS 'Status',
    processes.loginame AS 'Login Name',
    processes.hostname AS 'Host Name',
    databases.name AS 'Name',
    processes.cmd as 'Cmd'

FROM
    master.dbo.sysprocesses AS processes

    JOIN
    master.dbo.sysdatabases AS databases

    ON
    processes.dbid = databases.dbid

ORDER BY
	processes.loginame,
	databases.name;

GO