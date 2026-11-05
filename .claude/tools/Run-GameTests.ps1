<#
.SYNOPSIS
    Runs /kaftest suites in the game from start to results with the kit's game-input tools: nothing is written into the
    game's files and nobody needs to type or move the mouse (Krowi_ClaudeKit's docs/work/2026-11-05-kit-test-runs).

.DESCRIPTION
    Deploy first (the kit's Deploy.ps1, -WhatIf first): this tool deploys nothing. Then, one client at a time:
    1. The kit's marker addon is installed or updated in the client (Send-GameInput.ps1 -Install).
    2. A running client is used as it is: in the world it gets a /reload first, so the deployed files and the marker
       load; at character select it enters the world. A closed one is started (Start-Game.ps1 -Wait, which refuses
       while another client runs: they share one Battle.net account) and enters the world.
    3. /kaftest run <entries>, then Send-GameInput.ps1 -WaitForDone: it serves the hovers and keys the suites ask for
       (the options suite's half-shown row, the pictures suite's world map) and returns when the summary is up.
    4. /reload, so the results reach the saved variables, then Read-GameTests.ps1 per entry and the kit's
       Read-GameErrors.ps1.
    5. -Quit for a client this tool started, unless -KeepOpen.

    Exits 0 only when every entry left a run and no run has a FAIL, 1 otherwise. A line that differs from the headless
    run is shown but does not fail the run: options' y-on-new-install always differs (it runs headless only), and a
    difference asks for the headless model to be updated, not for the build to be stopped. Krowi_ClaudeKit's two-copy
    gate reads the exit code as the suites' verdict (its docs/work/2026-11-05-two-copy-gate).

    The kit's guard holds throughout: a client the kit started takes input after 15 s without input on the PC, any
    other client after 5 minutes. A refusal that says when to try again is retried then, for up to 10 minutes.
    Debug mode: /kaftest run turns it on for the run when it is off and back off after (Tests/Tests.lua).

.PARAMETER Entries
    What to run, as /kaftest run takes it: suites, or a suite and what to run of it after a space ("options toggle").
    Several as separate arguments or comma-separated: options, escape.

.PARAMETER Client
    Retail (default), Ptr, Xptr, Beta, Classic or ClassicPtr; Start-Game.ps1 starts only Retail and Classic (Mists), a
    running test-realm client is used as it is.

.PARAMETER Timeout
    Seconds the run may take, from /kaftest run to its summary. Default 900.

.PARAMETER KeepOpen
    Leaves a client this tool started running.

.EXAMPLE
    & ".claude\tools\Run-GameTests.ps1" options, escape
    & ".claude\tools\Run-GameTests.ps1" options -Client Classic
    & ".claude\tools\Run-GameTests.ps1" "options toggle-reset-clipped"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)][string[]]$Entries,
    [ValidateSet('Retail', 'Ptr', 'Xptr', 'Beta', 'Classic', 'ClassicPtr')][string]$Client = 'Retail',
    [int]$Timeout = 900,
    [switch]$KeepOpen
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'KitPath.ps1')
$send = Join-Path $KitTools 'Send-GameInput.ps1'

