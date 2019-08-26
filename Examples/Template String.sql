/*
Credit to John Saunders via Stack Overflow for his example:
https://stackoverflow.com/questions/727788/how-to-use-a-variable-for-the-database-name-in-t-sql/727815
*/

DECLARE @DBNAME VARCHAR(255)
SET @DBNAME = 'TestDB'

DECLARE @CREATE_TEMPLATE VARCHAR(MAX)
DECLARE @COMPAT_TEMPLATE VARCHAR(MAX)
DECLARE @RECOVERY_TEMPLATE VARCHAR(MAX)

SET @CREATE_TEMPLATE = 'CREATE DATABASE {DBNAME}'
SET @COMPAT_TEMPLATE='ALTER DATABASE {DBNAME} SET COMPATIBILITY_LEVEL = 90'
SET @RECOVERY_TEMPLATE='ALTER DATABASE {DBNAME} SET RECOVERY SIMPLE'

DECLARE @SQL_SCRIPT VARCHAR(MAX)

SET @SQL_SCRIPT = REPLACE(@CREATE_TEMPLATE, '{DBNAME}', @DBNAME)
EXECUTE (@SQL_SCRIPT)

SET @SQL_SCRIPT = REPLACE(@COMPAT_TEMPLATE, '{DBNAME}', @DBNAME)
EXECUTE (@SQL_SCRIPT)

SET @SQL_SCRIPT = REPLACE(@RECOVERY_TEMPLATE, '{DBNAME}', @DBNAME)
EXECUTE (@SQL_SCRIPT)