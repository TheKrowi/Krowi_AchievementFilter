---
name: add-achievement-data
description: Transform raw achievement lists (IDs + comments) into properly formatted Lua achievement data entries for Krowi's Achievement Filter addon. Handles reward type mapping, season references, faction detection, and maintains consistent code style. Use when the user pastes achievement ids for a new patch, or a patch's achievements need entering in AchievementData.lua.
---

Transform raw achievement lists (IDs + comments) into properly formatted Lua achievement data entries for the Krowi's Achievement Filter addon. Uses the V2 fluent builder format (`Ach(id):Method():...`) which is the current standard for all new data across all expansions and clients.

Provide your achievement list in this format and I'll:
1. Scan the currently open AchievementData.lua file to detect the expansion and latest patch
2. Confirm the target patch with you (append to existing or create new)
3. **Query wow.tools.local** for each achievement to get authoritative name, faction, and reward data
4. **Cross-check Wowhead** for any reward or description details the DB doesn't clarify
5. Parse achievements, detect rewards, seasons, and factions — using DB + web data to fill gaps
6. Generate properly formatted Lua code using V2 format
7. Insert or display the results

## When to Use
- Adding new batch of achievements for a patch
- Converting achievement data from WoW API or external sources
- Bulk adding achievements with their associated metadata

## Input Format
Provide a raw achievement list with this format:
```lua
{AchievementID}, -- Achievement Name (optional: Reward: description, Season/Event info, Faction)
```

Example:
```lua
{61792}, -- T-A-G that spells "Gotcha!"
{61793}, -- Deployed to the Void
{ -- Abyss Anglers: Pressurized Eyeglass (Reward: Unlock Pressurized Eyeglass for purchase from Depthdiver Jeju)
    62506,
    {
        RewardType = rewardType.NotCategorized,
    },
},
```

## Processing Steps

### 0. Determine Target Patch (First Step)
Before parsing achievements, use the **Patch Version Determination** process (see section below) to establish which patch/expansion these achievements will be added to.

### 0.5. DB & Web Lookup (Before Parsing)

Before applying comment-based heuristics, query authoritative sources. The DB is ground truth; Wowhead fills gaps.

#### wow.tools.local (primary — game DB)

Query all IDs in a single batch using the **designated script** `.claude/skills/add-achievement-data/_lookup_ids.ps1` — never write a new inline/ad-hoc PowerShell snippet. Full API reference: `.claude/skills/verify-achievement-data/API.md`.

**Rule:** Never create new throwaway `.ps1` files for one-off lookups. Pass the values as parameters, or edit the `$Ids` placeholder default inside the designated script, run it, and reset it to `@()`. The build is never typed: every lookup script resolves it from the server through the kit's `Get-WowBuilds.ps1` (after `.claude/tools/KitPath.ps1`); `-Client Classic` queries the Classic build, and `$env:KAF_RETAIL_PRODUCT = "wowxptr"` (or `"wowt"`) points Retail at the PTR for a patch that is not live yet.

```powershell
& ".claude\skills\add-achievement-data\_lookup_ids.ps1" -Ids 12345,12346
& ".claude\skills\add-achievement-data\_lookup_ids.ps1" -Ids 12345 -Client Classic
```

Output format per line: `id|Title_lang|Reward_lang|Faction|RewardItemID` (or `id|NOTFOUND`).

**Column index map (key fields for data entry):**

| Index | DB column | What it tells you |
|-------|-----------|-------------------|
| 0 | `Description_lang` | Achievement description — use when reward type or category is ambiguous |
| 1 | `Title_lang` | Authoritative achievement name — use to correct inline comments |
| 2 | `Reward_lang` | Non-empty means reward exists. `"Title Reward: X"` or `"Title: X"` → `:Title()`. `"Reward: X"` (no "Title") → tangible reward (mount/pet/toy/etc.) |
| 3 | `ID` | Confirm ID exists in DB (`recordsFiltered == 0` means not found) |
| 5 | `Faction` | `-1` = both, `0` = Horde only, `1` = Alliance only |
| 13 | `RewardItemID` | Non-`"0"` = item reward exists (Retail only — unreliable in Classic) |