$list = @($Entries | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
foreach ($entry in $list) {
    if ($entry -notmatch '^[a-z]+( [A-Za-z0-9-]+)?$') { throw "Not a suite name, or a suite name and a step: '$entry'" }
}
if (-not $list) { throw 'Name at least one suite.' }
$runText = $list -join ', '

# The kit must have -WaitForDone (Krowi_ClaudeKit's docs/work/2026-11-05-kit-test-runs); an older kit would type the
# run and then fail
if (-not (Get-Command $send).Parameters.ContainsKey('WaitForDone')) {
    throw "The kit at $KitRoot has no Send-GameInput.ps1 -WaitForDone yet: merge its test-run work, or point `$env:KROWI_CLAUDEKIT at a kit worktree that has it."
}

# One kit call, its lines shown as they come; a refusal that says when to try again is retried then, for up to 10
# minutes per call. Returns only the call's exit code.
function Invoke-Kit([string]$What, [hashtable]$Arguments) {
    $retryUntil = (Get-Date).AddMinutes(10)
    while ($true) {
        $out = @(& $send -Client $Client @Arguments 2>&1 | ForEach-Object { "$_" })
        $code = $LASTEXITCODE
        $out | ForEach-Object { Write-Host "  $_" }
        $last = if ($out) { $out[-1] } else { '' }
        if ($code -eq 0 -or $last -notmatch 'try again in (\d+) s') { return $code }
        if ((Get-Date) -gt $retryUntil) { Write-Host "  $What gave up: still refused after 10 minutes"; return $code }
        Start-Sleep -Seconds ([int]$Matches[1] + 2)
    }
}
$started = $false
# A client this tool started is closed whatever happens after
function Close-Started {
    if ($script:started -and -not $KeepOpen) {
        "Closing the $Client client this tool started"
        $null = Invoke-Kit 'closing' @{ Quit = $true }
        $script:started = $false
    }
}
function Stop-Run([string]$Reason) { Close-Started; "Run-GameTests: $Reason"; exit 1 }

"Run-GameTests: $runText on $Client"
$null = & $send -Client $Client -Install
$state = (& $send -Client $Client -State 2>&1 | Out-String)
if ($state -match 'client: not running') {
    "Starting the $Client client"
    & (Join-Path $KitTools 'Start-Game.ps1') -Client $Client -Wait
    $started = $true
    $state = (& $send -Client $Client -State 2>&1 | Out-String)
}

if ($state -match 'state: in the world') {
    "/reload, so the deployed files and the marker load"
    if ((Invoke-Kit '/reload' @{ Command = '/reload' }) -ne 0) { Stop-Run 'the first /reload failed' }
} elseif ($state -match 'state: character select') {
    'Entering the world'
    if ((Invoke-Kit 'entering the world' @{ EnterWorld = $true }) -ne 0) { Stop-Run 'could not enter the world' }
} else {
    # In the world without the marker: nothing can be typed, and the game only finds a new addon folder when it starts
    $stateLine = ((($state -split "`r?`n") | Where-Object { $_ -match 'state:' }) -join ' ').Trim()
    Stop-Run "the $Client client is neither in the world with the marker nor at character select ($stateLine). In the world without the marker, nothing can be typed; if the marker addon was only just installed, the client needs a restart: Krowi closes it, and this tool starts it."
}

"/kaftest run $runText"
$runStart = Get-Date
if ((Invoke-Kit '/kaftest run' @{ Command = "/kaftest run $runText" }) -ne 0) { Stop-Run 'could not type the run' }

'Waiting for the run to be done'
$waited = Invoke-Kit 'waiting' @{ WaitForDone = $true; Timeout = $Timeout }

# Also after a timeout: the suites that finished reach the saved variables
'/reload, so the results reach the saved variables'
$reloaded = Invoke-Kit '/reload' @{ Command = '/reload' }

if ($reloaded -eq 0) {
    # Only the kept runs of this run, oldest first, by their time in the reader's list ("  2. 2026-11-05 17:28:23 ...")
    $reader = Join-Path $PSScriptRoot 'Read-GameTests.ps1'
    $listing = @(& $reader -Client $Client 2>&1 | ForEach-Object { "$_" })
    $ours = @($listing | ForEach-Object {
        if ($_ -match '^\s+(\d+)\. (\d{4}-\d\d-\d\d \d\d:\d\d:\d\d) ') {
            $time = [datetime]::ParseExact($Matches[2], 'yyyy-MM-dd HH:mm:ss', [Globalization.CultureInfo]::InvariantCulture)
            if ($time -ge $runStart.AddSeconds(-1)) { [int]$Matches[1] }
        }
    } | Sort-Object -Unique -Descending)
    if ($ours.Count -eq 0) { "No run of this session reached the saved variables (the summary's screenshot shows what ran: Read-GameScreenshot.ps1 -Client $Client)" }
    if ($ours.Count -lt $list.Count) { "Only $($ours.Count) of $($list.Count) entries left a run; the summary's screenshot says why the others did not run" }
    # A run fails on a FAIL line, or when the reader cannot read it; its "suite ..." line says how many failed
    $failedRuns = 0
    foreach ($n in $ours) {
        $read = @(& $reader -Client $Client -Run $n 2>&1 | ForEach-Object { "$_" })
        $read
        $summary = @($read | Where-Object { $_ -match '^suite .+: (\d+) passed, (\d+) failed' })[0]
        if (-not $summary -or $summary -notmatch '^suite .+: \d+ passed, 0 failed') { $failedRuns++ }
    }
    & (Join-Path $KitTools 'Read-GameErrors.ps1') -Client $Client
}

Close-Started
if ($waited -ne 0) { Stop-Run 'the run did not report done in time (see above)' }
if ($reloaded -ne 0) { Stop-Run 'the last /reload failed, so the results are not on disk' }
if ($ours.Count -lt $list.Count) { Stop-Run "only $($ours.Count) of $($list.Count) entries left a run" }
if ($failedRuns -gt 0) { Stop-Run "$failedRuns of $($ours.Count) run(s) failed (see above)" }
'Run-GameTests: done'
exit 0