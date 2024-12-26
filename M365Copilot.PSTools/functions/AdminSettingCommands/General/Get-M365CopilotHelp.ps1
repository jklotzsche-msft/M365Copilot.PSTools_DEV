function Get-M365CopilotHelp {
    [CmdletBinding()]
    param (
        [ValidateScript({ $script:M365CopilotCommand.ContainsKey($_) })]
        [string[]]$Name = $script:M365CopilotCommand.Keys
    )

    # Check, if all required modules are installed and imported
    $requiredModules = $Name | ForEach-Object { $script:M365CopilotCommand[$_].ModuleName } | Select-Object -Unique
    $requiredModules | ForEach-Object {
        if (-not (Get-Module -Name $_ -ListAvailable)) {
            throw "The module '$_' is required for the command(s) '$Name'. Please install the module and try again."
        }

        # Import the module
        if (-not (Get-Module -Name $_)) {
            Import-Module -Name $_ -WarningAction SilentlyContinue
        }
    }

    # Get the help content for the specified command and add the custom properties
    $helpContent = @()
    $Name | ForEach-Object {
        $currentHelpContent = Get-Help -Name $_
        foreach ($customProp in ($script:M365CopilotCommand[$_].Keys)) {
            $currentHelpContent | Add-Member -MemberType NoteProperty -Name $customProp -Value $script:M365CopilotCommand[$_][$customProp] -Force
        }
        $helpContent += $currentHelpContent
    }

    # Output the help content
    $helpContent
}