---
name: migrate-to-shared
description: Migrates duplicate achievement data blocks from Retail and Classic AchievementData.lua into a Shared file using the _S suffix convention, eliminating duplication while preserving client-specific entries. Use when reducing duplication between Retail and Classic files, when patches have identical or nearly-identical entries across clients, or when setting up a new Shared expansion subfolder.
---

# Migrate Achievement Data to Shared

## Architecture

**Exclusive split**: each achievement ID appears in exactly one place.

| Table key | Location | Content |
|-----------|----------|---------|
| `"EE_PP_SS_S"` | `DataAddons/Shared/EE_ExpansionName/AchievementData.lua` | Entries identical on both clients |
| `"EE_PP_SS"` | `DataAddons/Retail/EE_…` and `DataAddons/Classic/EE_…` | Only the entries that differ between clients |

Where `EE` = expansion number, `PP` = major patch, `SS` = minor patch (e.g. `"05_01_00"`).

**Classic-only patches** (patches that exist in Classic but have no Retail equivalent) are **never touched**. Identify them by finding patch keys present in the Classic file but absent from the Retail file.

## Pre-flight: discover what needs migrating

```powershell
$retailPath  = "e:\...\DataAddons\Retail\EE_Expansion\AchievementData.lua"
$classicPath = "e:\...\DataAddons\Classic\EE_Expansion\AchievementData.lua"
$sharedPath  = "e:\...\DataAddons\Shared\EE_Expansion\AchievementData.lua"

# List all patch keys in each file
Select-String -Path $retailPath  -Pattern 'KrowiAF\.AchievementData\[' | Select-Object LineNumber, Line
Select-String -Path $classicPath -Pattern 'KrowiAF\.AchievementData\[' | Select-Object LineNumber, Line
```

Keys in Classic but not Retail = Classic-only patches. Skip those. Work only on patches that appear in both files.

## Workflow (one patch at a time)

### Step 1 — Read both blocks

```powershell
# Locate the patch and its successor to get the exact line range
Select-String -Path $retailPath  -Pattern '"EE_PP_SS"'  -SimpleMatch
Select-String -Path $retailPath  -Pattern '"EE_PP_SS2"' -SimpleMatch  # next patch = end boundary
Select-String -Path $classicPath -Pattern '"EE_PP_SS"'  -SimpleMatch
```

Then read the range with `read_file` at those line numbers.

### Step 2 — Identify differences

Compare every entry. Three categories:

| Difference type | Treatment |
|----------------|-----------|
| Chain method **order** only (`:PvP(13):AutoFactionSplit(...)` vs `:AutoFactionSplit(...):PvP(13)`) | **Identical** — use Retail order in Shared |
| **Comment text** only | **Identical** — use Retail comment in Shared |
| Different **flags/methods** (e.g. Classic adds `:Title()`, Retail adds `:HousingDecor()`) | **Client-specific** — stays in each client file |
| Different **`Obtainable(...)` arguments** | **Client-specific** |
| Entry exists on **one client only** | **Client-specific** |

### Step 3 — Build the Shared table

Shared table = all Retail entries **except** the client-specific ones, using Retail's canonical chain order and comment text.

```lua
KrowiAF.AchievementData["EE_PP_SS_S"] = {
    {KrowiAF.SetAchievementPatch, E, P, S},
    -- all shared entries here
}
```

### Step 4 — Append to Shared file

**Always use `[char]9` for tab characters** — never paste literal tabs or spaces into PowerShell here-strings; they get corrupted.

```powershell
$tab = [char]9
$block = @(
    "",
    "KrowiAF.AchievementData[`"EE_PP_SS_S`"] = {",
    "${tab}{KrowiAF.SetAchievementPatch, E, P, S},",
    "${tab}Ach(12345), -- Example entry",
    "${tab}Ach(12346):Mount(), -- Example with reward",
    "}"
)
$lines = Get-Content $sharedPath -Encoding UTF8
[System.IO.File]::WriteAllLines($sharedPath, ($lines + $block), [System.Text.UTF8Encoding]::new($false))
```

### Step 5 — Trim client files

Replace the full original block with only the client-specific entries using **line-index slicing** (0-based). If all entries were shared, the trimmed block still keeps the patch header so the loader can register the patch version.

```powershell
# Find indices: patchStart = line number of "EE_PP_SS" - 1 (0-based)
#               nextPatch  = line number of next patch key - 1 (0-based)
$patchStart = 10   # example
$nextPatch  = 53   # example

$retailBlock = @(
    "KrowiAF.AchievementData[`"EE_PP_SS`"] = {",
    "${tab}{KrowiAF.SetAchievementPatch, E, P, S},",
    "${tab}Ach(99999):HousingDecor(), -- Retail-specific entry",
    "}",
    ""
)
$lines = Get-Content $retailPath -Encoding UTF8
[System.IO.File]::WriteAllLines(
    $retailPath,
    ($lines[0..($patchStart-1)] + $retailBlock + $lines[$nextPatch..($lines.Count-1)]),
    [System.Text.UTF8Encoding]::new($false)
)
```

Repeat with the Classic-specific entries. Drop the trailing `;` from Classic's `};` closings — V2 style uses `}` only.

**Edge case — fully shared patch** (no client-specific entries at all): remove the block entirely from both client files; only the `_S` table in Shared is needed.

### Step 6 — Verify

```powershell
# Shared: confirm all expected _S keys are present
$s = Get-Content $sharedPath -Encoding UTF8
$s | Select-String 'KrowiAF\.AchievementData' | Select-Object LineNumber, Line

# Client files: confirm correct structure and Classic-only patches still intact
Get-Content $retailPath  -Encoding UTF8 | Select-Object -First 50
Get-Content $classicPath -Encoding UTF8 | Select-Object -First 50
```

Confirm for each file: tabs (not spaces) for indentation, closing `}` present on last table, blank line between tables, Classic-only patches untouched.

## Shared file prerequisites

If `DataAddons/Shared/EE_ExpansionName/` does not yet exist:

1. Create `AchievementData.lua` with the standard header:
   ```lua
   local _, addon = ...
   local Ach = KrowiAF.Ach
   local faction = KrowiAF.Enum.Faction
   ```
   Only include the `faction` line if any entry in the file uses `AutoFactionSplit` or `FactionSplit`.

2. Create `Files.xml`:
   ```xml
   <Ui xmlns="http://www.blizzard.com/wow/ui/">
       <Script file="AchievementData.lua" />
   </Ui>
   ```

3. Add an include to `DataAddons/Shared/Files.xml` (after any existing expansion includes, maintaining expansion order):
   ```xml
   <Include file="EE_ExpansionName\Files.xml" />
   ```
