/*
===========================
Update-WE_Tables.sql

.Description
This script can be used to update the same column across a series of tables.
Initialize @columnname with the column to update across tables. Then initialize
@columnvalue with the new value you'd like those columns to have. This will generate
a series of update statments which you should copy/paste into the BEGIN/COMMIT TRANSACTION
block. Uncomment the entire Try/Catch block and re-run the code but with the update statements.
In my example, every database table that has a 'Branch' column will have '902' as the new value
for that column. To further refine the generated update statments, edit SELECT AS STATEMENT.
For example, you could append "WHERE BranchType = 'Domestic'".

.Examples
	-EXEC Update_WE_Tables 'Column1', 'NewValue'

.Notes
	To-do:
		-Filter tables that have the specified column name.
		-Allow for database_name parameter
		-Separate into two different stored proceedures (1) generate UPDATE statements (2) while loop against UPDATE statements with transaction rolback.
	Tested
===========================
*/

CREATE PROCEDURE "Update_WE_Tables"

	@column_name NVARCHAR(50),
	@column_value NVARCHAR(50)

AS

SELECT
	'UPDATE ' + INFORMATION_SCHEMA.TABLES.TABLE_NAME + ' SET ' + @column_name + '=' + @column_value + ';' as Statement

FROM
	INFORMATION_SCHEMA.TABLES
	INNER JOIN INFORMATION_SCHEMA.COLUMNS
	ON INFORMATION_SCHEMA.COLUMNS.TABLE_NAME = INFORMATION_SCHEMA.TABLES.TABLE_NAME

WHERE
	INFORMATION_SCHEMA.TABLES.TABLE_TYPE != 'VIEW'
	AND INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME = @column_name

ORDER BY Statement;

GO

/*
BEGIN TRY

	BEGIN TRANSACTION UPDATE_TABLES

		UPDATE B_Config SET @columnname = @columnvalue;
		UPDATE Specials SET @columnname = @columnvalue;
		UPDATE APInvMatchDetails SET @columnname = @columnvalue;

	COMMIT TRANSACTION UPDATE_TABLES

	PRINT 'All tables have been updated.'

END TRY

BEGIN CATCH

	IF (@@TRANCOUNT > 0)

	BEGIN

		ROLLBACK TRANSACTION UPDATE_TABLES;

		PRINT 'Error detected, all changes reversed';

	END

	SELECT

		ERROR_NUMBER() AS ErrorNumber,

		ERROR_SEVERITY() AS ErrorSeverity,

		ERROR_STATE() AS ErrorState,

		ERROR_PROCEDURE() AS ErrorProcedure,

		ERROR_LINE() AS ErrorLine,

		ERROR_MESSAGE() AS ErrorMessage;

END CATCH

GO
*/