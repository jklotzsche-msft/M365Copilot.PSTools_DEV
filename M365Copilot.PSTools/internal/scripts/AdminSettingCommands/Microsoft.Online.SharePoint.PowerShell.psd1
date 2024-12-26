@{
    RequiredPermission = 'SharePoint admin', 'Global admin'
    Commands           = @{
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
    
        'Get-SPOTenantRestrictedSearchMode'           = @{
            M365CopilotRelation = 'Enable or disable the Restricted Search setting with the default being disabled. The first time when the setting is enabled the allow list is empty. The Get-SPOTenantRestrictedSearchMode cmdlet retrieves the current state of the Restricted Search setting.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#sharepoint-admin-task---restrict-sharepoint-search-rss'
        }
        'Set-SPOTenantRestrictedSearchMode'           = @{
            M365CopilotRelation = 'Enable or disable the Restricted Search setting with the default being disabled. The first time when the setting is enabled the allow list is empty. The Set-SPOTenantRestrictedSearchMode cmdlet enables or disables the Restricted Search setting.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#sharepoint-admin-task---restrict-sharepoint-search-rss'
        }

        'Get-SPOTenant'                               = @{
            M365CopilotRelation = 'The Get-SPOTenant cmdlet retrieves the properties of the SharePoint Online organization, including the "EnableAIPIntegration" property, which enables support for sensitivity labels in SharePoint Online and OneDrive for Business.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#4-enable-sensitivity-labels-for-files-in-sharepoint-and-onedrive'
        }
        'Set-SPOTenant'                               = @{
            M365CopilotRelation = 'The Set-SPOTenant cmdlet sets the properties of the SharePoint Online organization, including the "EnableAIPIntegration" property, which enables support for sensitivity labels in SharePoint Online and OneDrive for Business.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-e5-guide#4-enable-sensitivity-labels-for-files-in-sharepoint-and-onedrive'
        }
    }
}