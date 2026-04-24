---
name: migrate-v1-to-v2
description: Convert V1-format AchievementData entries (KrowiAF.AchievementData with positional tables) to V2 fluent builder format (KrowiAF.AchievementData2 with Ach() builder). Use when migrating existing expansion files for expansions 01–10 and 12.
---

Convert legacy V1 achievement entries to the V2 fluent builder format. V1 uses `KrowiAF.AchievementData` with positional/dict tables; V2 uses `KrowiAF.AchievementData2` with `Ach()` method chaining.

Provide a V1 Lua block (or say "open file") and I'll:
1. Identify all V1 patch tables in the file
2. Confirm which patch(es) to migrate
3. Convert each entry using the V1→V2 mapping
4. Collapse paired faction entries into single `AutoFactionSplit` lines
5. Update the file header
6. Rename the table key(s)
7. Display or insert the converted output

## When to Use
- Migrating an expansion file from V1 to V2 (expansions 01–10 and 12)
- Converting a block of V1 entries copied from an old file
- Batch-converting a specific patch table

V1 files are identified by:
- Table key uses `KrowiAF.AchievementData["X_Y_Z"]` (no `2` suffix)
- File header contains `local rewardType = KrowiAF.Enum.RewardType`
- Entries are positional tables `{id, ...}` rather than `Ach(id):...` chains

## V1 Format Recognition

### Entry Patterns

| V1 Pattern | Description |
|-----------|-------------|
| `{id}` | Simple — ID only |
| `{id, moreDataTable}` | With reward type, flags, and/or availability tuples |
| `{id, faction, altId}` | Faction-split pair |
| `{id, faction, altId, true}` | Faction-split pair + PvP flag (4th positional) |
| `{id, faction}` | Faction-only, no paired ID (edge case) |

### `moreDataTable` Anatomy

The second positional argument, when it is a table, is a mixed dict + array. Named keys are extracted first; remaining array entries are treated as temporaryObtainable tuples.

```lua
{
    RewardType = rewardType.Mount,     -- named key: reward type
    IsPvP = true,                      -- named key: PvP flag
    IsRealmFirst = true,               -- named key: Realm First flag
    {"Before", "Version", {7, 0, 3}}, -- tuple: unavailable after patch
    {"Event", 374},                    -- tuple: event-gated
    {"PvE Season", 5},                 -- tuple: M+ season availability
    {"From", "Date", {2010,11,1}, "Until", "Date", {2010,11,22}}, -- tuple: date range
    {"From", "PvP Season", 38, "Until", "PvP Season", 40},        -- tuple: PvP season range
    {"Once"},                          -- tuple: one-time (Realm First)
    {"Never"},                         -- ⚠️ STOP — flag to user before migrating
    {},                                -- ⚠️ STOP — flag to user before migrating
}
```

## V1 → V2 Mapping

### Reward Type Properties

| V1 `RewardType` | V2 Method |
|-----------------|-----------|
| `rewardType.Mount` | `:Mount()` |
| `rewardType.Pet` | `:Pet()` |
| `rewardType.Title` | `:Title()` |
| `rewardType.Toy` | `:Toy()` |
| `rewardType.Tabard` | `:Tabard()` |
| `rewardType.Transmog` | `:Transmog()` |
| `rewardType.Teleport` | `:Teleport()` |
| `rewardType.HousingDecor` | `:HousingDecor()` |
| `rewardType.AlliedRace` | `:AlliedRace()` |
| `rewardType.Garrison` | `:Garrison()` |
| `rewardType.NotCategorized` | `:NotCategorized()` |
| `rewardType.Other` | `:Other()` |
| `rewardType.RemixBronze` | `:RemixBronze()` |
| `rewardType.TradersTender` | `:TradersTender()` |
| `rewardType.WarbandCampsite` | `:WarbandCampsite()` |
| `rewardType.RemixInfiniteKnowledge` | `:RemixInfiniteKnowledge()` |
| `rewardType.KeystoneResilience` | `:KeystoneResilience()` |

### Flag Properties

