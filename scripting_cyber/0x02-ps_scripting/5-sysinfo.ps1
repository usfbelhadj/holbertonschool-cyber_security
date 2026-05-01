#!/usr/bin/env pwsh

Set-StrictMode -Version Latest
$ErrorActionPreference = 'SilentlyContinue'

$DEFAULT_PORTS = @(22, 80, 443, 3306, 8080)

function Invoke-PortScan {
    param (
        [string]  $Target,
        [int[]]   $Ports   = $DEFAULT_PORTS,
        [int]     $Timeout = 500
    )

    foreach ($port in $Ports) {
        $tcp    = [System.Net.Sockets.TcpClient]::new()
        $result = $tcp.BeginConnect($Target, $port, $null, $null)
        $open   = $result.AsyncWaitHandle.WaitOne($Timeout, $false)
        $tcp.Close()

        $status = if ($open) { "OPEN" } else { "CLOSED" }
        Write-Output "$port $status"
    }
}

function Main {
    if (-not $args[0]) {
        Write-Output "Usage: pwsh 11-portscan.ps1 <target>"
        exit 1
    }
    Invoke-PortScan -Target $args[0]
}

if ($MyInvocation.InvocationName -ne '.') {
    Main @args
}