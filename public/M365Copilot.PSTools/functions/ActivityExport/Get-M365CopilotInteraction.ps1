function Get-M365CopilotInteraction {
    <#
    .SYNOPSIS
        Get M365 Copilot Interaction History for a User

    .DESCRIPTION
        Get M365 Copilot Interaction History for a User

    .PARAMETER UserId   
        The UserId of the user to get interaction history for.
    
    .EXAMPLE
        Get-M365CopilotInteraction -UserId "00000000-0000-0000-000000000000"

        Gets the interaction history for the user with the specified UserId.

    .NOTES
        This function requires the Microsoft.Graph.Authentication module.
        This function requires a login using application permissions and the 'AiEnterpriseInteraction.Read.All' scope.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$UserId,

        [string[]]$Property,

        [string]$Filter,

        [int]$Skip = 0,

        [switch]$All
    )

    # Verify, that the connection to Graph has been established using AppOnly permissions
    if ((Get-MgContext).AuthType -ne 'AppOnly') {
        # TODO: Add link to documentation on how to connect to Graph using AppOnly permissions and custom application permission.
        throw "This function requires a connection to Graph using application permissions. Please refer to the documentation for more information."
    }

    # Verify, that the required scope is granted
    if ((Get-MgContext).Scopes -notcontains 'AiEnterpriseInteraction.Read.All') {
        throw "This function requires the 'AiEnterpriseInteraction.Read.All' scope. Please refer to the documentation for more information."
    }

    #TODO: The Activity Export API requires application permissions. Therefore, a seperate application registration is needed. Must be added to documentation.
    $uri = "https://graph.microsoft.com/beta/copilot/users/$UserId/interactionHistory/getAllEnterpriseInteractions?`$skip=$Skip"

    # If Properties have been provided, add them to the uri
    if (-not [string]::IsNullOrEmpty($Properties)) {
        $uri += "&`$select=$($Properties -join ',')"
    }

    # If a Filter has been provided, add it to the uri
    if (-not [string]::IsNullOrEmpty($Filter)) {
        $uri += "&`$filter=$($Filter)"
    }

    # Access to Activity API 
    $apiResult = Invoke-MgGraphRequest -Method 'GET' -Uri $uri

    # If requested, get all results
    if ($All) {
        $result = [System.Collections.Generic.List[Object]]::new()
        $result.Add($apiResult.value)
        while ($null -ne $apiResult.'@odata.nextLink') {
            $apiResult = Invoke-MgGraphRequest -Method 'GET' -Uri $apiResult.'@odata.nextLink'
            $result.Add($apiResult.value)
        }
        # return the result
        $result
    }
    else {
        # return the single result
        $apiResult.value
    }
}