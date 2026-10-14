<#
.SYNOPSIS
    Rebuilds .claude\tools\Check-Repo.deprecated-api, the list of Blizzard globals the Check-Repo `deprecated-api`
    rule reports, from the local wow-ui-source clones of the clients the .toc lists.

.DESCRIPTION
    Blizzard keeps old global names alive for a while as aliases in deprecation addons
    (`ChatEdit_InsertLink = ChatFrameUtil.InsertLink;`), which load only while the loadDeprecationFallbacks CVar is
    on, and deletes those files in a later patch (12.1.5 deleted ten). Reading such a name works on a client with the
    CVar on and errors for everyone else (docs/work/2026-10-14-deprecated-api-lint).

    For each client the .toc's Interface line lists, the script reads that client's clone once:
      - a deprecation file is one under a Blizzard_Deprecated* or Deprecated_* addon, or one whose code checks
        loadDeprecationFallbacks. A per-game variant (`Deprecated_Specialization_Mists.lua`, which the addon's .toc
        loads as `_[Game]`) counts only for its own game: Standard for Retail, Mists, Wrath (Titan), TBC, Vanilla.
        Its aliases are the PascalCase or UPPER_CASE assignments and functions outside table constructors, with
        the replacement when the alias names one; comments are skipped.
      - every other file says what the client has for real: top-level definitions, documented namespace-less
        functions, and names its own code calls as functions (an undocumented engine function shows up that way).
    A name is "deprecated" on a client that has it only as an alias, "removed" on a client that neither aliases,
    defines, documents nor calls it, and skipped where it is real. A name the previous list held that no longer
    appears in any deprecation file is kept, as removed, while no listed client has it for real, so a deleted file
    does not silently drop its names. Names in Check-Repo.removed-api are left out (that rule reports them).

    The classification is a port of Krowi_ClaudeKit's tools\Find-DeprecatedApi.ps1; keep the two in step. The list
    is committed, so the rule runs offline for everyone. Run this after Update-UiSource.ps1 on a patch day and commit
    the diff; a run on unchanged clones writes the same bytes. The clones are untrusted data: they are only read.

    Interface versions map to clones: 12.x live, 5.x classic, 3.x classic_titan, 2.x classic_anniversary, 1.60+
    forever, other 1.x classic_era.

.PARAMETER UiSource
    The folder holding the clones. Default: ..\wow-ui-source next to the main checkout, where Update-UiSource.ps1
    puts them (a worktree resolves to the same folder).

.EXAMPLE
    & ".claude\tools\Update-UiSource.ps1" -Branch live, classic, classic_titan
    & ".claude\tools\Update-DeprecatedApi.ps1"
#>
[CmdletBinding()]
param(
    [string]$UiSource
)

$ErrorActionPreference = 'Stop'
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

# --- The clients the .toc lists --------------------------------------------------------------------------
function Get-Branch([int]$number) {
    $major = [Math]::Floor($number / 10000)
    $minor = [Math]::Floor(($number % 10000) / 100)
    switch ($major) {
        12 { 'live' }
        5 { 'classic' }
        3 { 'classic_titan' }
        2 { 'classic_anniversary' }
        1 { if ($minor -ge 60) { 'forever' } else { 'classic_era' } }
        default { $null }
    }
}
$gameOf = @{ live = @('Standard', 'Mainline'); classic = @('Mists'); classic_titan = @('Wrath'); classic_anniversary = @('TBC'); classic_era = @('Vanilla') }
$toc = Get-ChildItem -LiteralPath $repo -Filter '*.toc' -File | Select-Object -First 1
$interfaceLine = if ($toc) { Get-Content -LiteralPath $toc.FullName | Where-Object { $_ -match '^##\s*Interface:' } | Select-Object -First 1 }
if (-not $interfaceLine) { throw "No '## Interface:' line in a .toc under $repo." }
$targets = [Collections.Generic.List[string]]::new()
foreach ($number in [regex]::Matches($interfaceLine, '\d+').Value) {
    $branch = Get-Branch ([int]$number)
    if (-not $branch) { throw "Interface $number has no wow-ui-source branch in this script's map; add it to Get-Branch." }
    if (-not $targets.Contains($branch)) { $targets.Add($branch) }
}
foreach ($branch in $targets) {
    if (-not (Test-Path -LiteralPath (Join-Path $UiSource "$branch\Interface\AddOns"))) {
        throw "No wow-ui-source clone '$branch' in $UiSource; run .claude\tools\Update-UiSource.ps1 -Branch $branch"
    }
}

function Get-CloneVersion([string]$path) { (git -C $path log -1 --format=%s 2>$null) }

