@{
    RequiredPermission = 'SharePoint admin', 'Global admin'
    Commands           = @{
        # Restricted search allowed list
        'Add-SPOTenantRestrictedSearchAllowedList'    = @{
            M365CopilotRelation = 'Restricted SharePoint Search allows you to limit organization-wide search and Copilot experiences to specific SharePoint sites you choose. Users can still interact with files and content they own or have previously accessed in Copilot. The Add-SPOTenantRestrictedSearchAllowedList cmdlet adds URLs to the list of allowed sites for restricted searches.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#sharepoint-admin-task---restrict-sharepoint-search-rss'
        }
        'Get-SPOTenantRestrictedSearchAllowedList'    = @{
            M365CopilotRelation = 'Restricted SharePoint Search allows you to limit organization-wide search and Copilot experiences to specific SharePoint sites you choose. Users can still interact with files and content they own or have previously accessed in Copilot. The Get-SPOTenantRestrictedSearchAllowedList cmdlet retrieves the list of allowed sites for restricted searches.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#sharepoint-admin-task---restrict-sharepoint-search-rss'
        }
        'Remove-SPOTenantRestrictedSearchAllowedList' = @{
            M365CopilotRelation = 'Restricted SharePoint Search allows you to limit organization-wide search and Copilot experiences to specific SharePoint sites you choose. Users can still interact with files and content they own or have previously accessed in Copilot. The Remove-SPOTenantRestrictedSearchAllowedList cmdlet removes URLs from the list of allowed sites for restricted searches.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#sharepoint-admin-task---restrict-sharepoint-search-rss'
        }

        # Restricted search mode
        'Get-SPOTenantRestrictedSearchMode'           = @{
            M365CopilotRelation = 'Enable or disable the Restricted Search setting with the default being disabled. The first time when the setting is enabled the allow list is empty. The Get-SPOTenantRestrictedSearchMode cmdlet retrieves the current state of the Restricted Search setting.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#sharepoint-admin-task---restrict-sharepoint-search-rss'
        }
        'Set-SPOTenantRestrictedSearchMode'           = @{
            M365CopilotRelation = 'Enable or disable the Restricted Search setting with the default being disabled. The first time when the setting is enabled the allow list is empty. The Set-SPOTenantRestrictedSearchMode cmdlet enables or disables the Restricted Search setting.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#sharepoint-admin-task---restrict-sharepoint-search-rss'
        }

        # Sensitivity labels
        'Get-SPOTenant'                               = @{
            M365CopilotRelation = 'The Get-SPOTenant cmdlet retrieves the properties of the SharePoint Online organization, including the "EnableAIPIntegration" property, which enables support for sensitivity labels in SharePoint Online and OneDrive for Business.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#4-enable-sensitivity-labels-for-files-in-sharepoint-and-onedrive'
        }
        'Set-SPOTenant'                               = @{
            M365CopilotRelation = 'The Set-SPOTenant cmdlet sets the properties of the SharePoint Online organization, including the "EnableAIPIntegration" property, which enables support for sensitivity labels in SharePoint Online and OneDrive for Business.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#4-enable-sensitivity-labels-for-files-in-sharepoint-and-onedrive'
        }

        # Organization assets library
        'Add-SPOOrgAssetsLibrary'                     = @{
            M365CopilotRelation = 'The Add-SPOOrgAssetsLibrary cmdlet adds a SharePoint Online organization assets library to the organization. An organization assets library is a SharePoint Online document library that is automatically connected to Microsoft 365 apps and services, including Microsoft 365 Copilot, for all users in the organization.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/sharepoint/organization-assets-library'
        }
        'Get-SPOOrgAssetsLibrary'                     = @{
            M365CopilotRelation = 'The Get-SPOOrgAssetsLibrary cmdlet retrieves the SharePoint Online organization assets library for the organization. An organization assets library is a SharePoint Online document library that is automatically connected to Microsoft 365 apps and services, including Microsoft 365 Copilot, for all users in the organization.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/sharepoint/organization-assets-library'
        }
        'Remove-SPOOrgAssetsLibrary'                  = @{
            M365CopilotRelation = 'The Remove-SPOOrgAssetsLibrary cmdlet removes the SharePoint Online organization assets library from the organization. An organization assets library is a SharePoint Online document library that is automatically connected to Microsoft 365 apps and services, including Microsoft 365 Copilot, for all users in the organization.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/sharepoint/organization-assets-library'
        }
        'Set-SPOOrgAssetsLibrary'                     = @{
            M365CopilotRelation = 'The Set-SPOOrgAssetsLibrary cmdlet sets the SharePoint Online organization assets library for the organization. An organization assets library is a SharePoint Online document library that is automatically connected to Microsoft 365 apps and services, including Microsoft 365 Copilot, for all users in the organization.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/sharepoint/organization-assets-library'
        }

        # SharePoint Online Copilot Promotion
        'Get-SPOCopilotPromoOptInStatus'              = @{
            M365CopilotRelation = 'The Get-SPOCopilotPromoOptInStatus cmdlet retrieves the current status of the Microsoft 365 Copilot promotion opt-in setting for the organization. The promotion opt-in setting determines whether users in the organization are allowed to use SharePoint Agents without Copilot licenses.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/sharepoint/manage-trial-agents-sharepoint-powershell#what-you-need-to-prepare-for-the-trial-access'
        }
        'Set-SPOCopilotPromoOptInStatus'              = @{
            M365CopilotRelation = 'The Set-SPOCopilotPromoOptInStatus cmdlet sets the Microsoft 365 Copilot promotion opt-in setting for the organization. The promotion opt-in setting determines whether users in the organization are allowed to use SharePoint Agents without Copilot licenses.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/sharepoint/manage-trial-agents-sharepoint-powershell#what-you-need-to-prepare-for-the-trial-access'
        }
    }
}