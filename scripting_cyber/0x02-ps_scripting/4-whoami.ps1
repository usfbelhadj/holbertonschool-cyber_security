#!/usr/bin/env pwsh

function Get-WhoAmI {
    whoami
}

function Main {
    Get-WhoAmI
}

if ($MyInvocation.InvocationName -ne '.') {
    Main
}