---
name: migrate-zone-fallbacks
description: Removes redundant A/C entries from ExportedUiMaps (Retail and Classic) when ZoneData already covers — or can be made to cover — the zone. Handles Shared vs client-specific ZoneData decisions, creates missing files and registers them in Files.xml. Use when cleaning up ExportedUiMaps, removing redundant zone entries, migrating zone fallbacks to ZoneData, or when asked to clean a specific expansion's zone entries from ExportedUiMaps.
---

# Migrate Zone Fallbacks (ExportedUiMaps → ZoneData)

## Overview

`Data/Retail/ExportedUiMaps.lua` and `Data/Classic/ExportedUiMaps.lua` are fallback files.
When ZoneData covers a zone, the ExportedUiMaps entry is redundant and must be removed.

Three helpers exist: `A(zoneId, {ids})`, `C(childId, parentId)`, `A10`/`A25` (raid variants).

## Reference files

| File | Columns | Use |
|------|---------|-----|
| `raw/MapViewerExportActive.csv` | `id, name, type, expansion` | Look up which expansion owns a zone ID — **never guess from the number** |
| `raw/MapViewerExportLinkGroups.csv` | `primaryId, primaryName, subIds` | Which C-children belong together in one `Zone({...})` call |

## Workflow

### Step 1 — Collect candidates
Read ExportedUiMaps for the target range. Note every `{A, zoneId, {ids}}` entry and its `{C, childId, zoneId}` children.

### Step 2 — Look up expansion per zone
Check `MapViewerExportActive.csv` for **every** zone ID. Never assume expansion from the zone number.

### Step 3 — Check existing ZoneData coverage
Locate the ZoneData file(s) (Shared, Retail, Classic) for that expansion. Confirm the ZoneData entry covers a **superset** of the ExportedUiMaps achievement IDs before removing.

### Step 4 — Decide Shared vs client-specific
- Achievement IDs **identical** in both clients → zone entry belongs in **Shared** ZoneData
- IDs **differ** → separate Retail and Classic ZoneData entries

### Step 5 — Create missing ZoneData infrastructure (if needed)

**Shared ZoneData for expansion doesn't exist:**
1. Create `DataAddons/Shared/0X_ExpansionName/ZoneData.lua`:
   ```lua
   local _, addon = ...
   addon.Data.ZoneData.Shared.ExpansionName = {}
   local sharedX = addon.Data.ZoneData.Shared.ExpansionName

   local zoneData = KrowiAF.NewZoneData("ExpansionName")
   sharedX.ZoneData = zoneData
   ```
2. Add `<Script file="ZoneData.lua" />` to `DataAddons/Shared/0X_ExpansionName/Files.xml`
3. Update **both** client ZoneData headers: replace `KrowiAF.NewZoneData(...)` with `sharedX.ZoneData`

**Client ZoneData for expansion doesn't exist:**
1. Create the file with the appropriate header (see patterns below)
2. Add `<Script file="ZoneData.lua" />` to `DataAddons/Classic/0X_ExpansionName/Files.xml`

## ZoneData file header patterns

**Shared file (creates zoneData):**
```lua
local _, addon = ...
addon.Data.ZoneData.Shared.ExpansionName = {}
local sharedX = addon.Data.ZoneData.Shared.ExpansionName

local zoneData = KrowiAF.NewZoneData("ExpansionName")
sharedX.ZoneData = zoneData
```

**Client file that extends a Shared zoneData:**
```lua
local _, addon = ...
-- include `local shared = addon.Data.ZoneData.Shared` only if needed for shared.OldWorldPetAchievements etc.
local sharedX = addon.Data.ZoneData.Shared.ExpansionName

local zoneData = sharedX.ZoneData
```

**Client file with no Shared counterpart:**
```lua
local _, addon = ...

local zoneData = KrowiAF.NewZoneData("ExpansionName")
```

## Zone() entry format

Fold all C-children into the `Zone()` call using LinkGroups CSV:
```lua
zoneData:Zone({primaryId, child1, child2}, { -- Instance Name (dungeon/raid/zone)
    achievementId1, -- Achievement Name
    achievementId2, -- Achievement Name
})
```

## Step 6 — Remove from ExportedUiMaps

Remove the `A` entry and all its `C` children from both Retail and Classic ExportedUiMaps
(unless the zone is genuinely client-exclusive — verify via CSV).

## Execution

Apply **all** ZoneData additions and ExportedUiMaps removals in a single `multi_replace_string_in_file` call.

## Critical rules

- `KrowiAF.NewZoneData(key)` **asserts uniqueness** — call it exactly once per key (in the Shared file, or in one client file if there is no Shared). Client files always use `sharedX.ZoneData`.
- Do **not** remove an ExportedUiMaps entry unless **all** its IDs are confirmed covered by ZoneData.
- Zone 337 (Zul'Gurub) = Cata. Zone 616 (UBRS) = WoD. Never infer expansion from sequential position.
