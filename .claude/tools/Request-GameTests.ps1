<#
.SYNOPSIS
    Asks the game to run /kaftest suites at the next login and starts the client, so the maintainer only enters the
    world: no /kaftest typed, no /reload before the results can be read.

.DESCRIPTION
    Only when the maintainer asks for a run, and only while the client is closed: the game keeps the saved variables in
    memory while it runs and overwrites the file on every /reload or logout, so a request written then would be lost.

    Writes KrowiAF_DebugTable.TestRequest = {Suites = {...}, NotAfter = <unix time>} as the last field of the addon's
    saved variables (a Lua table; the last copy of a key wins, so an old request a crash left behind cannot override
    it), checks with the kit's Lua 5.1 that the file still loads and holds the request, then starts the client with the
    kit's Start-Game.ps1, through the Battle.net app's own command line. Entering the world stays the maintainer's: a
    script that sends input to the client is what Blizzard's EULA forbids.

    At that login Tests/Tests.lua clears the request before anything runs, runs the suites without needing debug mode,
    and when they are done shows a panel with each suite's counts and failing lines and takes a screenshot:
    Read-GameScreenshot.ps1 finds it while the game still runs. The full results reach the saved variables at the next
    /reload or logout, for Read-GameTests.ps1.

.PARAMETER Suites
    The /kaftest suites to run, in order.

.PARAMETER Client
    Retail (default), Ptr, Xptr, Beta, Classic or ClassicPtr: the clients the addon loads on.

.PARAMETER Account
    Account folder name (e.g. 133658957#1) instead of the one whose saved variables were written last.

.PARAMETER Minutes
    How long the request stays valid; a login after that drops it unrun. Default 15.

.PARAMETER NoLaunch
    Writes the request without starting the client.

.EXAMPLE
    & ".claude\tools\Request-GameTests.ps1" tracking
    & ".claude\tools\Request-GameTests.ps1" tracking, escape -Minutes 30
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)][string[]]$Suites,
    [ValidateSet('Retail', 'Ptr', 'Xptr', 'Beta', 'Classic', 'ClassicPtr')][string]$Client = 'Retail',
    [string]$Account,
    [int]$Minutes = 15,
    [switch]$NoLaunch
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'KitPath.ps1')
. (Join-Path $KitTools 'AddonContext.ps1')   # the kit's client map: Get-ClientFolder

foreach ($suite in $Suites) {
    if ($suite -notmatch '^[a-z]+$') { throw "Not a suite name: '$suite'" }
}

$folder = (Get-ClientFolder $Client).TrimEnd('\')
$running = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.Path -and $_.Path.StartsWith("$folder\", [StringComparison]::OrdinalIgnoreCase) })
if ($running.Count -gt 0) {
    throw "The $Client client is running ($($running[0].ProcessName), started $($running[0].StartTime)): it would overwrite the request. Ask the maintainer for /kaftest $($Suites -join ' ') instead, or to close the game first."
}

$wtf = Join-Path $folder 'WTF\Account'
$file = if ($Account) {
    Get-Item -LiteralPath (Join-Path $wtf "$Account\SavedVariables\Krowi_AchievementFilter.lua")
} else {
    Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName 'SavedVariables\Krowi_AchievementFilter.lua' } |
        Where-Object { Test-Path -LiteralPath $_ } | Get-Item | Sort-Object LastWriteTime -Descending | Select-Object -First 1
}
if (-not $file) { throw "No Krowi_AchievementFilter.lua under $wtf; log in once with the addon enabled first." }

$utf8 = [Text.UTF8Encoding]::new($false)
$text = [IO.File]::ReadAllText($file.FullName, $utf8)
$notAfter = [DateTimeOffset]::UtcNow.AddMinutes($Minutes).ToUnixTimeSeconds()
$suiteLines = ($Suites | ForEach-Object { "`"$_`"," }) -join "`r`n"
$request = "[`"TestRequest`"] = {`r`n[`"Suites`"] = {`r`n$suiteLines`r`n},`r`n[`"NotAfter`"] = $notAfter,`r`n},`r`n"

# KrowiAF_DebugTable = { ... } as the game writes it: the opening line, unindented fields, a closing "}" before the next
# top-level assignment or the end of the file
$open = [regex]::Match($text, '(?m)^KrowiAF_DebugTable = \{\r\n')
if ($open.Success) {
    $next = [regex]::Match($text.Substring($open.Index + $open.Length), '(?m)^[A-Za-z_][A-Za-z0-9_]* = ')
    $end = if ($next.Success) { $open.Index + $open.Length + $next.Index } else { $text.Length }
    $close = $text.LastIndexOf("}", $end - 1)
    if ($close -lt $open.Index + $open.Length -or $text[$close - 1] -ne "`n") {
        throw "Could not find the closing line of KrowiAF_DebugTable in $($file.FullName); nothing was changed."
    }
    $text = $text.Insert($close, $request)
} else {
    $text = $text.TrimEnd("`r", "`n") + "`r`nKrowiAF_DebugTable = {`r`n$request}`r`n"
}

$backup = Join-Path ([IO.Path]::GetTempPath()) "Krowi_AchievementFilter.$Client.$(Get-Date -Format yyyyMMdd-HHmmss).lua"
Copy-Item -LiteralPath $file.FullName -Destination $backup
[IO.File]::WriteAllText($file.FullName, $text, $utf8)

# The file must still load, and hold this request as the one that counts
$check = "dofile([==[$($file.FullName)]==]) local r = KrowiAF_DebugTable and KrowiAF_DebugTable.TestRequest " +
    "io.write(r and table.concat(r.Suites, ',') or '', '|', r and tostring(r.NotAfter) or '')"
$got = & $KitLua -e $check 2>&1
if ($LASTEXITCODE -ne 0 -or "$got" -ne "$($Suites -join ',')|$notAfter") {
    Copy-Item -LiteralPath $backup -Destination $file.FullName -Force
    throw "The edited file did not read back as expected ($got); the original is restored."
}
"Requested $($Suites -join ', ') in $($file.FullName)"
"  valid until $([DateTimeOffset]::FromUnixTimeSeconds($notAfter).LocalDateTime); the original is kept at $backup"

if ($NoLaunch) { return }
& (Join-Path $KitTools 'Start-Game.ps1') -Client $Client
"Enter the world: the suites start 5 s after it; then Read-GameScreenshot.ps1 -Client $Client for the summary"