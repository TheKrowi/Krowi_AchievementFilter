<#
.SYNOPSIS
    Rebuilds .claude\tools\Check-Repo.deprecated-api, the list of Blizzard globals the Check-Repo `deprecated-api`
    rule reports, from the local wow-ui-source clones of the clients the .toc lists.

.DESCRIPTION
    Blizzard keeps old global names alive for a while as aliases in deprecation addons
    (`ChatEdit_InsertLink = ChatFrameUtil.InsertLink;`), which load only while the loadDeprecationFallbacks CVar is
    on, and deletes those files in a later patch (12.1.5 deleted ten). Reading such a name works on a client with the
    CVar on and errors for everyone else (docs/work/2026-10-14-deprecated-api-lint).

    For each client the .toc's Interface line lists, the script reads that client's clone once with
    Krowi_ClaudeKit's tools\DeprecatedApi.ps1, the classification its Find-DeprecatedApi.ps1 uses too:
      - a deprecation file is one under a Blizzard_Deprecated* or Deprecated_* addon, or one whose code checks
        loadDeprecationFallbacks; a per-game variant counts only for its own game. Its aliases name the
        replacement when the alias does.
      - every other file says what the client has for real: top-level definitions, documented namespace-less
        functions, and names its own code calls as functions (an undocumented engine function shows up that way).
    A name is "deprecated" on a client that has it only as an alias, "removed" on a client that neither aliases,
    defines, documents nor calls it, and skipped where it is real. A name the previous list held that no longer
    appears in any deprecation file is kept, as removed, while no listed client has it for real, so a deleted file
    does not silently drop its names. Names in Check-Repo.removed-api are left out (that rule reports them).

    The list is committed, so the rule runs offline. Run this after the kit's Update-UiSource.ps1 on a patch day and
    commit the diff; a run on unchanged clones writes the same bytes. The clones are untrusted data: they are only
    read.

    Interface versions map to clones: 12.x live, 5.x classic, 3.x classic_titan, 2.x classic_anniversary, 1.60+
    forever, other 1.x classic_era.

.PARAMETER UiSource
    The folder holding the clones. Default: ..\wow-ui-source next to the main checkout, where the kit's
    Update-UiSource.ps1 puts them (a worktree resolves to the same folder).

.EXAMPLE
    & "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\Update-UiSource.ps1" -Branch live, classic, classic_titan
    & ".claude\tools\Update-DeprecatedApi.ps1"
