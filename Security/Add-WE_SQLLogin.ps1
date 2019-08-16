<#
To do: add user and password parameter used to connect to instance. Fixed input for Role parameter. Add user/pass and loginname/loginpass parameters.
#>

Param(
    [String] $User,
    [String] $Password,
    [String] $LoginName,
    [String] $LoginPassword,
    [String] $Role,
    [String] $HostName = 'LocalHost'
)

Begin { }

Process {
    Try {
        Invoke-Sqlcmd -HostName $HostName -Query "CREATE LOGIN $LoginName WITH PASSWORD = '$LoginPassword';"
        Invoke-Sqlcmd -HostName $HostName -Query "EXEC master..sp_addsrvrolemember @loginame = N'$LoginName', @rolename = N'$Role';"
        $Login = Invoke-Sqlcmd -Query "SELECT * FROM MASTER.SYS.SERVER_PRINCIPALS WHERE NAME = '$LoginName'"
        $Property = @{
            Status              = 'Success'
            Name                = $Login.name
            Type                = $Login.type
            CreateDate          = $Login.create_date
            DefaultDatabaseName = $Login.default_database_name
        }
    }

    Catch {
        $Property = @{
            Status              = 'Unsuccessful'
            Name                = $Login.name
            Type                = $Login.type
            CreateDate          = $Login.create_date
            DefaultDatabaseName = $Login.default_database_name
        }
    }

    Finally {
        $Object = New-Object -TypeName PSObject -Property $Property
        Write-Output $Object
    }
}

End { }