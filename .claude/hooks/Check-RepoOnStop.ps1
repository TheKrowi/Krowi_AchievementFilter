<#
.SYNOPSIS
    Stop hook: runs the repo lint (Check-Repo.ps1 -ChangedOnly) when Claude finishes a turn.
    Errors are handed back so Claude fixes them before handing the work over. Fails open.

    stop_hook_active is true when this hook already sent Claude back once this turn; then we let
    the turn end so a finding Claude cannot fix does not loop forever.
#>
$ErrorActionPreference = 'Continue'

try {
    $raw = [Console]::In.ReadToEnd()
    $payload = if ($raw) { $raw | ConvertFrom-Json } else { $null }
    if ($payload -and $payload.stop_hook_active) { exit 0 }

    $root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\hooks -> repo root
    $lint = Join-Path $root '.claude\tools\Check-Repo.ps1'
    if (-not (Test-Path $lint)) { exit 0 }

    $output = (& $lint -ChangedOnly 2>&1 | ForEach-Object { "$_" }) -join "`n"
    if ($LASTEXITCODE -ne 0) {
        [Console]::Error.WriteLine("Repo lint found errors in the working tree (see the rules in .github/copilot-instructions.md). Fix them, or if a finding is a deliberate exception add it to .claude/tools/Check-Repo.ignore with a comment:")
        [Console]::Error.WriteLine($output.Trim())
        exit 2
    }
    exit 0
}
catch {
    [Console]::Error.WriteLine("Check-RepoOnStop: hook failed, skipping: $_")
    exit 0
}