# --- Read each listed client once ---------------------------------------------------------------------------
$aliasLine = [regex]'^\s*([A-Z][A-Za-z0-9_]*)\s*=\s*(.*?)\s*;?\s*$'
$aliasFunction = [regex]'^\s*function\s+([A-Z][A-Za-z0-9_]*)\s*\('
$replacementForm = [regex]'^[A-Z][A-Za-z0-9_]*(\.[A-Za-z_][A-Za-z0-9_]*)*$'
$longComment = [regex]::new('--\[(=*)\[.*?\]\1\]', 'Singleline')
$topLevel = [regex]::new('(?m)^(?:function\s+([A-Z]\w*)\s*\(|([A-Z]\w*)\s*=)', 'Compiled')
$called = [regex]::new('(?<![\w.:])([A-Z][A-Za-z0-9_]*)\s*\(', 'Compiled')
$variant = [regex]'_(Standard|Mainline|Vanilla|TBC|Wrath|Cata|Mists)\.lua$'
$clients = @{}   # branch -> @{ Aliases = name -> replacement; Real = name -> $true; Called = name -> $true }
foreach ($branch in $targets) {
    $addOns = Join-Path $UiSource "$branch\Interface\AddOns"
    $client = @{
        Aliases = [hashtable]::new([StringComparer]::Ordinal)   # Lua names are case-sensitive, @{} is not
        Real = [hashtable]::new([StringComparer]::Ordinal)
        Called = [hashtable]::new([StringComparer]::Ordinal)
    }
    $clients[$branch] = $client
    $paths = [IO.Directory]::GetFiles((Join-Path $UiSource "$branch\Interface"), '*.lua', 'AllDirectories')
    [Array]::Sort($paths, [StringComparer]::Ordinal)
    foreach ($path in $paths) {
        $text = [IO.File]::ReadAllText($path)
        $addOn = if ($path.StartsWith($addOns, 'OrdinalIgnoreCase')) { $path.Substring($addOns.Length + 1).Split('\')[0] } else { '' }
        $isDeprecation = $addOn -like 'Blizzard_Deprecated*' -or $addOn -like 'Deprecated_*' -or $text.Contains('loadDeprecationFallbacks')
        if ($isDeprecation) {
            $m = $variant.Match($path)
            if ($m.Success -and $gameOf[$branch] -notcontains $m.Groups[1].Value) { continue }   # another game's variant: not loaded here
            # Aliases sit in do-blocks, so leading whitespace is allowed; the PascalCase or UPPER_CASE name keeps out
            # the camelCase locals of function bodies, and the brace depth the fields of multi-line table constructors.
            $depth = 0
            foreach ($line in ($longComment.Replace($text, '') -split '\r?\n')) {
                $bare = $line -replace '--.*$', '' -replace '"(\\.|[^"\\])*"', '""' -replace "'(\\.|[^'\\])*'", "''"
                $outside = $depth -eq 0
                $depth += ([regex]::Matches($bare, '\{').Count - [regex]::Matches($bare, '\}').Count)
                if (-not $outside) { continue }
                $name = $null; $replacement = ''
                $fm = $aliasFunction.Match($bare)
                if ($fm.Success) { $name = $fm.Groups[1].Value }
                else {
                    $am = $aliasLine.Match($bare)
                    if ($am.Success -and $am.Groups[2].Value -ne 'nil') {
                        $name = $am.Groups[1].Value
                        if ($replacementForm.IsMatch($am.Groups[2].Value)) { $replacement = $am.Groups[2].Value }
                    }
                }
                if (-not $name) { continue }
                if (-not $client.Aliases.ContainsKey($name) -or (-not $client.Aliases[$name] -and $replacement)) { $client.Aliases[$name] = $replacement }
            }
            continue
        }
        if ($path -like '*\Blizzard_APIDocumentationGenerated\*') {
            if ($text -notmatch '(?m)^\s*Namespace\s*=') {
                foreach ($dm in [regex]::Matches($text, 'Name = "([A-Za-z_]\w*)",\s*\r?\n\s*Type = "Function"')) { $client.Real[$dm.Groups[1].Value] = $true }
            }
            continue
        }
        foreach ($tm in $topLevel.Matches($text)) { $client.Real[$tm.Groups[1].Value + $tm.Groups[2].Value] = $true }
        foreach ($cm in $called.Matches($text)) { $client.Called[$cm.Groups[1].Value] = $true }
    }
}

# --- Classify -----------------------------------------------------------------------------------------------
function Get-States([string]$name) {
    $states = [Collections.Generic.List[string]]::new()
    foreach ($branch in $targets) {
        $client = $clients[$branch]
        if ($client.Real.ContainsKey($name)) { continue }                              # a real API on this client
        if ($client.Aliases.ContainsKey($name)) { $states.Add("$branch=deprecated"); continue }
        if ($client.Called.ContainsKey($name)) { continue }                            # its own code calls it: an undocumented engine function
        $states.Add("$branch=removed")
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
$lines.Add('# regenerate after .claude/tools/Update-UiSource.ps1 on a patch day and commit the diff.')
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