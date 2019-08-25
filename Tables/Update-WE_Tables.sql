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

.Notes
	To-do:
		-Automatically execute the generated UPDATE statements.
===========================
*/

USE AdventureWorks
GO

DECLARE @columnname varchar(10) = 'Branch'
DECLARE @columnvalue varchar(10) = '902'

Select
	'UPDATE ' + TABLE_NAME + ' SET @columnname = @columnvalue ' as Statement

From
	INFORMATION_SCHEMA.COLUMNS

WHERE
	COLUMN_NAME = @columnname AND TABLE_NAME NOT LIKE 'vi%'

Order by Statement

/*
DECLARE @columnname varchar(10) = 'Branch'
DECLARE @columnvalue varchar(10) = '902'

BEGIN TRY

BEGIN TRANSACTION UPDATE_TABLES

	UPDATE B_Config SET @columnname = @columnvalue
	UPDATE Specials SET @columnname = @columnvalue
	UPDATE APInvMatchDetails SET @columnname = @columnvalue
	UPDATE PricingCondition SET @columnname = @columnvalue

COMMIT TRANSACTION UPDATE_TABLES

PRINT 'All tables have been updated.'

END TRY

BEGIN CATCH

IF (@@TRANCOUNT > 0)

BEGIN

	ROLLBACK TRANSACTION UPDATE_TABLES

	PRINT 'Error detected, all changes reversed'

END

SELECT

	ERROR_NUMBER() AS ErrorNumber,

	ERROR_SEVERITY() AS ErrorSeverity,

	ERROR_STATE() AS ErrorState,

	ERROR_PROCEDURE() AS ErrorProcedure,

	ERROR_LINE() AS ErrorLine,

	ERROR_MESSAGE() AS ErrorMessage

END CATCH
*/