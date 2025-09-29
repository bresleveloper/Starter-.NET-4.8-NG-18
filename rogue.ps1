param(
    [string[]]$ArgsArray
)


if ($ArgsArray.Count -eq 0) {
    # Code line 1 - runs if no args were provided
    Write-Output "No arguments provided - get nodes processes"
    Get-CimInstance Win32_Process -Filter "Name = 'node.exe'" | Select-Object ProcessId, CommandLine
} else {
    # Code line 2 - runs if args were provided
    Write-Output "Arguments provided: $ArgsArray - kill process"
    taskkill /PID $ArgsArray /F
}

