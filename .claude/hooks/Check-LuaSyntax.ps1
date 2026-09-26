<#
.SYNOPSIS
    PostToolUse hook: syntax-checks a .lua file Claude just edited with the repo's vendored Lua 5.1.5,
    the parser World of Warcraft uses. Fails open: any setup problem is reported and the edit goes through.

    The edit has already happened when this runs, so it cannot be blocked; exit 2 shows stderr to Claude
    as feedback so it fixes the file before moving on.
#>
$ErrorActionPreference = 'Continue'

try {
    $raw = [Console]::In.ReadToEnd()
    if (-not $raw) { exit 0 }
    $payload = $raw | ConvertFrom-Json
    $path = $payload.tool_input.file_path
    if (-not $path -or [IO.Path]::GetExtension($path) -ne '.lua') { exit 0 }
    if (-not (Test-Path -LiteralPath $path)) { exit 0 }

    $root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\hooks -> repo root
    $lua = Join-Path $root '.claude\tools\lua51\lua.exe'
    $checker = Join-Path $root '.claude\tools\lua51\check-syntax.lua'
    if (-not (Test-Path $lua) -or -not (Test-Path $checker)) {
        [Console]::Error.WriteLine("Check-LuaSyntax: vendored Lua missing under .claude\tools\lua51, skipping (run Build-Lua51.ps1)")
        exit 0
    }

    $output = (& $lua $checker $path 2>&1 | ForEach-Object { "$_" }) -join "`n"
    if ($LASTEXITCODE -ne 0) {
        [Console]::Error.WriteLine("Lua syntax error: WoW's Lua 5.1 parser rejects the file you just edited. Fix it before continuing.")
        [Console]::Error.WriteLine($output.Trim())
        exit 2
    }
    exit 0
}
catch {
    [Console]::Error.WriteLine("Check-LuaSyntax: hook failed, skipping: $_")
    exit 0
}