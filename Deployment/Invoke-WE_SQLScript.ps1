Function Invoke-WE_SQLScript {

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
            -
        Misc:
            -

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
            ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('HostName')]
        [String[]] $ComputerName = 'LocalHost',

        [Parameter(Mandatory = $False,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String] $ServerInstance = '.',

        [Parameter(Mandatory = $False,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
        [String] $Database,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
        [String] $SQLScriptPath

    )

    Begin {

        $StartErrorActionPreference = $ErrorActionPreference

    }

    Process {

        Foreach ($Computer in $ComputerName) {

            Try {

                $ScriptResults = Invoke-Sqlcmd -ServerInstance $ServerInstance -HostName $Computer -Database $Database -InputFile $SQLScriptPath -ErrorAction Stop | Tee-Object
                $ErrorActionPreference = $StartErrorActionPreference
                $Property = @{
                    Hostname      = $Computer
                    Database      = $Database
                    Status        = 'Connected'
                    ScriptResults = $ScriptResults
                }

            }

            Catch {

                Write-Verbose "Unable to run SQL Script $SQlScriptPath on $Computer. Please check that the computer is available on the network and that the PowerShell script policy allows for scripts."

                $Property = @{
                    Hostname      = $Computer
                    Database      = 'NULL'
                    Status        = 'Disconnected'
                    ScriptResults = 'NULL'
                }

            }


            Finally {

                $Object = New-Object -TypeName psobject -Property $Property
                Write-Output $Object

            }

        }

    }

    End {

        $ErrorActionPreference = $StartErrorActionPreference

    }

}