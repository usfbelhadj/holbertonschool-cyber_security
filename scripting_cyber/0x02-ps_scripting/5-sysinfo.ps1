#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-MachineInfo {
    # Works on both Linux and Windows
    $hostname = [System.Net.Dns]::GetHostName()

    # Cross-platform OS info
    $os = [System.Runtime.InteropServices.RuntimeInformation]::OSDescription

    Write-Output "Hostname: $hostname"
    Write-Output "OS: $os"
}

function Main {
    Get-MachineInfo
}

if ($MyInvocation.InvocationName -ne '.') {
    Main
}