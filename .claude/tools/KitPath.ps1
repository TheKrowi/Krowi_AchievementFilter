<#
.SYNOPSIS
    Finds Krowi_ClaudeKit, the home of the Claude Code tooling every Krowi repo shares (the vendored Lua 5.1.5,
    Get-WowBuilds, the deprecated-API classifier, Deploy and the game readers), for the scripts that stay in this repo.

.DESCRIPTION
    Dot-source it. It sets $KitRoot, $KitTools, $KitLua and $KitLuac and nothing else, and throws when the kit or its
    Lua is missing, so the lint fails loudly instead of skipping the rules that need Lua.

    The kit is Krowi_ClaudeKit next to this repo's main checkout; a worktree resolves to the same folder.
    $env:KROWI_CLAUDEKIT, when set, names another kit checkout instead, for testing a kit worktree. It moves only
    this repo's scripts: the plugin's hooks, skills and agent still load from the kit's main checkout, so test those
    with `claude -p --plugin-dir <kit worktree>`, and clear the variable after the test.
    The kit is private: a contributor's clone has none, and this repo's Claude Code tooling is the maintainer's.

.EXAMPLE
    . "$PSScriptRoot\..\..\tools\KitPath.ps1"     # from .claude\skills\<skill>\
    . "$KitTools\Get-WowBuilds.ps1"
#>
$KitRoot = & {
    if ($env:KROWI_CLAUDEKIT) { return $env:KROWI_CLAUDEKIT }
    $common = git -C $PSScriptRoot rev-parse --path-format=absolute --git-common-dir 2>$null
    if ($LASTEXITCODE -ne 0 -or -not $common) { throw "KitPath.ps1: $PSScriptRoot is not inside a git checkout." }
    Join-Path (Split-Path (Split-Path ($common.Trim() -replace '/', '\') -Parent) -Parent) 'Krowi_ClaudeKit'
}
$KitTools = Join-Path $KitRoot 'tools'
$KitLua = Join-Path $KitTools 'lua51\lua.exe'
$KitLuac = Join-Path $KitTools 'lua51\luac.exe'
foreach ($kitFile in $KitLua, $KitLuac) {
    if (-not (Test-Path -LiteralPath $kitFile)) {
        throw "Krowi_ClaudeKit not found at ${KitRoot}: this repo's Claude Code tooling is the maintainer's and lives there ($kitFile is missing)."
    }
}
Remove-Variable kitFile