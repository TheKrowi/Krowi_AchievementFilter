<#
.SYNOPSIS
    Shows what the data says about one or more achievements, and what the addon makes of it, per client, in one call.

.DESCRIPTION
    Runs .claude\tools\headless\show-achievement.lua in the kit's Lua 5.1.5: the real data load of each client
    (client-env.lua, as the data snapshot), then Data/TemporaryObtainable.lua on top. Per id and client it prints:
      source     the file and line of the Ach(<id>) data line, the line itself and its patch key
      snapshot   the line Achievements.<client>.txt records (same formatter, data-format.lua): patch, faction and
                 the other faction's id, reward types, flags, each Obtainable() record with where its Version
                 anchors land on that client (A=>B), previews, custom criteria, events
      state      Past, Current, Future or none from the real GetObtainableState at -AsOf and -Build; where the game
                 would ask its calendar or its season API, the event or season that decides instead
      record n   each Obtainable() record and the was/is/will be of its tooltip line
      category   the category paths, as CategoryTree.<client>.txt records them
      zone       the zone placements (uiMapId, raid-size list, name from raw/MapVerifier.csv)
      event, tooltip, transmog, petbattle, guide   the other stores that name the id, in the snapshots' forms
      load       what the data load reported about the id (LoadDiagnostics), such as an unregistered reference
    About half a second per client, offline. The clock reads dates as UTC days and ignores the region's weekly
    reset, so a season or Reset boundary can be hours off a given region's.

.PARAMETER Ids
    The achievement ids: 5313 or 5313,8246,4627.

.PARAMETER Client
    Retail or Classic (Mists, the headless Classic); both when left out.

.PARAMETER AsOf
    The clock the state is judged at, a date (2025-02-10) or a date and time (2025-02-10 15:00), read as UTC on the
    realm. Default: now.

.PARAMETER Build
    The client version the state is judged at (5.4.8); default the newest patch the .toc declares for the client.
    Needs -Client, since a version is one client's.

.PARAMETER Db
    Adds the name, the description and the builds the id exists on, from the game database (wow.tools.local)
    through .claude\skills\add-zone-data\_lookup_ids.ps1; the builds come from the kit's Get-WowBuilds.ps1. Starts
    the server with _start_server.ps1 when it is down, and warns and goes on without it when it cannot start.

.PARAMETER History
    Adds the commits that changed the Ach(<id>) line (git log -G over DataAddons/), with the changed lines.

.EXAMPLE
    & ".claude\tools\Show-Achievement.ps1" 5313
    & ".claude\tools\Show-Achievement.ps1" 5313,8246 -Db -History
    & ".claude\tools\Show-Achievement.ps1" 5313 -Client Classic -Build 5.4.8
    & ".claude\tools\Show-Achievement.ps1" 4627 -AsOf 2025-02-10
#>
# A plain script, not an advanced one: [CmdletBinding()] or [Parameter()] would add -Debug, whose alias is -db
param(
    [string[]] $Ids,   # strings, so "5313,8246" also works through pwsh -File, where it arrives as one argument
    [ValidateSet('Retail', 'Classic')][string] $Client,
    [datetime] $AsOf,
    [string] $Build,
    [switch] $Db,
    [switch] $History
)

$ErrorActionPreference = 'Stop'
$Ids = @($Ids -split '[,\s]+' | Where-Object { $_ })
if (-not $Ids) { throw "Pass the achievement ids: Show-Achievement.ps1 5313 or 5313,8246." }
$Ids = foreach ($text in $Ids) {
    if ($text -notmatch '^\d+$') { throw "Not an achievement id: '$text'." }
    [int]$text
}
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
. (Join-Path $PSScriptRoot 'KitPath.ps1')