**What to do with DB data:**
- `Faction == 0` or `1` → apply `:FactionSplit()` or `:AutoFactionSplit()` as appropriate; look for counterpart ID (typically ±1)
- `Reward_lang` starts with `"Title"` → add `:Title()`
- `Reward_lang` non-empty without `"Title"` prefix → lookup the specific reward type on Wowhead
- `recordsFiltered == 0` → ID not in this build; try alternate build or ask user to confirm ID
- `Title_lang` differs from inline comment → correct the comment to match DB name

**Build selection:** Retail files → `wow` build (e.g. `12.0.5.67602`). Classic files → `wow_classic` (e.g. `5.5.3.67509` for Cata/MoP Classic) or `wow_classic_era`. Probe the DB with a known ID to confirm. See API.md for full build table.

#### Wowhead (secondary)

When `Reward_lang` is ambiguous, empty while a reward is suspected, or you need the exact reward name: [REFERENCE.md](REFERENCE.md), Wowhead (URL per client, which Wowhead section maps to which method, and the faction, category and "unavailable" banners that confirm `:IsPvP()`, `:FactionSplit()` and `:Obtainable()`).

### 1. Parse Achievement ID
Extract numeric ID from each entry. IDs must be valid positive integers.

### 2. Extract Comment
Capture the comment after `--`. Comments contain:
- Achievement name (required)
- Reward type hint in parentheses (optional)
- Season/Event references (optional)
- Faction indicator (optional)

### 3. Reward Type Detection
Map comment text to `AchBuilder` method names:

| Keyword in Comment | Method |
|-------------------|--------|
| "Mount:", "Mount: " | `:Mount()` |
| "Title:", "Title: " | `:Title()` |
| "Pet:", "Pet: " | `:Pet()` |
| "Toy:" | `:Toy()` |
| "Tabard:" | `:Tabard()` |
| "Transmog:" | `:Transmog()` |
| "Unlock ..., **for purchase**" | `:NotCategorized()` |
| "Unlock ... travel method" | `:Mount()` |
| "Unlock ... decor" | `:HousingDecor()` |
| "Character Unlock:", "Character Title:", "Seasonal Character Title:" | `:Title()` |
| "Shop Sign" | `:HousingDecor()` |
| Bronze Cache | `:RemixBronze()` |
| "Small/Medium/Large Pile of Bound Silver" | `:TaleboundSilver()` |
| "Traveling Raven: X" | by the item X: `:Toy()` for a toy, else `:Other()` (look it up in `toy`/`itemsparse`) |
| Allied Race unlock | `:AlliedRace()` |
| Warband Campsite | `:WarbandCampsite()` |
| (no clear match) | Ask for clarification |

**Reward type methods (all 18):**
`:NotCategorized()` `:Other()` `:AlliedRace()` `:Garrison()` `:Mount()` `:Pet()` `:RemixBronze()` `:Tabard()` `:Teleport()` `:Title()` `:Toy()` `:TradersTender()` `:Transmog()` `:WarbandCampsite()` `:RemixInfiniteKnowledge()` `:HousingDecor()` `:KeystoneResilience()` `:TaleboundSilver()`

**Additional (non-reward) methods:**
`:IsPvP()` `:PvP(N)` `:PvE(N)` `:Weeks(first[, last])` `:IsRealmFirst()` `:Obtainable(...)` `:Anniv20()` `:FactionSplit(faction, altId)` `:AutoFactionSplit(faction, altId)` `:CreatureDisplay(displayId, spellId)`