| V1 | V2 |
|----|-----|
| `IsPvP = true` | `:IsPvP()` |
| `IsRealmFirst = true` | `:IsRealmFirst()` |
| 4th positional `true` (isPvP on faction split) | `:IsPvP()` |

### Temporary Availability Tuples

| V1 Tuple | V2 Method |
|----------|-----------|
| `{"Before", "Version", {x, y, z}}` | `:Obtainable("Before", "Version", {x, y, z})` |
| `{"Event", eventId}` | `:Obtainable("Event", eventId)` |
| `{"PvE Season", n}` | `:PvE(n)` |
| `{"From", "Date", {y,m,d}, "Until", "Date", {y,m,d}}` | `:Obtainable("From", "Date", {y,m,d}, "Until", "Date", {y,m,d})` |
| `{"From", "PvP Season", n, "Until", "PvP Season", m}` | `:Obtainable("From", "PvP Season", n, "Until", "PvP Season", m)` |
| `{"Once"}` | `:Obtainable("Once")` *(unverified in V2 codebase — confirm before use)* |

### Faction Split Collapse

V1 lists each faction side as a separate entry. V2 collapses the pair into **one line on the lower ID**.

**V1 (two entries):**
```lua
{4885, faction.Alliance, 4886}, -- Wildhammer Clan
{4886, faction.Horde, 4885},   -- Dragonmaw Clan
```

**V2 (one collapsed entry):**
```lua
Ach(4885):AutoFactionSplit(faction.Alliance, 4886), -- Wildhammer Clan / Dragonmaw Clan
```

**Rules:**
- Always use the **lower ID** as the primary entry
- Use `:AutoFactionSplit()` when both sides have the same reward types
- Use `:FactionSplit()` (two separate lines, one per side) only when reward types differ between factions
- Comment: if names are identical, use just the name; if different, use `Lower-ID Name / Higher-ID Name`; if they share a prefix or suffix, keep only the differing middle parts:

```lua
-- Identical names:
Ach(1000):AutoFactionSplit(faction.Alliance, 1001), -- For the Alliance!

-- Different names:
Ach(4885):AutoFactionSplit(faction.Alliance, 4886), -- Wildhammer Clan / Dragonmaw Clan

-- Shared prefix/suffix — strip the common parts, keep only the unique middle:
Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38), -- Forged Warlord / Marshal: The War Within Season 1
```

**Edge case — faction with no altId:** `{id, faction.Alliance}` with no third positional. Search the rest of the same patch table for the counterpart. If not found in the file, ask the user before proceeding.

## Pre-Migration: Flag Ambiguous Tuples

Before converting any entries, scan every patch table being migrated for the two patterns below. **Stop and show them all to the user — do not guess, do not skip, do not proceed until each one is resolved.**

### `{"Never"}` — never-obtainable marker

In V1 this tuple means the achievement is permanently unobtainable. However the intended V2 representation varies case-by-case (e.g. it may warrant `:Obtainable("Never")`, removal of the tuple entirely, or a different approach). Present each occurrence to the user:

```
⚠️  ID <id> — "<name>" has {"Never"}.
How should this be handled?
  A) :Obtainable("Never")
  B) Drop the tuple (no temporary-obtainable marker)
  C) Other — tell me
```

Wait for the user's answer before writing any converted output for that entry.

### `{}` — empty tuple

An empty table `{}` inside a `moreDataTable` is a no-op placeholder (it passes through `SetTemporaryObtainable` with no effect but still creates an empty record). Present each occurrence to the user:

```
⚠️  ID <id> — "<name>" has an empty tuple {}.
How should this be handled?
  A) Drop the tuple entirely (most common — it was a V1 placeholder)
  B) Keep as :Obtainable() with no arguments
  C) Other — tell me
```

Wait for the user's answer before writing any converted output for that entry.

**Only after all `{"Never"}` and `{}` occurrences in the batch are resolved, proceed with Steps 1–4.**

## Processing Steps

### Step 1 — Update File Header

**Remove:**
```lua
local rewardType = KrowiAF.Enum.RewardType
```

**Add (if not already present):**
```lua
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
```

