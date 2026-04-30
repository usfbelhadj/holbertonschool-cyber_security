# 3-hello_function.ps1

function Write-Hello {
    Write-Output "Hello, Holberton From Function"
}

function Main {
    Write-Hello
}

# Entry guard
if ($MyInvocation.InvocationName -ne '.') {
    Main
}