param(
    [Parameter(Mandatory)] [string] $MediaDir,
    [Parameter(Mandatory)] [string] $OutDir
)
# Converts the tutorial TGA textures to PNG, cropped to the ImageSize the tutorial shows (top-left region).
Add-Type -AssemblyName System.Drawing

$crops = [ordered]@{
    TabButton = 930, 158; Categories = 361, 512; FilteringSorting = 587, 720; QuickSearch = 358, 324
    FullSearch = 826, 512; NewAchievementColors = 722, 499; EarnedBy = 1018, 473; CompactAchievements = 722, 385
    TooltipCategories = 554, 154; TooltipAchievements = 1016, 381; WorldMapButton = 433, 392; RightClickMenu = 772, 340
    EventReminder = 391, 486; Summary = 732, 649; Calendar = 1041, 518
}

New-Item -ItemType Directory -Force $OutDir | Out-Null
foreach ($name in $crops.Keys) {
    $bytes = [IO.File]::ReadAllBytes((Join-Path $MediaDir "$name.tga"))
    $idLen = $bytes[0]; $cmapType = $bytes[1]; $imgType = $bytes[2]
    $w = [BitConverter]::ToUInt16($bytes, 12); $h = [BitConverter]::ToUInt16($bytes, 14)
    $bpp = $bytes[16]; $desc = $bytes[17]
    if ($cmapType -ne 0 -or ($imgType -ne 2 -and $imgType -ne 10) -or ($bpp -ne 24 -and $bpp -ne 32)) {
        Write-Warning "${name}: unsupported TGA (type $imgType, cmap $cmapType, bpp $bpp)"; continue
    }
    $px = $bpp / 8
    $src = 18 + $idLen
    $raw = New-Object byte[] ($w * $h * 4)
    $count = $w * $h; $i = 0
    while ($i -lt $count) {
        if ($imgType -eq 2) { $run = 1; $repeat = $false }
        else {
            $hdr = $bytes[$src]; $src++
            $run = ($hdr -band 0x7F) + 1; $repeat = ($hdr -band 0x80) -ne 0
        }
        for ($k = 0; $k -lt $run; $k++) {
            $o = $i * 4
            $raw[$o] = $bytes[$src]; $raw[$o + 1] = $bytes[$src + 1]; $raw[$o + 2] = $bytes[$src + 2]
            $raw[$o + 3] = if ($px -eq 4) { $bytes[$src + 3] } else { 255 }
            if (-not $repeat) { $src += $px }
            $i++
        }
        if ($repeat) { $src += $px }
    }
    $topDown = ($desc -band 0x20) -ne 0
    $cw = [Math]::Min($crops[$name][0], $w); $ch = [Math]::Min($crops[$name][1], $h)
    $bmp = New-Object System.Drawing.Bitmap $cw, $ch, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $data = $bmp.LockBits((New-Object System.Drawing.Rectangle 0, 0, $cw, $ch), [System.Drawing.Imaging.ImageLockMode]::WriteOnly, $bmp.PixelFormat)
    for ($y = 0; $y -lt $ch; $y++) {
        $srcRow = if ($topDown) { $y } else { $h - 1 - $y }
        [Runtime.InteropServices.Marshal]::Copy($raw, $srcRow * $w * 4, [IntPtr]($data.Scan0.ToInt64() + $y * $data.Stride), $cw * 4)
    }
    $bmp.UnlockBits($data)
    $out = Join-Path $OutDir "$name.png"
    $bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    "{0,-22} {1}x{2} -> {3}x{4}  {5:N0} KB" -f $name, $w, $h, $cw, $ch, ((Get-Item $out).Length / 1KB)
}