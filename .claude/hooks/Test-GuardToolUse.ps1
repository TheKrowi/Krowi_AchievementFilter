<#
.SYNOPSIS
    Regression cases for Guard-ToolUse.ps1: pipes each payload into the hook in a child pwsh and checks whether it is
    denied. Exit code 1 when any case fails. Ported from Krowi_ClaudeKit tests/Test-GuardToolUse.ps1 (36175d9); keep
    the two case lists in step.

    Run: pwsh -NoProfile -File .claude\hooks\Test-GuardToolUse.ps1
#>
$ErrorActionPreference = 'Stop'
$hook = Join-Path $PSScriptRoot 'Guard-ToolUse.ps1'
$env:CLAUDE_PROJECT_DIR = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\hooks -> repo root

$sedFix = 'sed -i s/a/b/ x.lua'
$cases = @(
    # In-place edits at command position: denied
    @{ Tool = 'Bash'; Deny = $true; Command = 'sed -i s/a/b/ x.lua' }
    @{ Tool = 'Bash'; Deny = $true; Command = "sed -i.bak 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "sed --in-place 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "sed -n -i 's/a/b/p' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "sed -E -i 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "/usr/bin/sed -i 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "cd src && sed -i 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "git status; sed -i 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "(sed -i 's/a/b/' x.lua)" }
    @{ Tool = 'Bash'; Deny = $true; Command = "echo hi`nsed -i 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "grep -l foo *.lua | xargs sed -i 's/a/b/'" }
    @{ Tool = 'Bash'; Deny = $true; Command = "grep -l foo *.lua | xargs -0 -n1 sed -i 's/a/b/'" }
    @{ Tool = 'Bash'; Deny = $true; Command = "find . -name '*.lua' -exec sed -i 's/a/b/' {} +" }
    @{ Tool = 'Bash'; Deny = $true; Command = "for f in *.lua; do sed -i 's/a/b/' `"`$f`"; done" }
    @{ Tool = 'Bash'; Deny = $true; Command = "bash -c 'sed -i s/a/b/ x.lua'" }
    @{ Tool = 'Bash'; Deny = $true; Command = "perl -pi -e 's/a/b/' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "awk -i inplace '{print}' x.lua" }
    @{ Tool = 'Bash'; Deny = $true; Command = "gawk -i inplace '{print}' x.lua" }
    @{ Tool = 'PowerShell'; Deny = $true; Command = "sed -i 's/a/b/' x.lua" }
    @{ Tool = 'PowerShell'; Deny = $true; Command = "& sed -i 's/a/b/' x.lua" }
    @{ Tool = 'PowerShell'; Deny = $true; Command = "git status; sed -i 's/a/b/' x.lua" }
    @{ Tool = 'PowerShell'; Deny = $true; Command = "Get-ChildItem *.lua | ForEach-Object { sed -i 's/a/b/' `$_ }" }
    @{ Tool = 'PowerShell'; Deny = $true; Command = "pwsh -NoProfile -Command `"sed -i 's/a/b/' x.lua`"" }

    # Only mentioned, not run: allowed
    @{ Tool = 'Bash'; Deny = $false; Command = "sed -n '1,20p' x.lua" }
    @{ Tool = 'Bash'; Deny = $false; Command = "sed -e 's/-i/x/' x.lua" }
    @{ Tool = 'Bash'; Deny = $false; Command = 'grep -n "sed -i" .claude/hooks/Guard-ToolUse.ps1' }
    @{ Tool = 'Bash'; Deny = $false; Command = 'grep -c "sed -i" .claude/hooks/Guard-ToolUse.ps1' }
    @{ Tool = 'Bash'; Deny = $false; Command = "git log --grep='sed -i'" }
    @{ Tool = 'Bash'; Deny = $false; Command = 'grep -rn "sed -i s/" .claude/hooks' }
    @{ Tool = 'Bash'; Deny = $false; Command = 'echo "never run sed -i on repo files"' }
    @{ Tool = 'Bash'; Deny = $false; Command = 'git commit -m "docs: sed -i rewrites line endings"' }
    @{ Tool = 'Bash'; Deny = $false; Command = 'git commit -m "fix: a note about sed -i; and | sed -i"' }
    @{ Tool = 'Bash'; Deny = $false; Command = "git commit -F - <<'EOF'`nsed -i is blocked now`nEOF" }
    @{ Tool = 'PowerShell'; Deny = $false; Command = "'{`"tool_name`":`"Bash`",`"tool_input`":{`"command`":`"$sedFix`"}}' | pwsh -NoProfile -File .claude\hooks\Guard-ToolUse.ps1" }
    @{ Tool = 'PowerShell'; Deny = $false; Command = "Select-String -Pattern 'sed -i' -Path *.ps1" }
    @{ Tool = 'PowerShell'; Deny = $false; Command = "Write-Host `"(sed -i) { sed -i }`"" }
    @{ Tool = 'PowerShell'; Deny = $false; Command = "git commit -m @'`nfix: guard`n`nsed -i in a message body is fine`n'@" }

    # Bash writes into the repo and inline game database queries
    @{ Tool = 'Bash'; Deny = $true; Command = 'echo x > x.lua' }
    @{ Tool = 'Bash'; Deny = $true; Command = 'echo "(x) { y }" >> Data/x.lua' }
    @{ Tool = 'Bash'; Deny = $true; Command = 'git show HEAD:x.lua | tee x.lua' }
    @{ Tool = 'Bash'; Deny = $false; Command = 'echo "a > b; (c) | d"' }
    @{ Tool = 'Bash'; Deny = $false; Command = 'git diff > /dev/null' }
    @{ Tool = 'PowerShell'; Deny = $true; Command = 'Invoke-RestMethod http://localhost:5000/api/item/19019' }
)

$failed = 0
foreach ($case in $cases) {
    $payload = @{ tool_name = $case.Tool; tool_input = @{ command = $case.Command }; cwd = $env:CLAUDE_PROJECT_DIR } |
        ConvertTo-Json -Compress -Depth 3
    $out = $payload | pwsh -NoProfile -File $hook
    $denied = [string]$out -match '"permissionDecision":"deny"'
    $ok = $denied -eq $case.Deny
    if (-not $ok) { $failed++ }
    $label = if ($case.Deny) { 'deny ' } else { 'allow' }
    $status = if ($ok) { 'ok  ' } else { 'FAIL' }
    Write-Output ("{0} {1} {2,-10} {3}" -f $status, $label, $case.Tool, ($case.Command -replace "`n", ' \n '))
}
Write-Output "$($cases.Count - $failed)/$($cases.Count) passed"
if ($failed) { exit 1 }