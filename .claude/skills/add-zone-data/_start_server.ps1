# Pre-flight check: ensure wow.tools.local is reachable before running any lookups.
# If not running, starts it and waits up to 60 seconds. Throws if still unreachable.
$baseUrl = "http://localhost:5000"

$serverReachable = $false
try {
    $null = Invoke-WebRequest "$baseUrl/casc/buildname" -UseBasicParsing -TimeoutSec 3
    $serverReachable = $true
} catch { }

if ($serverReachable) {
    Write-Host "wow.tools.local is already running."
    exit 0
}

Write-Host "wow.tools.local not reachable — starting it..."
# Since 0.9.x the server exits at once unless started from its own folder (it looks for wwwroot there)
$serverDir = "E:\World of Warcraft Addon Development\wow.tools.local"
Start-Process (Join-Path $serverDir "wow.tools.local.exe") -WorkingDirectory $serverDir
Write-Host "Waiting for server to become ready (up to 60 seconds)..."
$deadline = (Get-Date).AddSeconds(60)
while ((Get-Date) -lt $deadline) {
    Start-Sleep -Seconds 3
    try {
        $null = Invoke-WebRequest "$baseUrl/casc/buildname" -UseBasicParsing -TimeoutSec 2
        $serverReachable = $true
        break
    } catch { }
}

if (-not $serverReachable) {
    Write-Error "wow.tools.local did not become reachable within 60 seconds. Stop — do not proceed with the skill."
    exit 1
}

Write-Host "Server is ready."
