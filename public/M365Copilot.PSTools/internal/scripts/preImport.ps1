# Motify user, that the module import routine starts now
Write-Host "Importing module 'M365Copilot.PSTools'. Please wait for the import routine to finish..." -ForegroundColor Cyan

# This module is supported on Windows PowerShell on Windows only.
# The reason is, that some modules (e.g. Microsoft.Online.SharePoint.PowerShell) are not supported on other platforms or PowerShell editions.
# Therefore, we will check the OS and only import the module if it is Windows.
if ($PSVersionTable.PSVersion.Major -gt 5) {
    throw "This module is supported on Windows PowerShell only."
}

# Check, if there is a new version of this module available. If yes, notify the user.
$latestVersion = Find-Module -Name M365Copilot.PSTools -Repository PSGallery | Select-Object -ExpandProperty Version
if ($null -ne $latestVersion) {
    $currentVersion = (Get-Module -Name M365Copilot.PSTools | Sort-Object -Property Version -Descending | Select-Object -First 1).Version
    if ($currentVersion -lt $latestVersion) {
        Write-Warning "A new version of the module 'M365Copilot.PSTools' is available. Please update the module to version $latestVersion using 'Update-Module -Name M365Copilot.PSTools'."
    }
}

# Get the dependencies
$script:M365CopilotCommand = @{}
$dependencyFiles = Get-ChildItem -Path "$PSScriptRoot\Dependencies" -Filter *.psd1 -File -Recurse | Sort-Object -Property Name
foreach ($file in $dependencyFiles) {
    $configuration = Import-PowerShellDataFile -Path $file.FullName
    if ($null -ne $configuration.Module) {
        # We want to use all commands from the current module
        Get-Command -Module $file.BaseName | Select-Object -ExpandProperty Name | ForEach-Object {
            $commandName = $_
            $commandData = $configuration.Module.Clone()
            $commandData.ModuleName = $file.BaseName
            $commandData.RequiredPermission = $configuration.RequiredPermission

            # Add the command data to the M365CopilotCommand variable
            $script:M365CopilotCommand[$commandName] = $commandData.Clone()
        }
    }

    if ($null -ne $configuration.Commands) {
        # We want to use a few commands from the current module only
        $configuration.Commands.GetEnumerator() | ForEach-Object {
            $commandName = $_.Key
            $commandData = $_.Value.Clone()
            $commandData.ModuleName = $file.BaseName
            $commandData.RequiredPermission = $configuration.RequiredPermission
    
            # Add the command data to the M365CopilotCommand variable
            $script:M365CopilotCommand[$commandName] = $commandData.Clone()
        }
    }
}

# Create public, statis enums for autocompletion and user to view
New-Variable -Name M365CopilotCommands -Value ($script:M365CopilotCommand.Keys | Sort-Object -Unique) -Scope Global -Option Constant
New-Variable -Name M365CopilotModules -Value ($script:M365CopilotCommand.Values.ModuleName | Sort-Object -Unique) -Scope Global -Option Constant

# Notify user, that the module import routine has finished
Write-Host "Import routine of module 'M365Copilot.PSTools' has finished." -ForegroundColor Cyan