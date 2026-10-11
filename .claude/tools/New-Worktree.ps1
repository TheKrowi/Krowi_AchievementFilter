<#
.SYNOPSIS
    Creates a git worktree under .claude\worktrees\ so a parallel session gets its own folder, branch, index and
    HEAD instead of sharing the main checkout, with the Libs\ submodules and settings.local.json in place.

.DESCRIPTION
    A new branch starts from -Base (dev) without tracking it. An existing local or origin branch is checked out
    instead; git refuses a branch that another worktree already has checked out, which is what keeps two
    sessions off one branch. Run it from the main checkout or from any worktree: the new one always goes under
    the main checkout's .claude\worktrees\, which is gitignored and skipped by the lint, the language server,
    fsdeploy, Deploy.ps1 and the release zip.

    The Libs\ submodules are cloned from the main checkout's .git\modules (offline, under a second each) and
    then pointed at their GitHub remotes; a submodule commit the main checkout never fetched comes from GitHub.
    .claude\settings.local.json, which git does not track, is copied from the main checkout.

    Worktrees share every commit and branch, so another session sees a commit without a push. They do not
    isolate the game: one AddOns folder per client, so the last Deploy.ps1 run or fsdeploy save wins.

.PARAMETER Branch
    The branch to work on; created from -Base when neither it nor origin/<Branch> exists.

.PARAMETER Name
    The folder under .claude\worktrees\. Default: the branch with / turned into -.

.PARAMETER Base
    The start of a new branch. Default dev.

.EXAMPLE
    & ".claude\tools\New-Worktree.ps1" feature/2026-10-11-achievement-guides
    & ".claude\tools\New-Worktree.ps1" fix/2026-10-12-tooltip -Base origin/dev
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)][string]$Branch,
    [string]$Name,
    [string]$Base = 'dev'
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
# run from a worktree, the main checkout is the parent of the shared .git folder
$common = (git -C $root rev-parse --path-format=absolute --git-common-dir).Trim() -replace '/', '\'
$main = Split-Path $common -Parent

if (-not $Name) { $Name = $Branch -replace '[\\/]', '-' }
if ($Name -notmatch '^[\w.-]+$') { throw "Worktree name '$Name' may hold only letters, digits, '.', '_' and '-'." }
$path = Join-Path $main ".claude\worktrees\$Name"
if (Test-Path -LiteralPath $path) { throw "$path already exists; git worktree list shows what is checked out where." }

function Invoke-Git {
    $output = & git @args 2>&1 | ForEach-Object { "$_" }
    if ($LASTEXITCODE -ne 0) { throw "git $($args -join ' ') failed:`n$($output -join "`n")" }
}

# --- Worktree and branch ---------------------------------------------------------------------------
git -C $main show-ref --verify --quiet "refs/heads/$Branch"
$hasLocal = $LASTEXITCODE -eq 0
git -C $main show-ref --verify --quiet "refs/remotes/origin/$Branch"
$hasRemote = $LASTEXITCODE -eq 0
if ($hasLocal -or $hasRemote) {
    Invoke-Git -C $main worktree add $path $Branch   # origin-only: git creates the local branch tracking it
    $how = if ($hasLocal) { 'existing branch' } else { "new, tracking origin/$Branch" }
}
else {
    $behind = git -C $main rev-list --count "$Base..$Base@{upstream}" 2>$null
    if ($LASTEXITCODE -eq 0 -and [int]$behind -gt 0) {
        Write-Warning "$Base is $behind commit(s) behind its upstream as of the last fetch; git pull in the main checkout first if they matter."
    }
    Invoke-Git -C $main worktree add --no-track -b $Branch $path $Base
    $how = "new, from $Base"
}

# --- Submodules --------------------------------------------------------------------------------------
$copied = 0; $fetched = 0; $failed = @()
foreach ($line in (git -C $path config -f .gitmodules --get-regexp '^submodule\..*\.path$')) {
    if ($line -notmatch '^submodule\.(.+)\.path (.+)$') { continue }
    $subName = $Matches[1]; $subPath = $Matches[2]
    $url = git -C $path config --get "submodule.$subName.url"
    if (-not $url) { $url = git -C $path config -f .gitmodules --get "submodule.$subName.url" }

    $ok = $false
    $localRepo = Join-Path $common "modules\$subName"
    if (Test-Path -LiteralPath $localRepo) {
        # -c only for this run: the shared .git\config keeps the GitHub url
        git -C $path -c protocol.file.allow=always -c "submodule.$subName.url=$localRepo" submodule update --init -- $subPath 2>&1 | Out-Null
        $ok = $LASTEXITCODE -eq 0
    }
    $subRepo = Join-Path $path $subPath
    if (Test-Path -LiteralPath (Join-Path $subRepo '.git')) { git -C $subRepo remote set-url origin $url }
    if ($ok) { $copied++; continue }

    $output = git -C $path submodule update --init -- $subPath 2>&1 | ForEach-Object { "$_" }
    if ($LASTEXITCODE -eq 0) { $fetched++ } else { $failed += "$subPath`: $($output -join ' ')" }
}

# --- Local settings ----------------------------------------------------------------------------------
$localSettings = Join-Path $main '.claude\settings.local.json'
$settingsNote = 'no settings.local.json in the main checkout'
if (Test-Path -LiteralPath $localSettings) {
    Copy-Item -LiteralPath $localSettings -Destination (Join-Path $path '.claude\settings.local.json')
    $settingsNote = 'settings.local.json copied'
}

"Worktree $path"
"  branch $Branch ($how) at $(git -C $path log -1 --format='%h %s')"
"  submodules: $copied copied from the main checkout, $fetched fetched from GitHub; $settingsNote"
foreach ($f in $failed) { Write-Warning "submodule $f" }
"Work in it from its own VS Code window (code `"$path`"), or let a running Claude session switch with EnterWorktree and this path."
"Deploy it with its own Deploy.ps1; when its branch is merged: & `".claude\tools\Remove-Worktree.ps1`" $Name -DeleteBranch"
if ($failed) { exit 1 }