@{
    RequiredPermission = 'Global admin' # TODO: Add least permissions needed for getting users
    Commands           = @{
        # Teams meeting policy
        'Get-MgUser' = @{
            M365CopilotRelation = 'This command enables you to get a list of users from the Microsoft 365 service. This is required to export the Activity Data from certain users by their ObjectId.'
            M365CopilotLink     = 'https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/get-mguser'
        }
    }
}