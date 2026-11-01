<#
.SYNOPSIS
    One-off: makes the black backdrop of the help pictures in Media\Help transparent from the files themselves
    (spec.md), since the runs behind 15 of the 19 are gone. Kept as the record of how the files of 2026-11-01 were made;
    a remake goes through .claude\tools\Make-HelpPictures.ps1, which does the same.

.DESCRIPTION
    For each picture in Options\Window\Help\Pictures.lua:
      - reads its TGA (the tool's: 32-bit RLE, top-left origin) and the part of the texture it fills;
      - finds its edge sides from the alpha 20 px in from each side's middle: a margin's 40 px curve is at 135 there, a
        cut's 18 px fade already at 255;
      - clears the backdrop as Make-HelpPictures.ps1's Clear-Backdrop does;
      - FilterMenu, TipEarnedBy and TipPoints: the bottom is where the run cut the menu or tooltip short, which the tool
        of #376 took for an edge (spec.md, Root cause). Their bottom margin is left out of the flood and made
        transparent, and the frame's last 18 rows get the cut's fade, as the tool now makes such a side;
      - writes the TGA back in the tool's format. Only the alpha changes. A file without an edge side (SearchBox) is
        left as it is.

.PARAMETER Preview
    A folder for a PNG of every picture over the help pane's grey (RGB 28, 30, 29) and one over magenta, which shows
    what became transparent.

.EXAMPLE
    & "docs\work\2026-11-01-help-pictures-transparent\Convert-Pictures.ps1" -WhatIf -Preview "$env:TEMP\converted"
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [string[]]$Only,
    [string]$Preview
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) -Parent   # docs\work\<item> -> repo root
Add-Type -AssemblyName System.Drawing
$invariant = [Globalization.CultureInfo]::InvariantCulture
$margin = 50; $fade = 18
$cutBottoms = @('FilterMenu', 'TipEarnedBy', 'TipPoints')

$entries = [ordered]@{}
foreach ($line in [IO.File]::ReadAllLines((Join-Path $root 'Options\Window\Help\Pictures.lua'))) {
    if ($line -match '^\s*(\w+) = \{Width = (\d+), Height = (\d+), TexCoords = \{0, ([\d.]+), 0, ([\d.]+)\}\},?$') {
        $entries[$Matches[1]] = [pscustomobject]@{ Right = [double]::Parse($Matches[4], $invariant); Bottom = [double]::Parse($Matches[5], $invariant) }
    }
}

# The tool's TGA: type 10, 32 bit, top-left origin; BGRA rows top to bottom
function Read-Tga([string]$path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    if ($bytes[2] -ne 10 -or $bytes[16] -ne 32 -or ($bytes[17] -band 0x20) -eq 0) { throw "${path}: not the tool's TGA" }
    $w = [BitConverter]::ToUInt16($bytes, 12); $h = [BitConverter]::ToUInt16($bytes, 14)
    $raw = New-Object byte[] ($w * $h * 4)
    $src = 18 + $bytes[0]; $i = 0; $count = $w * $h
    while ($i -lt $count) {
        $hdr = $bytes[$src]; $src++; $run = ($hdr -band 0x7F) + 1; $repeat = ($hdr -band 0x80) -ne 0
        for ($k = 0; $k -lt $run; $k++) {
            [Array]::Copy($bytes, $src, $raw, $i * 4, 4)
            if (-not $repeat) { $src += 4 }
            $i++
        }
        if ($repeat) { $src += 4 }
    }
    [pscustomobject]@{ Width = $w; Height = $h; Pixels = $raw }
}

# Make-HelpPictures.ps1's Write-Tga
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

# Make-HelpPictures.ps1's fade curve
$curve = @(2, 6, 16, 39, 80, 135, 187, 223, 242, 250, 253, 255)
function Get-EdgeAlpha([double]$d, [double]$width) {
    $t = $d / $width * 40 / 4
    if ($t -ge $curve.Count - 1) { return 1.0 }
    $i = [Math]::Floor($t); $f = $t - $i
    (($curve[$i] * (1 - $f)) + ($curve[$i + 1] * $f)) / 255.0
}

