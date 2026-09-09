<#
.SYNOPSIS
    Repo lint for Krowi_AchievementFilter: the mechanical rules from .github/copilot-instructions.md that the game
    cannot check for you. Runs offline in about a second and installs nothing.

.DESCRIPTION
    Rules (severity in brackets; "changed" means modified vs HEAD or untracked):
      files-xml        [Error]   every .lua under the addon tree is registered in the .toc or a
                                 Files.xml chain; every registered file exists on disk
      dup-id           [Error]   an achievement ID is registered once per client
                                 (Shared counts for both Retail and Classic)
      saved-variables  [Error]   every `KrowiAF_X = KrowiAF_X or` saved variable is declared in the .toc
      lua-syntax       [Error]   every .lua parses under Lua 5.1 (the vendored interpreter)
      globals          [Error]   no assignment to an undeclared global (luac -l SETGLOBAL) other than
                                 KrowiAF*/BINDING_*/SLASH_* names and the deliberate Blizzard
                                 FrameXML overrides and API polyfills listed in Check-Repo.globals
      data-load        [Error]   the data pipeline runs headlessly for Retail and Classic
                                 (headless/load-data.lua: builder args, patch keys, duplicate and
                                 AutoFactionSplit registrations, category/zone/tooltip references
                                 to achievements no data file registers)
      lookup-placeholders [Warning] _lookup_*.ps1 skill scripts are committed with empty @() placeholders
      bom              [Warning] no UTF-8 byte order mark (.editorconfig: utf-8)
      line-endings     [Warning] CRLF only (.editorconfig: crlf)
      semicolon        [Error]   no trailing semicolons on added .lua lines (changed files only)
      enus-autogen     [Error]   nothing added below the AUTOGENTOKEN marker in enUS.lua;
                       [Warning] other locale files are CurseForge-managed
      changelog        [Warning] addon code changed without a Changelog.md entry

    Warnings on changed files are promoted to Error so pre-existing debt does not block work
    while new debt does.

.PARAMETER ChangedOnly
    Report only findings that involve changed files (plus the always-on structural errors).
    This is what the Stop hook uses.

.OUTPUTS
    One line per finding: <path>:<line>: [<rule>] <severity>: <message>, then a summary.
    Exit code 1 when any Error was found, else 0.

.EXAMPLE
    & ".claude\tools\Check-Repo.ps1"
    & ".claude\tools\Check-Repo.ps1" -ChangedOnly
