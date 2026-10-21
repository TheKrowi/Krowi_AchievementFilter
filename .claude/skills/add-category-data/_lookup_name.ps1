# Generic name-search lookup against wow.tools.local /dbc/data/<table>/ endpoint.
# Pass -Table uimap -Name "Venomfall Deeps", or set the $Table and $Name placeholders below, run, and reset them to "".
# table options used by add-category-data: uimap | journalinstance | areapoi
# -Client Classic queries the Classic build; the build itself is resolved from the server (the kit's tools\Get-WowBuilds.ps1).
# -Locale deDE (or another game locale) reads the table's strings in that language (the server fetches them from the
# CDN); the default is enUS. The locale is always sent: after a query in another language, a table read for the first
# time without one can come back in that language (seen on 0.9.9, 2026-10-21), which other lookup scripts, sending
# none, still risk until the server restarts.
# wow.tools.local must already be running.
param(
    [string] $Table = "",
    [string] $Name = "",
    [ValidateSet('Retail', 'Classic')] [string] $Client = 'Retail',
    [ValidateSet('enUS', 'deDE', 'esES', 'esMX', 'frFR', 'itIT', 'koKR', 'ptBR', 'ruRU', 'zhCN', 'zhTW')] [string] $Locale = 'enUS'
)
. "$PSScriptRoot\..\..\tools\KitPath.ps1"
. "$KitTools\Get-WowBuilds.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl)[$Client]
if (-not $Table -or -not $Name) { Write-Host "Pass -Table and -Name or set the placeholders first."; return }
$body = "draw=1&start=0&length=20&search[value]=$Name"
$resp = Invoke-WebRequest "$baseUrl/dbc/data/$Table/?build=$build&locale=$Locale" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$resp.Content
