# Internal > Scripts > Dependencies

Put in .psd1 files, containing information about relevant commands for Microsoft 365 Copilot.
The file name should be the same as the module name, e.g. 'MicrosoftTeams'.

The content should be as follows:

```PowerShell
@{
    'Get-CsTeamsMeetingPolicy' = @{
        M365CopilotRelation = 'To view the Copilot settings for your organization, use the Copilot parameter within the PowerShell Get-CsTeamsMeetingPolicy cmdlet.'
        M365CopilotLink = 'https://learn.microsoft.com/en-us/microsoftteams/copilot-teams-transcription#manage-copilot-using-powershell'
    }
    'Set-CsTeamsMeetingPolicy' = @{
        M365CopilotRelation = 'To manage how users in your org use Copilot in Teams meetings and events, use the Copilot parameter within the PowerShell Set-CsTeamsMeetingPolicy cmdlet.'
        M365CopilotLink = 'https://learn.microsoft.com/en-us/microsoftteams/copilot-teams-transcription#manage-copilot-using-powershell'
    },
    ...
}
```
