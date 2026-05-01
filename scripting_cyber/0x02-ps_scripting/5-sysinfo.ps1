#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-LocalUserStatus {
    Get-LocalUser |
        Sort-Object Name |
        ForEach-Object {
            $status = if ($_.Enabled) { "Enabled" } else { "Disabled" }
            Write-Output "$($_.Name) $status"
        }
}

function Main {
    Get-LocalUserStatus
}

if ($MyInvocation.InvocationName -ne '.') {
    Main
}