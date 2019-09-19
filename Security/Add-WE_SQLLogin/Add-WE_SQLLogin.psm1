Function Add-WE_SQLLogin.ps1 {

    <#

    .SYNOPSIS
        Synopsis here

    .DESCRIPTION
        Command description here.

    .PARAMETER
        -ParameterName [<String[]>]
            Parameter description here.

            Required?                    true
            Position?                    named
            Default value                None
            Accept pipeline input?       false
            Accept wildcard characters?  false

        <CommonParameters>
            This cmdlet supports the common parameters: Verbose, Debug,
            ErrorAction, ErrorVariable, WarningAction, WarningVariable,
            OutBuffer, PipelineVariable, and OutVariable. For more information, see
            about_CommonParameters (https:/go.microsoft.com/fwlink/?LinkID=113216).

    .INPUTS
        System.String[]
            Input description here.

    .OUTPUTS
        System.Management.Automation.PSCustomObject

    .NOTES
        Version: 1.0
        Author(s): Wesley Esterline
        Resources:
            -
        To Do:
            -Add user and password parameter used to connect to instance.
            -Fixed input for Role parameter.
            -Add user/pass and loginname/loginpass parameters.
        Misc:
            -

    .Example
        -------------------------- EXAMPLE 1 --------------------------

        C:\PS>WE_ModuleTemplate

        Description

        -----------

        Insert here.

    #>

    [Cmdletbinding(SupportsShouldProcess)]

    Param(

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
        [Alias('UserName')]
        [String] $LoginName,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
        [String] $LoginPassword,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
        [Parameter(Mandatory = $True)]
        [String] $Role,

        [Parameter(Mandatory = $False)]
        [ValidateNotNullOrEmpty]
        [Alias('ComputerName')]
        [String] $HostName = 'LocalHost'

    )

    Begin {

        $StartErrorActionPreference = $ErrorActionPreference

    }

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

            Write-Verbose "Unable to create login $LoginName on $HostName. PLease ensure the user you're connecting as has permissions to create a new login."

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

    End {

        $ErrorActionPreference = $StartErrorActionPreference

    }

}