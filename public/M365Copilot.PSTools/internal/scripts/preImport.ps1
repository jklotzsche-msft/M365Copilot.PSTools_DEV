# Motify user, that the module import routine starts now
Write-Host "Importing module 'M365Copilot.PSTools'. Please wait for the import routine to finish..." -ForegroundColor Cyan

# This module is supported on Windows only.
# The reason is, that some modules (e.g. Microsoft.Online.SharePoint.PowerShell) are not supported on Linux.
# Therefore, we will check the OS and only import the module if it is Windows.

# Check, if this is executed on Windows PowerShell or PowerShell
if ($PSVersionTable.PSVersion.Major -gt 5) {
    throw "This module is supported on Windows PowerShell only."

    # add more checks for PowerShell here, if needed
}
else {
    # add more checks for Windows PowerShell here, if needed
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

# Check, if there are new versions of this module or any of he dependencies available and update the module and dependencies automatically
$modulesToCheck = $dependencyFiles.Name.replace(".psd1", "") + 'M365Copilot.PSTools'
$moduleUpdated = $false
foreach ($moduleToCheck in $modulesToCheck) {
    [System.Version]$currentModuleVersion = (Get-Module -Name $moduleToCheck -ListAvailable | Sort-Object -Property Version -Descending | Select-Object -First 1).Version
    [System.Version]$latestModuleVersion = (Find-Module -Name $moduleToCheck).Version

    if ($currentModuleVersion -lt $latestModuleVersion) {
        # Prepare parameters to update and/or install the module
        $moduleInstallProps = @{
            Name            = $moduleToCheck
            RequiredVersion = $latestModuleVersion
            Scope           = 'AllUsers'
            Force           = $true
            ErrorAction     = 'Stop'
            WarningAction   = 'Stop'
        }

        # Check, if PowerShell is in elevated mode. If not, install the module for the current user only
        if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
            $moduleInstallProps.Scope = 'CurrentUser'
        }

        # Update the module
        Write-Warning "The module '$moduleToCheck' is outdated. The currently installed version is '$currentModuleVersion' and the latest available version is '$latestModuleVersion'. Updating the module..."
        try {
            $null = Update-Module @moduleInstallProps
            $moduleUpdated = $true
        }
        catch {
            # An error occurred while updating the module. Try to install the new version side-by-side the current version
            Write-Warning "An error occurred while updating the module '$moduleToCheck'. Trying to install the new version side-by-side the currently installed version..."
            try {
                $null = Install-Module @moduleInstallProps
                $moduleUpdated = $true
            }
            catch {
                Write-Error "An error occurred while installing the new version of the module '$moduleToCheck'. Please update the module manually. You can still use this module, but some commands might not work as expected."
            }
        }
    }
}

# Check, if the module was updated and reload the module
if ($moduleUpdated) {
    Write-Warning "At least one module was updated during module import. Please restart Windows PowerShell and run the command again."
    return
}

# Import all dependencies
foreach ($moduleToCheck in $modulesToCheck) {
    Write-Host "Importing module '$moduleToCheck'..." -NoNewline
    $moduleToImport = Get-Module -Name $moduleToCheck -ListAvailable | Sort-Object -Property Version -Descending | Select-Object -First 1
    try {
        $null = Import-Module -Name $moduleToImport -DisableNameChecking -WarningAction SilentlyContinue 
        Write-Host "OK" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed" -ForegroundColor Red
        Write-Error "An error occurred while importing the module '$moduleToCheck'. Please try to import the module manually."
    }
}

# Notify user, that the module import routine has finished
Write-Host "Import routine of module 'M365Copilot.PSTools' has finished." -ForegroundColor Cyan