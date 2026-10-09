<#
.SYNOPSIS
    Lists the newest screenshots the game took, so a GUI or layout bug can be looked at without
    watching the client: Deploy.ps1 -> /reload in game -> Print Screen -> Read-GameScreenshot.ps1,
    then open the printed path with the Read tool.

.DESCRIPTION
    Lists the newest files in the client's Screenshots folder with the full path, when each was
    taken, its age, its pixel size (read from the file header) and its file size.

    Also reads the screenshot CVars from the client's WTF\Config.wtf: screenshotFormat (default
    jpeg; warcraft.wiki.gg documents jpg and tga, and anything other than tga saves jpeg),
    screenshotQuality (1-10, default 3, jpeg only) and screenshotSizeOverride (default 0x0, the
    window size). The game writes a CVar there only when it differs from the default. The Read tool
    displays jpg and png but not tga, so a tga format or a .tga file prints a warning with the console
    command that switches back to jpg. The Read tool shows a wide screenshot scaled down (3440x1440 at
    2000x837), so a jpeg quality below 8 prints a note: small UI text does not survive both.

    Unlike saved variables, a screenshot is written the moment it is taken; no /reload is needed.

.PARAMETER Client
    Retail (_retail_), Classic (_classic_), Ptr (_ptr_, the wowt test realm) or Xptr (_xptr_, the second test realm, wowxptr). Default Retail.

.PARAMETER Count
    Number of screenshots to list, newest first. Default 1.

.PARAMETER Minutes
    Only screenshots from the last N minutes. Default 1440 (24 hours, as Read-GameErrors.ps1 -Hours). Use 0 for everything.

.EXAMPLE
    & ".claude\tools\Read-GameScreenshot.ps1"
    & ".claude\tools\Read-GameScreenshot.ps1" -Client Classic -Count 3 -Minutes 10
#>
[CmdletBinding()]
param(
    [ValidateSet('Retail', 'Classic', 'Ptr', 'Xptr')][string]$Client = 'Retail',
    [ValidateRange(1, [int]::MaxValue)][int]$Count = 1,
    [double]$Minutes = 1440
)

$ErrorActionPreference = 'Stop'
$flavor = @{ Retail = '_retail_'; Classic = '_classic_'; Ptr = '_ptr_'; Xptr = '_xptr_' }[$Client]
$clientDir = "H:\World of Warcraft\$flavor"
if (-not (Test-Path -LiteralPath $clientDir)) { throw "No $Client client at $clientDir (is it installed?)" }
$folder = Join-Path $clientDir 'Screenshots'
$extensions = @('.jpg', '.jpeg', '.png', '.tga')

function Format-Age([TimeSpan]$age) {
    if ($age.TotalMinutes -lt 120) { return "$([int][math]::Floor($age.TotalMinutes)) min ago" }
    if ($age.TotalHours -lt 48) { return "$([int][math]::Floor($age.TotalHours)) h ago" }
    "$([int][math]::Floor($age.TotalDays)) days ago"
}

function Format-Size([long]$bytes) {
    $invariant = [Globalization.CultureInfo]::InvariantCulture
    if ($bytes -ge 1MB) { return [string]::Format($invariant, '{0:0.0} MB', $bytes / 1MB) }
    [string]::Format($invariant, '{0:0} KB', $bytes / 1KB)
}

# Pixel size from the file header, without decoding the image: png IHDR, the first jpeg start-of-frame, the tga header
function Get-ImageSize([string]$path) {
    $fs = [IO.File]::Open($path, 'Open', 'Read', 'ReadWrite')
    try {
        $head = New-Object byte[] 24
        if ($fs.Read($head, 0, 24) -lt 18) { return $null }
        if ($head[0] -eq 0x89 -and $head[1] -eq 0x50 -and $head[2] -eq 0x4E -and $head[3] -eq 0x47) {
            $w = ([long]$head[16] -shl 24) -bor ([long]$head[17] -shl 16) -bor ([long]$head[18] -shl 8) -bor [long]$head[19]
            $h = ([long]$head[20] -shl 24) -bor ([long]$head[21] -shl 16) -bor ([long]$head[22] -shl 8) -bor [long]$head[23]
            return "${w}x$h"
        }
        if ($head[0] -eq 0xFF -and $head[1] -eq 0xD8) {
            $fs.Position = 2
            while ($fs.Position -lt $fs.Length) {
                if ($fs.ReadByte() -ne 0xFF) { return $null }
                do { $marker = $fs.ReadByte() } while ($marker -eq 0xFF)
                if ($marker -lt 0 -or $marker -eq 0xD9 -or $marker -eq 0xDA) { return $null }   # end of file or image, or scan data
                if ($marker -eq 0x01 -or ($marker -ge 0xD0 -and $marker -le 0xD7)) { continue }   # markers without a length
                $length = ($fs.ReadByte() -shl 8) -bor $fs.ReadByte()
                if ($marker -ge 0xC0 -and $marker -le 0xCF -and $marker -notin 0xC4, 0xC8, 0xCC) {
                    $null = $fs.ReadByte()   # sample precision
                    $h = ($fs.ReadByte() -shl 8) -bor $fs.ReadByte()
                    $w = ($fs.ReadByte() -shl 8) -bor $fs.ReadByte()
                    return "${w}x$h"
                }
                $fs.Position += $length - 2
            }
            return $null
        }
        if ([IO.Path]::GetExtension($path) -eq '.tga') {
            return "$([int]$head[12] -bor ([int]$head[13] -shl 8))x$([int]$head[14] -bor ([int]$head[15] -shl 8))"
        }
        $null
    } finally {
        $fs.Dispose()
    }
}