#>
[CmdletBinding()]
param(
    [string]$UiSource
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'KitPath.ps1')
. (Join-Path $KitTools 'DeprecatedApi.ps1')
$repo = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root (this checkout or worktree)
if ($UiSource) {
    $UiSource = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($UiSource)   # .NET file calls resolve relative paths elsewhere
}
else {
    $main = $repo
    try {
        # a worktree lives elsewhere; the main checkout is the parent of the shared .git folder
        $common = git -C $repo rev-parse --path-format=absolute --git-common-dir
        if ($LASTEXITCODE -eq 0 -and $common) { $main = Split-Path ($common.Trim() -replace '/', '\') -Parent }
    } catch { }
    $UiSource = Join-Path (Split-Path $main -Parent) 'wow-ui-source'
}
$out = Join-Path $PSScriptRoot 'Check-Repo.deprecated-api'
$removedFile = Join-Path $PSScriptRoot 'Check-Repo.removed-api'

# --- The clients the .toc lists, each read once -----------------------------------------------------------
$targets = Get-TocBranches $repo
foreach ($branch in $targets) {
    if (-not (Test-Path -LiteralPath (Join-Path $UiSource "$branch\Interface\AddOns"))) {
        throw "No wow-ui-source clone '$branch' in $UiSource; run `"$KitTools\Update-UiSource.ps1`" -Branch $branch"
    }
}
$clients = @{}   # branch -> Read-CloneApi result
foreach ($branch in $targets) { $clients[$branch] = Read-CloneApi (Join-Path $UiSource $branch) $branch }

# --- Classify -----------------------------------------------------------------------------------------------
function Get-States([string]$name) {
    $states = [Collections.Generic.List[string]]::new()
    foreach ($branch in $targets) {
        $state = Get-ApiState $name $clients[$branch]
        if ($state) { $states.Add("$branch=$state") }
    }
    , $states
}
$skip = [hashtable]::new([StringComparer]::Ordinal)   # reported by the removed-api rule
if (Test-Path -LiteralPath $removedFile) {
    foreach ($line in Get-Content -LiteralPath $removedFile) {
        $t = ($line -replace '#.*$', '').Trim()
        if ($t -match '^(\S+)\s') { $skip[$Matches[1]] = $true }
    }
}
$entries = [hashtable]::new([StringComparer]::Ordinal)   # name -> @{ Replacement; States }
foreach ($branch in $targets) {
    foreach ($name in $clients[$branch].Aliases.Keys) {
        if ($entries.ContainsKey($name) -or $skip.ContainsKey($name)) { continue }
        $replacement = ''
        foreach ($b in $targets) { if (-not $replacement -and $clients[$b].Aliases[$name]) { $replacement = $clients[$b].Aliases[$name] } }
        $states = Get-States $name
        if ($states.Count -gt 0) { $entries[$name] = @{ Replacement = $replacement; States = $states } }
    }
}
# Names the previous list held that no deprecation file carries any more: Blizzard deleted the file. They stay while
# no listed client has them for real, now as removed.
if (Test-Path -LiteralPath $out) {
    foreach ($line in Get-Content -LiteralPath $out) {
        $t = ($line -replace '#.*$', '').Trim()
        if ($t -notmatch '^(\S+)\s+(\S+)\s+\S+$') { continue }
        $name = $Matches[1]; $replacement = if ($Matches[2] -ne '-') { $Matches[2] } else { '' }
        if ($entries.ContainsKey($name) -or $skip.ContainsKey($name)) { continue }
        $states = Get-States $name
        if ($states.Count -gt 0) { $entries[$name] = @{ Replacement = $replacement; States = $states } }
    }
}

# --- Write the list ---------------------------------------------------------------------------------------
$names = [string[]]@($entries.Keys)
[Array]::Sort($names, [StringComparer]::Ordinal)
$lines = [Collections.Generic.List[string]]::new()
$lines.Add('# Blizzard globals that, on a client the .toc lists, exist only as a deprecated alias or not at all, for the')
$lines.Add('# Check-Repo.ps1 `deprecated-api` rule. Generated by .claude/tools/Update-DeprecatedApi.ps1: do not edit by hand,')
$lines.Add('# regenerate after Krowi_ClaudeKit/tools/Update-UiSource.ps1 on a patch day and commit the diff.')
$lines.Add('# One "<name> <replacement or -> <client>=<state>,..." per line, sorted ordinally. deprecated: only a deprecation')
$lines.Add('# file of that client defines it, so it is nil with the loadDeprecationFallbacks CVar off and gone once Blizzard')
$lines.Add('# deletes the file. removed: that client neither defines, documents nor calls it. Names Check-Repo.removed-api')
$lines.Add('# lists are left out.')
$lines.Add('#')
$lines.Add('# Clients: ' + (($targets | ForEach-Object { "$_ $(Get-CloneVersion (Join-Path $UiSource $_))" }) -join ', '))
$lines.Add('')
foreach ($name in $names) {
    $entry = $entries[$name]
    $replacement = if ($entry.Replacement) { $entry.Replacement } else { '-' }
    $lines.Add("$name $replacement $($entry.States -join ',')")
}
[IO.File]::WriteAllText($out, ($lines -join "`r`n"), [Text.UTF8Encoding]::new($false))
"Check-Repo.deprecated-api: $($names.Count) names for $($targets -join ', ')"