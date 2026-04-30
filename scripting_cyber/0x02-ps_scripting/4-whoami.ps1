#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-CurrentUser {
    Write-Output $env:USERNAME
}

function Main {
    Get-CurrentUser
}

if ($MyInvocation.InvocationName -ne '.') {
    Main
}