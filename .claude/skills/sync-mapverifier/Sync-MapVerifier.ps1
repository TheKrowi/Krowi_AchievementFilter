<#
.SYNOPSIS
    Normalises and validates raw\MapVerifier.csv, the canonical Map Verifier state.
.DESCRIPTION
    Workflow: in game, Map Verifier -> Export, copy the text, paste it over raw\MapVerifier.csv, run this
    script. It parses the file, validates it with the same rules as the in-game Import, patches cells the
    game could not fill ("?" name, empty mapType/parentMapID) from the committed version of the file,
    sorts by id, writes the canonical form back and prints what changed against git HEAD.
    -Validate only checks (content and order) and never writes; Check-Repo.ps1 runs this.
    -Verify parses the committed form, writes it to a temp file and compares bytes: the round-trip test.
    Exit 1 on validation errors (file left untouched) or a failed verify.
.EXAMPLE
    & ".claude\skills\sync-mapverifier\Sync-MapVerifier.ps1"
    & ".claude\skills\sync-mapverifier\Sync-MapVerifier.ps1" -Validate
    & ".claude\skills\sync-mapverifier\Sync-MapVerifier.ps1" -Verify
#>
param(
    [string] $Path = (Join-Path (Split-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) -Parent) 'raw\MapVerifier.csv'),
    [string] $Baseline,     # compare against and patch from this file instead of git HEAD
    [switch] $Validate,
    [switch] $Verify
)
Set-StrictMode -Version 3
$ErrorActionPreference = 'Stop'
. "$PSScriptRoot\_mapverifier_io.ps1"
$root = Split-Path (Split-Path $Path -Parent) -Parent
$rel = 'raw/MapVerifier.csv'

$read = Read-MapVerifierCsv $Path
$errors = @($read.Errors) + @(Test-MapVerifierRows $read.Rows)
if ($Validate -or $Verify) { $o = Test-MapVerifierOrder $read.Rows; if ($o) { $errors += $o } }
if ($errors.Count -gt 0) {
    foreach ($e in $errors) { Write-Host "[ERROR] $e" }
    Write-Host "FAIL — $($errors.Count) error(s) in $Path; nothing written."
    exit 1
}
$rows = $read.Rows

if ($Verify) {
    $current = [System.IO.File]::ReadAllText($Path, [System.Text.UTF8Encoding]::new($false))
    $canon = ConvertTo-MapVerifierText $rows
    if ($current -ceq $canon) { Write-Host "PASS — $($rows.Count) rows, file is in canonical form"; exit 0 }
    Write-Host "FAIL — file differs from its canonical form (line endings, quoting or order); run Sync-MapVerifier.ps1"; exit 1
}
if ($Validate) { Write-Host "PASS — $($rows.Count) rows valid"; exit 0 }

# ── committed version (or -Baseline), for patching and the change summary ──
$head = $null
if ($Baseline) {
    $head = Read-MapVerifierCsv $Baseline
    if ($head.Errors.Count -gt 0) { throw "baseline: $($head.Errors[0])" }
} else { try {
    Push-Location $root
    $headText = git show "HEAD:$rel" 2>$null
    Pop-Location
    if ($LASTEXITCODE -eq 0 -and $headText) {
        $tmp = [System.IO.Path]::GetTempFileName()
        [System.IO.File]::WriteAllText($tmp, ($headText -join "`n"), [System.Text.UTF8Encoding]::new($false))
        $head = Read-MapVerifierCsv $tmp
        Remove-Item $tmp
    }
} catch { Pop-Location -ErrorAction SilentlyContinue } }
$headById = @{}
if ($head) { foreach ($r in $head.Rows) { $headById[[int]$r.id] = $r } }

# ── patch game-derived cells the exporting client could not resolve ──
$patched = 0
foreach ($r in $rows) {
    $id = [int]$r.id
    if (-not $headById.ContainsKey($id)) { continue }
    $h = $headById[$id]
    if (($r.name -eq '?' -or $r.name -eq '') -and $h.name -ne '' -and $h.name -ne '?') { $r.name = $h.name; $patched++ }
    if ($r.mapType -eq '' -and $h.mapType -ne '') { $r.mapType = $h.mapType; $patched++ }
    if ($r.parentMapID -eq '' -and $h.parentMapID -ne '') { $r.parentMapID = $h.parentMapID; $patched++ }
}

# ── write canonical form ──
$before = if (Test-Path $Path) { [System.IO.File]::ReadAllText($Path, [System.Text.UTF8Encoding]::new($false)) } else { '' }
$after = ConvertTo-MapVerifierText $rows
if ($before -cne $after) { [System.IO.File]::WriteAllText($Path, $after, [System.Text.UTF8Encoding]::new($false)) }
Write-Host "$($rows.Count) rows written in canonical form$(if ($patched) { "; $patched cell(s) patched from HEAD" })$(if ($before -ceq $after) { ' (no byte changed)' })"

# ── change summary against HEAD ──
if (-not $head) { Write-Host "No committed version to compare against."; exit 0 }
Write-Host "`nChanges against $(if ($Baseline) { $Baseline } else { 'HEAD' }):"
$newById = @{}; foreach ($r in $rows) { $newById[[int]$r.id] = $r }
$added = @($newById.Keys | Where-Object { -not $headById.ContainsKey($_) } | Sort-Object)
$removed = @($headById.Keys | Where-Object { -not $newById.ContainsKey($_) } | Sort-Object)
$changes = @{}
foreach ($c in 'verdict', 'expansion', 'link', 'parentOverride', 'nameOverride', 'comment', 'name', 'mapType', 'parentMapID') { $changes[$c] = [System.Collections.Generic.List[string]]::new() }
foreach ($id in ($newById.Keys | Where-Object { $headById.ContainsKey($_) } | Sort-Object)) {
    $n = $newById[$id]; $h = $headById[$id]
    foreach ($c in $changes.Keys) { if ($n[$c] -cne $h[$c]) { $changes[$c].Add("$id $($n.name): '$($h[$c])' -> '$($n[$c])'") } }
}
Write-Host "  rows added: $($added.Count)$(if ($added) { ' (' + (($added | Select-Object -First 20) -join ', ') + $(if ($added.Count -gt 20) { ', ...' }) + ')' })"
Write-Host "  rows removed: $($removed.Count)$(if ($removed) { ' (' + (($removed | Select-Object -First 20) -join ', ') + $(if ($removed.Count -gt 20) { ', ...' }) + ')' })"
foreach ($c in 'verdict', 'expansion', 'link', 'parentOverride', 'nameOverride', 'comment') {
    $l = $changes[$c]
    Write-Host "  $c changed: $($l.Count)"
    foreach ($s in ($l | Select-Object -First 30)) { Write-Host "    $s" }
    if ($l.Count -gt 30) { Write-Host "    ... $($l.Count - 30) more" }
}
$gameCols = ($changes['name'].Count + $changes['mapType'].Count + $changes['parentMapID'].Count)
if ($gameCols) { Write-Host "  game-derived cells changed (name/mapType/parentMapID): $gameCols" }
exit 0