**Rules:**
- If multiple reward types apply (e.g., "Title and Mount"), chain both in alphabetical order, the order every multi-reward line in the data uses: `Ach(id):Mount(mountId):Title()`
- If comment contains "Reward:" but no recognizable keyword, ask user for clarification
- If no reward hint in comment, use simple form: `Ach(id), -- Comment`

### 3.5 to 3.7 Reward preview ids

A battle pet, mount or housing decoration reward always gets its preview id: the SpeciesID for `:Pet(id)`, the mount id for `:Mount(id)`, the decor record id for `:HousingDecor(id)`. The lookup scripts and fallbacks: [REFERENCE.md](REFERENCE.md), sections 3.5 to 3.7.

### 4. Season/Event Reference Detection
Extract from comment text:

| Pattern | Action |
|---------|--------|
| "Season X" (X = number) | Detect context (PvP or PvE) from surrounding text |
| "PvE Season", "Keystone", "Raid", "Dungeon" | Use `:PvE(X)` where X is the **game season number** (e.g., 13 for TWW S1) |
| "PvP Season", "Gladiator", "Duelist", "Rival", "Combatant", "Challenger" | Use `:PvP(X)` where X is the **arena season number** |
| PvP context but **no season number** (e.g., "Battleground", "Tour of Duty") | Use `:IsPvP()` (sets PvP flag only, no season reference) |
| "Realm First!" in name | Use `:IsRealmFirst()`; it adds `Obtainable("Once")` itself, so never write that |
| Event name (e.g., "Remix Event", "Anniversary") | Try to find matching event ID in codebase or ask user |

**`:IsPvP()` vs `:PvP(N)`:**
- `:PvP(N)` — Achievement is PvP AND tied to a specific season (e.g., gladiator titles, seasonal mounts)
- `:IsPvP()` — Achievement is PvP but NOT tied to a specific season (e.g., battleground wins, tour of duty, conquest accumulation)
- Both can be combined with reward type methods: `Ach(id):Pet():IsPvP()`

An event, anniversary or season achievement often needs an `Obtainable()` window as well (`:Anniv20()`, a calendar date window, a season added a patch early): read Edge Cases and Obtainable Patterns below before writing it.

### 5. Faction Detection
Scan comment for faction keywords:

| Text | Action |
|------|--------|
| Contains "Alliance" | Use `:AutoFactionSplit(faction.Alliance, HORDE_ID)` |
| Contains "Horde" | Use `:AutoFactionSplit(faction.Horde, ALLIANCE_ID)` |
| Faction-specific with **no counterpart** | Use `:FactionSplit(faction.X, nil)` |
| No faction keyword | Default to faction-neutral (no FactionSplit) |

**`:FactionSplit(faction.X, nil)` — faction-only, no paired achievement:**
Use when an achievement exists only for one faction with no counterpart (e.g., some Allied Race unlocks):
```lua
Ach(12242):FactionSplit(faction.Alliance, nil):AlliedRace(),
```

**Faction Pairing:**
If detecting either faction variant, automatically look for the counterpart (typically ID+1 or ID-1). Collapse both into a single entry on the lower-ID achievement. Comment order follows the entry: lower-ID name first, higher-ID name second, separated by ` / `:
```lua
-- Same name on both sides:
Ach(LOWER_ID):AutoFactionSplit(faction.X, HIGHER_ID), -- Achievement Name

-- Different names:
Ach(LOWER_ID):AutoFactionSplit(faction.X, HIGHER_ID), -- Lower-ID Name / Higher-ID Name

-- Shared prefix and/or suffix — merge them, keep only the unique parts in the middle:
Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38), -- Forged Warlord / Marshal: The War Within Season 1
```
`:AutoFactionSplit()` copies the reward types, seasons, `Obtainable()` records and the PvP and realm-first flags to the mirrored id (the reward preview ids stay on the written id only). Use `:FactionSplit()` (two explicit lines) when anything in the chain differs between the two achievements: a reward one faction gets and the other doesn't, a different obtainable window, a different season.

