#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-SHA256 {
    param ([string] $Input)

    $bytes  = [System.Text.Encoding]::UTF8.GetBytes($Input)
    $hash   = [System.Security.Cryptography.SHA256]::Create().ComputeHash($bytes)
    $hex    = ($hash | ForEach-Object { $_.ToString("x2") }) -join ''

    Write-Output "SHA256: $hex"
}

function Main {
    if (-not $args[0]) {
        Write-Output "Usage: pwsh 10-hash.ps1 <word>"
        exit 1
    }
    Get-SHA256 -Input $args[0]
}

if ($MyInvocation.InvocationName -ne '.') {
    Main @args
}