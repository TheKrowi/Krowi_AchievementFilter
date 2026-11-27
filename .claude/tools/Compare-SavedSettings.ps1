<#
.SYNOPSIS
    Compares a player's saved settings of this addon around a change: the files before and after a login, and every
    option's value as two checkouts read the same file (docs/work/2026-11-25-leave-aceconfig).

.DESCRIPTION
    The settings are what the options and the filters keep, in each account's
    WTF\Account\<account>\SavedVariables\Krowi_AchievementFilter.lua: KrowiAF_Options, KrowiAF_Filters and
    KrowiAF_SearchOptions whole, and KrowiAF_SavedData.Tabs. The rest of KrowiAF_SavedData changes with every login and
    no option writes it. The Lua half is .claude/tools/headless/saved-settings.lua.

    -Snapshot <dir>  copies every account's file of the client into <dir>\<account>\ with a dump of its settings
                     (settings.txt). Take it with the client closed, right before the first login with a new build.
    -Compare <dir>   dumps the settings of the client's files now and compares each with the snapshot's: "same", or the
                     lines that differ.
    -Options <dir>   boots the headless options environment of -Checkout (default: this checkout) on each snapshot file
                     and writes every option's value in every profile, and every filters and search profile, to
                     <dir>\<account>\options-<Label>.txt; with -Against <label>, compares it with that label's file.
                     With -Live it reads the client's files as they are now instead of the snapshot's copies: after a
                     login with a new build, what the game saved (a settings store's file is read as it was saved).

    Snapshots belong in the scratchpad, never in the repo: they are a player's own files.

.EXAMPLE
    & .claude\tools\Compare-SavedSettings.ps1 -Snapshot $dir                                  # client closed
    & .claude\tools\Compare-SavedSettings.ps1 -Options $dir -Checkout <main checkout> -Label main
    & .claude\tools\Compare-SavedSettings.ps1 -Options $dir -Label branch -Against main          # the same values?
    # deploy the branch, log in, /reload, quit
    & .claude\tools\Compare-SavedSettings.ps1 -Compare $dir                                   # the same files?
    & .claude\tools\Compare-SavedSettings.ps1 -Options $dir -Live -Label live -Against branch  # what the game saved, the same?
#>
[CmdletBinding(DefaultParameterSetName = 'Snapshot')]
param(
    [Parameter(ParameterSetName = 'Snapshot', Mandatory)][string]$Snapshot,
    [Parameter(ParameterSetName = 'Compare', Mandatory)][string]$Compare,
    [Parameter(ParameterSetName = 'Options', Mandatory)][string]$Options,
    [Parameter(ParameterSetName = 'Options')][string]$Checkout,
    [Parameter(ParameterSetName = 'Options')][string]$Label = 'checkout',
    [Parameter(ParameterSetName = 'Options')][string]$Against,
    [Parameter(ParameterSetName = 'Options')][switch]$Live,
    [ValidateSet('Retail', 'Classic')][string]$Client = 'Retail'
)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'KitPath.ps1')
. (Join-Path $KitTools 'AddonContext.ps1')   # Get-ClientFolder
$script = Join-Path $PSScriptRoot 'headless\saved-settings.lua'
$fileName = 'Krowi_AchievementFilter.lua'

function Get-AccountFiles {
    $accounts = Join-Path (Get-ClientFolder $Client) 'WTF\Account'
    Get-ChildItem $accounts -Directory | ForEach-Object {
        $file = Join-Path $_.FullName "SavedVariables\$fileName"
        if (Test-Path $file) { [pscustomobject]@{ Account = $_.Name; File = $file } }
    }
}

function Get-Dump([string]$File) {
    $out = & $KitLua $script dump $File 2>&1
    if ($LASTEXITCODE -ne 0) { throw "dump of $File failed: $out" }
    return ($out -join "`n")
}

function Compare-Text([string]$Before, [string]$After, [string]$What) {
    if ($Before -eq $After) { Write-Host "  $What`: same"; return $true }
    $diff = Compare-Object ($Before -split "`n") ($After -split "`n") | Select-Object -First 10
    Write-Host "  $What`: DIFFERENT"
    $diff | ForEach-Object { Write-Host ("    {0} {1}" -f $(if ($_.SideIndicator -eq '<=') { 'before' } else { 'after ' }), $_.InputObject.Trim()) }
    return $false
}

switch ($PSCmdlet.ParameterSetName) {
    'Snapshot' {
        foreach ($entry in Get-AccountFiles) {
            $target = Join-Path $Snapshot $entry.Account
            New-Item -ItemType Directory -Force $target | Out-Null
            Copy-Item $entry.File (Join-Path $target $fileName) -Force
            [IO.File]::WriteAllText((Join-Path $target 'settings.txt'), (Get-Dump $entry.File))
            "snapshot: $Client $($entry.Account) -> $target"
        }
    }
    'Compare' {
        $allSame = $true
        foreach ($entry in Get-AccountFiles) {
            # the snapshot's own copy of the file, dumped now, so both sides go through the same dump code
            $copy = Join-Path (Join-Path $Compare $entry.Account) $fileName
            if (-not (Test-Path $copy)) { "  $($entry.Account): no snapshot"; continue }
            $same = Compare-Text (Get-Dump $copy) (Get-Dump $entry.File) "$Client $($entry.Account)"
            if (-not $same) { $allSame = $false }
        }
        if (-not $allSame) { exit 1 }
    }
    'Options' {
        if (-not $Checkout) { $Checkout = (git -C $PSScriptRoot rev-parse --show-toplevel) }
        $allSame = $true
        $liveFiles = @{}
        if ($Live) { foreach ($entry in Get-AccountFiles) { $liveFiles[$entry.Account] = $entry.File } }
        foreach ($dir in Get-ChildItem $Options -Directory) {
            $file = Join-Path $dir.FullName $fileName
            if ($Live) { $file = $liveFiles[$dir.Name] }
            if (-not $file -or -not (Test-Path $file)) { continue }
            $errFile = [IO.Path]::GetTempFileName()
            $out = & $KitLua $script options $Checkout $Client $file 2> $errFile
            $failed = $LASTEXITCODE -ne 0
            $reason = (Get-Content $errFile -Raw); Remove-Item $errFile -ErrorAction SilentlyContinue
            # a read that did not work is never compared: no file is written for it, and the run fails
            if ($failed) { "  $($dir.Name): the read failed: $reason"; $allSame = $false; continue }
            $path = Join-Path $dir.FullName "options-$Label.txt"
            [IO.File]::WriteAllText($path, ($out -join "`n"))
            "options: $($dir.Name), $(@($out).Count) lines -> $path"
            if ($Against) {
                $other = Join-Path $dir.FullName "options-$Against.txt"
                if (-not (Test-Path $other)) { "  no options-$Against.txt"; $allSame = $false; continue }
                $same = Compare-Text ([IO.File]::ReadAllText($other)) ($out -join "`n") "$($dir.Name) $Against vs $Label"
                if (-not $same) { $allSame = $false }
            }
        }
        if (-not $allSame) { exit 1 }
    }
}