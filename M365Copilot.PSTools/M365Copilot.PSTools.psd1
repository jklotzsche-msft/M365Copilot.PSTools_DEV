﻿@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'M365Copilot.PSTools.psm1'

    # Version number of this module.
    ModuleVersion     = '1.0.0'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = '501ed559-7410-4b87-99ed-1dbdaec21cba'

    # Author of this module
    Author            = 'jklotzsche'

    # Company or vendor of this module
    CompanyName       = ''

    # Copyright statement for this module
    Copyright         = '(c) jklotzsche. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'M365Copilot.PSTools is a PowerShell module that simplifies and enhances the administration of Microsoft 365 Copilot. It provides tools to streamline tasks, making it easier for administrators and developers to manage and optimize your Microsoft 365 Copilot experience.'

    # Minimum version of the PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # ClrVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        # Admin Setting Commands
        'Get-M365CopilotCommand', # list relevant commands for Microsoft 365 Copilot (original command + additional property to show, if the related module is installed)
        'Get-M365CopilotHelp', # get help for relevant commands for Microsoft 365 Copilot (original help + additional property for description, how the command is relevant for Microsoft 365 Copilot)
        'New-M365CopilotPSToolsIssue', # create a new issue on GitHub for a command for Microsoft 365 Copilot. This can be used to report news about a command or suggest a new command for the next version of the M365Copilot.PSTools module.
        'Get-M365CopilotModule', # list relevant modules for Microsoft 365 Copilot (original module + additional property to show, if the module is installed)
        'Install-M365CopilotModule', # install all modules for Microsoft 365 Copilot
        'Uninstall-M365CopilotModule', # uninstall all modules for Microsoft 365 Copilot
        'Update-M365CopilotModule' # update all modules for Microsoft 365 Copilot
        
        # Copilot Activity API Commands

        # Extensibility: Graph Connector Commands

        # Extensibility: Declarative Agent Commands
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    # CmdletsToExport = '*'

    # Variables to export from this module
    # VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    # AliasesToExport = '*'

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @()

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

            # Prerelease string of this module
            # Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            # RequireLicenseAcceptance = $false

            # External dependent modules of this module
            # ExternalModuleDependencies = @()

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}
