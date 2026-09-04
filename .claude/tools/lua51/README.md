# Vendored Lua 5.1.5

`lua.exe` and `luac.exe` are Lua 5.1.5, the Lua version World of Warcraft embeds, built from the
official lua.org source with the checksums lua.org publishes:

| Source archive | md5 | sha1 |
| --- | --- | --- |
| https://www.lua.org/ftp/lua-5.1.5.tar.gz | `2e115fe26e435e33b0d5c022e4490567` | `b3882111ad02ecc6b972f8c1241647905cb2e3fc` |

They are statically linked (`/MT`) 64-bit Windows executables with no runtime dependency, so a clone
of this repo carries everything the harness scripts need. Nothing is installed on the machine.

Rebuild from source with the MSVC Build Tools (any Visual Studio install with the C++ workload):

```powershell
& ".claude\tools\lua51\Build-Lua51.ps1"
```

The script downloads the archive, verifies both checksums, compiles, copies the executables and
`COPYRIGHT` (Lua's MIT license) here, and smoke-tests the result.

## Why Lua 5.1 and not 5.4 or LuaJIT

- Lua 5.4 accepts syntax WoW rejects (`//`, bitwise operators, `<const>`) and lacks 5.1 globals the
  addon relies on (`unpack`, `loadstring`, `setfenv`).
- LuaJIT is close but accepts `goto`, which WoW does not.
- Lua 5.1.5 is the exact parser and runtime, so a file that passes here parses in the game.

## One known difference

Stock Lua 5.1 does not skip a UTF-8 byte order mark; WoW does. `check-syntax.lua` strips the BOM
before parsing so BOM files are checked correctly, and the repo lint reports the BOM itself because
`.editorconfig` declares plain `utf-8`.

This folder is never shipped: the addon manager excludes every dot-directory from the release zip.