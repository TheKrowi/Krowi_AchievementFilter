<#
.SYNOPSIS
    Krowi_AchievementFilter's own release check. The kit's release preflight (Krowi_ClaudeKit\skills\release\
    Check-ReleaseReady.ps1) dot-sources it after its TOC checks: the escape suite must have a green in-game run on
    the newest Retail client the TOC claims.

.DESCRIPTION
    The escape suite models Blizzard's Escape chain, which a patch can change. Its last in-game run (/kaftest escape,
    then /reload) must be green on the newest Retail version the TOC's `## Interface:` line claims, read from the
    live, PTR and second-PTR (_xptr_) saved variables, before that version ships. A new interface number therefore
    blocks the release until the suite has run on that client; when it differs from the headless model, update the
    model in .claude/tools/headless/run-tests.lua before releasing. Not something to bypass: run the suite.

    Uses from the preflight: $repo, $addon, $toc, $Lua, Get-ClientFolder, Pass and Fail. Its own variables stay in a
    child scope.
#>
& {
    # Suites that model Blizzard UI code a patch can change
    $suitesOnNewestClient = @('escape')
    $interface = (Select-String -LiteralPath $toc.FullName -Pattern '^## Interface:\s*(.+)$').Matches[0].Groups[1].Value
    $retailInterface = @($interface -split '[,\s]+' | Where-Object { $_ -match '^\d+$' -and [int]$_ -ge 100000 } | ForEach-Object { [int]$_ } | Sort-Object -Descending | Select-Object -First 1)
    if (-not $retailInterface) { return }

    $i = $retailInterface[0]
    $newest = [version]("{0}.{1}.{2}" -f [math]::Floor($i / 10000), ([math]::Floor($i / 100) % 100), ($i % 100))
    $reader = Join-Path $repo '.claude\tools\headless\read-runs.lua'
    $runs = foreach ($client in 'Retail', 'Ptr', 'Xptr') {
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
    foreach ($suite in $suitesOnNewestClient) {
        $mine = @($runs | Where-Object { $_.Suite -eq $suite -and $_.Build })
        $green = @($mine | Where-Object { $_.Build -ge $newest -and $_.Failed -eq 0 })
        if ($green.Count -gt 0) {
            $g = $green | Sort-Object Build, Time -Descending | Select-Object -First 1
            Pass "In-game '$suite' suite green on $($g.Build) ($($g.Flavor), $($g.Time))"
        } else {
            $seen = if ($mine.Count -gt 0) { ($mine | Sort-Object Build, Time -Descending | ForEach-Object { "$($_.Build) $($_.Flavor) failed=$($_.Failed)" }) -join '; ' } else { 'no run found' }
            Fail "In-game '$suite' suite has no green run on $newest or later (TOC Interface $i): run /kaftest $suite on that client and /reload. Seen: $seen"
        }
    }
}