**Keep:** `local _, addon = ...` and `local faction = KrowiAF.Enum.Faction`

**Result:**
```lua
local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction
```

### Step 2 — Rename Table Key(s)

Replace every:
```lua
KrowiAF.AchievementData["X_Y_Z"] = {
```
with:
```lua
KrowiAF.AchievementData2["X_Y_Z"] = {
```

The patch marker line **inside** the table is unchanged:
```lua
{KrowiAF.SetAchievementPatch, major, minor, patch},
```

### Step 3 — Convert Each Entry

For each V1 entry, extract all properties and build the V2 `Ach()` chain. Apply methods in this order to match V2 convention:

1. Reward type methods (`:Mount()`, `:Title()`, etc.)
2. Flag methods (`:IsPvP()`, `:IsRealmFirst()`)
3. Season methods (`:PvE(n)`, `:PvP(n)`)
4. Availability method (`:Obtainable(...)`)

### Step 4 — Collapse Faction Pairs

After converting all entries individually, scan for any remaining paired Alliance/Horde entries and collapse them into single `AutoFactionSplit` lines per the rules above. Remove the now-redundant higher-ID entry.

## Worked Examples

```lua
-- Simple
-- V1: {14460}
-- V2:
Ach(14460), -- Ahead of the Curve: Sire Denathrius

-- Reward type
-- V1: {4845, {RewardType = rewardType.Mount}}
-- V2:
Ach(4845):Mount(), -- Reins of the Blue Drake

-- IsPvP flag
-- V1: {5209, {IsPvP = true}}
-- V2:
Ach(5209):IsPvP(), -- Arathi Basin Veteran

-- PvE Season tuple
-- V1: {14460, {{"PvE Season", 5}}}
-- V2:
Ach(14460):PvE(5), -- Ahead of the Curve: Sire Denathrius

-- Reward type + Before Version
-- V1: {5535, {RewardType = rewardType.Title, {"Before", "Version", {6, 0, 2}}}}
-- V2:
Ach(5535):Title():Obtainable("Before", "Version", {6, 0, 2}), -- Loremaster of Cataclysm

-- Realm First
-- V1: {6433, {IsRealmFirst = true, {"Once"}}}
-- V2:
Ach(6433):IsRealmFirst():Obtainable("Once"), -- Realm First!

-- Faction split (symmetric)
-- V1:
--   {4885, faction.Alliance, 4886}, -- Wildhammer Clan
--   {4886, faction.Horde, 4885},   -- Dragonmaw Clan
-- V2 (collapsed):
Ach(4885):AutoFactionSplit(faction.Alliance, 4886), -- Wildhammer Clan / Dragonmaw Clan

-- Faction split + PvP (4th positional true)
-- V1:
--   {5213, faction.Alliance, 5214, true}, -- Alliance Name
--   {5214, faction.Horde, 5213, true},   -- Horde Name
-- V2 (collapsed):
Ach(5213):AutoFactionSplit(faction.Alliance, 5214):IsPvP(), -- Alliance Name / Horde Name

-- Multiple tuples
-- V1: {9999, {RewardType = rewardType.Mount, {"Event", 374}, {"Before", "Version", {10, 0, 0}}}}
-- V2:
Ach(9999):Mount():Obtainable("Event", 374):Obtainable("Before", "Version", {10, 0, 0}), -- Name
```

## Code Style

Match existing V2 style exactly:
- Indentation: **tabs** (not spaces)
- One entry per line
- Comment on the same line as the closing `,` after `--`
- No semicolons at the end of lines
- Method chain order: RewardType → flags → seasons → Obtainable

## Output Options

After conversion, ask user:
```
Where should the converted code go?
A) Replace the V1 block in the currently open file
B) Show in chat for manual copy-paste
```

## Validation Checklist

Before returning output, verify:

