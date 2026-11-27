<#
.SYNOPSIS
    Stop hook: runs the repo lint (Check-Repo.ps1 -ChangedOnly) when Claude finishes a turn, in the checkout the
    session works in (a worktree's own copy once it entered one). Errors are handed back so Claude fixes them
    before handing the work over. Fails open. Skips the lint when nothing changed since its last clean run
    (.claude\cache\stop-lint.fingerprint).

    stop_hook_active is true when this hook already sent Claude back once this turn; then we let
    the turn end so a finding Claude cannot fix does not loop forever.
#>
$ErrorActionPreference = 'Continue'

# What git sees of a checkout, added to $Lines: HEAD; the bytes of the diff against HEAD, the submodules' own changes
# included; each untracked file's name and blob, in the submodules too. Throws on any git failure.
function Add-TreeState([Collections.Generic.List[string]]$Lines, [string]$Dir) {
    $Lines.Add((git -C $Dir rev-parse HEAD)); if ($LASTEXITCODE -ne 0) { throw "rev-parse $Dir" }
    $diffFile = [IO.Path]::GetTempFileName()
    try {
        git -C $Dir diff HEAD --binary --submodule=diff "--output=$diffFile"; if ($LASTEXITCODE -ne 0) { throw "diff $Dir" }
        $Lines.Add((git hash-object -- $diffFile)); if ($LASTEXITCODE -ne 0) { throw "hash diff $Dir" }
    }
    finally { Remove-Item -LiteralPath $diffFile -Force -ErrorAction SilentlyContinue }
    $untracked = @(git -C $Dir -c core.quotePath=false ls-files -o --exclude-standard); if ($LASTEXITCODE -ne 0) { throw "ls-files $Dir" }
    if ($untracked.Count) {
        $blobs = @($untracked | git -C $Dir hash-object --stdin-paths); if ($LASTEXITCODE -ne 0) { throw "hash untracked $Dir" }
        for ($i = 0; $i -lt $untracked.Count; $i++) { $Lines.Add("$($untracked[$i]) $($blobs[$i])") }
    }
    $inSubmodules = 'echo $displaypath; git -c core.quotePath=false ls-files -o --exclude-standard | git hash-object --stdin-paths'
    foreach ($line in @(git -C $Dir submodule foreach --quiet --recursive $inSubmodules)) { $Lines.Add($line) }
    if ($LASTEXITCODE -ne 0) { throw "submodules $Dir" }
}

# The lint's inputs as git sees them, in the checkout and in the kit (its Lua, its tools), hashed. Not covered:
# gitignored files and the game database's builds, which only the zone rules read. Throws on any git failure, so a
# failed read never matches a stamp.
function Get-CheckoutFingerprint([string]$Root) {
    [Console]::OutputEncoding = [Text.UTF8Encoding]::new($false)
    $global:OutputEncoding = [Console]::OutputEncoding
    $lines = [Collections.Generic.List[string]]::new()
    Add-TreeState $lines $Root
    . (Join-Path $Root '.claude\tools\KitPath.ps1')
    Add-TreeState $lines $KitRoot
    $bytes = [Text.Encoding]::UTF8.GetBytes(($lines -join "`n"))
    [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData($bytes))
}

try {
    $raw = [Console]::In.ReadToEnd()
    $payload = if ($raw) { $raw | ConvertFrom-Json } else { $null }
    if ($payload -and $payload.stop_hook_active) { exit 0 }

    $root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\hooks -> repo root
    # A session that entered a worktree keeps the hooks of the checkout it started in; lint the one it works in
    if ($payload -and $payload.cwd) {
        $top = git -C $payload.cwd rev-parse --show-toplevel 2>$null
        if ($LASTEXITCODE -eq 0 -and $top -and (Test-Path (Join-Path $top '.claude\tools\Check-Repo.ps1'))) { $root = $top.Trim() -replace '/', '\' }
    }
    $lint = Join-Path $root '.claude\tools\Check-Repo.ps1'
    if (-not (Test-Path $lint)) { exit 0 }

    # Skip when the checkout and the kit are what they were at the last clean run (docs/work/2026-11-27-setup-review).
    # A failed run is never remembered, a run during which something changed neither, and any error here lints.
    $stamp = Join-Path $root '.claude\cache\stop-lint.fingerprint'
    $fingerprint = $null
    try { $fingerprint = Get-CheckoutFingerprint $root } catch { $fingerprint = $null }
    if ($fingerprint -and (Test-Path $stamp) -and (Get-Content $stamp -Raw) -ceq $fingerprint) { exit 0 }

    $output = (& $lint -ChangedOnly 2>&1 | ForEach-Object { "$_" }) -join "`n"
    if ($LASTEXITCODE -eq 0) {
        $after = $null
        if ($fingerprint) { try { $after = Get-CheckoutFingerprint $root } catch { $after = $null } }
        if ($fingerprint -and $after -ceq $fingerprint) {
            New-Item -ItemType Directory -Force (Split-Path $stamp) | Out-Null
            Set-Content -LiteralPath $stamp -Value $fingerprint -NoNewline
        }
        else { Remove-Item -LiteralPath $stamp -Force -ErrorAction SilentlyContinue }
    }
    else {
        Remove-Item -LiteralPath $stamp -Force -ErrorAction SilentlyContinue
        [Console]::Error.WriteLine("Repo lint found errors in the working tree (see the rules in CLAUDE.md and .claude/rules/). Fix them, or if a finding is a deliberate exception add it to .claude/tools/Check-Repo.ignore with a comment:")
        [Console]::Error.WriteLine($output.Trim())
        exit 2
    }
    exit 0
}
catch {
    [Console]::Error.WriteLine("Check-RepoOnStop: hook failed, skipping: $_")
    exit 0
}