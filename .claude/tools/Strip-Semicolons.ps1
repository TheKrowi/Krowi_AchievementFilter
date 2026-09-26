<#
.SYNOPSIS
    Removes trailing statement semicolons from the addon's Lua files and proves each edit
    with the vendored Lua 5.1.5 compiler.

.DESCRIPTION
    For every file, the script compiles the original with `luac -s` (debug info stripped, so
    line numbers do not matter), rewrites it through lua51/strip-semicolons.lua, compiles the
    result the same way and compares the two bytecode images byte for byte. The rewritten file
    replaces the original only when both compile and the bytecode is identical; anything else
    is reported and the original is left alone.

    Scope: every tracked .lua file except Libs/ and the non-addon folders Check-Repo.ps1 skips
    (.claude, .github, .vscode, _Packaging, raw, wiki, docs). Pass -Path to limit it.

.PARAMETER Path
    Files (repo-relative or absolute) to process instead of the whole tree.

.PARAMETER DryRun
    Verify and report, write nothing.

.EXAMPLE
    & ".claude\tools\Strip-Semicolons.ps1" -DryRun
    & ".claude\tools\Strip-Semicolons.ps1" -Path Globals.lua, Filters.lua
#>
[CmdletBinding()]
param(
    [string[]]$Path,
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$lua = Join-Path $PSScriptRoot 'lua51\lua.exe'
$luac = Join-Path $PSScriptRoot 'lua51\luac.exe'
$stripper = Join-Path $PSScriptRoot 'lua51\strip-semicolons.lua'
foreach ($tool in $lua, $luac, $stripper) {
    if (-not (Test-Path $tool)) { throw "missing tool: $tool" }
}

$nonAddonDirs = @('.claude', '.git', '.github', '.vscode', '_Packaging', 'raw', 'wiki', 'docs', 'Libs')
Push-Location $root
try {
    if ($Path) {
        $files = @($Path | ForEach-Object { (Resolve-Path $_).Path })
    }
    else {
        $files = @(git ls-files '*.lua' | Where-Object { $nonAddonDirs -notcontains $_.Split('/')[0] } | ForEach-Object { Join-Path $root $_ })
    }
}
finally { Pop-Location }

$tmpDir = Join-Path ([IO.Path]::GetTempPath()) ("strip-semicolons-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tmpDir | Out-Null
$before = Join-Path $tmpDir 'before.luac'
$after = Join-Path $tmpDir 'after.luac'
$stripped = Join-Path $tmpDir 'stripped.lua'

$stats = [ordered]@{ files = 0; changed = 0; removed = 0; replaced = 0; kept = 0; failed = 0 }
$problems = [System.Collections.Generic.List[string]]::new()

function Compile([string]$source, [string]$target) {
    $out = & $luac -s -o $target $source 2>&1
    if ($LASTEXITCODE -ne 0) { return ($out | Out-String).Trim() }
    return $null
}

foreach ($file in $files) {
    $rel = $file.Substring($root.Length + 1).Replace('\', '/')
    $stats.files++

    $err = Compile $file $before
    if ($err) { $problems.Add("${rel}: original does not compile: $err"); $stats.failed++; continue }

    $counts = (& $lua $stripper $file $stripped 2>&1 | Out-String).Trim()
    if ($LASTEXITCODE -ne 0) { $problems.Add("${rel}: stripper failed: $counts"); $stats.failed++; continue }
    $removed, $replaced, $kept = $counts -split ' ' | ForEach-Object { [int]$_ }
    if ($removed + $replaced -eq 0) { $stats.kept += $kept; continue }

    $err = Compile $stripped $after
    if ($err) { $problems.Add("${rel}: stripped file does not compile: $err"); $stats.failed++; continue }

    $a = [IO.File]::ReadAllBytes($before)
    $b = [IO.File]::ReadAllBytes($after)
    if ($a.Length -ne $b.Length -or -not [Linq.Enumerable]::SequenceEqual($a, $b)) {
        $problems.Add("${rel}: bytecode differs after stripping; left untouched")
        $stats.failed++
        continue
    }

    $stats.changed++
    $stats.removed += $removed
    $stats.replaced += $replaced
    $stats.kept += $kept
    Write-Verbose ("{0}: -{1} semicolons, {2} -> comma, {3} kept" -f $rel, $removed, $replaced, $kept)
    if (-not $DryRun) { Copy-Item $stripped $file -Force }
}

Remove-Item $tmpDir -Recurse -Force

foreach ($p in $problems) { Write-Host $p -ForegroundColor Yellow }
$mode = if ($DryRun) { 'dry run' } else { 'written' }
Write-Host ("{0} files scanned, {1} {2}: {3} semicolons removed, {4} turned into table commas, {5} kept before '(', {6} files with problems" -f `
    $stats.files, $stats.changed, $mode, $stats.removed, $stats.replaced, $stats.kept, $stats.failed)
exit ([int]($stats.failed -gt 0))
