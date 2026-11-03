<#
.SYNOPSIS
    This repo's own lines for the kit's Get-RepoState.ps1. With -Lint: the summary of Check-Repo.ps1 -ChangedOnly
    and its first findings. Read-only; without -Lint it only says how to get them.

.PARAMETER Repo
    The checkout, passed by Get-RepoState.ps1. Default: the one this script is in.

.PARAMETER Lint
    Run the lint (about 10 s).
#>
param(
    [string]$Repo,
    [switch]$Lint
)

if (-not $Lint) {
    'lint: not run; Get-RepoState.ps1 -Lint runs Check-Repo.ps1 -ChangedOnly (about 10 s)'
    return
}
if (-not $Repo) { $Repo = Split-Path $PSScriptRoot -Parent }

$output = @(& (Join-Path $Repo '.claude\tools\Check-Repo.ps1') -ChangedOnly 2>&1 | ForEach-Object { "$_" })
$summary = $output | Where-Object { $_ -like 'Check-Repo:*' } | Select-Object -Last 1
$findings = @($output | Where-Object { $_ -match '^\S.*:\d+: \[[\w-]+\] (Error|Warning):' })
"lint: $(if ($summary) { $summary.Substring(12) } else { 'no summary line; it failed' })"
$findings | Select-Object -First 10
if ($findings.Count -gt 10) { "... and $($findings.Count - 10) more" }