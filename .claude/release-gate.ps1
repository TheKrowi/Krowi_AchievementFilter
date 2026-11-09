<#
.SYNOPSIS
    Krowi_AchievementFilter's own release check. The kit's release preflight (Krowi_ClaudeKit\skills\release\
    Check-ReleaseReady.ps1) dot-sources it after its TOC checks: Options/Window/Changelog.lua must list the changelog's
    top entry (run .claude/tools/Build-ChangelogLua.ps1 when it does not), every in-game suite must have a green run on
    the newest build of each client the TOC claims, and the library's own tests must have a green full run on that build.

.DESCRIPTION
    Before a release the addon gets a full swoop (Krowi, 2026-11-07): each scenario suite that runs in game, on Retail
    and on Mists Classic. A run is green only when it failed nothing and passed something, the rule of
    .claude/tools/Run-GameTests.ps1 (Krowi, 2026-11-08: a run that only skipped proves nothing), so a suite with little
    to do on a client checks there, read only, that what it covers is absent (docs/work/2026-11-08-test-run-history).
    `scheduler` and `sources` (game-only observations) and `pictures` (makes the help pictures) are not checks and never
    count. In development and in pull requests only the suites a change can affect are run, never the whole set.

    The options window's frames are built on Blizzard templates a patch can change; their steps live in Krowi_Options'
    test addon (Krowi_OptionsTests, /kotest). Its full run (`all`) is required once per client version, not on every
    release: a green run on the newest build or later passes, whenever it ran, and a client that gets a new version
    number blocks the release until the library's tests have run on it. Run it with Krowi_Options'
    .claude/tools/Run-GameTests.ps1, with the test addon deployed together with the library copy KAF embeds.

    The suites' last in-game runs (/kaftest <suite>, then /reload) are read from each family's live and test-realm saved
    variables. A suite's run counts only when it is newer than the last commit that changed the suite's file. A new
    interface number therefore blocks the release until the suites have run on that client; when a run differs from the
    headless model, update the model in .claude/tools/headless/run-tests.lua before releasing. Titan Reforged has no
    local install, so its interface number is not checked here. Not something to bypass: run the suites.

    Uses from the preflight: $repo, $addon, $toc, $Lua, Get-ClientFolder, Pass and Fail. Its own variables stay in a
    child scope.