# --- Screenshot CVars ------------------------------------------------------------------------------
$config = Join-Path $clientDir 'WTF\Config.wtf'
$cvars = @{}
if (Test-Path -LiteralPath $config) {
    foreach ($line in [IO.File]::ReadLines($config)) {
        if ($line -match '^\s*SET\s+(screenshot\w+)\s+"([^"]*)"') { $cvars[$Matches[1]] = $Matches[2] }
    }
}
$format = $cvars['screenshotFormat']
$warnTga = $format -eq 'tga'
$formatText = switch ($true) {
    ($null -eq $format) { 'jpeg (default)'; break }
    ($format -in 'tga', 'jpg', 'jpeg') { "$format (Config.wtf)"; break }
    default { "$format (Config.wtf; not a documented value, the wiki says anything but tga saves jpeg)" }
}
$quality = 3
$qualityText = '3 (default)'
if ($null -ne $cvars['screenshotQuality']) {
    $qualityText = "$($cvars['screenshotQuality']) (Config.wtf)"
    if (-not [int]::TryParse($cvars['screenshotQuality'], [ref]$quality)) { $quality = 10 }   # unreadable: do not nag about it
}
$size = $cvars['screenshotSizeOverride']
$sizeText = if ($size -and $size -ne '0x0') { ", screenshotSizeOverride $size (Config.wtf)" } else { '' }

"Screenshots: $folder"
"  screenshotFormat $formatText, screenshotQuality $qualityText$sizeText"
if ($warnTga) { "  warning: tga screenshots cannot be opened with the Read tool; in game: /console screenshotFormat jpg" }
if (-not $warnTga -and $quality -lt 8) { "  note: jpeg quality $quality blurs small UI text; in game: /console screenshotQuality 10" }
""

# --- Newest screenshots ----------------------------------------------------------------------------
if (-not (Test-Path -LiteralPath $folder)) {
    "No Screenshots folder yet; the game creates it with the first screenshot (Print Screen in the $Client client)."
    exit 1
}
$all = @(Get-ChildItem -LiteralPath $folder -File | Where-Object { $extensions -contains $_.Extension.ToLowerInvariant() } | Sort-Object LastWriteTime -Descending)
if ($all.Count -eq 0) {
    "The Screenshots folder is empty; take one with Print Screen in the $Client client."
    exit 1
}
$recent = if ($Minutes -gt 0) { @($all | Where-Object { $_.LastWriteTime -ge (Get-Date).AddMinutes(-$Minutes) }) } else { $all }
if ($recent.Count -eq 0) {
    $newest = $all[0]
    "No screenshot in the last $Minutes min; the newest is $($newest.FullName), taken $($newest.LastWriteTime) ($(Format-Age ((Get-Date) - $newest.LastWriteTime))). Use -Minutes 0 to list it."
    exit 1
}

$shown = @($recent | Select-Object -First $Count)
foreach ($file in $shown) {
    $pixels = Get-ImageSize $file.FullName
    if (-not $pixels) { $pixels = 'unknown size' }
    $file.FullName
    "  taken $($file.LastWriteTime) ($(Format-Age ((Get-Date) - $file.LastWriteTime))), $pixels, $(Format-Size $file.Length)"
}
if ($recent.Count -gt $shown.Count) { "  ... and $($recent.Count - $shown.Count) older (raise -Count to list them)" }
if (-not $warnTga -and $shown[0].Extension -eq '.tga') { "warning: the newest screenshot is tga, which the Read tool cannot display; in game: /console screenshotFormat jpg" }
exit 0