param(
    [Parameter(Mandatory = $true)]
    [string]$location,

    [Parameter(Mandatory = $true)]
    [string]$resourceGroupName,

    [string]$owner,
    [string]$costCenter,
    [string]$application,
    [string]$description,
    [string]$repo
)

$tags = @{
    Owner       = $owner
    CostCenter  = $costCenter
    Application = $application
    Description = $description
    Repository  = $repo
}

try {
    Write-Host "Creating Azure Resource Group..."
    Write-Host "Location: $location"
    Write-Host "Resource Group Name: $resourceGroupName"

    $deployment = New-AzResourceGroup `
        -Name $resourceGroupName `
        -Location $location `
        -Tag $tags

    Write-Host "Resource Group created successfully."
    Write-Host $deployment
}
catch {
    Write-Host "Script failed."
    Write-Host $_.Exception.Message
    throw
}