# Pass the decor names as -Names "Amani Forge","Mysterious Voodoo Mask", or set the $Names placeholder below, run, and
# reset it to @(). Housing is Retail-only; the build is resolved from the server (.claude\tools\Get-WowBuilds.ps1).
# Looks up housedecor table ID by exact Name_lang match -- this is the id passed to :HousingDecor(recordId).
# Pre-requisite: wow.tools.local must already be running.
param(
    [string[]] $Names = @()
)
. "$PSScriptRoot\..\..\tools\Get-WowBuilds.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl).Retail
if ($Names.Count -eq 0) { Write-Host "Pass -Names or set the `$Names placeholder first."; return }
foreach ($name in $Names) {
    $body = "draw=1&start=0&length=10&search[value]=$name"
    $resp = Invoke-WebRequest "$baseUrl/dbc/data/housedecor/?build=$build" `
        -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    $json = $resp.Content | ConvertFrom-Json
    $match = $json.data | Where-Object { [System.Net.WebUtility]::HtmlDecode($_[0]) -eq $name } | Select-Object -First 1
    if ($match) {
        Write-Host "$name|RecordID=$($match[4])"
    } else {
        Write-Host "$name|NOTFOUND (recordsFiltered=$($json.recordsFiltered))"
    }
}
