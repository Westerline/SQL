/*
===========================
Select-WE_TableNames.SQL

.Description
    Lists all table names for a specified database.
    Adjust the datbase name in the FROM statement (AdventureWorks)
    to match the database you'd like to query.

.Notes
    -To-do:
        Add option for variable input for FROM statement
===========================
*/

USE Master
GO

SELECT
    TABLE_NAME

FROM
    AdventureWorks.INFORMATION_SCHEMA.TABLES

WHERE
    TABLE_TYPE = 'BASE TABLE'