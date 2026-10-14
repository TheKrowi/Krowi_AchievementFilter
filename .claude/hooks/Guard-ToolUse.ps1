<#
.SYNOPSIS
    PreToolUse hook: stops the tool calls that have broken this repo before, BEFORE they run, instead of
    leaving them to the Stop-hook lint and a repair. Fails open: any problem in the hook lets the call through.

    Bash, PowerShell
      in-place stream edits    sed -i / --in-place, perl -i, awk -i inplace run as a command (not merely mentioned
                               in a string): MSYS rewrites the whole file with LF endings (and awk adds a final
                               newline), even when the pattern does not match
      Bash file writes         >, >>, &> and tee into a repo file: same LF problem; Bash is for read-only work
      inline DB queries        Invoke-WebRequest / Invoke-RestMethod / curl / wget at localhost:5000; the
                               maintainer rejects them, the designated lookup scripts take -Ids/-Terms/-Names
    Edit, Write, MultiEdit
      Libs/                    vendored submodules; asks the user instead of denying, for when they asked for it
      AUTOGENTOKEN             an L[...] string added above the marker in a locale file (the enus-autogen lint
                               rule, enforced before the edit instead of after)

    Output: the PreToolUse JSON contract (hookSpecificOutput.permissionDecision deny|ask with a reason Claude sees).
#>
$ErrorActionPreference = 'Stop'

function Write-Decision([string]$Decision, [string]$Reason) {
    @{ hookSpecificOutput = @{ hookEventName = 'PreToolUse'; permissionDecision = $Decision; permissionDecisionReason = $Reason } } |
        ConvertTo-Json -Compress -Depth 3
    exit 0
}

# Repo-relative path with forward slashes, or $null when the path is outside the repo. MSYS (/e/...) paths too.
function Get-RepoPath([string]$Path) {
    $p = $Path.Trim().Trim('"', "'") -replace '\\', '/'
    if ($p -match '^/([a-zA-Z])/(.*)$') { $p = "$($Matches[1]):/$($Matches[2])" }
    if ($p -notmatch '^[a-zA-Z]:/') { return $p.TrimStart('.', '/') }   # relative: commands run from the repo root
    $r = $root -replace '\\', '/'
    if ($p.StartsWith("$r/", [StringComparison]::OrdinalIgnoreCase)) { return $p.Substring($r.Length + 1) }
    return $null
}
# A checkout's own path inside an agent worktree counts the same as in the main tree
function Get-CheckoutPath([string]$Rel) { $Rel -replace '^\.claude/worktrees/[^/]+/', '' }

# Blank out heredoc bodies and the operators, brackets and line breaks inside quoted strings, so a '>' or a 'sed -i'
# in Lua code, a message or a test payload is not taken for a redirect or a command
function Get-ShellSkeleton([string]$Command) {
    $lines = $Command -split "`n"
    $out = [System.Collections.Generic.List[string]]::new()
    $delimiter = $null
    foreach ($line in $lines) {
        if ($delimiter) {
            if ($line.Trim() -eq $delimiter) { $delimiter = $null }
            continue
        }
        $out.Add($line)
        if ($line -match "<<-?\s*['""]?(\w+)['""]?") { $delimiter = $Matches[1] }
    }
    $s = $out -join "`n"
    $s = [regex]::Replace($s, "'[^']*'", { param($m) "'" + ($m.Value.Substring(1, $m.Value.Length - 2) -replace '[>|;&(){}`\r\n]', '_') + "'" })
    $s = [regex]::Replace($s, '"(?:[^"\\]|\\.)*"', { param($m) '"' + ($m.Value.Substring(1, $m.Value.Length - 2) -replace '[>|;&(){}`\r\n]', '_') + '"' })
    return $s
}
function Test-ScratchTarget([string]$Target) {
    $t = $Target.Trim('"', "'")
    return $t -match '^(/dev/(null|stdout|stderr)|NUL)$' -or $t -match '^\$' -or
        $t -match '(?i)(^|[\\/])(tmp|temp)[\\/]|scratchpad|AppData[\\/]Local[\\/]Temp'
}

