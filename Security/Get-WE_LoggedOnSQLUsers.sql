/*
===========================
Get-WE_LoggedOnSQLUsers.sql

.Description
    Queries the SQL Server to see which users are logged in.
    Can filter based on database name or other fields by adding a
    WHERE statement.
===========================
*/

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

/*
WHERE
	databases.name = 'Database'
*/

ORDER BY
	processes.loginame,
	databases.name