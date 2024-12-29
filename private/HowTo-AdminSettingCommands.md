# Sources for the Dependencies .psd1 files

Create one file per source module, with the same name as the module, but with the extension .psd1. The file should be placed in the /M3665Copilot.PSTools/internal/scripts/Dependencies folder.

The following documentations are used as sources for the files. The goal is to have a full list of all relevant Microsoft 365 PowerShell commands to manage Microsoft 365 Copilot settings.

The following sources have been identified:

- [Microsoft 365 PowerShell documentation](https://learn.microsoft.com/en-us/copilot/microsoft-365/)
- [Microsoft 365 Copilot extensibility documentation](https://learn.microsoft.com/en-us/microsoft-365-copilot/extensibility/)

Additionally, some specific documentations are used to get the commands for specific settings:

- [SPO: Create an organization assets library](https://learn.microsoft.com/en-us/sharepoint/organization-assets-library)
- [SPO: Manage trial access to SharePoint agents with PowerShell](https://learn.microsoft.com/en-us/sharepoint/manage-trial-agents-sharepoint-powershell)
- [Graph: Microsoft Graph Connector overview](https://learn.microsoft.com/en-us/graph/connecting-external-content-connectors-overview)

To search through each documentation quickly, click the "Download PDF" button on the bottom left of the page, and then use the search function in the PDF viewer with the keyword "PowerShell".

The following steps should be followed to create the .psd1 files:

1. Open the documentation PDF file.
2. Search for the keyword "PowerShell".
3. Copy the relevant commands.
4. Paste the commands into the .psd1 file.
5. Save the file in the /M3665Copilot.PSTools/internal/scripts/Dependencies folder.

The module will update itself based on the content of the .psd1 files.
