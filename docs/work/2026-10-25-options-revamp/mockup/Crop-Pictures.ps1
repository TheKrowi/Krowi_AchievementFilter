param(
    [Parameter(Mandatory)] [string] $InDir,
    [Parameter(Mandatory)] [string] $OutDir,
    [int] $Fade = 18
)
# Cuts the help pane pictures out of the tutorial pictures and gives each the old soft edge.
Add-Type -AssemblyName System.Drawing

# The old pictures' edge: alpha at 0, 4, 8 ... 40 px in from the edge (measured, identical on every picture).
$curve = @(2, 6, 16, 39, 80, 135, 187, 223, 242, 250, 253, 255)
function EdgeAlpha([double] $d) {
    $t = $d / $Fade * 40 / 4
    if ($t -ge $curve.Count - 1) { return 1.0 }
    $i = [Math]::Floor($t); $f = $t - $i
    (($curve[$i] * (1 - $f)) + ($curve[$i + 1] * $f)) / 255.0
}

$crops = @(
    @('TooltipAchievements', 'TipAchievement', 632, 40, 344, 296),
    @('TooltipCategories', 'TipCategory', 44, 42, 466, 76),
    @('EarnedBy', 'TipPoints', 138, 48, 284, 142),
    @('EarnedBy', 'TipEarnedBy', 672, 194, 344, 274),
    @('RightClickMenu', 'MenuMain', 150, 102, 292, 112),
    @('RightClickMenu', 'MenuGoTo', 432, 142, 294, 150),
    @('FilteringSorting', 'FilterMenu', 176, 76, 364, 394),
    @('Categories', 'CategoryTree', 50, 52, 300, 320),
    @('Summary', 'SummaryBars', 64, 355, 300, 235),
    @('Calendar', 'CalendarDays', 0, 96, 384, 422),
    @('CompactAchievements', 'CompactList', 44, 50, 420, 236),
    @('NewAchievementColors', 'Colors', 40, 48, 330, 364),
    @('QuickSearch', 'SearchBox', 52, 52, 256, 222),
    @('WorldMapButton', 'MapButton', 40, 44, 350, 300),
    @('TabButton', 'NewTabs', 400, 48, 484, 62),
    @('EventReminder', 'Reminders', 46, 50, 330, 210)
)

New-Item -ItemType Directory -Force $OutDir | Out-Null
foreach ($c in $crops) {
    $src = New-Object System.Drawing.Bitmap (Join-Path $InDir "$($c[0]).png")
    $w = $c[4]; $h = $c[5]
    $bmp = New-Object System.Drawing.Bitmap $w, $h, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    for ($y = 0; $y -lt $h; $y++) {
        $ay = EdgeAlpha ([Math]::Min($y, $h - 1 - $y))
        for ($x = 0; $x -lt $w; $x++) {
            $p = $src.GetPixel($c[2] + $x, $c[3] + $y)
            $a = [int]($p.A * $ay * (EdgeAlpha ([Math]::Min($x, $w - 1 - $x))))
            $bmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($a, $p.R, $p.G, $p.B))
        }
    }
    $out = Join-Path $OutDir "$($c[1]).png"
    $bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose(); $src.Dispose()
    '{0,-16} {1}x{2}' -f $c[1], $w, $h
}