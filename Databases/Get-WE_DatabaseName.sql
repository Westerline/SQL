/*
===========================
Get-WE_DatabaseName.sql

.Description
Queries the master database table for the names of all databases.
===========================
*/

SELECT
    name

FROM
    master.sys.databases;

GO