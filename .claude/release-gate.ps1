<#
.SYNOPSIS
    Krowi_AchievementFilter's own release check. The kit's release preflight (Krowi_ClaudeKit\skills\release\
    Check-ReleaseReady.ps1) dot-sources it after its TOC checks: Options/Window/Changelog.lua must list the changelog's
    top entry (run .claude/tools/Build-ChangelogLua.ps1 when it does not), and the in-game suites must have a green run
    on the newest build of each client the TOC claims: escape and options on Retail, options on Mists Classic.

.DESCRIPTION
    The escape suite models Blizzard's Escape chain, which a patch can change; the options suite drives the options
    window, built on Blizzard templates a patch can change (docs/work/2026-10-25-options-revamp). Their last in-game runs
    (/kaftest <suite>, then /reload) must be green on the newest version of each client family the TOC's `## Interface:`
    line claims, read from that family's live and test-realm saved variables, before that version ships. A new interface
    number therefore blocks the release until the suites have run on that client; when a run differs from the headless
    model, update the model in .claude/tools/headless/run-tests.lua before releasing. Titan Reforged has no local
    install, so its interface number is not checked here. Not something to bypass: run the suites.

    Uses from the preflight: $repo, $addon, $toc, $Lua, Get-ClientFolder, Pass and Fail. Its own variables stay in a
    child scope.
#>
& {
    # The options window's Overview lists the released version's changelog lines, generated from the changelog
    $changelogCheck = @(& (Join-Path $repo '.claude\tools\Build-ChangelogLua.ps1') -Check)
    if ($LASTEXITCODE -eq 0) { Pass ($changelogCheck -join ' ') } else { Fail ($changelogCheck -join ' ') }

    # The in-game suites each client family needs green, and where its saved variables are
    $families = @(
        @{ Name = 'Retail'; Suites = @('escape', 'options'); Min = 100000; Max = 999999; Clients = @('Retail', 'Ptr', 'Xptr') },
        @{ Name = 'Mists Classic'; Suites = @('options'); Min = 50000; Max = 59999; Clients = @('Classic', 'ClassicPtr') }
    )
    $interface = (Select-String -LiteralPath $toc.FullName -Pattern '^## Interface:\s*(.+)$').Matches[0].Groups[1].Value
    $numbers = @($interface -split '[,\s]+' | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [int]$_ })
    $reader = Join-Path $repo '.claude\tools\headless\read-runs.lua'

    foreach ($family in $families) {
        $claimed = @($numbers | Where-Object { $_ -ge $family.Min -and $_ -le $family.Max } | Sort-Object -Descending)
        if ($claimed.Count -eq 0) { continue }
        $i = $claimed[0]
        $newest = [version]("{0}.{1}.{2}" -f [math]::Floor($i / 10000), ([math]::Floor($i / 100) % 100), ($i % 100))
        $runs = foreach ($client in $family.Clients) {
            $folder = Get-ClientFolder $client
            $flavor = Split-Path $folder -Leaf
            $wtf = Join-Path $folder 'WTF\Account'
            if (-not (Test-Path -LiteralPath $wtf)) { continue }
            foreach ($sv in Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName "SavedVariables\$addon.lua" } | Where-Object { Test-Path -LiteralPath $_ }) {
                foreach ($line in @(& $Lua $reader $sv 2>$null)) {
                    $f = "$line" -split '\|'
                    if ($f.Count -lt 6) { continue }
                    $build = $null; [void][version]::TryParse($f[1], [ref]$build)
                    [pscustomobject]@{ Suite = $f[0]; Build = $build; Failed = [int]$f[3]; Time = $f[5]; Flavor = $flavor }
                }
            }
        }
        foreach ($suite in $family.Suites) {
            # A run counts only when it is newer than the last commit that changed the suite's scenarios
            $suiteFile = 'Tests/' + (Get-Culture).TextInfo.ToTitleCase($suite) + '.lua'
            $changed = [datetime]::MinValue
            $lastCommit = git -C $repo log -1 --format=%ci -- $suiteFile 2>$null
            if ($lastCommit) { $changed = ([datetimeoffset]::Parse($lastCommit)).LocalDateTime }
            $mine = @($runs | Where-Object { $_.Suite -eq $suite -and $_.Build })
            $green = @($mine | Where-Object { $_.Build -ge $newest -and $_.Failed -eq 0 -and [datetime]$_.Time -ge $changed })
            if ($green.Count -gt 0) {
                $g = $green | Sort-Object Build, Time -Descending | Select-Object -First 1
                Pass "In-game '$suite' suite green on $($family.Name) $($g.Build) ($($g.Flavor), $($g.Time))"
            } else {
                $seen = if ($mine.Count -gt 0) { ($mine | Sort-Object Build, Time -Descending | ForEach-Object { "$($_.Build) $($_.Flavor) failed=$($_.Failed) $($_.Time)" }) -join '; ' } else { 'no run found' }
                Fail "In-game '$suite' suite has no green run on $($family.Name) $newest or later since $suiteFile changed ($($changed.ToString('yyyy-MM-dd HH:mm'))): run /kaftest $suite on that client and /reload. Seen: $seen"
            }
        }
    }
}