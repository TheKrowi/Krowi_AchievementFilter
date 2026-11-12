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
       (the pictures suite's world map) and returns when the summary is up.
    4. /reload, so the results reach the saved variables, then Read-GameTests.ps1 per entry and the kit's
       Read-GameErrors.ps1. After every /reload it reads the saved variables only once the game has written them
       since (up to 60 s): the kit can report the UI back while the reload has only begun.
    5. -Quit for a client this tool started, unless -KeepOpen.

    Exits 0 only when every entry left a run, no run has a FAIL and every run passed something (a run whose every step
    was skipped proves nothing), 1 otherwise. A line that differs from the headless
    run is shown but does not fail the run: options' y-on-new-install always differs (it runs headless only), and a
    difference asks for the headless model to be updated, not for the build to be stopped. Krowi_ClaudeKit's two-copy
    gate reads the exit code as the suites' verdict (its docs/work/2026-11-05-two-copy-gate).

    The kit's guard holds throughout: a client the kit started takes input after 15 s without input on the PC, any
    other client after 5 minutes. A refusal that says when to try again is retried then, for up to 10 minutes.
    Debug mode: /kaftest run turns it on for the run when it is off and back off after (Tests/Tests.lua).

.PARAMETER Entries
    What to run, as /kaftest run takes it: suites, or a suite and what to run of it after a space ("options open",
    or options' set "options smoke"). Several as separate arguments or comma-separated: options, escape.

.PARAMETER Matrix
    Instead of entries: /kaftest matrix, every suite but the probes with every feature on, with every feature off and with
    each feature alone (docs/work/2026-11-08-feature-split-poc). Each step asks for a /reload and this tool types it; the
    last one puts the switches back. Exits 0 only when the plan's record is newer than the run, every step ran every
    suite, nothing failed and something passed. -Timeout then counts per step. The release gate wants one such run on the
    newest Retail and Mists build since Features/ last changed.

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
    & ".claude\tools\Run-GameTests.ps1" "options open"
    & ".claude\tools\Run-GameTests.ps1" "options smoke", escape
    & ".claude\tools\Run-GameTests.ps1" -Matrix -Client Classic
#>
[CmdletBinding(DefaultParameterSetName = 'Entries')]
param(
    [Parameter(Mandatory, Position = 0, ParameterSetName = 'Entries')][string[]]$Entries,
    [Parameter(Mandatory, ParameterSetName = 'Matrix')][switch]$Matrix,
    [ValidateSet('Retail', 'Ptr', 'Xptr', 'Beta', 'Classic', 'ClassicPtr')][string]$Client = 'Retail',
    [int]$Timeout = 900,
    [switch]$KeepOpen
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'KitPath.ps1')
$send = Join-Path $KitTools 'Send-GameInput.ps1'

if ($Matrix) {
    $list = @()
    $runText = 'matrix'
} else {
    $list = @($Entries | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    foreach ($entry in $list) {
        if ($entry -notmatch '^[a-z]+( [A-Za-z0-9-]+)?$') { throw "Not a suite name, or a suite name and a step: '$entry'" }
    }
    if (-not $list) { throw 'Name at least one suite.' }
    $runText = $list -join ', '
}

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
$savedVariablesLate = $false   # set by Wait-SavedVariables
# A client this tool started is closed whatever happens after
function Close-Started {
    if ($script:started -and -not $KeepOpen) {
        "Closing the $Client client this tool started"
        $null = Invoke-Kit 'closing' @{ Quit = $true }
        $script:started = $false
    }
}
function Stop-Run([string]$Reason) { Close-Started; "Run-GameTests: $Reason"; exit 1 }

# The saved variables this tool reads: the newest Krowi_AchievementFilter.lua of the client's accounts, as
# Read-GameTests.ps1 picks it
. (Join-Path $KitTools 'AddonContext.ps1')   # the kit's client map: Get-ClientFolder
$wtf = Join-Path (Get-ClientFolder $Client) 'WTF\Account'
function Get-SavedVariablesFile {
    Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName 'SavedVariables\Krowi_AchievementFilter.lua' } |
        Where-Object { Test-Path -LiteralPath $_ } | Get-Item | Sort-Object LastWriteTime -Descending | Select-Object -First 1
}
# Waits until the game has written the saved variables at or after $Since, the moment before /reload was typed, and
# says when; $false after $Seconds. The kit's -Command '/reload' can report the UI back while the reload has only
# begun, and a read then gets the file from before it (docs/work/2026-11-12-matrix-run-length).
function Wait-SavedVariables([datetime]$Since, [int]$Seconds = 60) {
    $until = (Get-Date).AddSeconds($Seconds)
    while ($true) {
        $file = Get-SavedVariablesFile
        if ($file -and $file.LastWriteTime -ge $Since) {
            "  saved variables written $($file.LastWriteTime.ToString('HH:mm:ss'))"
            return
        }
        if ((Get-Date) -gt $until) {
            "  the saved variables were not written within $Seconds s of the /reload"
            $script:savedVariablesLate = $true
            return
        }
        Start-Sleep -Seconds 1
    }
}

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

if ($Matrix) {
    # /kaftest matrix (Tests/Tests.lua, docs/work/2026-11-08-feature-split-poc): each step sets the features' switches
    # and asks for a /reload, since C_UI.Reload is protected outside a key press or click; this tool types it, waits for
    # the step's suites, and stops once the saved variables hold no pending plan. That last /reload also brings the
    # switches back as they were. -Timeout is per step.
    $runsReader = Join-Path $PSScriptRoot 'headless\read-runs.lua'
    function Read-MatrixState {
        $sv = Get-SavedVariablesFile
        if ($sv) { @(& $KitLua $runsReader $sv.FullName 'KrowiAF_DebugTable' 'matrix' 2>$null) }
    }
    '/kaftest matrix'
    $runStart = Get-Date
    if ((Invoke-Kit '/kaftest matrix' @{ Command = '/kaftest matrix' }) -ne 0) { Stop-Run 'could not type the matrix run' }
    $reloads = 0
    while ($true) {
        'Waiting for the step to be done'
        $waited = Invoke-Kit 'waiting' @{ WaitForDone = $true; Timeout = $Timeout }
        '/reload, for the next step or to put the switches back'
        $typedAt = Get-Date
        $reloaded = Invoke-Kit '/reload' @{ Command = '/reload' }
        if ($waited -ne 0 -or $reloaded -ne 0) { break }
        Wait-SavedVariables $typedAt
        if ($savedVariablesLate) { break }
        $matrixState = @(Read-MatrixState)
        $pending = @($matrixState | Where-Object { $_ -like 'pending|*' })
        if (-not $pending) { break }
        "  matrix: $($pending[0])"
        if (++$reloads -gt 64) { $waited = 1; 'Gave up after 64 steps'; break }
    }
    $record = @($matrixState | Where-Object { $_ -like 'matrix|*' })[0]
    if ($reloaded -eq 0) {
        $reader = Join-Path $PSScriptRoot 'Read-GameTests.ps1'
        try { $listing = @(& $reader -Client $Client 2>&1 | ForEach-Object { "$_" }) }
        catch { Stop-Run "Read-GameTests.ps1 could not read the $Client client's runs: $($_.Exception.Message)" }
        # The kept runs of this matrix run, by their time in the reader's list ("  2. 2026-11-05 17:28:23 ...")
        $listing | Where-Object { $_ -match '^\s+\d+\. (\d{4}-\d\d-\d\d \d\d:\d\d:\d\d) ' -and
            [datetime]::ParseExact($Matches[1], 'yyyy-MM-dd HH:mm:ss', [Globalization.CultureInfo]::InvariantCulture) -ge $runStart.AddSeconds(-1) }
        & (Join-Path $KitTools 'Read-GameErrors.ps1') -Client $Client
    }
    Close-Started
    if ($waited -ne 0) { Stop-Run 'a step did not report done in time (see above)' }
    if ($reloaded -ne 0) { Stop-Run 'a /reload failed, so the plan stopped on a step' }
    if ($savedVariablesLate) { Stop-Run 'the saved variables were not written after a /reload, so the plan could not be read (see above)' }
    if (-not $record) { Stop-Run 'no finished matrix run reached the saved variables' }
    "Run-GameTests: matrix record $record (build|passed|failed|skipped|time|complete)"
    $f = $record -split '\|'
    $recordTime = [datetime]::ParseExact($f[5], 'yyyy-MM-dd HH:mm:ss', [Globalization.CultureInfo]::InvariantCulture)
    if ($recordTime -lt $runStart.AddSeconds(-1)) { Stop-Run 'the matrix record is older than this run' }
    if ($f[6] -ne '1') { Stop-Run 'a step did not run every suite (see the steps above)' }
    if ([int]$f[3] -gt 0 -or [int]$f[2] -eq 0) { Stop-Run "the matrix run failed $($f[3]) and passed $($f[2])" }
    'Run-GameTests: done'
    exit 0
}

"/kaftest run $runText"
$runStart = Get-Date
if ((Invoke-Kit '/kaftest run' @{ Command = "/kaftest run $runText" }) -ne 0) { Stop-Run 'could not type the run' }

'Waiting for the run to be done'
$waited = Invoke-Kit 'waiting' @{ WaitForDone = $true; Timeout = $Timeout }

# Also after a timeout: the suites that finished reach the saved variables
'/reload, so the results reach the saved variables'
$typedAt = Get-Date
$reloaded = Invoke-Kit '/reload' @{ Command = '/reload' }
if ($reloaded -eq 0) {
    Wait-SavedVariables $typedAt
    if ($savedVariablesLate) { Stop-Run 'the saved variables were not written after the /reload, so the runs could not be read (see above)' }
}

if ($reloaded -eq 0) {
    # Only the kept runs of this run, oldest first, by their time in the reader's list ("  2. 2026-11-05 17:28:23 ...")
    $reader = Join-Path $PSScriptRoot 'Read-GameTests.ps1'
    # A reader that throws (no saved variables yet, a client it does not know) ends the run as a failure, with a
    # client this tool started closed first
    try { $listing = @(& $reader -Client $Client 2>&1 | ForEach-Object { "$_" }) }
    catch { Stop-Run "Read-GameTests.ps1 could not read the $Client client's runs: $($_.Exception.Message)" }
    $ours = @($listing | ForEach-Object {
        if ($_ -match '^\s+(\d+)\. (\d{4}-\d\d-\d\d \d\d:\d\d:\d\d) ') {
            $time = [datetime]::ParseExact($Matches[2], 'yyyy-MM-dd HH:mm:ss', [Globalization.CultureInfo]::InvariantCulture)
            if ($time -ge $runStart.AddSeconds(-1)) { [int]$Matches[1] }
        }
    } | Sort-Object -Unique -Descending)
    if ($ours.Count -eq 0) { "No run of this session reached the saved variables (the summary's screenshot shows what ran: Read-GameScreenshot.ps1 -Client $Client)" }
    if ($ours.Count -lt $list.Count) { "Only $($ours.Count) of $($list.Count) entries left a run; the summary's screenshot says why the others did not run" }
    # A run fails on a FAIL line, when nothing in it passed (escape skips every step when something outside the game
    # could take its Escape), or when the reader cannot read it; its "suite ..." line has the counts
    $failedRuns = 0
    foreach ($n in $ours) {
        try { $read = @(& $reader -Client $Client -Run $n 2>&1 | ForEach-Object { "$_" }) }
        catch { $read = @("Read-GameTests.ps1 -Run $n threw: $($_.Exception.Message)") }
        $read
        # The verdict reads the summary line (read-tests.lua: "suite <name>, run ...: N passed, M failed, ..."), not the
        # reader's exit code, which also counts differences from the headless run
        $summary = @($read | Where-Object { $_ -match '^suite .+: \d+ passed, \d+ failed' })[0]
        if (-not $summary) { "Run $n has no 'suite ...: N passed, M failed' line; it counts as failed" }
        if (-not ($summary -match '^suite .+: (\d+) passed, 0 failed' -and [int]$Matches[1] -gt 0)) { $failedRuns++ }
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