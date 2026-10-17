# Pass the mount names as -Names "Ancestral Phoenix","Galakras", or set the $Names placeholder below, run, and reset it to @().
# -Client Classic queries the Classic build; the build itself is resolved from the server (the kit's tools\Get-WowBuilds.ps1).
# Looks up mount table ID by exact Name_lang match -- this is the id passed to :Mount(mountId).
# Pre-requisite: wow.tools.local must already be running.
param(
    [string[]] $Names = @(),
    [ValidateSet('Retail', 'Classic')] [string] $Client = 'Retail'
)
. "$PSScriptRoot\..\..\tools\KitPath.ps1"
. "$KitTools\Get-WowBuilds.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl)[$Client]
if ($Names.Count -eq 0) { Write-Host "Pass -Names or set the `$Names placeholder first."; return }
foreach ($name in $Names) {
    $body = "draw=1&start=0&length=10&search[value]=$name"
    $resp = Invoke-WebRequest "$baseUrl/dbc/data/mount/?build=$build" `
        -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    $json = $resp.Content | ConvertFrom-Json
    $match = $json.data | Where-Object { [System.Net.WebUtility]::HtmlDecode($_[0]) -eq $name } | Select-Object -First 1
    if ($match) {
        Write-Host "$name|MountID=$($match[3])"
    } else {
        Write-Host "$name|NOTFOUND (recordsFiltered=$($json.recordsFiltered))"
    }
}
