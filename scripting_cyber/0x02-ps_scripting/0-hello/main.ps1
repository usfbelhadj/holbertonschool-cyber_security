# main.ps1 - Task Entry Point
# Level 0 - Hello Operator
# Run: powershell -File main.ps1

# Global variables (required by platform)
$Global:SchoolName = "Holberton"
$Global:TextColor = "Cyan"

# Level 0 - Hello Operator
$hostname = $env:COMPUTERNAME
$user = $env:USERNAME
$psVersion = $PSVersionTable.PSVersion

Write-Host "=== Level 0 ===" -ForegroundColor Cyan
Write-Host "Hostname:" $hostname
Write-Host "User:" $user
Write-Host "PS Version:" $psVersion