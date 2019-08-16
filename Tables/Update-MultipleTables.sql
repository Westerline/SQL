Declare @Databasename varchar(60)
Set @Databasename = ''

USE @Databasename

GO

BEGIN TRY

	DECLARE @columnname varchar(10)
	SET @columnname = 'Branch'
	DECLARE @columnvalue varchar(10)
	SET @columnvalue = '902'

	BEGIN TRANSACTION UpdateMultipleTables


	Select 'UPDATE ' + TABLE_NAME + ' SET @columnname = @columnvalue ' as Statement

From INFORMATION_SCHEMA.COLUMNS

WHERE COLUMN_NAME = @columnname AND TABLE_NAME NOT LIKE 'vi%'

Order by Statement


	/* Copy/Paste the resulting Insert Statements below and re-run script.

	e.g. UPDATE Alerts SET @columnname = @columnvalue */


	COMMIT TRANSACTION UpdateMultipleTables

	PRINT 'All tables have been updated.'

END TRY



BEGIN CATCH

  IF (@@TRANCOUNT > 0)

   BEGIN

	ROLLBACK TRANSACTION UpdateMultipleTables

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