try {
    $raw = [Console]::In.ReadToEnd()
    if (-not $raw) { exit 0 }
    $payload = $raw | ConvertFrom-Json
    $tool = $payload.tool_name
    $in = $payload.tool_input
    $root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\hooks -> repo root

    if ($tool -eq 'Bash' -or $tool -eq 'PowerShell') {
        $command = [string]$in.command
        if (-not $command) { exit 0 }
        $skeleton = Get-ShellSkeleton $command

        # Command position: line start, after ; & | ( { or a backtick, after xargs, -exec, then/do/else, or opening the
        # quoted script of bash/sh/pwsh -c; an unquoted path prefix (/usr/bin/sed) is allowed
        $atCommand = '(?:^|[;&|({`]|\bxargs\b[^;&|\n]*?\s|-exec\s+|\b(?:then|do|else)\s+|\b(?:bash|sh|zsh|dash|pwsh|powershell)(?:\.exe)?\s+(?:-\S+\s+)*?-c(?:ommand)?\s+[''"])\s*(?:[^\s;&|(){}''"]*[\\/])?'
        $inPlace = '(?m)' + $atCommand + '(sed\s+(?:[^|;&\n]*\s)?(?:-[a-zA-Z]*i[a-zA-Z.]*|--in-place)(?=\s|$)|g?awk\s+(?:[^|;&\n]*\s)?-i\s*inplace|perl\s+(?:[^|;&\n]*\s)?-[a-zA-Z]*i)'
        if ($skeleton -match $inPlace) {
            Write-Decision 'deny' "Blocked '$($Matches[1].Trim())': on this machine sed/awk/perl in-place edits rewrite the whole file with LF line endings (awk also adds a final newline), even when nothing matches, which breaks the line-endings lint on every file touched. Edit files with the Edit/Write tools or PowerShell; keep Bash for read-only work."
        }

        if ($command -match '(?i)(localhost|127\.0\.0\.1):5000' -and
            $command -match '(?i)(Invoke-RestMethod|Invoke-WebRequest|(?<![\w-])(irm|iwr|curl|wget)(?![\w-])|WebClient|HttpClient)') {
            Write-Decision 'deny' "Blocked an inline query to the game database (localhost:5000). Use the designated lookup scripts with parameters instead, e.g. & "".claude\skills\add-achievement-data\_lookup_ids.ps1"" -Ids 1,2 (-Client Classic), _lookup_name.ps1 -Table <table> -Name <text>, or & "".claude\tools\Get-WowBuilds.ps1"" for the build strings; the list is in .claude/tools/README.md. If no script covers the query, add a parameterised one under the skill instead of an ad-hoc command."
        }

        if ($tool -eq 'Bash') {
            $targets = @()
            $word = '(''[^'']*''|"[^"]*"|[^\s;|&)''"]+)'   # a quoted path may hold spaces
            foreach ($m in [regex]::Matches($skeleton, '(?:^|[^&<>\d])1?>{1,2}(?!&)\s*' + $word)) { $targets += $m.Groups[1].Value }
            foreach ($m in [regex]::Matches($skeleton, '&>{1,2}\s*' + $word)) { $targets += $m.Groups[1].Value }
            foreach ($m in [regex]::Matches($skeleton, '(?<![\w-])tee\s+(?:-a\s+)?(?!-)' + $word)) { $targets += $m.Groups[1].Value }
            foreach ($target in $targets) {
                if (Test-ScratchTarget $target) { continue }
                if ($null -eq (Get-RepoPath $target)) { continue }   # outside the repo
                Write-Decision 'deny' "Blocked a Bash write to '$($target.Trim('"', "'"))': Git Bash writes files with LF line endings and the repo is CRLF throughout (.editorconfig). Write repo files with the Write/Edit tools or PowerShell, or send scratch output to the scratchpad directory; keep Bash for read-only work (grep, diff, git, the vendored Lua)."
            }
        }
        exit 0
    }

    if ($tool -in 'Edit', 'Write', 'MultiEdit') {
        $path = [string]$in.file_path
        if (-not $path) { exit 0 }
        $rel = Get-RepoPath $path
        if ($null -eq $rel) { exit 0 }
        $rel = Get-CheckoutPath $rel

        if ($rel -like 'Libs/*') {
            Write-Decision 'ask' "Libs/ holds vendored libraries (several are git submodules of TheKrowi/* repos): fixes belong upstream and an edit here is overwritten by the next submodule update. Only go ahead if the user asked for this edit."
        }

        if ($rel -like 'Localization/*.lua' -and $rel -ne 'Localization/Shared.lua' -and (Test-Path -LiteralPath $path)) {
            $before = [IO.File]::ReadAllText($path) -replace "`r`n", "`n"
            $after = $before
            switch ($tool) {
                'Write' { $after = ([string]$in.content) -replace "`r`n", "`n" }
                'Edit' {
                    $old = ([string]$in.old_string) -replace "`r`n", "`n"
                    $new = ([string]$in.new_string) -replace "`r`n", "`n"
                    if ($in.replace_all) { $after = $after.Replace($old, $new) }
                    else { $i = $after.IndexOf($old); if ($i -ge 0) { $after = $after.Substring(0, $i) + $new + $after.Substring($i + $old.Length) } }
                }
                'MultiEdit' {
                    foreach ($e in $in.edits) {
                        $old = ([string]$e.old_string) -replace "`r`n", "`n"
                        $new = ([string]$e.new_string) -replace "`r`n", "`n"
                        if ($e.replace_all) { $after = $after.Replace($old, $new) }
                        else { $i = $after.IndexOf($old); if ($i -ge 0) { $after = $after.Substring(0, $i) + $new + $after.Substring($i + $old.Length) } }
                    }
                }
            }
            function Get-StringsAboveMarker([string]$Text) {
                $set = @{}
                foreach ($line in $Text -split "`n") {
                    if ($line -like '*AUTOGENTOKEN*') { return $set }
                    if ($line -match '^\s*L\[') { $set[$line.Trim()] = $true }
                }
                return $null   # no marker: nothing to protect
            }
            $was = Get-StringsAboveMarker $before
            $now = Get-StringsAboveMarker $after
            if ($null -ne $was -and $null -ne $now) {
                $added = @($now.Keys | Where-Object { -not $was.ContainsKey($_) })
                if ($added.Count) {
                    Write-Decision 'deny' "Blocked: this edit adds $($added.Count) L[...] string(s) above the AUTOGENTOKEN marker in $rel (first: $($added[0])). The block above the marker is code; new strings go directly below the '-- [[ Exported at ... ]] --' line under it, in every locale file (.github/copilot-instructions.md, Localization)."
                }
            }
        }
    }
    exit 0
}
catch {
    [Console]::Error.WriteLine("Guard-ToolUse: hook failed, letting the call through: $_")
    exit 0
}