- [ ] No `{"Never"}` or `{}` tuples were converted without explicit user confirmation
- [ ] Every V1 entry has a corresponding V2 entry (none skipped)
- [ ] Faction pairs collapsed — no solo Alliance or Horde entries remain unless they have no counterpart
- [ ] All `KrowiAF.AchievementData["X_Y_Z"]` renamed to `KrowiAF.AchievementData2["X_Y_Z"]`
- [ ] `local rewardType = KrowiAF.Enum.RewardType` removed from header
- [ ] `local shared = addon.Data.AchievementData.Shared` and `local Ach = shared.Ach` present in header
- [ ] No bare `rewardType.X` references remain in the converted output
- [ ] All method names are valid (see `add-achievement-data` skill for full list)
- [ ] Lua syntax valid — no missing commas, balanced parentheses
- [ ] Indentation consistent (tabs, matching V2 file style)

## Post-Migration Verification

After converting an expansion, run a runtime hash comparison to confirm the V2 data is semantically equivalent to V1. The tool for this is `VerifyHash.lua` (in the repo root), which is already wired into `Krowi_AchievementFilter.toc`. It is parameterised by major version number.

**The agent must actively drive this entire process.** Do not just describe steps — execute each agent-owned action and prompt the user for each WoW client action in sequence.

### Workflow

**Step 1 — Agent: Set the major version**
Edit `VerifyHash.lua` — change the `MAJOR` constant at the top to match the expansion being verified (e.g. `9` for Shadowlands, `10` for Dragonflight, `11` for The War Within). Derive the correct value from the patch key prefix (e.g. `"09_..."` → `9`).

**Step 2 — Agent: Restore V1 to disk**
Run: `git checkout HEAD -- <path/to/AchievementData.lua>`
This puts the original V1 file back on disk so WoW loads V1 data.

**Step 3 — User: Load WoW with V1**
Prompt the user: *"Please reload WoW (or log in). Wait for the `[KAF-Verify]` message in chat (~10 s after login), then type `/reload` to flush saved variables. Let me know when done."*

**Step 4 — Agent: Snapshot V1 saved variables**
Run: `Copy-Item "H:\World of Warcraft\_retail_\WTF\Account\133658957#1\SavedVariables\Krowi_AchievementFilter.lua" "$env:TEMP\KAF_v1.lua"`

The user's WTF saved variables path is: `H:\World of Warcraft\_retail_\WTF\Account\133658957#1\SavedVariables\Krowi_AchievementFilter.lua`

**Step 5 — Agent: Restore V2 to disk**
Restore the converted V2 file from the working tree. If the file was stashed: `git stash pop`. If the V2 file is already the working-tree version (user never stashed), it may already be in place — verify with `git status`.

**Step 6 — User: Load WoW with V2**
Prompt the user: *"Please reload WoW again. Wait for the `[KAF-Verify]` message (~10 s), then `/reload` again. Let me know when done."*

**Step 7 — Agent: Diff the two snapshots**
Parse both saved-variable files and diff the `KrowiAF_SavedData.VerifyHash[tostring(MAJOR)].perAch` tables. Report:
- Overall hash and count from each pass
- Every achievement ID where any field differs, with old vs new values side-by-side

### Expected diff results after a clean migration

| Change type | Cause | Verdict |
|---|---|---|
| `AltId` 0 → N on faction-split pairs | V1 omitted the cross-link; V2 `AutoFactionSplit`/`FactionSplit` wires it correctly | ✅ Improvement |
| Intentional flag removal (e.g. wrong faction flag) | Deliberate correction discussed before migration | ✅ Intentional |
| `Date` obtainable value shows different memory address | `tostring()` on a Lua table gives its pointer, which varies per session | ⚠️ False positive — not a real change |
| Any other field difference | Unexpected — investigate before committing | ❌ Bug |

A migration is considered **clean** when the only diffs are the two categories above (cross-link additions and intentional corrections). Count must match exactly.

## Related Files
- `DataAddons/Retail/11_TheWarWithin/AchievementData.lua` — Canonical V2 reference
- `DataAddons/Shared/AchievementData.lua` — `AchBuilder` definition (all available methods)
- `Api/AchievementDataApi.lua` — V1 parser source (documents how V1 moreData is processed)
- `VerifyHash.lua` — Runtime hash verification tool (parameterised by major version)
- `add-achievement-data` skill — Full V2 method list and code style reference
