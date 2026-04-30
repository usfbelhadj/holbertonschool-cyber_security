#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-MachineInfo {
    $hostname = $env:COMPUTERNAME
    $os       = (Get-CimInstance Win32_OperatingSystem).Caption
    Write-Output "Hostname: $hostname"
    Write-Output "OS: $os"
}

function Main {
    Get-MachineInfo
}

if ($MyInvocation.InvocationName -ne '.') {
    Main
}