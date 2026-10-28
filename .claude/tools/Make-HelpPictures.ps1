<#
.SYNOPSIS
    Turns a /kaftest pictures run into the options window's help pictures: Media\Help\<Name>.tga and the generated
    Options\Window\Help\Pictures.lua (docs/work/2026-10-25-options-revamp/plan-help.md).

.DESCRIPTION
    Tests\Pictures.lua records, per picture, the screen rectangle to cut out and the moment of its screenshot in
    KrowiAF_DebugTable.Pictures (written on the next /reload). This tool reads that with the kit's Lua 5.1
    (headless\read-pictures.lua), finds each screenshot in the client's Screenshots folder by its time, as
    Read-GameTests.ps1 does, and for every picture:
      - cuts the rectangle out (scaled when the screenshot's size differs from the recorded screen), stacking the parts
        of a picture recorded in several steps (Colors) top to bottom;
      - looks at each side, as the old tutorial pictures were made by hand (docs/work/2026-10-26-help-picture-margins):
        where the frame ends in the run's black backdrop within 24 px of the cut, a frame's own edge shows there, so
        the cut takes in what the frame draws outside its rectangle (a border, the tabs' art), moves in over black to
        the frame's visible edge and gets -Margin pixels of black; where content goes on (a long tooltip, the window
        around the category list) the side is a cut through it;
      - scales it down so its longest side, margins included, is at most -MaxSide pixels;
      - gives it the old tutorial pictures' soft edge: the alpha curve every old picture has over its outer 40 px, in
        the margin of an edge side, and scaled to -Fade pixels on a cut side
        (docs/work/2026-10-25-options-revamp/mockup/Crop-Pictures.ps1);
      - pads it with transparency to powers of two, as every texture in Media\ is;
      - writes it as a 32-bit RLE TGA with the old files' header (type 10, top-left origin, TGA 2.0 footer).
    Each picture comes from the newest run that recorded it, so a run that skipped one (Compact Achievements off) does
    not lose the picture of an earlier run. Pictures.lua keeps the entries of pictures this call did not make.

    Screenshots may be jpg (the game's default; type /console screenshotQuality 10 in game first, quality 3 blurs text),
    png or tga. The Read tool cannot open TGA, so -Preview writes a PNG of each picture to look at.

.PARAMETER Client
    Retail (_retail_, default), Classic (_classic_), Ptr or Xptr.

.PARAMETER Account
    Account folder name (e.g. 133658957#1) instead of the most recently written saved variables.

.PARAMETER SavedVariables
    A Krowi_AchievementFilter.lua saved variables file to read instead of the client's (a copy, or a test).

.PARAMETER Screenshots
    A folder to look for the screenshots in instead of the client's Screenshots folder.

.PARAMETER Only
    Makes only these pictures.

.PARAMETER MaxSide
    Longest side in pixels after scaling. Default 1024, so a picture stays sharp when the pane shows it enlarged.

.PARAMETER Fade
    Width of the soft edge on a side that cuts through content, in pixels. Default 18.

.PARAMETER Margin
    Black around a frame's own edge, in pixels, faded out over its outer 40. Default 50, as the old tutorial pictures
    had wherever a frame's edge shows.

.PARAMETER Preview
    A folder to write a PNG of every picture made, without its padding.

.EXAMPLE
    & ".claude\tools\Make-HelpPictures.ps1" -WhatIf
    & ".claude\tools\Make-HelpPictures.ps1" -Preview "$env:TEMP\help-pictures"
    & ".claude\tools\Make-HelpPictures.ps1" -Only Colors,MenuGoTo
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [ValidateSet('Retail', 'Classic', 'Ptr', 'Xptr')][string]$Client = 'Retail',
    [string]$Account,
    [string]$SavedVariables,
    [string]$Screenshots,
    [string[]]$Only,
    [int]$MaxSide = 1024,
    [int]$Fade = 18,
    [int]$Margin = 50,
    [string]$Preview
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
. (Join-Path $PSScriptRoot 'KitPath.ps1')
. (Join-Path $KitTools 'AddonContext.ps1')   # the kit's client map: Get-ClientFolder
Add-Type -AssemblyName System.Drawing
$invariant = [Globalization.CultureInfo]::InvariantCulture
$utf8 = New-Object Text.UTF8Encoding $false
$mediaDir = Join-Path $root 'Media\Help'
$picturesLua = Join-Path $root 'Options\Window\Help\Pictures.lua'

# --- the run ------------------------------------------------------------------------------------------------------
$wtf = Join-Path (Get-ClientFolder $Client) 'WTF\Account'
$file = if ($SavedVariables) {
    Get-Item -LiteralPath $SavedVariables
} elseif ($Account) {
    Get-Item -LiteralPath (Join-Path $wtf "$Account\SavedVariables\Krowi_AchievementFilter.lua")
} else {
    Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName 'SavedVariables\Krowi_AchievementFilter.lua' } |
        Where-Object { Test-Path -LiteralPath $_ } | Get-Item | Sort-Object LastWriteTime -Descending | Select-Object -First 1
}
if (-not $file) { throw "No Krowi_AchievementFilter.lua under $wtf; has the client been reloaded since the run?" }
"Saved variables: $($file.FullName) (last written $($file.LastWriteTime))"

$runs = @{}
$shots = New-Object System.Collections.Generic.List[object]
foreach ($line in & $KitLua (Join-Path $root '.claude\tools\headless\read-pictures.lua') $file.FullName) {
    $f = "$line" -split "`t"
    if ($f[0] -eq 'RUN') {
        $runs[[int]$f[1]] = [pscustomobject]@{ Time = $f[2]; Client = $f[3]; Build = $f[4]; Width = [int]$f[5]; Height = [int]$f[6] }
    } elseif ($f[0] -eq 'SHOT') {
        $shots.Add([pscustomobject]@{ Run = [int]$f[1]; Name = $f[2]; Time = [datetime]::ParseExact($f[3], 'yyyy-MM-dd HH:mm:ss', $invariant)
            Left = [double]::Parse($f[4], $invariant); Top = [double]::Parse($f[5], $invariant); Right = [double]::Parse($f[6], $invariant)
            Bottom = [double]::Parse($f[7], $invariant); Width = [int]$f[8]; Height = [int]$f[9] })
    }
}
if ($shots.Count -eq 0) { throw "The saved variables hold no pictures run; run /kaftest pictures in game, then /reload." }

# Each picture from the newest run that recorded it, its parts in the order they were taken
$pictures = $shots | Group-Object Name | ForEach-Object {
    $newest = [int]($_.Group | Measure-Object Run -Maximum).Maximum   # Measure-Object gives a double, the runs are keyed by int
    [pscustomobject]@{ Name = $_.Name; Run = $newest; Parts = @($_.Group | Where-Object Run -eq $newest | Sort-Object Time) }
} | Where-Object { -not $Only -or $Only -contains $_.Name } | Sort-Object Name

# --- the screenshots ----------------------------------------------------------------------------------------------
# The game names the file after the second it was written, the same second or the next (WoWScrnShot_MMddyy_HHmmss)
$shotDir = if ($Screenshots) { $Screenshots } else { Join-Path (Get-ClientFolder $Client) 'Screenshots' }
$files = @(if (Test-Path -LiteralPath $shotDir) {
    Get-ChildItem -LiteralPath $shotDir -File -Filter 'WoWScrnShot_*' | ForEach-Object {
        $t = [datetime]::MinValue
        if ($_.BaseName -match '^WoWScrnShot_(\d{6})_(\d{6})$' -and
            [datetime]::TryParseExact($Matches[1] + $Matches[2], 'MMddyyHHmmss', $invariant, 'None', [ref]$t)) {
            [pscustomobject]@{ Time = $t; Path = $_.FullName }
        }
    }
})
function Find-Screenshot([datetime]$at) {
    $files | Where-Object { ($_.Time - $at).TotalSeconds -ge -1 -and ($_.Time - $at).TotalSeconds -le 2 } |
        Sort-Object { [math]::Abs(($_.Time - $at).TotalSeconds) } | Select-Object -First 1
}

# A TGA screenshot, raw or RLE, 24 or 32 bit (as mockup\Convert-Tga.ps1 reads them)
function Read-Tga([string]$path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $imgType = $bytes[2]; $w = [BitConverter]::ToUInt16($bytes, 12); $h = [BitConverter]::ToUInt16($bytes, 14)
    $px = $bytes[16] / 8; $topDown = ($bytes[17] -band 0x20) -ne 0
    if ($bytes[1] -ne 0 -or ($imgType -ne 2 -and $imgType -ne 10) -or ($px -ne 3 -and $px -ne 4)) { throw "${path}: unsupported TGA" }
    $raw = New-Object byte[] ($w * $h * 4)
    $src = 18 + $bytes[0]; $i = 0; $count = $w * $h
    while ($i -lt $count) {
        if ($imgType -eq 2) { $run = 1; $repeat = $false } else { $hdr = $bytes[$src]; $src++; $run = ($hdr -band 0x7F) + 1; $repeat = ($hdr -band 0x80) -ne 0 }
        for ($k = 0; $k -lt $run; $k++) {
            $o = $i * 4
            $raw[$o] = $bytes[$src]; $raw[$o + 1] = $bytes[$src + 1]; $raw[$o + 2] = $bytes[$src + 2]
            $raw[$o + 3] = if ($px -eq 4) { $bytes[$src + 3] } else { 255 }
            if (-not $repeat) { $src += $px }
            $i++
        }
        if ($repeat) { $src += $px }
    }
    $bmp = New-Object System.Drawing.Bitmap $w, $h, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $data = $bmp.LockBits((New-Object System.Drawing.Rectangle 0, 0, $w, $h), 'WriteOnly', $bmp.PixelFormat)
    for ($y = 0; $y -lt $h; $y++) {
        $srcRow = if ($topDown) { $y } else { $h - 1 - $y }
        [Runtime.InteropServices.Marshal]::Copy($raw, $srcRow * $w * 4, [IntPtr]($data.Scan0.ToInt64() + $y * $data.Stride), $w * 4)
    }
    $bmp.UnlockBits($data)
    $bmp
}

$images = @{}
function Get-Image([string]$path) {
    if (-not $images.ContainsKey($path)) {
        $images[$path] = if ($path -like '*.tga') { Read-Tga $path } else { New-Object System.Drawing.Bitmap $path }
    }
    $images[$path]
}

# The screenshot's pixels, read once, for the side checks
$buffers = @{}
function Get-Buffer([string]$path) {
    if (-not $buffers.ContainsKey($path)) {
        $image = Get-Image $path
        $data = $image.LockBits((New-Object System.Drawing.Rectangle 0, 0, $image.Width, $image.Height), 'ReadOnly', ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb))
        $bytes = New-Object byte[] ($data.Stride * $image.Height)
        [Runtime.InteropServices.Marshal]::Copy($data.Scan0, $bytes, 0, $bytes.Length)
        $image.UnlockBits($data)
        $buffers[$path] = [pscustomobject]@{ Bytes = $bytes; Stride = $data.Stride; Width = $image.Width; Height = $image.Height }
    }
    $buffers[$path]
}

# A row or column of the screenshot from $from to $to is black when at most $share of it (and at least one pixel) is
# brighter than the backdrop (R+G+B above 40, over the jpg's noise); outside the screenshot nothing is black
function Test-Black($buffer, [bool]$row, [int]$at, [int]$from, [int]$to, [double]$share = 0.005) {
    if ($at -lt 0 -or $at -ge $(if ($row) { $buffer.Height } else { $buffer.Width })) { return $false }
    $bytes = $buffer.Bytes; $stride = $buffer.Stride; $bright = 0
    $allowed = [Math]::Max(1, [int][Math]::Floor(($to - $from + 1) * $share))
    for ($i = $from; $i -le $to; $i++) {
        $o = if ($row) { $at * $stride + $i * 4 } else { $i * $stride + $at * 4 }
        if (([int]$bytes[$o] + $bytes[$o + 1] + $bytes[$o + 2]) -gt 40) {
            $bright++
            if ($bright -gt $allowed) { return $false }
        }
    }
    $true
}

# The line $k px outside one side of the cut
function Test-Outside($buffer, [System.Drawing.Rectangle]$r, [string]$side, [int]$k, [double]$share) {
    switch ($side) {
        'Left' { Test-Black $buffer $false ($r.Left - $k) $r.Top ($r.Bottom - 1) $share }
        'Right' { Test-Black $buffer $false ($r.Right - 1 + $k) $r.Top ($r.Bottom - 1) $share }
        'Top' { Test-Black $buffer $true ($r.Top - $k) $r.Left ($r.Right - 1) $share }
        'Bottom' { Test-Black $buffer $true ($r.Bottom - 1 + $k) $r.Left ($r.Right - 1) $share }
    }
}

# A side shows a frame's own edge when the frame ends in black within $reach px of the cut: a border drawn just outside
# the frame's rectangle, the art Blizzard's achievement tabs hang below their buttons (19 px on a 1440 px screen); Grow
# takes them in. A frame laid over another one's corner (the guide panel and the reward preview over the window's
# border) still has its edge where at least 85% of the line 3 px out is black. Anything else is a cut through content.
$reach = 24
function Get-Side($buffer, [System.Drawing.Rectangle]$r, [string]$side) {
    for ($k = 1; $k -le $reach; $k++) {
        if (Test-Outside $buffer $r $side $k 0.005) { Write-Verbose "  $side`: black $k px out"; return [pscustomobject]@{ Edge = $true; Grow = $k - 1 } }
    }
    $mostlyBlack = Test-Outside $buffer $r $side 3 0.15
    Write-Verbose "  $side`: $(if ($mostlyBlack) { 'mostly' } else { 'not' }) black 3 px out"
    [pscustomobject]@{ Edge = $mostlyBlack; Grow = 0 }
}

# The cut moved in over black lines on the given sides, to the frame's visible edge
function Get-Trimmed($buffer, [System.Drawing.Rectangle]$r, [bool]$left, [bool]$top, [bool]$right, [bool]$bottom) {
    $l = $r.Left; $t = $r.Top; $rr = $r.Right - 1; $b = $r.Bottom - 1
    if ($top) { while ($t -lt $b -and (Test-Black $buffer $true $t $l $rr)) { $t++ } }
    if ($bottom) { while ($b -gt $t -and (Test-Black $buffer $true $b $l $rr)) { $b-- } }
    if ($left) { while ($l -lt $rr -and (Test-Black $buffer $false $l $t $b)) { $l++ } }
    if ($right) { while ($rr -gt $l -and (Test-Black $buffer $false $rr $t $b)) { $rr-- } }
    New-Object System.Drawing.Rectangle $l, $t, ($rr - $l + 1), ($b - $t + 1)
}

# --- the picture --------------------------------------------------------------------------------------------------
# The old pictures' edge: alpha at 0, 4, 8 ... 40 px in from the edge (measured, identical on every old picture),
# stretched to $width pixels: 40 in an edge side's margin, -Fade on a cut side
$curve = @(2, 6, 16, 39, 80, 135, 187, 223, 242, 250, 253, 255)
function Get-EdgeAlpha([double]$d, [double]$width) {
    $t = $d / $width * 40 / 4
    if ($t -ge $curve.Count - 1) { return 1.0 }
    $i = [Math]::Floor($t); $f = $t - $i
    (($curve[$i] * (1 - $f)) + ($curve[$i + 1] * $f)) / 255.0
}

function Get-NextPowerOfTwo([int]$n) { $p = 1; while ($p -lt $n) { $p *= 2 }; $p }

function New-ScaledBitmap($image, [System.Drawing.Rectangle]$from, [int]$width, [int]$height) {
    $bmp = New-Object System.Drawing.Bitmap $width, $height, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = 'HighQualityBicubic'; $g.PixelOffsetMode = 'HighQuality'; $g.CompositingMode = 'SourceCopy'
    $attributes = New-Object System.Drawing.Imaging.ImageAttributes
    $attributes.SetWrapMode([System.Drawing.Drawing2D.WrapMode]::TileFlipXY)   # no dark seam from outside the cut
    $g.DrawImage($image, (New-Object System.Drawing.Rectangle 0, 0, $width, $height), $from.X, $from.Y, $from.Width, $from.Height, 'Pixel', $attributes)
    $g.Dispose()
    $bmp
}

# BGRA rows top to bottom, run-length encoded per row, in the old files' layout
function Write-Tga([string]$path, [byte[]]$pixels, [int]$width, [int]$height) {
    $out = New-Object System.IO.MemoryStream
    $header = New-Object byte[] 18
    $header[2] = 10
    [BitConverter]::GetBytes([uint16]$width).CopyTo($header, 12)
    [BitConverter]::GetBytes([uint16]$height).CopyTo($header, 14)
    $header[16] = 32; $header[17] = 0x28   # 32 bit, 8 alpha bits, top-left origin
    $out.Write($header, 0, 18)
    for ($y = 0; $y -lt $height; $y++) {
        $rowStart = $y * $width
        $x = 0
        while ($x -lt $width) {
            $o = ($rowStart + $x) * 4
            $run = 1
            while ($x + $run -lt $width -and $run -lt 128) {
                $p = ($rowStart + $x + $run) * 4
                if ($pixels[$p] -ne $pixels[$o] -or $pixels[$p + 1] -ne $pixels[$o + 1] -or $pixels[$p + 2] -ne $pixels[$o + 2] -or $pixels[$p + 3] -ne $pixels[$o + 3]) { break }
                $run++
            }
            if ($run -gt 1) {
                $out.WriteByte(0x80 -bor ($run - 1)); $out.Write($pixels, $o, 4); $x += $run; continue
            }
            # a raw packet up to the next run of two equal pixels
            $count = 1
            while ($x + $count -lt $width -and $count -lt 128) {
                $p = ($rowStart + $x + $count) * 4
                $q = $p - 4
                if ($pixels[$p] -eq $pixels[$q] -and $pixels[$p + 1] -eq $pixels[$q + 1] -and $pixels[$p + 2] -eq $pixels[$q + 2] -and $pixels[$p + 3] -eq $pixels[$q + 3]) { $count--; break }
                $count++
            }
            if ($count -lt 1) { $count = 1 }
            $out.WriteByte($count - 1); $out.Write($pixels, $o, $count * 4); $x += $count
        }
    }
    $footer = New-Object byte[] 8
    $out.Write($footer, 0, 8)
    $signature = [Text.Encoding]::ASCII.GetBytes("TRUEVISION-XFILE.")
    $out.Write($signature, 0, $signature.Length); $out.WriteByte(0)
    [IO.File]::WriteAllBytes($path, $out.ToArray())
}

# --- make them ----------------------------------------------------------------------------------------------------
$made = @{}
foreach ($picture in $pictures) {
    $run = $runs[$picture.Run]
    $crops = @()
    foreach ($part in $picture.Parts) {
        $shot = Find-Screenshot $part.Time
        if (-not $shot) { Write-Warning "$($picture.Name): no screenshot near $($part.Time) (run $($run.Time))"; continue }
        $image = Get-Image $shot.Path
        $sx = $image.Width / [Math]::Max(1, $run.Width); $sy = $image.Height / [Math]::Max(1, $run.Height)
        $left = [Math]::Max(0, [int][Math]::Round($part.Left * $sx)); $top = [Math]::Max(0, [int][Math]::Round($part.Top * $sy))
        $right = [Math]::Min($image.Width, [int][Math]::Round($part.Right * $sx)); $bottom = [Math]::Min($image.Height, [int][Math]::Round($part.Bottom * $sy))
        if ($right -le $left -or $bottom -le $top) { Write-Warning "$($picture.Name): empty cut in $($shot.Path)"; continue }
        $rect = New-Object System.Drawing.Rectangle $left, $top, ($right - $left), ($bottom - $top)
        $crops += [pscustomobject]@{ Image = $image; Buffer = (Get-Buffer $shot.Path); Rect = $rect; Part = $part
            UnitsX = $part.Width / [double]$rect.Width; UnitsY = $part.Height / [double]$rect.Height }
    }
    if ($crops.Count -eq 0) { continue }

    # The picture's sides: left and right when every part has that edge, top from the first part, bottom from the last.
    # On those sides each part takes in its frame's art outside the cut, then moves in over the black.
    $sides = @($crops | ForEach-Object {
        $crop = $_; $found = [ordered]@{}
        foreach ($side in 'Left', 'Top', 'Right', 'Bottom') { $found[$side] = Get-Side $crop.Buffer $crop.Rect $side }
        [pscustomobject]$found
    })
    $edge = [pscustomobject]@{ Left = -not ($sides.Left.Edge -contains $false); Right = -not ($sides.Right.Edge -contains $false)
        Top = $sides[0].Top.Edge; Bottom = $sides[-1].Bottom.Edge }
    for ($i = 0; $i -lt $crops.Count; $i++) {
        $top = $edge.Top -and $i -eq 0; $bottom = $edge.Bottom -and $i -eq $crops.Count - 1
        $growLeft = if ($edge.Left) { $sides[$i].Left.Grow } else { 0 }; $growRight = if ($edge.Right) { $sides[$i].Right.Grow } else { 0 }
        $growTop = if ($top) { $sides[$i].Top.Grow } else { 0 }; $growBottom = if ($bottom) { $sides[$i].Bottom.Grow } else { 0 }
        $r = $crops[$i].Rect
        $r = New-Object System.Drawing.Rectangle ($r.X - $growLeft), ($r.Y - $growTop), ($r.Width + $growLeft + $growRight), ($r.Height + $growTop + $growBottom)
        $crops[$i].Rect = Get-Trimmed $crops[$i].Buffer $r $edge.Left $top $edge.Right $bottom
    }
    $marginLeft = if ($edge.Left) { $Margin } else { 0 }; $marginRight = if ($edge.Right) { $Margin } else { 0 }
    $marginTop = if ($edge.Top) { $Margin } else { 0 }; $marginBottom = if ($edge.Bottom) { $Margin } else { 0 }

    # scaled to fit with its margins; the natural size in UI units through the run's units per screenshot pixel
    $pxWidth = ($crops.Rect | Measure-Object Width -Maximum).Maximum; $pxHeight = ($crops.Rect | Measure-Object Height -Sum).Sum
    $scale = [Math]::Min(1.0, [Math]::Min(($MaxSide - $marginLeft - $marginRight) / [double]$pxWidth, ($MaxSide - $marginTop - $marginBottom) / [double]$pxHeight))
    foreach ($crop in $crops) {
        $crop | Add-Member -Force DrawWidth ([Math]::Max(1, [int][Math]::Round($crop.Rect.Width * $scale)))
        $crop | Add-Member -Force DrawHeight ([Math]::Max(1, [int][Math]::Round($crop.Rect.Height * $scale)))
    }
    $width = [int]($marginLeft + ($crops | Measure-Object DrawWidth -Maximum).Maximum + $marginRight)
    $height = [int]($marginTop + ($crops | Measure-Object DrawHeight -Sum).Sum + $marginBottom)
    $uiWidth = [int][Math]::Round($width / $scale * $crops[0].UnitsX); $uiHeight = [int][Math]::Round($height / $scale * $crops[0].UnitsY)
    $texWidth = Get-NextPowerOfTwo $width; $texHeight = Get-NextPowerOfTwo $height
    $target = Join-Path $mediaDir "$($picture.Name).tga"
    $margins = @('Left', 'Top', 'Right', 'Bottom' | Where-Object { $edge.$_ })
    "{0,-16} run {1}, {2} part(s): {3}x{4} px ({5}x{6} units) in a {7}x{8} texture, margin {9}" -f $picture.Name, $run.Time, $crops.Count,
        $width, $height, $uiWidth, $uiHeight, $texWidth, $texHeight, $(if ($margins) { $margins -join ' ' } else { 'none' })
    $made[$picture.Name] = [pscustomobject]@{ Width = $uiWidth; Height = $uiHeight; Right = $width / $texWidth; Bottom = $height / $texHeight }
    $write = $PSCmdlet.ShouldProcess($target, 'write the picture')
    if (-not $write -and -not $Preview) { continue }

    # black under the parts, so the margins and a narrower part's side are the backdrop's black
    $canvas = New-Object System.Drawing.Bitmap $width, $height, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($canvas)
    $g.Clear([System.Drawing.Color]::Black)
    $g.CompositingMode = 'SourceCopy'
    $y = $marginTop
    foreach ($crop in $crops) {
        $part = New-ScaledBitmap $crop.Image $crop.Rect $crop.DrawWidth $crop.DrawHeight
        $g.DrawImage($part, $marginLeft, $y, $crop.DrawWidth, $crop.DrawHeight)
        $part.Dispose()
        $y += $crop.DrawHeight
    }
    $g.Dispose()

    # soft edge, then into a transparent power-of-two texture
    $fadeLeft = if ($edge.Left) { 40 } else { $Fade }; $fadeRight = if ($edge.Right) { 40 } else { $Fade }
    $fadeTop = if ($edge.Top) { 40 } else { $Fade }; $fadeBottom = if ($edge.Bottom) { 40 } else { $Fade }
    $data = $canvas.LockBits((New-Object System.Drawing.Rectangle 0, 0, $width, $height), 'ReadWrite', $canvas.PixelFormat)
    $rowBytes = New-Object byte[] ($width * 4)
    $pixels = New-Object byte[] ($texWidth * $texHeight * 4)
    $alphaX = New-Object double[] $width
    for ($x = 0; $x -lt $width; $x++) { $alphaX[$x] = [Math]::Min((Get-EdgeAlpha $x $fadeLeft), (Get-EdgeAlpha ($width - 1 - $x) $fadeRight)) }
    for ($row = 0; $row -lt $height; $row++) {
        $scan = [IntPtr]($data.Scan0.ToInt64() + $row * $data.Stride)
        [Runtime.InteropServices.Marshal]::Copy($scan, $rowBytes, 0, $width * 4)
        $alphaY = [Math]::Min((Get-EdgeAlpha $row $fadeTop), (Get-EdgeAlpha ($height - 1 - $row) $fadeBottom))
        for ($x = 0; $x -lt $width; $x++) {
            $rowBytes[$x * 4 + 3] = [byte][Math]::Round($rowBytes[$x * 4 + 3] * $alphaX[$x] * $alphaY)
        }
        [Runtime.InteropServices.Marshal]::Copy($rowBytes, 0, $scan, $width * 4)
        [Array]::Copy($rowBytes, 0, $pixels, $row * $texWidth * 4, $width * 4)
    }
    $canvas.UnlockBits($data)
    if ($Preview) {
        New-Item -ItemType Directory -Force $Preview -WhatIf:$false | Out-Null   # previews also with -WhatIf
        $canvas.Save((Join-Path $Preview "$($picture.Name).png"), [System.Drawing.Imaging.ImageFormat]::Png)
    }
    $canvas.Dispose()
    if ($write) {
        New-Item -ItemType Directory -Force $mediaDir | Out-Null
        Write-Tga $target $pixels $texWidth $texHeight
    }
}
foreach ($image in $images.Values) { $image.Dispose() }

# --- Pictures.lua: this call's pictures, and the earlier entries of the others ------------------------------------
$entries = @{}
if (Test-Path -LiteralPath $picturesLua) {
    foreach ($line in [IO.File]::ReadAllLines($picturesLua)) {
        if ($line -match '^\s*(\w+) = \{Width = (\d+), Height = (\d+), TexCoords = \{0, ([\d.]+), 0, ([\d.]+)\}\},?$') {
            $entries[$Matches[1]] = [pscustomobject]@{ Width = [int]$Matches[2]; Height = [int]$Matches[3]
                Right = [double]::Parse($Matches[4], $invariant); Bottom = [double]::Parse($Matches[5], $invariant) }
        }
    }
}
foreach ($name in $made.Keys) { $entries[$name] = $made[$name] }
$lines = @(
    'local _, addon = ...'
    'addon.Options.Window = addon.Options.Window or {}'
    ''
    '-- Generated by .claude/tools/Make-HelpPictures.ps1 from a /kaftest pictures run; do not edit. Per picture in Media/Help:'
    '-- its natural size in UI units, and the part of its power-of-two texture it fills.'
    'addon.Options.Window.HelpPictures = {'
)
$names = @($entries.Keys | Sort-Object)
for ($i = 0; $i -lt $names.Count; $i++) {
    $e = $entries[$names[$i]]
    $lines += ('    {0} = {{Width = {1}, Height = {2}, TexCoords = {{0, {3}, 0, {4}}}}}{5}' -f $names[$i], $e.Width, $e.Height,
        $e.Right.ToString('0.##########', $invariant), $e.Bottom.ToString('0.##########', $invariant), $(if ($i -lt $names.Count - 1) { ',' } else { '' }))
}
$lines += '}'
if ($PSCmdlet.ShouldProcess($picturesLua, "write $($names.Count) picture sizes")) {
    [IO.File]::WriteAllText($picturesLua, ($lines -join "`r`n"), $utf8)
    "Pictures.lua: $($names.Count) pictures"
}