# Make-HelpPictures.ps1's Clear-Backdrop, with rows from $blockedFrom down kept out of the flood
function Clear-Backdrop([byte[]]$bytes, [int]$stride, [int]$width, [int]$height, $edge, [int]$blockedFrom) {
    $seen = New-Object bool[] ($width * $height)
    $queue = New-Object System.Collections.Generic.Queue[int]
    if ($edge.Left) { for ($y = 0; $y -lt $height; $y++) { $queue.Enqueue($y * $width) } }
    if ($edge.Right) { for ($y = 0; $y -lt $height; $y++) { $queue.Enqueue($y * $width + $width - 1) } }
    if ($edge.Top) { for ($x = 0; $x -lt $width; $x++) { $queue.Enqueue($x) } }
    if ($edge.Bottom) { for ($x = 0; $x -lt $width; $x++) { $queue.Enqueue(($height - 1) * $width + $x) } }
    $cleared = 0
    for ($pass = 0; $pass -le 2; $pass++) {
        $next = New-Object System.Collections.Generic.Queue[int]
        if ($pass -eq 0) { $to = $queue } else { $to = $next }
        while ($queue.Count -gt 0) {
            $i = $queue.Dequeue()
            if ($seen[$i]) { continue }
            $x = $i % $width; $y = ($i - $x) / $width
            if ($y -ge $blockedFrom) { continue }
            $o = $y * $stride + $x * 4
            $sum = [int]$bytes[$o] + $bytes[$o + 1] + $bytes[$o + 2]
            if ($sum -gt 40) { continue }
            if ($pass -eq 0 -and $sum -gt 12) { $next.Enqueue($i); continue }
            $seen[$i] = $true; $bytes[$o + 3] = 0; $cleared++
            if ($x -gt 0) { $to.Enqueue($i - 1) }
            if ($x -lt $width - 1) { $to.Enqueue($i + 1) }
            if ($y -gt 0) { $to.Enqueue($i - $width) }
            if ($y -lt $height - 1) { $to.Enqueue($i + $width) }
        }
        $queue = $next
    }
    $cleared
}

function Save-Composite([byte[]]$pixels, [int]$stride, [int]$width, [int]$height, [int[]]$rgb, [string]$path) {
    $bmp = New-Object System.Drawing.Bitmap $width, $height, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $data = $bmp.LockBits((New-Object System.Drawing.Rectangle 0, 0, $width, $height), 'WriteOnly', $bmp.PixelFormat)
    $row = New-Object byte[] ($width * 4)
    for ($y = 0; $y -lt $height; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $o = $y * $stride + $x * 4; $a = $pixels[$o + 3] / 255.0
            for ($c = 0; $c -lt 3; $c++) { $row[$x * 4 + $c] = [byte][Math]::Round($pixels[$o + $c] * $a + $rgb[2 - $c] * (1 - $a)) }
            $row[$x * 4 + 3] = 255
        }
        [Runtime.InteropServices.Marshal]::Copy($row, 0, [IntPtr]($data.Scan0.ToInt64() + $y * $data.Stride), $width * 4)
    }
    $bmp.UnlockBits($data); $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png); $bmp.Dispose()
}

if ($Preview) { New-Item -ItemType Directory -Force $Preview -WhatIf:$false | Out-Null }
foreach ($name in $entries.Keys) {
    if ($Only -and $Only -notcontains $name) { continue }
    $path = Join-Path $root "Media\Help\$name.tga"
    $tga = Read-Tga $path
    $p = $tga.Pixels; $stride = $tga.Width * 4
    $width = [int][Math]::Round($tga.Width * $entries[$name].Right); $height = [int][Math]::Round($tga.Height * $entries[$name].Bottom)
    $midX = [int]($width / 2); $midY = [int]($height / 2)
    $edge = [pscustomobject]@{
        Left = $p[$midY * $stride + 20 * 4 + 3] -lt 200; Right = $p[$midY * $stride + ($width - 21) * 4 + 3] -lt 200
        Top = $p[20 * $stride + $midX * 4 + 3] -lt 200; Bottom = $p[($height - 21) * $stride + $midX * 4 + 3] -lt 200
    }
    $cutBottom = $cutBottoms -contains $name
    $last = $height - $margin - 1   # the frame's last row above a bottom margin
    if ($cutBottom -and $p[$last * $stride + $midX * 4 + 3] -lt 10) { "{0,-16} already converted" -f $name; continue }
    if ($cutBottom) { $edge.Bottom = $false }
    $sides = @('Left', 'Top', 'Right', 'Bottom' | Where-Object { $edge.$_ })
    if (-not $sides) { "{0,-16} no edge side, left as it is" -f $name; continue }

    $cleared = Clear-Backdrop $p $stride $width $height $edge $(if ($cutBottom) { $height - $margin } else { $height })
    if ($cutBottom) {
        for ($y = $height - $margin; $y -lt $height; $y++) { for ($x = 0; $x -lt $width; $x++) { $p[$y * $stride + $x * 4 + 3] = 0 } }
        for ($y = $last - $fade; $y -le $last; $y++) {
            $alpha = Get-EdgeAlpha ($last - $y) $fade
            for ($x = 0; $x -lt $width; $x++) { $o = $y * $stride + $x * 4 + 3; $p[$o] = [byte][Math]::Round($p[$o] * $alpha) }
        }
    }
    "{0,-16} {1}x{2}, edges {3}{4}; {5:P0} made transparent" -f $name, $width, $height, ($sides -join ' '),
        $(if ($cutBottom) { ', bottom cut' } else { '' }), ($cleared / [double]($width * $height))
    if ($Preview) {
        Save-Composite $p $stride $width $height @(28, 30, 29) (Join-Path $Preview "$name-pane.png")
        Save-Composite $p $stride $width $height @(255, 0, 255) (Join-Path $Preview "$name-magenta.png")
    }
    if ($PSCmdlet.ShouldProcess($path, 'write the converted picture')) { Write-Tga $path $p $tga.Width $tga.Height }
}