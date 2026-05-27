$r = @()
$c = @()

git show 73c2b5d:DataAddons/Retail/02_TheBurningCrusade/CategoryData.lua | ForEach-Object {
    if ($_ -match '^\s+(\d+),') { $r += $Matches[1] }
}

git show 73c2b5d:DataAddons/Classic/02_TheBurningCrusade/CategoryData.lua | ForEach-Object {
    if ($_ -match '^\s+(\d+),') { $c += $Matches[1] }
}

$rOnly = @($r | Where-Object { $_ -notin $c } | Sort-Object { [int]$_ } | Get-Unique)
$cOnly = @($c | Where-Object { $_ -notin $r } | Sort-Object { [int]$_ } | Get-Unique)

Write-Host "Retail total: $($r.Count) unique: $(($r | Get-Unique).Count)"
Write-Host "Classic total: $($c.Count) unique: $(($c | Get-Unique).Count)"
Write-Host "`nRetail-only ($($rOnly.Count)):"
Write-Host ($rOnly -join ", ")
Write-Host "`nClassic-only ($($cOnly.Count)):"
Write-Host ($cOnly -join ", ")
