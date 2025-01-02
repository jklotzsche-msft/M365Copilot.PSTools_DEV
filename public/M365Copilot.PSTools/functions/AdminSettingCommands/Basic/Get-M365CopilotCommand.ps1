function Get-M365CopilotCommand {
    <#
    .SYNOPSIS
    Retrieves M365 Copilot command information based on command name or module name.

    .DESCRIPTION
    The Get-M365CopilotCommand function retrieves information about M365 Copilot commands. 
    It allows you to filter commands by their name or by the module they belong to. 
    The function also adds custom properties to the command information based on the script-scoped variable $script:M365CopilotCommand.

    .PARAMETER Name
    Specifies the name(s) of the command(s) to retrieve. Wildcards are supported. 
    If not specified, all command names from $script:M365CopilotCommand.Keys are used.

    .PARAMETER Module
    Specifies the module name to filter the commands. This parameter is mandatory when using the 'ModuleName' parameter set.

    .EXAMPLE
    Get-M365CopilotCommand
    Retrieves all M365 Copilot commands.

    .EXAMPLE
    Get-M365CopilotCommand -Name 'Get-*'
    Retrieves all M365 Copilot commands that start with 'Get-'.

    .EXAMPLE
    Get-M365CopilotCommand -Module 'ExchangeOnlineManagement'
    Retrieves all M365 Copilot commands that belong to the 'ExchangeOnlineManagement' module.
    #>
    [CmdletBinding(DefaultParameterSetName = 'Name')]
    param (
        [Parameter(ParameterSetName = 'Name', Position = 0)]
        [ArgumentCompleter({ $M365CopilotCommands })]
        [string[]]$Name = $M365CopilotCommands,

        [Parameter(Mandatory = $true, ParameterSetName = 'ModuleName', Position = 0)]
        [ArgumentCompleter({ $M365CopilotModules })]
        [string]$Module,

        [switch]$ShowWindow
    )

    # Check, if the command name contains wildcards
    if ($null -ne $Name -and $Name -match '\*|\?') {
        $Name = $script:M365CopilotCommand.Keys | Where-Object { $_ -like $Name }
    }

    # Check, if the module name is specified and get the command name(s) for the specified module
    if ([string]::IsNullOrEmpty($Module) -eq $false) {
        $Name = $script:M365CopilotCommand.Keys | Where-Object { $script:M365CopilotCommand[$_].ModuleName -eq $Module }
    }

    # Get the command content for the specified command and add the custom properties
    $commandContent = @()
    $Name | ForEach-Object {
        $currentCommandContent = Get-Command -Name $_
        foreach ($customProp in ($script:M365CopilotCommand[$_].Keys)) {
            $currentCommandContent | Add-Member -MemberType NoteProperty -Name $customProp -Value $script:M365CopilotCommand[$_][$customProp] -Force
        }
        $commandContent += $currentCommandContent
    }

    # Output the command content
    if ($ShowWindow) {
        $commandContent | Select-Object -Property Name, Module, Version, M365CopilotRelation, M365CopilotLink | Out-GridView -Title "M365 Copilot Commands" -PassThru
        return
    }

    $commandContent
}