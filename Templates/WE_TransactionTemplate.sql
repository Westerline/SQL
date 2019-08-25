/*
===========================
Transaction Script Template
-Start with try and catch blocks so that the transaction can be reversed if it fails.
-Within try, begin a named transaction and increments @@TRANCOUNT by 1.
-If the transaction was successful, commit it and print an output message.
-If the transaction was unsuccessful, go to the catch block.
-If @@TRANCOUNT has incremented, roll back the named transaction.
-Lastly, output error/debugging information
-GO is used to isolate one part of the script from another.
-BEGIN and END bind together logical blocks of code. This is necessary if using for loops, if statements, etc. It's optional to use these in the start/end of a stored procedure.
-BEGIN TRAN and END TRAN are used to wrap the code block in a transaction and the transaction can be rolled back if an error occurrs.
-GO is used to terminate/separate an entire batch of code. If one GO batch has an error,
the second GO batch will still execute.
-Semi-Colon is used to terminate/separate blocks of code. If one SELECT statement has an
error, the next SELECT statement will not execute if both are terminated by semi-colons.
===========================
*/

DECLARE @database_name VARCHAR(50) = 'database1'
DECLARE @data_file VARCHAR(250) = 'C:\temp\AdventureWorks_Data.mdf'
DECLARE @log_file VARCHAR(250) = 'C:\temp\AdventureWorks_Log.ldf'

USE [@database_name]

GO

BEGIN TRY

	BEGIN TRANSACTION TRANSACTION1

		UPDATE
		dbo.Config

		SET
		Value = 'yyyymmdd - Date'

		WHERE
		DESCRIPTION = 'Automatic Trading Name Format'

	COMMIT TRANSACTION TRANSACTION1

	PRINT 'Automatic trading name format set to "yyyymmdd - Date"'

END TRY

BEGIN CATCH

  IF (@@TRANCOUNT > 0)

   BEGIN
	ROLLBACK TRANSACTION TRANSACTION1
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