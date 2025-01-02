function Get-M365CopilotHelp {
    <#
    .SYNOPSIS
    Retrieves help content for specified M365Copilot commands with additional custom properties.

    .DESCRIPTION
    The Get-M365CopilotHelp function retrieves help content for specified M365Copilot commands. 
    It supports retrieving help by command name or by module name. The function also adds custom properties 
    to the help content based on the M365Copilot command metadata.

    .PARAMETER Name
    Specifies the name(s) of the M365Copilot commands to retrieve help for. Wildcards are supported. 
    If not specified, all command names from the M365CopilotCommand script variable are used.

    .PARAMETER Module
    Specifies the module name to filter the M365Copilot commands. This parameter is mandatory when using the 'ModuleName' parameter set.

    .EXAMPLE
    Get-M365CopilotHelp
    Retrieves all M365Copilot help content.

    .EXAMPLE
    Get-M365CopilotHelp -Name 'Get-*'
    Retrieves help content for all M365Copilot commands that start with 'Get-'.

    .EXAMPLE
    Get-M365CopilotHelp -Module 'ExchangeOnlineManagement'
    Retrieves help content for all M365Copilot commands in the 'ExchangeOnlineManagement' module.
    #>
    [CmdletBinding(DefaultParameterSetName = 'Name')]
    param (
        [Parameter(ParameterSetName = 'Name', Position = 0)]
        [ArgumentCompleter({ $M365CopilotCommands })]
        [string[]]$Name = $M365CopilotCommands,

        [Parameter(Mandatory = $true, ParameterSetName = 'ModuleName', Position = 0)]
        [ArgumentCompleter({ $M365CopilotModules })]
        [string]$Module
    )

    # Check, if the command name contains wildcards
    if ($null -ne $Name -and $Name -match '\*|\?') {
        $Name = $script:M365CopilotCommand.Keys | Where-Object { $_ -like $Name }
    }

    # Check, if the module name is specified and get the command name(s) for the specified module
    if ([string]::IsNullOrEmpty($Module) -eq $false) {
        $Name = $script:M365CopilotCommand.Keys | Where-Object { $script:M365CopilotCommand[$_].ModuleName -eq $Module }
    }

    # Get the help content for the specified command and add the custom properties
    $helpContent = @()
    $Name | ForEach-Object {
        $currentHelpContent = Get-Help -Name $_
        foreach ($customProp in ($script:M365CopilotCommand[$_].Keys)) {
            $currentHelpContent | Add-Member -MemberType NoteProperty -Name $customProp -Value $script:M365CopilotCommand[$_][$customProp] -Force
        }

        # Additionally, add the description and link to the default help content
        $currentHelpContent.Description = $currentHelpContent.Description + ("`n" + $script:M365CopilotCommand[$_].M365CopilotRelation)

        $helpContent += $currentHelpContent
    }

    # Output the help content
    $helpContent
}