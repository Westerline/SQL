[Cmdletbinding()]
Param (
    [String] $DatabaseName,
    [String] $DatabasePath,
    [String] $LogPath
)

Try {
    Invoke-Sqlcmd -Query "CREATE DATABASE $DatabaseName ON (FILENAME = '$DatabasePath'), (FILENAME = '$LogPath') FOR ATTACH;"
    $Database = Invoke-Sqlcmd -Query "SELECT NAME FROM MASTER.SYS.DATABASES WHERE NAME = '$DatabaseName'"
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