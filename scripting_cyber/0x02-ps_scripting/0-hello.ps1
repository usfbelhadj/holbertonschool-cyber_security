# PowerShell Script

# Display Hello message in Cyan
Write-Host "Hello, PowerShell!" -ForegroundColor Cyan

# Create and display name
$name = "Djo"
Write-Host "Name: $name"

# Display current date and time
Write-Host "Date: $(Get-Date)"

# Display PowerShell version
Write-Host "Version: $($PSVersionTable.PSVersion)"