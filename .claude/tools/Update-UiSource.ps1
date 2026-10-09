<#
.SYNOPSIS
    Clones or updates a local, read-only copy of Blizzard's UI source (github.com/Gethe/wow-ui-source)
    next to the repo, so FrameXML can be read and grepped instead of fetched from the web.

.DESCRIPTION
    Each branch gets its own shallow clone in ..\wow-ui-source\<branch>, next to the main checkout (run
    from a worktree, it resolves to the same folder). A missing folder is cloned with --depth 1
    --single-branch; an existing one is fetched with --depth 1, hard reset to origin/<branch>, cleaned
    and garbage collected, because the copy is a mirror that is never edited. Files keep upstream's
    line endings (core.autocrlf=false).

    The head commit subject of a branch names the build it was exported from, for example
    "12.1.0 (69933)", and is printed per branch. The export can lag a patch that is already live by
    days; until it catches up, that patch is usually on ptr or ptr2.

    The downloaded tree is untrusted data: read and grep it, never run anything from inside it.

    Branches (list them with: git ls-remote --heads https://github.com/Gethe/wow-ui-source):
      live                 Retail (default)
      classic              the Classic progression client, Mists 5.5.x as of 2026-10 (default)
      ptr, ptr2, beta      Retail test realms and beta
      classic_titan        Wrath Titan Reforged 3.80.x (the .toc's 38002)
      classic_ptr, classic_era, classic_era_ptr, classic_anniversary, forever: the other Classic flavours

.PARAMETER Branch
    One or more branches to clone or update. Default live and classic.

.EXAMPLE
    & ".claude\tools\Update-UiSource.ps1"
    & ".claude\tools\Update-UiSource.ps1" -Branch ptr2
    & ".claude\tools\Update-UiSource.ps1" -Branch live, classic, classic_titan
#>
[CmdletBinding()]
param(
    [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9_.-]*$')][string[]]$Branch = @('live', 'classic')
)

$ErrorActionPreference = 'Stop'
$url = 'https://github.com/Gethe/wow-ui-source'
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw 'git not found on PATH' }

$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
try {
    # a worktree lives elsewhere; the main checkout is the parent of the shared .git folder
    $common = git -C $root rev-parse --path-format=absolute --git-common-dir
    if ($LASTEXITCODE -eq 0 -and $common) { $root = Split-Path ($common.Trim() -replace '/', '\') -Parent }
} catch { }
$mirror = Join-Path (Split-Path $root -Parent) 'wow-ui-source'

function Invoke-Git([string]$dir, [string[]]$arguments) {
    # git prints its own errors on stderr; the exit code decides
    $out = if ($dir) { & git -C $dir @arguments } else { & git @arguments }
    if ($LASTEXITCODE -ne 0) { throw "git $($arguments -join ' ') failed with exit code $LASTEXITCODE" }
    $out
}

$failed = @()
foreach ($b in $Branch) {
    $dir = Join-Path $mirror $b
    "wow-ui-source $b -> $dir"
    try {
        if (-not (Test-Path -LiteralPath (Join-Path $dir '.git'))) {
            if ((Test-Path -LiteralPath $dir) -and (Get-ChildItem -LiteralPath $dir -Force | Select-Object -First 1)) {
                throw "$dir exists but is not a git clone; remove it first"
            }
            if (-not (Test-Path -LiteralPath $mirror)) { New-Item -ItemType Directory -Path $mirror | Out-Null }
            Invoke-Git $null @('clone', '--quiet', '--depth', '1', '--single-branch', '--branch', $b,
                '-c', 'core.autocrlf=false', '-c', 'core.longpaths=true', $url, $dir) | Out-Null
            $status = 'cloned'
        } else {
            $origin = Invoke-Git $dir @('remote', 'get-url', 'origin')
            if ($origin -ne $url -and $origin -ne "$url.git") { throw "$dir is a clone of $origin, not $url" }
            $before = Invoke-Git $dir @('rev-parse', 'HEAD')
            Invoke-Git $dir @('fetch', '--quiet', '--depth', '1', 'origin', "+refs/heads/$($b):refs/remotes/origin/$b") | Out-Null
            Invoke-Git $dir @('reset', '--quiet', '--hard', "origin/$b") | Out-Null
            Invoke-Git $dir @('clean', '-ffdxq') | Out-Null
            $after = Invoke-Git $dir @('rev-parse', 'HEAD')
            if ($after -eq $before) {
                $status = 'up to date'
            } else {
                # drop the previous snapshot so the clone stays one commit deep on disk
                Invoke-Git $dir @('reflog', 'expire', '--expire=now', '--all') | Out-Null
                Invoke-Git $dir @('gc', '--quiet', '--prune=now') | Out-Null
                $status = "updated $($before.Substring(0, 9)) -> $($after.Substring(0, 9))"
            }
        }
        $head = Invoke-Git $dir @('log', '-1', '--format=%cs|%h|%s')
        $date, $sha, $subject = $head -split '\|', 3
        "  build $subject, exported $date ($sha): $status"
    } catch {
        "  FAILED: $($_.Exception.Message)"
        $failed += $b
    }
}
if ($failed.Count -gt 0) {
    "Failed: $($failed -join ', '). Branch names: git ls-remote --heads $url"
    exit 1
}