### 6. Generate Lua Entry
Build the `Ach()` call based on detected properties:

**Format Decision Tree:**
```
If (no extra properties)
  → Ach(id), -- Comment

If (has reward type)
  → Ach(id):RewardMethod(), -- Comment

If (has faction split, identical chains)
  → Ach(lowerid):AutoFactionSplit(faction.X, altId), -- Lower-ID Name / Higher-ID Name (or just Name if identical; merge shared suffix)

If (has faction split, chains differ)
  → Ach(id):FactionSplit(faction.X, altId), -- Comment
  → Ach(altId):FactionSplit(faction.Y, id), -- Comment
```

### 7. Code Style Matching
All V2 entries use the following conventions:

**Indentation:** Tabs (not spaces). Each entry on its own line.

**Line format:**
```lua
Ach(id):Method():Method(), -- Achievement Name
```

**Comments:** Achievement name after `--` on the same line as the closing `,`.

**File header** (ensure present when V2 entries are added to a file):
```lua
local _, addon = ... -- only if the file uses addon
local Ach = KrowiAF.Ach
local faction = KrowiAF.Enum.Faction -- only if AutoFactionSplit or FactionSplit is used
```

## Edge Cases and Obtainable Patterns

For any achievement that is time-limited, tied to an event, an anniversary or a season, removed from the game, a realm first, faction-split with rewards, or given more than one method, read [REFERENCE.md](REFERENCE.md), Edge Cases & Exceptions, before writing its line. It holds the chained examples, `:Anniv20()`, and every common `Obtainable()` form with its rules: date windows from the game's calendar (`_lookup_holidays.ps1`), where a cutoff starts, and ranges that differ per client.

## Patch Version Determination

Before generating output, determine the target patch using **Option D** approach:

### Step 1: Infer Expansion from Current File
- Check currently open file path (from VS Code editor context)
- Extract expansion folder name from path, e.g.:
  - `DataAddons/Retail/11_TheWarWithin/AchievementData.lua` → Expansion: The War Within (11)
  - `DataAddons/Classic/05_MistsOfPandaria/AchievementData.lua` → Expansion: Mists of Pandaria (05)
  - If no file open, ask user to specify

### Step 2: Scan File for Existing Patches
- Read the currently open AchievementData.lua file
- Find all patch keys in `KrowiAF.AchievementData["X_Y_Z"]`
- Extract patch versions: parse as `{major=X, minor=Y, patch=Z}`
- Identify the **latest patch** (highest version across both formats)

Example scan:
```lua
KrowiAF.AchievementData["11_00_00"] = { ... }   -- 11.0.0
KrowiAF.AchievementData["11_01_00"] = { ... }   -- 11.1.0
KrowiAF.AchievementData["11_02_00"] = { ... }   -- Latest: 11.2.0
```
Result: Latest patch = `11.2.0`

### Step 3: Present Confirmation Dialog
Ask user to confirm or create new patch:

```
Detected: Retail The War Within expansion

Latest patch in file: 11.2.0

Options:
A) Add to existing patch 11.2.0 (achievements appended to current patch table)
B) Create new patch 11.2.5 (achievements in a new patch section)
C) Specify custom patch version (e.g., 11.3.0)
```

### Step 4: Output the Patch Table
- If appending to an existing patch: just append the entries.
- If creating a new patch: insert a new patch table. `Data/Data.lua` derives the patch record from the key, so the table holds only the entries; never write a `{KrowiAF.SetAchievementPatch, ...}` line. A Shared file adds the `_S` suffix to the key (`"11_02_05_S"`).
  ```lua
  KrowiAF.AchievementData["11_02_05"] = {
  	-- new achievement entries...
  }
  ```
- A new patch also needs its registration in the expansion's `BuildVersionData.lua` (`minor:Patch(n, addon.L["Name"])`) if it is not there yet; the headless data load reports an unregistered one.

