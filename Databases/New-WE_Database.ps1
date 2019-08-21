[Cmdletbinding()]
Param (
    [String] $DatabaseName,
    [String] $DatabasePath,
    [String] $LogPath
)

Try {

    $Property = @{
        Status           = 'Successful'
        AttachedDatabase = $Database.NAME
    }

}

Catch {

    Write-Verbose "Unable to attach the database: $DatabaseName."
    $Property = @{
        Status           = 'Unsuccessful'
        AttachedDatabase = 'Null'
    }

}

Finally { }

CREATE DATABASE $DatabaseName
CONTAINMENT = NONE
ON  PRIMARY
( NAME = N'$(dbname)', FILENAME = N'D:\Data\$(dbname).mdf', SIZE = 65536KB , FILEGROWTH = 65536KB )
LOG ON
( NAME = N'$(dbname)_log', FILENAME = N'L:\Log\$(dbname)_log.ldf', SIZE = 65536KB , FILEGROWTH = 65536KB )
COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE $
(dbname)
Set-Variable COMPATIBILITY_LEVEL
= 120
GO
ALTER DATABASE $
(dbname)
Set-Variable ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable ANSI_NULLS OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable ANSI_PADDING OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable ANSI_WARNINGS OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable ARITHABORT OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable AUTO_CLOSE OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable AUTO_SHRINK OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE $
(dbname)
Set-Variable AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE $
(dbname)
Set-Variable CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE $
(dbname)
Set-Variable CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable  DISABLE_BROKER
GO
ALTER DATABASE $
(dbname)
Set-Variable AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable PARAMETERIZATION SIMPLE
GO
ALTER DATABASE $
(dbname)
Set-Variable READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE $
(dbname)
Set-Variable  READ_WRITE
GO
ALTER DATABASE $
(dbname)
Set-Variable RECOVERY SIMPLE
GO
ALTER DATABASE $
(dbname)
Set-Variable  MULTI_USER
GO
ALTER DATABASE $
(dbname)
Set-Variable PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE $
(dbname)
Set-Variable TARGET_RECOVERY_TIME
= 0 SECONDS
GO
ALTER DATABASE $
(dbname)
Set-Variable DELAYED_DURABILITY
= DISABLED
GO
USE $
(dbname)
GO
IF NOT EXISTS (Select-Object name
    FROM sys.filegroups
    Where-Object is_default=1 AND name = N'PRIMARY') ALTER DATABASE $
(dbname) MODIFY FILEGROUP [PRIMARY] DEFAULT
GO