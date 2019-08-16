/*
Script to set Infinity RMS Cash Balancing trading day name format setting.
This can also be done via the GUI, but has been scripted for a mass deployment scenario. 
This script will set the format as "yyyymmdd - date". 
*/

USE [AKPOS]

GO



BEGIN TRY

	BEGIN TRANSACTION AUTOTRADINGFORMAT 

		UPDATE
		dbo.Config

		SET
		Value = 'yyyymmdd - Date'

		WHERE
		DESCRIPTION = 'Automatic Trading Name Format'

	COMMIT TRANSACTION AUTOTRADINGFORMAT

	PRINT 'Automatic trading name format set to "yyyymmdd - Date"'	

END TRY	



BEGIN CATCH 

  IF (@@TRANCOUNT > 0)

   BEGIN

      ROLLBACK TRANSACTION AUTOTRADINGFORMAT
   
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