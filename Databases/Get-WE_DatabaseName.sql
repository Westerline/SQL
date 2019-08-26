/*
===========================
Get-WE_DatabaseName.sql

.Description
Queries the master database table for the names of all databases.

.Examples
    -EXEC Get_WE_DatabaseName

.Notes
    To do:
    Tested
===========================
*/

CREATE PROCEDURE "Get_WE_DatabaseName"
AS

SELECT
    name
FROM
    master.sys.databases;

GO