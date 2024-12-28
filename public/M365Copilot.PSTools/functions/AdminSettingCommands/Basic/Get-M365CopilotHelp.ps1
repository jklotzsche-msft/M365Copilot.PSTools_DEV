function Get-M365CopilotHelp {
    [CmdletBinding(DefaultParameterSetName = 'Name')]
    param (
        [Parameter(ParameterSetName = 'Name', Position = 0)]
        [string[]]$Name = $script:M365CopilotCommand.Keys,

        [Parameter(Mandatory = $true, ParameterSetName = 'ModuleName', Position = 0)]
        [string]$Module
    )

    # Check, if the command name contains wildcards
    if ($null -ne $Name -and $Name -match '\*|\?') {
        Write-Host "The command name contains wildcards." -ForegroundColor Green
        $Name = $script:M365CopilotCommand.Keys | Where-Object { $_ -like $Name }
    }

    # Check, if the module name is specified and get the command name(s) for the specified module
    if ([string]::IsNullOrEmpty($Module) -eq $false) {
        Write-Host "The module name is: $Module." -ForegroundColor Green
        $Name = $script:M365CopilotCommand.Keys | Where-Object { $script:M365CopilotCommand[$_].ModuleName -eq $Module }
    }

    Write-Host "The command name(s) are: $($Name -join ', ')." -ForegroundColor Green

    # Check, if all required modules are installed and imported
    $requiredModules = $Name | ForEach-Object { $script:M365CopilotCommand[$_].ModuleName } | Select-Object -Unique
    $requiredModules | ForEach-Object {
        if (-not (Get-Module -Name $_ -ListAvailable)) {
            throw "The module '$_' is required for the command(s) '$Name'. Please install the dependencies using 'Update-M365CopilotDependencies' and try again."
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