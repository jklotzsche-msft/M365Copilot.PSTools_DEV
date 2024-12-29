@{
    RequiredPermission = 'Exchange admin', 'Global admin'
    Commands           = @{
        # Viva module feature policy
        'Add-VivaModuleFeaturePolicy'     = @{
            M365CopilotRelation = 'The VivaModuleFeaturePolicy cmdlets enable administrators to control access to the Microsoft Copilot Dashboard. You can use the Microsoft365 admin center or PowerShell to manage how users in your org use the Microsoft Copilot Dashboard.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/viva/insights/advanced/admin/manage-settings-copilot-dashboard#remove-access-to-the-dashboard-for-the-entire-tenant-with-powershell'
        }
        'Get-VivaModuleFeaturePolicy'     = @{
            M365CopilotRelation = 'The VivaModuleFeaturePolicy cmdlets enable administrators to control access to the Microsoft Copilot Dashboard. You can use the Microsoft365 admin center or PowerShell to manage how users in your org use the Microsoft Copilot Dashboard.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/viva/insights/advanced/admin/manage-settings-copilot-dashboard#remove-access-to-the-dashboard-for-the-entire-tenant-with-powershell'
        }
        'Remove-VivaModuleFeaturePolicy'  = @{
            M365CopilotRelation = 'The VivaModuleFeaturePolicy cmdlets enable administrators to control access to the Microsoft Copilot Dashboard. You can use the Microsoft365 admin center or PowerShell to manage how users in your org use the Microsoft Copilot Dashboard.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/viva/insights/advanced/admin/manage-settings-copilot-dashboard#remove-access-to-the-dashboard-for-the-entire-tenant-with-powershell'
        }
        'Update-VivaModuleFeaturePolicy'  = @{
            M365CopilotRelation = 'The VivaModuleFeaturePolicy cmdlets enable administrators to control access to the Microsoft Copilot Dashboard. You can use the Microsoft365 admin center or PowerShell to manage how users in your org use the Microsoft Copilot Dashboard.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/viva/insights/advanced/admin/manage-settings-copilot-dashboard#remove-access-to-the-dashboard-for-the-entire-tenant-with-powershell'
        }

        # Viva module feature enablement
        'Get-VivaModuleFeatureEnablement' = @{
            M365CopilotRelation = 'Use the Get-VivaModuleFeatureEnablement cmdlet to view whether or not a feature in a Viva module is enabled for a specific user or group. Whether or not the feature is enabled is referred to as the features "enablement state".'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/viva/goals/copilot-intro#configure-access-to-copilot-by-using-vfam-powershell-cmdlets'
        }
    }
}