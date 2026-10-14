<#
.SYNOPSIS
    Rebuilds .claude\tools\Check-Repo.deprecated-api, the list of Blizzard globals the Check-Repo `deprecated-api`
    rule reports, from the local wow-ui-source clones of the clients the .toc lists.

.DESCRIPTION
    Blizzard keeps old global names alive for a while as aliases in its Blizzard_Deprecated* addons
    (`ChatEdit_InsertLink = ChatFrameUtil.InsertLink;`), which load only while the loadDeprecationFallbacks CVar is
    on, and deletes those files in a later patch (12.1.5 deleted ten). Reading such a name works on a client with the
    CVar on and errors for everyone else (docs/work/2026-10-14-deprecated-api-lint).

    The script reads the aliases from the Blizzard_Deprecated* addons of every clone in ..\wow-ui-source, then, for
    each client the .toc's Interface line lists, keeps the names that client defines only in a deprecated file
    ("deprecated") or not at all ("removed"). A name that is a real API on a client (a top-level FrameXML definition
    outside the deprecated addons, or a documented namespace-less function) is skipped for that client. The
    classification is a port of Krowi_ClaudeKit's tools\Find-DeprecatedApi.ps1; keep the two in step.

    The list is committed, so the rule runs offline for everyone. Run this after Update-UiSource.ps1 on a patch day
    and commit the diff; a run on unchanged clones writes the same bytes. The clones are untrusted data: they are
    only read.

    Interface majors map to clones: 12 live, 5 classic, 3 classic_titan, 2 classic_anniversary, 1 classic_era.

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
if (-not $UiSource) {
    $main = $repo
    try {
        # a worktree lives elsewhere; the main checkout is the parent of the shared .git folder
        $common = git -C $repo rev-parse --path-format=absolute --git-common-dir
        if ($LASTEXITCODE -eq 0 -and $common) { $main = Split-Path ($common.Trim() -replace '/', '\') -Parent }
    } catch { }
    $UiSource = Join-Path (Split-Path $main -Parent) 'wow-ui-source'
}
$out = Join-Path $PSScriptRoot 'Check-Repo.deprecated-api'

# --- The clients the .toc lists --------------------------------------------------------------------------
$branchOfMajor = @{ 12 = 'live'; 5 = 'classic'; 3 = 'classic_titan'; 2 = 'classic_anniversary'; 1 = 'classic_era' }
$toc = Get-ChildItem -LiteralPath $repo -Filter '*.toc' -File | Select-Object -First 1
$interfaceLine = if ($toc) { Get-Content -LiteralPath $toc.FullName | Where-Object { $_ -match '^##\s*Interface:' } | Select-Object -First 1 }
if (-not $interfaceLine) { throw "No '## Interface:' line in a .toc under $repo." }
$targets = [Collections.Generic.List[string]]::new()
foreach ($number in [regex]::Matches($interfaceLine, '\d+').Value) {
    $major = [int][Math]::Floor([int]$number / 10000)
    $branch = $branchOfMajor[$major]
    if (-not $branch) { throw "Interface $number (major $major) has no wow-ui-source branch in this script's map; add it." }
    if (-not $targets.Contains($branch)) { $targets.Add($branch) }
}
foreach ($branch in $targets) {
    if (-not (Test-Path -LiteralPath (Join-Path $UiSource "$branch\Interface\AddOns"))) {
        throw "No wow-ui-source clone '$branch' in $UiSource; run .claude\tools\Update-UiSource.ps1 -Branch $branch"
    }
}
$clones = @(Get-ChildItem -LiteralPath $UiSource -Directory | Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'Interface\AddOns') } | Sort-Object Name)

function Get-CloneVersion([string]$path) { (git -C $path log -1 --format=%s 2>$null) }

# --- The deprecated aliases, from every clone ---------------------------------------------------------------
# Inside the deprecated files the aliases sit in do-blocks, so leading whitespace is allowed; the PascalCase or
# UPPER_CASE name keeps out the camelCase locals of the function bodies, and the brace depth the fields of
# multi-line table constructors (`Invalid = 0,` in an enum table).
$aliasLine = [regex]'^\s*([A-Z][A-Za-z0-9_]*)\s*=\s*(.*?)\s*;?\s*$'
$aliasFunction = [regex]'^\s*function\s+([A-Z][A-Za-z0-9_]*)\s*\('
$replacementForm = [regex]'^[A-Z][A-Za-z0-9_]*(\.[A-Za-z_][A-Za-z0-9_]*)*$'
$aliases = [hashtable]::new([StringComparer]::Ordinal)          # Lua names are case-sensitive, @{} is not; name -> replacement ('' when the alias is a function body)
$aliasesOf = @{}                                                # clone -> names a deprecated file of that clone defines
foreach ($clone in $clones) {
    $own = [hashtable]::new([StringComparer]::Ordinal)
    $aliasesOf[$clone.Name] = $own
    $folders = Get-ChildItem -LiteralPath (Join-Path $clone.FullName 'Interface\AddOns') -Directory -Filter 'Blizzard_Deprecated*'
    foreach ($file in ($folders | ForEach-Object { Get-ChildItem -LiteralPath $_.FullName -Recurse -File -Filter '*.lua' } | Sort-Object FullName)) {
        $depth = 0
        foreach ($line in [IO.File]::ReadLines($file.FullName)) {
            $outside = $depth -eq 0
            $bare = $line -replace '--.*$', '' -replace '"(\\.|[^"\\])*"', '' -replace "'(\\.|[^'\\])*'", ''
            $depth += ([regex]::Matches($bare, '\{').Count - [regex]::Matches($bare, '\}').Count)
            if (-not $outside) { continue }
            $name = $null; $replacement = ''
            $m = $aliasFunction.Match($line)
            if ($m.Success) { $name = $m.Groups[1].Value }
            else {
                $m = $aliasLine.Match($line)
                if ($m.Success -and $m.Groups[2].Value -ne 'nil') {
                    $name = $m.Groups[1].Value
                    if ($replacementForm.IsMatch($m.Groups[2].Value)) { $replacement = $m.Groups[2].Value }
                }
            }
            if (-not $name) { continue }
            if (-not $aliases.ContainsKey($name) -or (-not $aliases[$name] -and $replacement)) { $aliases[$name] = $replacement }
            $own[$name] = $true
        }
    }
}
if ($aliases.Count -eq 0) { throw "No Blizzard_Deprecated* aliases found under $UiSource." }

