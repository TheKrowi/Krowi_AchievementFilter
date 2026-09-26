<#
.SYNOPSIS
    Rebuilds lua.exe and luac.exe (Lua 5.1.5, the version World of Warcraft embeds) from the
    official lua.org source, so the repo carries its own Lua without installing anything.

.DESCRIPTION
    1. Downloads lua-5.1.5.tar.gz from lua.org (or uses -SourceArchive if given).
    2. Verifies the archive against the checksums lua.org publishes.
    3. Compiles with the MSVC Build Tools already present on the machine (found through vswhere),
       statically linked (/MT) so the executables have no runtime DLL dependency.
    4. Copies lua.exe, luac.exe and Lua's COPYRIGHT into this folder and smoke-tests them.

    Nothing is installed; the only prerequisite is a Visual Studio / Build Tools install with the
    "Desktop development with C++" workload, which vswhere locates.

.EXAMPLE
    & ".claude\tools\lua51\Build-Lua51.ps1"
#>
[CmdletBinding()]
param(
    [string]$SourceUrl = 'https://www.lua.org/ftp/lua-5.1.5.tar.gz',
    [string]$SourceArchive,
    [string]$OutDir = $PSScriptRoot
)

$ErrorActionPreference = 'Stop'

# Published on https://www.lua.org/ftp/ for lua-5.1.5.tar.gz
$expectedMd5 = '2e115fe26e435e33b0d5c022e4490567'
$expectedSha1 = 'b3882111ad02ecc6b972f8c1241647905cb2e3fc'

$work = Join-Path ([System.IO.Path]::GetTempPath()) "lua51-build-$([guid]::NewGuid().ToString('N'))"
New-Item -ItemType Directory -Path $work | Out-Null

try {
    # --- 1. Source archive ---------------------------------------------------------------------
    if (-not $SourceArchive) {
        $SourceArchive = Join-Path $work 'lua-5.1.5.tar.gz'
        Write-Host "Downloading $SourceUrl"
        Invoke-WebRequest -Uri $SourceUrl -OutFile $SourceArchive -UseBasicParsing
    }

    # --- 2. Verify -----------------------------------------------------------------------------
    $md5 = (Get-FileHash -Algorithm MD5 -Path $SourceArchive).Hash.ToLower()
    $sha1 = (Get-FileHash -Algorithm SHA1 -Path $SourceArchive).Hash.ToLower()
    if ($md5 -ne $expectedMd5 -or $sha1 -ne $expectedSha1) {
        throw "Checksum mismatch for $SourceArchive`n  md5  $md5 (expected $expectedMd5)`n  sha1 $sha1 (expected $expectedSha1)"
    }
    Write-Host "Checksums OK (md5 $md5, sha1 $sha1)"

    & (Join-Path $env:SystemRoot 'System32\tar.exe') -xzf $SourceArchive -C $work   # Windows tar; Git Bash tar treats C: as a remote host
    $src = Join-Path $work 'lua-5.1.5\src'
    if (-not (Test-Path (Join-Path $src 'lua.c'))) { throw "Extraction failed, lua.c not found under $src" }

    # --- 3. Locate MSVC ------------------------------------------------------------------------
    $vswhere = Join-Path ${env:ProgramFiles(x86)} 'Microsoft Visual Studio\Installer\vswhere.exe'
    if (-not (Test-Path $vswhere)) { throw "vswhere.exe not found; install Visual Studio Build Tools with the C++ workload" }
    $vcvars = & $vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -find 'VC\Auxiliary\Build\vcvars64.bat' | Select-Object -First 1
    if (-not $vcvars) { throw "No MSVC toolset with vcvars64.bat found" }
    Write-Host "Using $vcvars"

    # --- 4. Compile and link -------------------------------------------------------------------
    # lua.exe  = lua.obj  + core + libs
    # luac.exe = luac.obj + print.obj + core + libs
    $build = @(
        "call `"$vcvars`" >nul 2>nul"
        "cd /d `"$src`""
        "cl /nologo /O2 /MT /W3 /D_CRT_SECURE_NO_DEPRECATE /c *.c"
        "link /nologo /OUT:lua.exe lua.obj lapi.obj lauxlib.obj lbaselib.obj lcode.obj ldblib.obj ldebug.obj ldo.obj ldump.obj lfunc.obj lgc.obj linit.obj liolib.obj llex.obj lmathlib.obj lmem.obj loadlib.obj lobject.obj lopcodes.obj loslib.obj lparser.obj lstate.obj lstring.obj lstrlib.obj ltable.obj ltablib.obj ltm.obj lundump.obj lvm.obj lzio.obj"
        "link /nologo /OUT:luac.exe luac.obj print.obj lapi.obj lauxlib.obj lbaselib.obj lcode.obj ldblib.obj ldebug.obj ldo.obj ldump.obj lfunc.obj lgc.obj linit.obj liolib.obj llex.obj lmathlib.obj lmem.obj loadlib.obj lobject.obj lopcodes.obj loslib.obj lparser.obj lstate.obj lstring.obj lstrlib.obj ltable.obj ltablib.obj ltm.obj lundump.obj lvm.obj lzio.obj"
    ) -join ' && '
    cmd /c $build
    if ($LASTEXITCODE -ne 0) { throw "Build failed (exit $LASTEXITCODE)" }

    # --- 5. Install into OutDir and smoke-test -------------------------------------------------
    New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
    foreach ($f in 'lua.exe', 'luac.exe') { Copy-Item (Join-Path $src $f) (Join-Path $OutDir $f) -Force }
    Copy-Item (Join-Path $work 'lua-5.1.5\COPYRIGHT') (Join-Path $OutDir 'COPYRIGHT') -Force

    $probe = Join-Path $work 'probe.lua'
    Set-Content -Path $probe -Value 'local t = { unpack({1, 2, 3}) } return #t'
    & (Join-Path $OutDir 'luac.exe') -p $probe
    if ($LASTEXITCODE -ne 0) { throw "luac smoke test failed" }
    & (Join-Path $OutDir 'lua.exe') -v

    Get-ChildItem $OutDir -Filter '*.exe' | ForEach-Object {
        '{0,-10} {1,8:N0} bytes  sha256 {2}' -f $_.Name, $_.Length, (Get-FileHash -Algorithm SHA256 $_.FullName).Hash.ToLower()
    }
}
finally {
    Remove-Item -Recurse -Force $work -ErrorAction SilentlyContinue
}