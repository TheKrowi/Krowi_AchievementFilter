# Generic name-search lookup against wow.tools.local /dbc/data/<table>/ endpoint.
# Pass -Table uimap -Name "Venomfall Deeps", or set the $Table and $Name placeholders below, run, and reset them to "".
# table options used by add-category-data: uimap | journalinstance | areapoi
# -Client Classic queries the Classic build; the build itself is resolved from the server (.claude\tools\Get-WowBuilds.ps1).
# wow.tools.local must already be running.
param(
    [string] $Table = "",
    [string] $Name = "",
    [ValidateSet('Retail', 'Classic')] [string] $Client = 'Retail'
)
. "$PSScriptRoot\..\..\tools\Get-WowBuilds.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl)[$Client]
if (-not $Table -or -not $Name) { Write-Host "Pass -Table and -Name or set the placeholders first."; return }
$body = "draw=1&start=0&length=20&search[value]=$Name"
$resp = Invoke-WebRequest "$baseUrl/dbc/data/$Table/?build=$build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$resp.Content
