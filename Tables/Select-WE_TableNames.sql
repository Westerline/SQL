/*
===========================
Select-WE_TableNames.SQL

.Description
    Lists all table names for a specified database.
    Adjust the datbase name in the FROM statement (AdventureWorks)
    to match the database you'd like to query.

.Examples
    -EXEC Select_WE_TableNames Adventureworks

.Notes
    To-do:
    Tested
===========================
*/

CREATE PROCEDURE "Select_WE_TableNames"

    @database_name NVARCHAR(50)

AS

DECLARE @select_table_template VARCHAR(MAX) =

    'SELECT
        Table_Name
    FROM
        {database_name}.INFORMATION_SCHEMA.TABLES
    WHERE
        TABLE_TYPE = ''BASE TABLE''
    ORDER BY
        Table_Name;'

DECLARE @sql_script VARCHAR(MAX) = REPLACE(@select_table_template, '{database_name}', @database_name)

EXEC (@sql_script);