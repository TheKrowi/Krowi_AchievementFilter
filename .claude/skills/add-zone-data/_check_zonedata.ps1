# Check which achievement IDs are already present in a ZoneData.lua Zone() entry, straight from the Lua.
# Replaces _check_csv.ps1, which read MapVerifier_ZonesPerAchievement.csv — a stale export that drifted
# from the real files (24 ids missing, 175 with different maps on 2026-09-04).
# Pass the achievement ids as -Ids 12345,12346, or set the $Ids placeholder below, run, and reset it to @().
# Output: id|PRESENT|primaries=<primary map ids>|maps=<all map ids>|files=<relative paths>   or   id|NOT_PRESENT
param(
    [string[]] $Ids = @()
)
if ($Ids.Count -eq 0) { Write-Host "Pass -Ids or set the `$Ids placeholder first."; return }
$root = (Resolve-Path "$PSScriptRoot\..\..\..").Path
. "$PSScriptRoot\_zonedata_parser.ps1"
$zd = Get-ZoneDataIndex -RootDir $root
$mapRef = Get-MapReference -RootDir $root
foreach ($id in $ids) {
    if ($zd.IdToMaps.ContainsKey([int]$id)) {
        $maps = @($zd.IdToMaps[[int]$id] | Sort-Object)
        $prims = @($maps | ForEach-Object { ConvertTo-PrimaryMap $mapRef $_ } | Sort-Object -Unique | ForEach-Object { "$_ $($mapRef.Names[$_])" })
        $files = @($zd.IdToFiles[[int]$id] | Sort-Object | ForEach-Object { $_ -replace '^DataAddons\\', '' })
        Write-Host "$id|PRESENT|primaries=$($prims -join '; ')|maps=$($maps -join ',')|files=$($files -join ', ')"
    } else {
        Write-Host "$id|NOT_PRESENT"
    }
}