## Output Options

After confirming patch, ask user:
```
Where should the generated code be placed?
A) Insert into currently open file (append to confirmed patch section)
B) Show in chat for manual copy-paste
```

## Validation Checklist

Before returning output, verify:

- [ ] All achievement IDs are valid positive integers
- [ ] All comments are non-empty
- [ ] Faction pairing logic found correct variants (or asked user)
- [ ] All reward method names are valid (see reward type list above)
- [ ] Season/Event references use correct method (`:PvE(n)` vs `:PvP(n)`) with correct game season number
- [ ] PvP achievements without a season use `:IsPvP()` not `:PvP(N)` (never invent a season number)
- [ ] "Realm First!" achievements use `:IsRealmFirst()` alone, without `Obtainable("Once")`
- [ ] Multiple reward types are chained in alphabetical order (`:Mount(id):Title()`)
- [ ] Lua syntax is valid (no missing commas, balanced parentheses)
- [ ] Indentation is consistent (tabs, matching file style)
- [ ] No duplicate entries
- [ ] File header includes `local Ach = KrowiAF.Ach` (add if missing)
- [ ] `local faction = KrowiAF.Enum.Faction` is present if any `:AutoFactionSplit()` or `:FactionSplit()` is used
- [ ] `& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\snapshot-data.lua" "$PWD" Both -write` was run and the `git diff` of `.claude/tools/headless/snapshots/Achievements.*.txt` shows exactly the new ids, each with the intended patch, faction, rewards and `obtainable=` records; the diff is committed with the data (lint rule `data-snapshot`)

## Clarification Questions

Ask the user when the reward type stays unclear after the DB and Wowhead, when a season or its number is unclear, when a faction counterpart is missing from the list, and for where the output goes. Sample wording and a worked input-to-output example: [REFERENCE.md](REFERENCE.md), Clarification Questions and Example Transformation.

---

## Integration Notes

- Achievement data is organized by expansion: `DataAddons/Retail/{XX_ExpansionName}/AchievementData.lua`
- Classic data lives under `DataAddons/Classic/{XX_ExpansionName}/AchievementData.lua`; shared data under `DataAddons/Shared/{XX_ExpansionName}/AchievementData.lua`
- Current expansions (Retail): `03_WrathOfTheLichKing` through `12_Midnight`
- Always insert new achievements after the patch marker, in ascending ID order
- Validate against existing IDs to prevent duplicates

## Related Files
- `DataAddons/Retail/12_Midnight/AchievementData.lua` — Newest V2 reference
- `DataAddons/Retail/11_TheWarWithin/AchievementData.lua` — Canonical V2 reference
- `Api/AchievementDataBuilder.lua` — the `Ach()` builder and every method on it
- `Api/AchievementDataApi.lua` — `KrowiAF.AddAchievementData` and `KrowiAF.SetAchievementPatch`
- `docs/obtainability.md` — every `Obtainable()` form and how it resolves per client
- `Api/ApiDocumentation.lua` — Annotated examples of all data patterns

## Autolearn Feedback Loop

### Loop A: Verifying generated entries

After generating V2 output, run it through the `verify-achievement-data` skill before presenting the final result:

1. Generate the Lua entries per the steps above
2. Invoke the `verify-achievement-data` skill on the generated entries (or the target file after insertion)
3. If verification reports errors (missing reward flags, incorrect faction split, wrong method name, duplicate IDs), fix the entry and re-run — up to 3 attempts
4. Only present output that passes verification

This loop catches common mistakes (missing `:IsPvP()` on PvP achievements, wrong method names, malformed faction splits) without requiring manual review.

### Loop B: Finding new achievements in a patch

When asked which achievements a patch adds, follow [REFERENCE.md](REFERENCE.md), Loop B: `Find-NewAchievements.ps1` is the only source, checked with `Evaluate-FindNewAchievements.ps1` before you present the list.