/*
This code should only be run if you plan to create a database for Sage 300.
Steps:
1. From the toolbar at the top, select [Query] > Enable [SQLCMD Mode]
2. Change :setvar dbname "..." to the name you'd like your database to have. Make sure it's enclosed in single quotes.
	E.g. :setvar dbname "DatabaseNameHere"
3. Save the file, CTRL+S is a good shortcut for this.
4. Next, execute the code by hitting F5 or the [! Execute] button in SQL Server Management Studio.
5. Refresh and Browse the databases to confirm the database was created.
*/

:setvar dbname "TEST" 


CREATE DATABASE $(dbname)
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'$(dbname)', FILENAME = N'D:\Data\$(dbname).mdf', SIZE = 65536KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'$(dbname)_log', FILENAME = N'L:\Log\$(dbname)_log.ldf', SIZE = 65536KB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE $(dbname) SET COMPATIBILITY_LEVEL = 120
GO
ALTER DATABASE $(dbname) SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE $(dbname) SET ANSI_NULLS OFF 
GO
ALTER DATABASE $(dbname) SET ANSI_PADDING OFF 
GO
ALTER DATABASE $(dbname) SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE $(dbname) SET ARITHABORT OFF 
GO
ALTER DATABASE $(dbname) SET AUTO_CLOSE OFF 
GO
ALTER DATABASE $(dbname) SET AUTO_SHRINK OFF 
GO
ALTER DATABASE $(dbname) SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE $(dbname) SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE $(dbname) SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE $(dbname) SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE $(dbname) SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE $(dbname) SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE $(dbname) SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE $(dbname) SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE $(dbname) SET  DISABLE_BROKER 
GO
ALTER DATABASE $(dbname) SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE $(dbname) SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE $(dbname) SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE $(dbname) SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE $(dbname) SET  READ_WRITE 
GO
ALTER DATABASE $(dbname) SET RECOVERY SIMPLE 
GO
ALTER DATABASE $(dbname) SET  MULTI_USER 
GO
ALTER DATABASE $(dbname) SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE $(dbname) SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE $(dbname) SET DELAYED_DURABILITY = DISABLED 
GO
USE $(dbname)
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE $(dbname) MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
