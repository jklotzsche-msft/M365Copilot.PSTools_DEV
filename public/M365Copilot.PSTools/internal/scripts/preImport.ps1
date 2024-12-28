# This module is supported on Windows only.
# The reason is, that some modules (e.g. Microsoft.Online.SharePoint.PowerShell) are not supported on Linux.
# Therefore, we will check the OS and only import the module if it is Windows.

# Check, if this is executed on Windows PowerShell or PowerShell
if ($PSVersionTable.PSVersion.Major -gt 5) {
    # Check, if the OS is Windows
    if (-not $IsWindows) {
        throw "This module is supported on Windows only. Please use Windows PowerShell or PowerShell on Windows."
    }

    # add more checks for PowerShell here, if needed
}
else {
    # add more checks for Windows PowerShell here, if needed
}

# Import the AdminSettingCommands
$script:M365CopilotCommand = @{}
foreach ($file in (Get-ChildItem -Path "$PSScriptRoot\AdminSettingCommands" -Filter *.psd1)) {
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

#TODO: Check, if there are new versions of this module or any dependencies available and ask the user if they want to update the module(s).