if ($Build -and -not $Client) { throw "-Build is one client's version: name -Client Retail or Classic with it." }
if ($Build -and $Build -notmatch '^\d+\.\d+\.\d+$') { throw "-Build must look like 12.1.5, got '$Build'." }
$clock = if ($PSBoundParameters.ContainsKey('AsOf')) {
    $utc = if ($AsOf.Kind -eq 'Local') { $AsOf.ToUniversalTime() } else { [datetime]::SpecifyKind($AsOf, 'Utc') }
    [DateTimeOffset]::new($utc).ToUnixTimeSeconds()
} else {
    [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
}

# Runs a native command with its output read as UTF-8 (data lines and commit messages carry names)
function Invoke-Utf8([scriptblock] $command) {
    $encoding = [Console]::OutputEncoding
    [Console]::OutputEncoding = [Text.Encoding]::UTF8
    $ErrorActionPreference = 'Continue'
    try { & $command 2>&1 | ForEach-Object { "$_" } } finally { [Console]::OutputEncoding = $encoding }
}

$luaScript = Join-Path $root '.claude\tools\headless\show-achievement.lua'
$clientArg = if ($Client) { $Client } else { 'Both' }
$buildArg = if ($Build) { $Build } else { '-' }
$output = @(Invoke-Utf8 { & $KitLua $luaScript $root $clientArg $clock $buildArg ($Ids -join ',') })
if ($LASTEXITCODE -ne 0) {
    $output
    exit $LASTEXITCODE
}

# --- the game database ----------------------------------------------------------------------------------------
$dbLines = @{}
if ($Db) {
    $skill = Join-Path $root '.claude\skills\add-zone-data'
    try {
        & (Join-Path $skill '_start_server.ps1') 6>$null | Out-Null
        if ($LASTEXITCODE -ne 0) { throw "_start_server.ps1 exited with $LASTEXITCODE" }
        $lookup = @(& (Join-Path $skill '_lookup_ids.ps1') -Ids $Ids 6>&1 | ForEach-Object { "$_" })
        $builds = ($lookup | Where-Object { $_ -match '^builds: ' } | Select-Object -First 1) -replace '^builds: ', ''
        foreach ($line in $lookup) {
            if ($line -notmatch '^(\d+)\|(.*?)\|(.*)\|builds=([a-z,]*)$') { continue }
            $found = $Matches[4] -split ',' | Where-Object { $_ }
            $dbLines[[int]$Matches[1]] = @(
                if ($Matches[2] -eq 'NOT_FOUND') { "  game db   in neither build ($builds)" }
                else {
                    "  game db   $($Matches[2]): $($Matches[3])"
                    "            exists on $(if ($found) { $found -join ' and ' } else { 'neither build' }) ($builds)"
                }
            )
        }
    } catch {
        $warning = "-Db: the game database is left out, wow.tools.local is not reachable ($($_.Exception.Message))"
        foreach ($id in $Ids) { $dbLines[$id] = @("  game db   $warning") }
    }
}

# --- the history of the data line -----------------------------------------------------------------------------
function Get-LineHistory([int] $id) {
    $log = Invoke-Utf8 { git -C $root log -G "Ach\($id\)" --format='@@@ %h %ad %s' --date=short -U0 -p -- DataAddons }
    $lines, $file, $shownFile, $inHeader = @(), $null, $null, $false
    foreach ($line in $log) {
        if ($line -match '^@@@ (.*)$') {
            $subject = $Matches[1]
            if ($subject.Length -gt 110) { $subject = $subject.Substring(0, 107) + '...' }
            $lines += "  history   $subject"
            $shownFile = $null
        } elseif ($line -match '^diff --git ') {
            $inHeader = $true
        } elseif ($inHeader -and $line -match '^--- a/(.*)$') {
            $file = $Matches[1]
        } elseif ($inHeader -and $line -match '^\+\+\+ (?:b/(.*)|/dev/null)$') {
            if ($Matches[1]) { $file = $Matches[1] }
        } elseif ($line -match '^@@ ') {
            $inHeader = $false
        } elseif (-not $inHeader -and $line -match "^([-+])\s*(.*Ach\($id\).*)$") {
            if ($file -ne $shownFile) { $lines += "              $file"; $shownFile = $file }
            $lines += "                $($Matches[1]) $($Matches[2])"
        }
    }
    if ($lines.Count -eq 0) { $lines = @("  history   no commit changed an Ach($id) line under DataAddons/") }
    $lines
}

# --- one block per id: its header, the game database, the clients, the history ---------------------------------
# (the blank line before an id's header is held back, so the previous id's history goes above it)
$id, $blank = $null, $false
foreach ($line in $output) {
    if ($line -eq '') { $blank = $true; continue }
    if ($line -match '^== (\d+) ==$') {
        if ($null -ne $id -and $History) { Get-LineHistory $id }
        if ($blank) { '' }
        $id = [int]$Matches[1]
        $line
        if ($dbLines.ContainsKey($id)) { $dbLines[$id] }
    } else {
        if ($blank) { '' }
        $line
    }
    $blank = $false
}
if ($null -ne $id -and $History) { Get-LineHistory $id }