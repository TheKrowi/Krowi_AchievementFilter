<#
.SYNOPSIS
    Removes a worktree made by New-Worktree.ps1 once nothing in it would be lost; the branch and its commits
    stay unless -DeleteBranch.

.DESCRIPTION
    Refuses when the worktree or one of its submodules has uncommitted or untracked changes (unless -Force),
    when the current directory is inside it, and for the main checkout. It cannot see a Claude session or an
    editor that still has the folder open; close those first.

    Directory junctions inside the worktree (the older way of linking Libs\ from the main checkout) are unlinked
    first, because a recursive delete through one wipes the main checkout's files. Then git worktree remove
    --force, which git requires for any worktree with submodules, and git worktree prune.

.PARAMETER Name
    The folder under .claude\worktrees\, the branch checked out there, or the worktree's full path.

.PARAMETER DeleteBranch
    Also delete the branch, but only when it is merged into the local dev.

.PARAMETER Force
    Remove even with uncommitted changes, which are then lost.

.PARAMETER WhatIf
    Prints what would be removed without doing it.

.EXAMPLE
    & ".claude\tools\Remove-Worktree.ps1" feature-2026-10-11-achievement-guides -DeleteBranch
    & ".claude\tools\Remove-Worktree.ps1" fix/2026-10-12-tooltip -WhatIf
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)][string]$Name,
    [switch]$DeleteBranch,
    [switch]$Force,
    [switch]$WhatIf
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
# run from a worktree, the main checkout is the parent of the shared .git folder
$common = (git -C $root rev-parse --path-format=absolute --git-common-dir).Trim() -replace '/', '\'
$main = Split-Path $common -Parent

# --- Find it in git worktree list ---------------------------------------------------------------------
$worktrees = @()
foreach ($line in (git -C $main worktree list --porcelain)) {
    if ($line -like 'worktree *') { $worktrees += [pscustomobject]@{ Path = $line.Substring(9) -replace '/', '\'; Branch = $null } }
    elseif ($line -like 'branch refs/heads/*') { $worktrees[-1].Branch = $line.Substring(18) }
}
$byFolder = Join-Path $main ".claude\worktrees\$($Name -replace '[\\/]', '-')"
$byPath = if (Test-Path -LiteralPath $Name) { (Resolve-Path -LiteralPath $Name).ProviderPath.TrimEnd('\') } else { $null }
$wt = $worktrees | Where-Object { $_.Path -eq $byFolder -or $_.Path -eq $byPath -or $_.Branch -eq $Name } | Select-Object -First 1
if (-not $wt) { throw "No worktree matches '$Name'. git worktree list:`n$((git -C $main worktree list) -join "`n")" }
if ($wt.Path -eq $main) { throw "'$Name' is the main checkout, which is never removed." }
$here = (Get-Location).ProviderPath
if ("$here\".StartsWith("$($wt.Path)\", [StringComparison]::OrdinalIgnoreCase)) { throw "The current directory is inside $($wt.Path); leave it first." }

# --- What would be lost --------------------------------------------------------------------------------
$junctions = @(Get-ChildItem -LiteralPath $wt.Path -Recurse -Directory -Force -Attributes ReparsePoint -ErrorAction SilentlyContinue)
# a junctioned submodule is not a repository of this worktree, so its status cannot be read
$ignore = if ($junctions) { 'all' } else { 'none' }
$dirty = @(git -C $wt.Path status --porcelain "--ignore-submodules=$ignore")
if ($LASTEXITCODE -ne 0) { throw "git status failed in $($wt.Path)." }

"Worktree $($wt.Path)"
if ($wt.Branch) {
    $ahead = git -C $main rev-list --count "dev..$($wt.Branch)"
    $upstream = git -C $main rev-parse --abbrev-ref "$($wt.Branch)@{upstream}" 2>$null
    $pushed = if ($LASTEXITCODE -eq 0) { "upstream $upstream" } else { 'not pushed' }
    "  branch $($wt.Branch): $ahead commit(s) not on dev, $pushed"
}
else { '  detached HEAD, no branch' }
foreach ($j in $junctions) { "  junction $($j.FullName.Substring($wt.Path.Length + 1)): unlinked first, its target is kept" }
if ($dirty) {
    "  uncommitted:"
    $dirty | ForEach-Object { "    $_" }
}
$refusal = if ($dirty -and -not $Force) { 'Not removed: commit or stash the changes above, or pass -Force to discard them.' }

if ($WhatIf) {
    if ($refusal) { "  -WhatIf: would be refused. $refusal" }
    else { "  -WhatIf: nothing removed$(if ($DeleteBranch -and $wt.Branch) { "; -DeleteBranch deletes $($wt.Branch) only if it is merged into dev" })" }
    exit 0
}
if ($refusal) { Write-Error $refusal }

# --- Remove -----------------------------------------------------------------------------------------------
foreach ($j in $junctions) {
    cmd /c rmdir "$($j.FullName)"   # removes the link only, never what it points to
    if ($LASTEXITCODE -ne 0) { throw "Could not unlink the junction $($j.FullName); nothing else was removed." }
}
$output = git -C $main worktree remove --force $wt.Path 2>&1 | ForEach-Object { "$_" }
if ($LASTEXITCODE -ne 0) { throw "git worktree remove failed (an open editor or shell holding a file?):`n$($output -join "`n")" }
git -C $main worktree prune
"  removed"

if ($DeleteBranch -and $wt.Branch) {
    # merged means reachable from dev, as a merge-commit PR leaves it; git branch -d would also accept a
    # branch that is only pushed
    git -C $main merge-base --is-ancestor $wt.Branch dev
    if ($LASTEXITCODE -eq 0) {
        git -C $main branch -D $wt.Branch | Out-Null
        "  branch $($wt.Branch) deleted (merged into dev)"
    }
    else { Write-Warning "Branch $($wt.Branch) kept: it is not merged into the local dev (git pull in the main checkout if its PR was merged)." }
}