# --- Per listed client: what it defines for real, and the state of every alias there ------------------------
$topLevel = [regex]::new('(?m)^(?:function\s+([A-Z]\w*)\s*\(|([A-Z]\w*)\s*=)', 'Compiled')
$states = [hashtable]::new([StringComparer]::Ordinal)          # name -> list of "<client>=<state>", in .toc order
foreach ($branch in $targets) {
    $root = Join-Path $UiSource $branch
    $addOns = Join-Path $root 'Interface\AddOns'
    $realGlobals = [hashtable]::new([StringComparer]::Ordinal)
    foreach ($path in [IO.Directory]::GetFiles((Join-Path $root 'Interface'), '*.lua', 'AllDirectories')) {
        if ($path.StartsWith($addOns, 'OrdinalIgnoreCase') -and $path.Substring($addOns.Length + 1) -like 'Blizzard_Deprecated*') { continue }
        $text = [IO.File]::ReadAllText($path)
        if ($path -like '*\Blizzard_APIDocumentationGenerated\*') {
            if ($text -notmatch '(?m)^\s*Namespace\s*=') {
                foreach ($m in [regex]::Matches($text, 'Name = "([A-Za-z_]\w*)",\s*\r?\n\s*Type = "Function"')) { $realGlobals[$m.Groups[1].Value] = $true }
            }
            continue
        }
        foreach ($m in $topLevel.Matches($text)) { $realGlobals[$m.Groups[1].Value + $m.Groups[2].Value] = $true }
    }
    foreach ($name in $aliases.Keys) {
        if ($realGlobals.ContainsKey($name)) { continue }   # a real API on this client, deprecated only in another flavour
        $state = if ($aliasesOf[$branch].ContainsKey($name)) { 'deprecated' } else { 'removed' }
        if (-not $states.ContainsKey($name)) { $states[$name] = [Collections.Generic.List[string]]::new() }
        $states[$name].Add("$branch=$state")
    }
}

# --- Write the list ---------------------------------------------------------------------------------------
$names = [string[]]@($states.Keys)
[Array]::Sort($names, [StringComparer]::Ordinal)
$lines = [Collections.Generic.List[string]]::new()
$lines.Add('# Blizzard globals that, on a client the .toc lists, exist only as a deprecated alias or not at all, for the')
$lines.Add('# Check-Repo.ps1 `deprecated-api` rule. Generated by .claude/tools/Update-DeprecatedApi.ps1: do not edit by hand,')
$lines.Add('# regenerate after .claude/tools/Update-UiSource.ps1 on a patch day and commit the diff.')
$lines.Add('# One "<name> <replacement or -> <client>=<state>,..." per line, sorted ordinally. deprecated: only a')
$lines.Add('# Blizzard_Deprecated* file of that client defines it, so it is nil with the loadDeprecationFallbacks CVar off and')
$lines.Add('# gone once Blizzard deletes the file. removed: that client defines it nowhere.')
$lines.Add('#')
$lines.Add('# Listed clients: ' + (($targets | ForEach-Object { "$_ $(Get-CloneVersion (Join-Path $UiSource $_))" }) -join ', '))
$lines.Add('# Aliases read from: ' + (($clones | ForEach-Object { "$($_.Name) $(Get-CloneVersion $_.FullName)" }) -join ', '))
$lines.Add('')
foreach ($name in $names) {
    $replacement = if ($aliases[$name]) { $aliases[$name] } else { '-' }
    $lines.Add("$name $replacement $($states[$name] -join ',')")
}
[IO.File]::WriteAllText($out, ($lines -join "`r`n"), [Text.UTF8Encoding]::new($false))
"Check-Repo.deprecated-api: $($names.Count) names for $($targets -join ', ') (aliases from $($clones.Count) clones)"