#>
& {
    # The options window's Overview lists the released version's changelog lines, generated from the changelog
    $changelogCheck = @(& (Join-Path $repo '.claude\tools\Build-ChangelogLua.ps1') -Check)
    if ($LASTEXITCODE -eq 0) { Pass ($changelogCheck -join ' ') } else { Fail ($changelogCheck -join ' ') }

    # Every in-game scenario suite, for each client family, and where its saved variables are
    $suites = @('escape', 'special', 'navigation', 'worldmap', 'obtainable', 'tooltip', 'guide', 'menu', 'memory', 'events',
        'schedules', 'tracking', 'options', 'help', 'earned', 'plugins', 'popups', 'features')
    # The suites whose file is not the title-cased suite name
    $suiteFiles = @{ special = 'SpecialCategories'; popups = 'PopUps'; worldmap = 'WorldMap' }
    $families = @(
        @{ Name = 'Retail'; Min = 100000; Max = 999999; Clients = @('Retail', 'Ptr', 'Xptr') },
        @{ Name = 'Mists Classic'; Min = 50000; Max = 59999; Clients = @('Classic', 'ClassicPtr') }
    )
    $interface = (Select-String -LiteralPath $toc.FullName -Pattern '^## Interface:\s*(.+)$').Matches[0].Groups[1].Value
    $numbers = @($interface -split '[,\s]+' | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [int]$_ })
    $reader = Join-Path $repo '.claude\tools\headless\read-runs.lua'

    # The runs an addon's saved variables keep, from every client of the family: Suite, Build, Passed, Failed, Time, Flavor
    function Get-Runs($family, $savedFile, $savedTable, $mode) {
        foreach ($client in $family.Clients) {
            $folder = Get-ClientFolder $client
            $flavor = Split-Path $folder -Leaf
            $wtf = Join-Path $folder 'WTF\Account'
            if (-not (Test-Path -LiteralPath $wtf)) { continue }
            foreach ($sv in Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName "SavedVariables\$savedFile.lua" } | Where-Object { Test-Path -LiteralPath $_ }) {
                $readerArgs = @($reader, $sv, $savedTable) + @($mode | Where-Object { $_ }) + @($runVersion | Where-Object { $_ } | ForEach-Object { "version=$_" })
                foreach ($line in @(& $Lua @readerArgs 2>$null)) {
                    $f = "$line" -split '\|'
                    if ($f.Count -lt 6) { continue }
                    $build = $null; [void][version]::TryParse($f[1], [ref]$build)
                    $complete = if ($f.Count -ge 7) { $f[6] -eq '1' } else { $true }
                    [pscustomobject]@{ Suite = $f[0]; Build = $build; Passed = [int]$f[2]; Failed = [int]$f[3]; Time = $f[5]; Flavor = $flavor; Complete = $complete }
                }
            }
        }
    }

    foreach ($family in $families) {
        $claimed = @($numbers | Where-Object { $_ -ge $family.Min -and $_ -le $family.Max } | Sort-Object -Descending)
        if ($claimed.Count -eq 0) { continue }
        $i = $claimed[0]
        $newest = [version]("{0}.{1}.{2}" -f [math]::Floor($i / 10000), ([math]::Floor($i / 100) % 100), ($i % 100))
        # Only runs of the version being released count, so a hotfix is tested as itself and never by main's build
        # (the kit's docs/work/2026-11-08-hotfix-mode): Get-Runs hands $runVersion to the reader, for the suites and the
        # matrix run; /kotest below keeps its own rule, so it is cleared before it
        $runVersion = $tocVersion
        $runs = @(Get-Runs $family $addon 'KrowiAF_DebugTable')
        foreach ($suite in $suites) {
            # A run counts only when it is newer than the last commit that changed the suite's scenarios
            $name = if ($suiteFiles.ContainsKey($suite)) { $suiteFiles[$suite] } else { (Get-Culture).TextInfo.ToTitleCase($suite) }
            $suiteFile = "Tests/$name.lua"
            $changed = [datetime]::MinValue
            $lastCommit = git -C $repo log -1 --format=%ci -- $suiteFile 2>$null
            if ($lastCommit) { $changed = ([datetimeoffset]::Parse($lastCommit)).LocalDateTime }
            $mine = @($runs | Where-Object { $_.Suite -eq $suite -and $_.Build })
            $green = @($mine | Where-Object { $_.Build -ge $newest -and $_.Failed -eq 0 -and $_.Passed -gt 0 -and [datetime]$_.Time -ge $changed })
            if ($green.Count -gt 0) {
                $g = $green | Sort-Object Build, Time -Descending | Select-Object -First 1
                Pass "In-game '$suite' suite green on $($family.Name) $($g.Build) ($($g.Flavor), $($g.Time))"
            } else {
                $seen = if ($mine.Count -gt 0) { ($mine | Sort-Object Build, Time -Descending | ForEach-Object { "$($_.Build) $($_.Flavor) passed=$($_.Passed) failed=$($_.Failed) $($_.Time)" }) -join '; ' } else { 'no run found' }
                Fail "In-game '$suite' suite has no green run (failed nothing, passed something) on $($family.Name) $newest or later since $suiteFile changed ($($changed.ToString('yyyy-MM-dd HH:mm'))): run /kaftest $suite on that client and /reload. Seen: $seen"
            }
        }

        # The features that switch off (docs/work/2026-11-08-feature-split-poc): a whole /kaftest matrix run (every suite
        # with every feature on, every feature off and each feature alone) green on the newest build or later, newer than
        # the last change under Features/ or to the registry and the slots
        $featuresChanged = [datetime]::MinValue
        $lastFeatures = git -C $repo log -1 --format=%ci -- Features/ Features.lua Slots.lua 2>$null
        if ($lastFeatures) { $featuresChanged = ([datetimeoffset]::Parse($lastFeatures)).LocalDateTime }
        $matrixRuns = @(Get-Runs $family $addon 'KrowiAF_DebugTable' 'matrix' | Where-Object { $_.Suite -eq 'matrix' -and $_.Build })
        $runVersion = $null
        $matrixGreen = @($matrixRuns | Where-Object { $_.Build -ge $newest -and $_.Complete -and $_.Failed -eq 0 -and $_.Passed -gt 0 -and [datetime]$_.Time -ge $featuresChanged })
        if ($matrixGreen.Count -gt 0) {
            $g = $matrixGreen | Sort-Object Build, Time -Descending | Select-Object -First 1
            Pass "In-game matrix run (features on, off, alone) green on $($family.Name) $($g.Build) ($($g.Flavor), $($g.Time))"
        } else {
            $seen = if ($matrixRuns.Count -gt 0) { ($matrixRuns | Sort-Object Build, Time -Descending | ForEach-Object { "$($_.Build) $($_.Flavor) passed=$($_.Passed) failed=$($_.Failed) complete=$($_.Complete) $($_.Time)" }) -join '; ' } else { 'no run found' }
            Fail "In-game matrix run has no green whole run (every step ran every suite, failed nothing, passed something) on $($family.Name) $newest or later since Features/, Features.lua or Slots.lua changed ($($featuresChanged.ToString('yyyy-MM-dd HH:mm'))): run .claude/tools/Run-GameTests.ps1 -Matrix on that client. Seen: $seen"
        }

        # The library's tests: one green full run on the newest build or later, whenever it ran, so only the first
        # release after a client's new version number is blocked
        $libraryRuns = @(Get-Runs $family 'Krowi_OptionsTests' 'KrowiOptionsTests_Debug' | Where-Object { $_.Suite -eq 'all' -and $_.Build })
        $libraryGreen = @($libraryRuns | Where-Object { $_.Build -ge $newest -and $_.Failed -eq 0 -and $_.Passed -gt 0 })
        if ($libraryGreen.Count -gt 0) {
            $g = $libraryGreen | Sort-Object Build, Time -Descending | Select-Object -First 1
            Pass "Krowi_Options' tests (/kotest all) green on $($family.Name) $($g.Build) ($($g.Flavor), $($g.Time))"
        } else {
            $seen = if ($libraryRuns.Count -gt 0) { ($libraryRuns | Sort-Object Build, Time -Descending | ForEach-Object { "$($_.Build) $($_.Flavor) passed=$($_.Passed) failed=$($_.Failed) $($_.Time)" }) -join '; ' } else { 'no run found' }
            Fail "Krowi_Options' tests (/kotest all) have no green run (failed nothing, passed something) on $($family.Name) $newest or later: run them with Krowi_Options' .claude/tools/Run-GameTests.ps1 all on that client, the test addon deployed with the library copy KAF embeds. Seen: $seen"
        }
    }
}