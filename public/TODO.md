# Next steps to continue with this module

- [x] Add the next commands from the Copilot Documentation PDF. Continue at "Set-SPOTenant"
- [ ] MAJOR TASK: Make this module a "Copilot Admin GUI Tool", so non-technical users can work with the PowerShell Cmdlets without having to think about modules, versions, parameters etc. Just let them select the action they want to perform, ask for needed parameters and execute the command. This will be a great tool for Copilot Admins who are not familiar with PowerShell.
-- [ ] Remove the CopilotInteraction part, as this is to far away from the GUI tool idea + many customers are not allowed to look into this data
-- [ ] Remove the GraphConnector part, as this is something for real admins
-- [ ] no technical readiness scan, no agents, no nothing. Just the GUI tool for non-technical people, who must edit settings for Copilot based on our documentation.

``` PowerShell
<#
    Add CompatiblePSEditions to the manifest
#>
# Supported PSEditions
CompatiblePSEditions = @('Desktop') # import this module in Windows PowerShell compatibility mode only. Allows the module to be used in PS7 as well

<#
    Module handling

    - use RequiredVersion for all dependencies and update my module manually! Needed to prevent dependency hell.

    - Add two options to update the module itself:
        - Install modules in the background using Task Scheduler on every boot (non-interactive - updates done in the background)
        - Check module versions and ask the user to update it manually and restart PowerShell (interactive - user must wait)
            - Check the module version by comparing it with a public json file from my GitHub repository
#>

<#
    GUI elements

    main components
        - Show-Command
        - Out-GridView
#>

<#
    Shortcut

        - Ask the user to create a shortcut on the desktop and/or start menu like the Exchange Server PowerShell
            - Shortcut starts plain Windows PowerShell
            - then it will check a public json file for the current module version of the M365Copilot.PSTools module
                - if the file cannot be accessed, tell the user to make sure the module is up to date
            - if needed, it and it's dependencies will be updated
            - then the module will be imported
            - Banner with additional information, how to and where to get help
            - optional: "M365 Copilot Prompt of the week" from GitHub repo, if available
#>

<#
    PSFramework nutzen ;-)
    
    Error handling
        Stop-PSFFunction
#>
```
