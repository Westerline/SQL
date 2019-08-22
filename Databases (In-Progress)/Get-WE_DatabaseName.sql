/*
===========================
Get-WE_DatabaseName.sql

.Description
Queries the master database table for the names of all databases.
===========================
*/

Select
    name

From
    master.sys.databases