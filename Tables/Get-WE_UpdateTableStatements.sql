/*
==================================================================================================================================================================
Get-WE_UpdateTableStatements.sql

.Description
	This stored proceedure can be used to generate a series of UPDATE statements. These statements will update all rows of the specified column, in any table
	with that column name. For example, every database table that has a 'Branch' column will have '902' as the new value for that column. Copy/Paste the resulting
	statements into the BEGIN/COMMIT TRANSACTION block of the Update-WE_Tables.sql script. By default, this stored proceedure filters out views.

.Parameters
	The first parameter is @column_name, the name of the column which you'd like to update across multiple tables.
	The second parameter is @column_value, the value you'd like to assign to that column across multiple tables.

.Examples
	-EXEC Update_WE_Tables 'Column1', 'NewValue'

.Notes
	To-do:
		-Allow for database_name parameter
		-Separate into two different stored proceedures (1) generate UPDATE statements (2) while loop against UPDATE statements with transaction rolback.
	Tested
==================================================================================================================================================================
*/

CREATE PROCEDURE "Get_WE_UpdateTableStatements"

	@column_name NVARCHAR(50),
	@column_value NVARCHAR(50)

AS

SELECT
	'UPDATE ' + INFORMATION_SCHEMA.TABLES.TABLE_NAME + ' SET ' + @column_name + '=' + @column_value + ';' as Statement

FROM
	INFORMATION_SCHEMA.COLUMNS
	INNER JOIN INFORMATION_SCHEMA.TABLES
	ON INFORMATION_SCHEMA.COLUMNS.TABLE_NAME = INFORMATION_SCHEMA.TABLES.TABLE_NAME

WHERE
	INFORMATION_SCHEMA.TABLES.TABLE_TYPE != 'VIEW'
	AND INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME = @column_name

ORDER BY Statement;

GO