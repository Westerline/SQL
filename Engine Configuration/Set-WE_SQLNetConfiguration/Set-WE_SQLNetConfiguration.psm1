Function Set-WE_SQLNetConfiguration {

    <#

    .SYNOPSIS
        Synopsis here

    .DESCRIPTION
        Configures the TCP, Named Pipes, and Shared Memory protocols for SQL Server.
        In SQL Server 2012 and 2014 is there’s no longer a need to manually reference the SQL Server assemblies to use SMO
        because they’re automatically loaded when the SQLPS module is imported. If you're using SQL Server 2008, you can try adding the following lines after "Import-Module -Name sqlps"
            -$Assembly_SMO = [reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
            -$Assembly_WMIManagement = [reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement")

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
            -Modified from the original script available at https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/dd206997(v=sql.105)
        To Do:
            -Add 32-bit support
        Misc:
            -Requires RunasAdmin
            -Requires SQL Server 2012 or higher.

    .Example
        -------------------------- EXAMPLE 1 --------------------------

        C:\PS>WE_ModuleTemplate

        Description

        -----------

        Insert here.

    #>

    [CmdletBinding(SupportsShouldProcess)]

    Param (

        [Parameter(Mandatory = $False,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
            HelpMessage = "Help. Message. Here.",
            Position = 0)]
        [ValidateNotNullOrEmpty()]
        $InstanceName = 'MSSQLSERVER',

        [Parameter(Mandatory = $False)]
        [Switch]
        $Force,

        [Switch]
        $TCPSetting,

        [Switch]
        $NPSetting

    )

    Begin {

        $StartErrorActionPreference = $ErrorActionPreference

    }

    Process {

        Try {

            $ErrorActionPreference = 'Stop'
            Import-Module "sqlps" -DisableNamechecking
            $WMI = New-Object -TypeName ('Microsoft.SqlServer.Management.Smo.' + 'Wmi.ManagedComputer')
            $URI_TCP = "ManagedComputer[@Name='$Env:COMPUTERNAME']/ ServerInstance[@Name='$InstanceName']/ServerProtocol[@Name='TCP']"
            $TCP = $WMI.GetSmoObject("$URI_TCP")
            $TCP.IsEnabled = $TCPSetting
            $TCP.Alter()
            $URI_NP = "ManagedComputer[@Name='$Env:COMPUTERNAME']/ ServerInstance[@Name='$InstanceName']/ServerProtocol[@Name='NP']"
            $NP = $WMI.GetSmoObject("$URI_NP")
            $NP.IsEnabled = $NPSetting
            $NP.Alter()
            Restart-Service -Name MSSQLSERVER -Force:$Force
            $ErrorActionPreference = $StartErrorActionPreference
            $Property = @{
                TCPSetting = $TCP.IsEnabled
                NPSetting  = $NP.IsEnabled
            }

        }


        Catch {

            Write-Verbose "Unable to configure the network protocol settings for SQL Server. Ensure the computername matches the name of the SQL server, and that the instance name is correct."
            $Property = @{
                TCPSetting = $TCP.IsEnabled
                NPSetting  = $NP.IsEnabled
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