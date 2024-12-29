function Get-M365CopilotCommand {
    [CmdletBinding(DefaultParameterSetName = 'Name')]
    param (
        [Parameter(ParameterSetName = 'Name', Position = 0)]
        [string[]]$Name = $script:M365CopilotCommand.Keys,

        [Parameter(Mandatory = $true, ParameterSetName = 'ModuleName', Position = 0)]
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

    # Check, if all required modules are installed and imported
    $requiredModules = $Name | ForEach-Object { $script:M365CopilotCommand[$_].ModuleName } | Select-Object -Unique
    $requiredModules | ForEach-Object {
        if ((Get-Module -Name $_ -ListAvailable).count -eq 0) {
            throw "The module '$_' is required for the command(s) '$Name'. Please install the dependencies using 'Update-M365CopilotDependencies' and try again."
        }

        # Import the module
        if ((Get-Module -Name $_).count -eq 0) {
            Import-Module -Name $_ -WarningAction SilentlyContinue
        }
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
    $commandContent
}