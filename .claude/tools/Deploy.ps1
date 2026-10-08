<#
.SYNOPSIS
    Mirrors the addon into a World of Warcraft client's AddOns folder, exactly like the fsdeploy
    configuration in .vscode/settings.json, so a deploy no longer needs VS Code.

.DESCRIPTION
    Copies every *.lua, *.blp, *.tga and *.xml file (plus LICENSE and the .toc at the root) that is
    not under a .git, .github, .vscode, .claude, _Packaging, raw, wiki or docs folder at any depth
    (fsdeploy's **/{...}/** pattern, which also skips a library's own _Packaging), and deletes files in
    the destination that no longer exist in the repo. Only files whose size or timestamp differ are
    copied. Nothing outside the destination folder is touched.

    The game reads the files on the next /reload; saved variables (and BugGrabber's error log) are
    written on /reload or logout, so: Deploy -> /reload in game -> Read-GameErrors.ps1.

.PARAMETER Client
    Retail (_retail_), Classic (_classic_), Ptr (_ptr_, the wowt test realm) or Xptr (_xptr_, the second test realm, wowxptr). Default Retail.

.PARAMETER Destination
    Overrides the destination folder entirely.

.PARAMETER WhatIf
    Lists what would be copied and deleted without doing it.

.EXAMPLE
    & ".claude\tools\Deploy.ps1"
    & ".claude\tools\Deploy.ps1" -Client Classic -WhatIf
#>
[CmdletBinding()]
param(
    [ValidateSet('Retail', 'Classic', 'Ptr', 'Xptr')][string]$Client = 'Retail',
    [string]$Destination,
    [switch]$WhatIf
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
$addonName = 'Krowi_AchievementFilter'
$flavor = @{ Retail = '_retail_'; Classic = '_classic_'; Ptr = '_ptr_'; Xptr = '_xptr_' }[$Client]
if (-not $Destination) { $Destination = "H:\World of Warcraft\$flavor\Interface\AddOns\$addonName" }

$addOnsFolder = Split-Path $Destination -Parent
if (-not (Test-Path -LiteralPath $addOnsFolder)) { throw "AddOns folder not found: $addOnsFolder (is the $Client client installed?)" }

$excludedDirs = @('.git', '.github', '.vscode', '.claude', '_Packaging', 'raw', 'wiki', 'docs')
$extensions = @('.lua', '.blp', '.tga', '.xml')

function Get-Relative([string]$base, [string]$full) { $full.Substring($base.Length).TrimStart('\') }

# --- Source set ----------------------------------------------------------------------------------
$source = @{}
foreach ($f in Get-ChildItem -LiteralPath $root -File) {
    if ($f.Name -eq 'LICENSE' -or $f.Extension -eq '.toc' -or $extensions -contains $f.Extension) { $source[$f.Name] = $f }
}
foreach ($d in Get-ChildItem -LiteralPath $root -Directory | Where-Object { $excludedDirs -notcontains $_.Name }) {
    foreach ($f in Get-ChildItem -LiteralPath $d.FullName -Recurse -File | Where-Object { $extensions -contains $_.Extension }) {
        $rel = Get-Relative $root $f.FullName
        $folders = $rel.Split('\') | Select-Object -SkipLast 1
        if ($folders | Where-Object { $excludedDirs -contains $_ }) { continue } # fsdeploy excludes these at any depth
        $source[$rel] = $f
    }
}

# --- Destination set -------------------------------------------------------------------------------
$target = @{}
if (Test-Path -LiteralPath $Destination) {
    foreach ($f in Get-ChildItem -LiteralPath $Destination -Recurse -File) { $target[(Get-Relative $Destination $f.FullName)] = $f }
}

# --- Plan ------------------------------------------------------------------------------------------
$toCopy = @()
$unchanged = 0
$md5 = [System.Security.Cryptography.MD5]::Create()
function Get-Hash([string]$path) { [BitConverter]::ToString($md5.ComputeHash([IO.File]::ReadAllBytes($path))) }
foreach ($rel in $source.Keys) {
    $s = $source[$rel]; $t = $target[$rel]
    $same = $false
    if ($t -and $t.Length -eq $s.Length) {
        # timestamps differ after a VS Code fsdeploy copy, so compare content when sizes match
        $same = ([math]::Abs(($t.LastWriteTimeUtc - $s.LastWriteTimeUtc).TotalSeconds) -lt 2) -or ((Get-Hash $s.FullName) -eq (Get-Hash $t.FullName))
    }
    if ($same) { $unchanged++ } else { $toCopy += $rel }
}
$toDelete = @($target.Keys | Where-Object { -not $source.ContainsKey($_) })

"Deploy $Client -> $Destination"
"  $($source.Count) source files: $unchanged unchanged, $($toCopy.Count) to copy, $($toDelete.Count) to delete"
if ($WhatIf) {
    foreach ($rel in ($toCopy | Sort-Object | Select-Object -First 40)) { "  copy   $rel" }
    if ($toCopy.Count -gt 40) { "  ... and $($toCopy.Count - 40) more" }
    foreach ($rel in ($toDelete | Sort-Object)) { "  delete $rel" }
    exit 0
}

# --- Execute -----------------------------------------------------------------------------------------
foreach ($rel in $toCopy) {
    $dest = Join-Path $Destination $rel
    $dir = Split-Path $dest -Parent
    if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    Copy-Item -LiteralPath $source[$rel].FullName -Destination $dest -Force
}
foreach ($rel in $toDelete) { Remove-Item -LiteralPath (Join-Path $Destination $rel) -Force }
# prune directories left empty by deletions
if ($toDelete.Count -gt 0) {
    Get-ChildItem -LiteralPath $Destination -Recurse -Directory | Sort-Object FullName -Descending |
        Where-Object { -not (Get-ChildItem -LiteralPath $_.FullName -Force | Select-Object -First 1) } |
        ForEach-Object { Remove-Item -LiteralPath $_.FullName -Force }
}
"  done: $($toCopy.Count) copied, $($toDelete.Count) deleted. Type /reload in the $Client client to pick the files up."