#>
[CmdletBinding()]
param(
    [switch]$ChangedOnly
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
Set-Location $root

$nonAddonDirs = @('.claude', '.git', '.github', '.vscode', '_Packaging', 'raw', 'wiki', 'docs')
$findings = [System.Collections.Generic.List[object]]::new()

function Add-Finding([string]$Rule, [string]$Severity, [string]$Path, [int]$Line, [string]$Message) {
    $findings.Add([pscustomobject]@{ Rule = $Rule; Severity = $Severity; Path = $Path; Line = $Line; Message = $Message })
}
$stopwatch = [Diagnostics.Stopwatch]::StartNew()
function Write-Timing([string]$Section) {
    Write-Verbose ('{0,-16} {1,5} ms' -f $Section, $stopwatch.ElapsedMilliseconds)
    $stopwatch.Restart()
}
function ConvertTo-RelativePath([string]$full) { $full.Substring($root.Length).TrimStart('\', '/').Replace('\', '/') }
function Test-AddonPath([string]$rel) {
    $top = $rel.Split('/')[0]
    return -not ($nonAddonDirs -contains $top)
}

# --- Changed set -------------------------------------------------------------------------------
$changed = @{}
foreach ($p in (git diff --name-only HEAD 2>$null)) { if ($p) { $changed[$p.Replace('\', '/')] = 'modified' } }
foreach ($p in (git ls-files --others --exclude-standard 2>$null)) { if ($p) { $changed[$p.Replace('\', '/')] = 'untracked' } }

# --- Enumerate addon text files ----------------------------------------------------------------
# Skip non-addon directories up front: .claude holds agent worktrees (full repo copies) and .git is large
$allFiles = @(Get-ChildItem -Path "$root\*" -File -Include *.lua, *.xml, *.toc | ForEach-Object { ConvertTo-RelativePath $_.FullName }) +
    @(Get-ChildItem -Path $root -Directory | Where-Object { $nonAddonDirs -notcontains $_.Name } |
        Get-ChildItem -Recurse -File -Include *.lua, *.xml, *.toc | ForEach-Object { ConvertTo-RelativePath $_.FullName })
$luaFiles = @($allFiles | Where-Object { $_ -like '*.lua' })
$ownLuaFiles = @($luaFiles | Where-Object { $_ -notlike 'Libs/*' })

# --- files-xml ---------------------------------------------------------------------------------
$registered = @{}   # lower-case rel path -> "declaring file:line"
$disabled = @{}     # lower-case rel path referenced only inside an XML comment
$visitedXml = @{}
$queue = New-Object System.Collections.Generic.Queue[object]   # @{Rel; Disabled}
$tocRel = 'Krowi_AchievementFilter.toc'
$lineNo = 0
foreach ($line in Get-Content (Join-Path $root $tocRel)) {
    $lineNo++
    $t = ($line -replace '#.*$', '') -replace '\[.*?\]', ''
    $t = $t.Trim()
    if (-not $t) { continue }
    $rel = $t.Replace('\', '/')
    $registered[$rel.ToLower()] = "${tocRel}:$lineNo"
    if ($rel -like '*.xml') { $queue.Enqueue(@{ Rel = $rel; Disabled = $false }) }
}
$fileRefPattern = '<(Script|Include)\s+file\s*=\s*["' + "'" + ']([^"' + "'" + ']+)["' + "'" + ']'
while ($queue.Count -gt 0) {
    $item = $queue.Dequeue()
    $xmlRel = $item.Rel
    if ($visitedXml.ContainsKey($xmlRel.ToLower())) { continue }
    $visitedXml[$xmlRel.ToLower()] = $true
    $xmlFull = Join-Path $root $xmlRel
    if (-not (Test-Path -LiteralPath $xmlFull)) { continue }   # reported below as missing
    $xmlDir = [IO.Path]::GetDirectoryName($xmlRel).Replace('\', '/')
    $content = Get-Content -Raw -LiteralPath $xmlFull
    # A reference inside an XML comment, or anywhere below a commented-out Include, is a
    # deliberately disabled file, not a forgotten one
    foreach ($c in [regex]::Matches($content, '<!--.*?-->', 'Singleline')) {
        foreach ($m in [regex]::Matches($c.Value, $fileRefPattern)) {
            $fileRel = $m.Groups[2].Value.Replace('\', '/')
            $rel = if ($xmlDir) { "$xmlDir/$fileRel" } else { $fileRel }
            $disabled[$rel.ToLower()] = $true
            if ($rel -like '*.xml') { $queue.Enqueue(@{ Rel = $rel; Disabled = $true }) }
        }
    }
    $content = [regex]::Replace($content, '<!--.*?-->', { param($m) ' ' * $m.Length }, 'Singleline')
    foreach ($m in [regex]::Matches($content, $fileRefPattern)) {
        $fileRel = $m.Groups[2].Value.Replace('\', '/')
        $rel = if ($xmlDir) { "$xmlDir/$fileRel" } else { $fileRel }
        if ($item.Disabled) {
            $disabled[$rel.ToLower()] = $true
        }
        else {
            $declLine = ($content.Substring(0, $m.Index) -split "`n").Count
            if (-not $registered.ContainsKey($rel.ToLower())) { $registered[$rel.ToLower()] = "${xmlRel}:$declLine" }
        }
        if ($rel -like '*.xml') { $queue.Enqueue(@{ Rel = $rel; Disabled = $item.Disabled }) }
    }
}
foreach ($kv in $registered.GetEnumerator()) {
    $full = Join-Path $root $kv.Key
    if (-not (Test-Path -LiteralPath $full)) {
        $decl = $kv.Value -split ':'
        Add-Finding 'files-xml' 'Error' $decl[0] ([int]$decl[1]) "registered file does not exist: $($kv.Key)"
    }
}
foreach ($rel in $ownLuaFiles) {
    if (-not $registered.ContainsKey($rel.ToLower()) -and -not $disabled.ContainsKey($rel.ToLower())) {
        $sev = if ($changed.ContainsKey($rel)) { 'Error' } else { 'Warning' }
        Add-Finding 'files-xml' $sev $rel 1 'not registered in the .toc or any Files.xml chain, so it never loads'
    }
}

Write-Timing 'files-xml'

# --- Read every file once ----------------------------------------------------------------------
$fileBytes = @{}
foreach ($rel in $allFiles) { $fileBytes[$rel] = [IO.File]::ReadAllBytes((Join-Path $root $rel)) }
Write-Timing 'read'

# --- bom / line-endings ------------------------------------------------------------------------
foreach ($rel in $allFiles) {
    if ($rel -like 'Libs/*') { continue }
    $b = $fileBytes[$rel]
    $sev = if ($changed.ContainsKey($rel)) { 'Error' } else { 'Warning' }
    if ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF) {
        Add-Finding 'bom' $sev $rel 1 'file starts with a UTF-8 byte order mark; .editorconfig says plain utf-8'
    }
    $text = [Text.Encoding]::UTF8.GetString($b)
    $lf = [regex]::Matches($text, '(?<!\r)\n').Count
    $crlf = [regex]::Matches($text, "`r`n").Count
    if ($lf -gt 0) {
        $what = if ($crlf -gt 0) { "mixed line endings ($lf LF, $crlf CRLF)" } else { 'LF line endings' }
        Add-Finding 'line-endings' $sev $rel 1 "$what; .editorconfig says crlf"
    }
}

Write-Timing 'bom/line-endings'

# --- dup-id ------------------------------------------------------------------------------------
$idOccurrences = @{}   # id -> list of @{Client; Path; Line}
foreach ($rel in ($ownLuaFiles | Where-Object { $_ -like 'DataAddons/*' -and [IO.Path]::GetFileName($_) -like 'AchievementData*.lua' })) {
    $client = if ($rel -like 'DataAddons/Shared/*') { 'Shared' } elseif ($rel -like 'DataAddons/Retail/*') { 'Retail' } else { 'Classic' }
    $text = [Text.Encoding]::UTF8.GetString($fileBytes[$rel])
    $code = [regex]::Replace($text, '--[^\r\n]*', '')   # drop line comments, keep line structure
    foreach ($m in [regex]::Matches($code, '\bAch\((\d+)\)')) {
        $id = [int]$m.Groups[1].Value
        if (-not $idOccurrences.ContainsKey($id)) { $idOccurrences[$id] = [System.Collections.Generic.List[object]]::new() }
        $idOccurrences[$id].Add(@{ Client = $client; Path = $rel; Code = $code; Index = $m.Index })
    }
}
function Get-LineNumber($occurrence) { ([regex]::Matches($occurrence.Code.Substring(0, $occurrence.Index), "`n")).Count + 1 }
foreach ($kv in $idOccurrences.GetEnumerator()) {
    $occ = $kv.Value
    if ($occ.Count -lt 2) { continue }
    foreach ($side in 'Retail', 'Classic') {
        $onSide = @($occ | Where-Object { $_.Client -eq 'Shared' -or $_.Client -eq $side })
        if ($onSide.Count -gt 1) {
            $others = ($onSide | Select-Object -Skip 1 | ForEach-Object { "$($_.Path):$(Get-LineNumber $_)" }) -join ', '
            Add-Finding 'dup-id' 'Error' $onSide[0].Path (Get-LineNumber $onSide[0]) "achievement $($kv.Key) is registered more than once for $side (also at $others); the runtime asserts on this"
        }
    }
}

Write-Timing 'dup-id'

# --- saved-variables ---------------------------------------------------------------------------
$tocText = [Text.Encoding]::UTF8.GetString($fileBytes[$tocRel])
$declared = @{}
foreach ($m in [regex]::Matches($tocText, '(?m)^## SavedVariables(?:PerCharacter)?:\s*(.+)$')) {
    foreach ($name in ($m.Groups[1].Value -split ',')) { $declared[$name.Trim()] = $true }
}
foreach ($rel in $ownLuaFiles) {
    $text = [Text.Encoding]::UTF8.GetString($fileBytes[$rel])
    foreach ($m in [regex]::Matches($text, '(?m)^[ \t]*(KrowiAF_\w+)[ \t]*=[ \t]*\1[ \t]+or\b')) {
        if (-not $declared.ContainsKey($m.Groups[1].Value)) {
            $n = ([regex]::Matches($text.Substring(0, $m.Index), "`n")).Count + 1
            Add-Finding 'saved-variables' 'Error' $rel $n "$($m.Groups[1].Value) is initialised like a saved variable but is not in the .toc ## SavedVariables line, so it is lost on logout"
        }
    }
}

Write-Timing 'saved-variables'

# --- lua-syntax --------------------------------------------------------------------------------
$lua = Join-Path $root '.claude\tools\lua51\lua.exe'
$checker = Join-Path $root '.claude\tools\lua51\check-syntax.lua'
if ((Test-Path $lua) -and (Test-Path $checker)) {
    $targets = @(if ($ChangedOnly) { $luaFiles | Where-Object { $changed.ContainsKey($_) } } else { $luaFiles })
    if ($targets.Count -gt 0) {
        $ErrorActionPreference = 'Continue'
        $out = ($targets -join "`n") | & $lua $checker - 2>&1 | ForEach-Object { "$_" }
        $ErrorActionPreference = 'Stop'
        foreach ($line in $out) {
            $m = [regex]::Match($line, '^(.*?):(\d+): (.*)$')
            if ($m.Success) { Add-Finding 'lua-syntax' 'Error' $m.Groups[1].Value ([int]$m.Groups[2].Value) $m.Groups[3].Value }
        }
    }
}
else {
    Add-Finding 'lua-syntax' 'Warning' '.claude/tools/lua51' 1 'vendored Lua missing, syntax not checked (run Build-Lua51.ps1)'
}

Write-Timing 'lua-syntax'

# --- globals: no accidental writes to the global environment -----------------------------------
# luac -l lists one SETGLOBAL per assignment to an undeclared name. Anything that is not a KrowiAF*/
# BINDING_*/SLASH_* name and not listed in Check-Repo.globals ("<path glob> <name glob>") is a leak,
# or a Blizzard override nobody has owned up to. Vendored Libs are not ours to lint.
$luac = Join-Path $root '.claude\tools\lua51\luac.exe'
if (Test-Path $luac) {
    $allowGlobals = @()
    $allowFile = Join-Path $PSScriptRoot 'Check-Repo.globals'
    if (Test-Path $allowFile) {
        foreach ($line in Get-Content $allowFile) {
            $t = ($line -replace '#.*$', '').Trim()
            if ($t -match '^(\S+)\s+(\S+)$') { $allowGlobals += @{ Path = $Matches[1]; Name = $Matches[2] } }
        }
    }
    $targets = @(if ($ChangedOnly) { $ownLuaFiles | Where-Object { $changed.ContainsKey($_) } } else { $ownLuaFiles })
    $bomMap = @{}     # temp copy path -> repo path, for files whose BOM stock luac would reject
    $tmpDir = $null
    # The listing is one line per bytecode instruction (about 100k lines for the tree), so it is
    # captured whole and scanned with one regex: a function header sets the current file, a
    # SETGLOBAL line yields (source line, name). 150 paths per call keeps the command line short.
    $listingRx = [regex]'(?m)^(?:main|function) <(?<path>.+?):\d+,\d+>|^\s*\d+\s+\[(?<line>\d+)\]\s+SETGLOBAL\s[^;]*;\s*(?<name>\S+)'
    for ($i = 0; $i -lt $targets.Count; $i += 150) {
        $chunk = @($targets[$i..([Math]::Min($i + 149, $targets.Count - 1))])
        $psi = [Diagnostics.ProcessStartInfo]::new($luac)
        $psi.UseShellExecute = $false; $psi.RedirectStandardOutput = $true; $psi.RedirectStandardError = $true
        $psi.WorkingDirectory = $root
        $psi.ArgumentList.Add('-l'); $psi.ArgumentList.Add('-p')
        foreach ($rel in $chunk) {
            $b = $fileBytes[$rel]
            if ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF) {
                if (-not $tmpDir) { $tmpDir = Join-Path ([IO.Path]::GetTempPath()) "kaf-globals-$PID"; New-Item -ItemType Directory -Force $tmpDir | Out-Null }
                $tmp = Join-Path $tmpDir ($rel -replace '[\\/]', '__')
                [IO.File]::WriteAllBytes($tmp, $b[3..($b.Length - 1)])
                $bomMap[$tmp.Replace('\', '/')] = $rel
                $psi.ArgumentList.Add($tmp)
            }
            else { $psi.ArgumentList.Add($rel) }
        }
        $proc = [Diagnostics.Process]::Start($psi)
        $errTask = $proc.StandardError.ReadToEndAsync()   # drain both pipes so neither blocks
        $listing = $proc.StandardOutput.ReadToEnd()
        $proc.WaitForExit(); $null = $errTask.Result           # syntax errors are the lua-syntax rule's job
        $current = $null
        foreach ($m in $listingRx.Matches($listing)) {
            if ($m.Groups['path'].Success) {
                $p = $m.Groups['path'].Value.Replace('\', '/')
                $current = if ($bomMap.ContainsKey($p)) { $bomMap[$p] } else { $p }
                continue
            }
            if (-not $current) { continue }
            $name = $m.Groups['name'].Value
            if ($name -like 'KrowiAF*' -or $name -like 'BINDING_*' -or $name -like 'SLASH_*') { continue }
            if ($allowGlobals | Where-Object { $current -like $_.Path -and $name -like $_.Name }) { continue }
            Add-Finding 'globals' 'Error' $current ([int]$m.Groups['line'].Value) "assigns global '$name'; declare it local (or hang it on addon.*), or if it is a deliberate Blizzard FrameXML override or API polyfill list it in .claude/tools/Check-Repo.globals with the reason"
        }
    }
    if ($tmpDir) { Remove-Item -Recurse -Force $tmpDir -ErrorAction SilentlyContinue }
}
Write-Timing 'globals'

# --- data-load: evaluate Api + DataAddons headlessly for each client -----------------------------
$loader = Join-Path $root '.claude\tools\headless\load-data.lua'
if ((Test-Path $lua) -and (Test-Path $loader)) {
    $ErrorActionPreference = 'Continue'
    $out = & $lua $loader $root Both 2>&1 | ForEach-Object { "$_" }   # runs Retail and Classic, cross-checks references
    $ErrorActionPreference = 'Stop'
    foreach ($line in $out) {
        $m = [regex]::Match($line, '^(.*?):(\d+): (.*)$')
        if ($m.Success) { Add-Finding 'data-load' 'Error' $m.Groups[1].Value ([int]$m.Groups[2].Value) $m.Groups[3].Value }
    }
}
Write-Timing 'data-load'

# --- lookup-placeholders: designated DB lookup scripts must be left with empty placeholders -----
foreach ($script in Get-ChildItem -Path (Join-Path $root '.claude\skills') -Recurse -Filter '_lookup_*.ps1') {
    $rel = ConvertTo-RelativePath $script.FullName
    $n = 0
    foreach ($line in Get-Content -LiteralPath $script.FullName) {
        $n++
        if ($line -match '^\s*\$(ids|terms)\s*=\s*@\(\s*[^)\s]') {
            $sev = if ($changed.ContainsKey($rel)) { 'Error' } else { 'Warning' }
            Add-Finding 'lookup-placeholders' $sev $rel $n 'lookup script committed with ids in its placeholder; reset it to @() after running (.github/copilot-instructions.md rule)'
        }
    }
}
Write-Timing 'lookup-placeholders'

# --- mapverifier: raw/MapVerifier.csv must be valid and in canonical form (Sync-MapVerifier.ps1 -Verify) --
$mvSync = Join-Path $root '.claude\skills\sync-mapverifier\Sync-MapVerifier.ps1'
if ((Test-Path $mvSync) -and (-not $ChangedOnly -or $changed.ContainsKey('raw/MapVerifier.csv'))) {
    $ErrorActionPreference = 'Continue'
    $out = & $mvSync -Verify *>&1 | ForEach-Object { "$_" }
    $ErrorActionPreference = 'Stop'
    foreach ($line in $out) {
        $m = [regex]::Match($line, '^(?:\[ERROR\]|FAIL —)\s+(.*)$')
        if (-not $m.Success) { continue }
        $msg = $m.Groups[1].Value
        $n = 1
        $lm = [regex]::Match($msg, '^line (\d+):')
        if ($lm.Success) { $n = [int]$lm.Groups[1].Value }
        Add-Finding 'mapverifier' 'Error' 'raw/MapVerifier.csv' $n $msg
    }
}
Write-Timing 'mapverifier'

# --- Diff-based rules: semicolon, enus-autogen -------------------------------------------------
function Get-AddedLines([string]$rel) {
    # lines added vs HEAD as @{Line; Text}; every line for an untracked file
    $result = [System.Collections.Generic.List[object]]::new()
    if ($changed[$rel] -eq 'untracked') {
        $n = 0
        foreach ($line in ([Text.Encoding]::UTF8.GetString($fileBytes[$rel]) -split "`r?`n")) { $n++; $result.Add(@{ Line = $n; Text = $line }) }
        return $result
    }
    $newLine = 0
    foreach ($line in (git diff -U0 HEAD -- $rel 2>$null)) {
        if ($line -match '^@@ -\d+(?:,\d+)? \+(\d+)') { $newLine = [int]$Matches[1]; continue }
        if ($line.StartsWith('+++')) { continue }
        if ($line.StartsWith('+')) { $result.Add(@{ Line = $newLine; Text = $line.Substring(1) }); $newLine++ }
    }
    return $result
}
$enUsRel = 'Localization/enUS.lua'
foreach ($rel in @($changed.Keys | Where-Object { $_ -like '*.lua' -and $_ -notlike 'Libs/*' -and (Test-AddonPath $_) -and $fileBytes.ContainsKey($_) })) {
    $added = Get-AddedLines $rel
    foreach ($a in $added) {
        if ($a.Text -match ';\s*(--.*)?$' -and $a.Text -notmatch '^\s*--') {
            Add-Finding 'semicolon' 'Error' $rel $a.Line 'trailing semicolon on an added line; new and edited code drops them (.github/copilot-instructions.md)'
        }
    }
    if ($rel -eq $enUsRel) {
        $marker = 0; $n = 0
        foreach ($line in ([Text.Encoding]::UTF8.GetString($fileBytes[$rel]) -split "`r?`n")) { $n++; if ($line -like '*AUTOGENTOKEN*') { $marker = $n; break } }
        foreach ($a in $added) {
            if ($marker -gt 0 -and $a.Line -gt $marker) {
                Add-Finding 'enus-autogen' 'Error' $rel $a.Line 'added below the AUTOGENTOKEN marker; that block is generated by CurseForge, add strings above it'
            }
        }
    }
    elseif ($rel -like 'Localization/*.lua' -and $rel -notlike 'Localization/enUS*.lua') {
        Add-Finding 'enus-autogen' 'Warning' $rel 1 'locale files other than enUS are managed by CurseForge; edits here are overwritten'
    }
}

Write-Timing 'diff rules'

# --- zone-decisions: raw/ZoneDataDecisions.md must agree with the ZoneData.lua files (offline checks) --
$zoneEval = Join-Path $root 'raw\Evaluate-ZoneDataDecisions.ps1'
$zoneTouched = $changed.Keys | Where-Object { $_ -eq 'raw/ZoneDataDecisions.md' -or $_ -like '*/ZoneData.lua' }
if ((Test-Path $zoneEval) -and (-not $ChangedOnly -or $zoneTouched)) {
    $ErrorActionPreference = 'Continue'
    $out = & $zoneEval -SkipDb *>&1 | ForEach-Object { "$_" }   # *> : the evaluator reports through Write-Host (information stream)
    $ErrorActionPreference = 'Stop'
    foreach ($line in $out) {
        $m = [regex]::Match($line, '^\[(ERROR|WARN)\s*\]\s+(\S+)\s+(.*)$')
        if (-not $m.Success) { continue }
        $sev = if ($m.Groups[1].Value -eq 'ERROR') { 'Error' } else { 'Warning' }
        $n = 1
        $idm = [regex]::Match($m.Groups[3].Value, '\bID (\d+)\b')
        if ($idm.Success) {
            $hit = Select-String -LiteralPath (Join-Path $root 'raw\ZoneDataDecisions.md') -Pattern ('^\| ' + $idm.Groups[1].Value + ' \|') | Select-Object -First 1
            if ($hit) { $n = $hit.LineNumber }
        }
        Add-Finding 'zone-decisions' $sev 'raw/ZoneDataDecisions.md' $n "$($m.Groups[2].Value): $($m.Groups[3].Value)"
    }
}
Write-Timing 'zone-decisions'

# --- changelog ---------------------------------------------------------------------------------
$codeChanged = @($changed.Keys | Where-Object { (Test-AddonPath $_) -and $_ -notlike '*.md' -and $_ -notlike 'Libs/*' })
if ($codeChanged.Count -gt 0 -and -not $changed.ContainsKey('_Packaging/Changelog.md')) {
    Add-Finding 'changelog' 'Warning' '_Packaging/Changelog.md' 1 "addon files changed ($($codeChanged.Count)) but the changelog was not; every user-visible change needs a line under the next version"
}

# --- Report ------------------------------------------------------------------------------------
# Check-Repo.ignore: one "<rule or *> <path glob>" per line, # comments; for deliberate exceptions
$ignore = @()
$ignoreFile = Join-Path $PSScriptRoot 'Check-Repo.ignore'
if (Test-Path $ignoreFile) {
    foreach ($line in Get-Content $ignoreFile) {
        $t = ($line -replace '#.*$', '').Trim()
        if ($t -match '^(\S+)\s+(\S+)$') { $ignore += @{ Rule = $Matches[1]; Path = $Matches[2] } }
    }
}
$alwaysOn = @('dup-id', 'saved-variables', 'lua-syntax', 'globals', 'data-load', 'zone-decisions', 'mapverifier', 'changelog')
$report = $findings | Where-Object {
    $f = $_
    -not ($ignore | Where-Object { ($_.Rule -eq '*' -or $_.Rule -eq $f.Rule) -and $f.Path -like $_.Path })
}
if ($ChangedOnly) {
    $report = $report | Where-Object { $changed.ContainsKey($_.Path) -or ($alwaysOn -contains $_.Rule) -or ($_.Rule -eq 'files-xml' -and $_.Message -like 'registered file does not exist*') }
}
$report = @($report | Sort-Object Path, Line, Rule)
foreach ($f in $report) { '{0}:{1}: [{2}] {3}: {4}' -f $f.Path, $f.Line, $f.Rule, $f.Severity, $f.Message }
$errors = @($report | Where-Object Severity -eq 'Error').Count
$warnings = @($report | Where-Object Severity -eq 'Warning').Count
"Check-Repo: $($ownLuaFiles.Count) Lua files, $($changed.Count) changed; $errors error(s), $warnings warning(s)"
exit $(if ($errors -gt 0) { 1 } else { 0 })