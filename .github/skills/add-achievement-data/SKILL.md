---
name: add-achievement-data
description: Transform raw achievement lists (IDs + comments) into properly formatted Lua achievement data entries for Krowi's Achievement Filter addon. Handles reward type mapping, season references, faction detection, and maintains consistent code style.
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

Query all IDs in a single batch. Use the build that matches the expansion/client being worked on. Full API reference: `.github/skills/verify-achievement-data/API.md`.

```powershell
# Batch lookup — replace with actual IDs and build
$ids  = @(61792, 61793, 62506)
$build = "12.0.5.67602"  # retail; use wow_classic build string for Classic files
$pat  = "^(" + ($ids -join "|") + ")$"
$body = "draw=1&start=0&length=$($ids.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$resp = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" `
            -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows = ($resp.Content | ConvertFrom-Json).data
$byId = @{}
$rows | ForEach-Object { $byId[$_[3]] = $_ }
```

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

#### Wowhead (secondary — reward and description detail)

Use Wowhead when `Reward_lang` is ambiguous, empty but a reward is suspected, or you need to see the exact reward item/mount/pet name.

| Client | URL pattern |
|--------|-------------|
| Retail | `https://www.wowhead.com/achievement=ID` |
| Cata / MoP Classic | `https://www.wowhead.com/classic/achievement=ID` |
| WotLK Classic | `https://www.wowhead.com/wotlk/achievement=ID` |

On the Wowhead page, look for:

| Wowhead section | Maps to |
|----------------|---------|
| **Title Reward** | `:Title()` |
| **Mount** in rewards | `:Mount()` |
| **Battle Pet** in rewards | `:Pet()` |
| **Toy** in rewards | `:Toy()` |
| **Tabard** in rewards | `:Tabard()` |
| **Appearance / Transmog set** in rewards | `:Transmog()` |
| **Unlocks for purchase** (vendor item, not directly awarded) | `:NotCategorized()` |
| **Unlock travel method** | `:Mount()` |
| **Housing decoration** | `:HousingDecor()` |
| **Warband Campsite** | `:WarbandCampsite()` |
| No reward section | Simple `Ach(id)` |

> **Tip:** Wowhead also shows faction restrictions, category (PvP / Dungeon & Raids / etc.), and "unavailable" banners — use these to confirm `:IsPvP()`, `:FactionSplit()`, and `:Obtainable()` needs.

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
| Allied Race unlock | `:AlliedRace()` |
| Warband Campsite | `:WarbandCampsite()` |
| (no clear match) | Ask for clarification |

**Reward type methods (all 17):**
`:NotCategorized()` `:Other()` `:AlliedRace()` `:Garrison()` `:Mount()` `:Pet()` `:RemixBronze()` `:Tabard()` `:Teleport()` `:Title()` `:Toy()` `:TradersTender()` `:Transmog()` `:WarbandCampsite()` `:RemixInfiniteKnowledge()` `:HousingDecor()` `:KeystoneResilience()`

**Additional (non-reward) methods:**
`:IsPvP()` `:PvP(N)` `:PvE(N)` `:IsRealmFirst()` `:Obtainable(...)` `:Anniv20()` `:FactionSplit(faction, altId)` `:AutoFactionSplit(faction, altId)`

**Rules:**
- If multiple reward types apply (e.g., "Title and Mount"), chain both: `Ach(id):Title():Mount()`
- If comment contains "Reward:" but no recognizable keyword, ask user for clarification
- If no reward hint in comment, use simple form: `Ach(id), -- Comment`

### 4. Season/Event Reference Detection
Extract from comment text:

| Pattern | Action |
|---------|--------|
| "Season X" (X = number) | Detect context (PvP or PvE) from surrounding text |
| "PvE Season", "Keystone", "Raid", "Dungeon" | Use `:PvE(X)` where X is the **game season number** (e.g., 13 for TWW S1) |
| "PvP Season", "Gladiator", "Duelist", "Rival", "Combatant", "Challenger" | Use `:PvP(X)` where X is the **arena season number** |
| PvP context but **no season number** (e.g., "Battleground", "Tour of Duty") | Use `:IsPvP()` (sets PvP flag only, no season reference) |
| "Realm First!" in name | Use `:IsRealmFirst():Obtainable("Once")` |
| Event name (e.g., "Remix Event", "Anniversary") | Try to find matching event ID in codebase or ask user |

**`:IsPvP()` vs `:PvP(N)`:**
- `:PvP(N)` — Achievement is PvP AND tied to a specific season (e.g., gladiator titles, seasonal mounts)
- `:IsPvP()` — Achievement is PvP but NOT tied to a specific season (e.g., battleground wins, tour of duty, conquest accumulation)
- Both can be combined with reward type methods: `Ach(id):Pet():IsPvP()`

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
Use `:FactionSplit()` (two explicit lines) only when the two achievements have **different reward types** (e.g., one faction gets a reward the other doesn't).

### 6. Generate Lua Entry
Build the `Ach()` call based on detected properties:

**Format Decision Tree:**
```
If (no extra properties)
  → Ach(id), -- Comment

If (has reward type)
  → Ach(id):RewardMethod(), -- Comment

If (has faction split, symmetric reward types)
  → Ach(lowerid):AutoFactionSplit(faction.X, altId), -- Lower-ID Name / Higher-ID Name (or just Name if identical; merge shared suffix)

If (has faction split, asymmetric reward types)
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
local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction -- only if AutoFactionSplit or FactionSplit is used
```

## Edge Cases & Exceptions

### Multiple Reward Types
```lua
Ach(42300):Title():Mount(), -- Two Minutes to Midnight (Title: Thorn of Twilight and Mount: Light-Forged Mechsuit)
```

### Temporary Availability
```lua
Ach(10):Obtainable("Before", "Version", {9, 0, 1}), -- Level 50 (Legacy)
```

### Faction Split with Reward Type
```lua
Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38), -- Forged Warlord / Marshal: The War Within Season 1
```

### PvP with Season
```lua
Ach(40233):Title():Toy():PvP(38), -- Strategist: The War Within Season 1
```

### Keystone Hero with Multiple Seasons (available in both)
```lua
Ach(20581):Teleport():PvE(14):PvE(15), -- Keystone Hero: Priory of the Sacred Flame
```

### Standalone PvP Flag (no season)
```lua
Ach(40083):IsPvP(), -- Tour of Duty: Isle of Dorn
Ach(40088):Pet():IsPvP(), -- A Champion's Tour: The War Within
```

### Realm First
```lua
Ach(6523):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 90 Shaman (Legacy)
```

### Anniversary Shorthand
```lua
Ach(40661):Anniv20(), -- Zoomies!
Ach(40976):Mount():Anniv20(), -- A Cool Twenty Years
```
`:Anniv20()` expands to `Obtainable("From", "Date", {2024, 11, 4}, "Until", "Date", {2025, 1, 7})`.

### Full Obtainable Patterns

| Pattern | Example |
|---------|---------|
| No longer obtainable from version | `Obtainable("Before", "Version", {11, 1, 0})` |
| Version window | `Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3})` |
| Available from version (open-ended) | `Obtainable("From", "Version", {11, 2, 7})` |
| Date window | `Obtainable("From", "Date", {2024, 7, 30}, "Until", "Date", {2024, 8, 26})` |
| In-game event | `Obtainable("Event", eventId)` |
| PvP season range | `Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18)` |
| One-time (Realm First) | `Obtainable("Once")` |

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

### Step 4: Output Patch Marker
- If appending to existing patch: **no new patch marker needed**, just append entries
- If creating new patch: **insert new patch section** with marker:
  ```lua
  KrowiAF.AchievementData["11_02_05"] = {
      {KrowiAF.SetAchievementPatch, 11, 2, 5},
      -- new achievement entries...
  }
  ```

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
- [ ] "Realm First!" achievements use `:IsRealmFirst():Obtainable("Once")`
- [ ] Lua syntax is valid (no missing commas, balanced parentheses)
- [ ] Indentation is consistent (tabs, matching file style)
- [ ] No duplicate entries
- [ ] File header includes `local Ach = shared.Ach` (add if missing)
- [ ] `local faction = KrowiAF.Enum.Faction` is present if any `:AutoFactionSplit()` or `:FactionSplit()` is used

## Clarification Questions

Ask user for input when:

1. **Ambiguous Reward Type** — after checking wow.tools.local `Reward_lang` and Wowhead
   > "Achievement #61803: DB `Reward_lang = 'Reward: Amani Appearances'` and Wowhead shows it as a cosmetic appearance set. Should this be `:Transmog()` or `:NotCategorized()`?"

2. **Unclear Season/Event**
   > "Found 'Season 1' but context is ambiguous. Is this PvE (Keystone/Raid) — use `:PvE(N)` — or PvP (Arena/Battleground) — use `:PvP(N)`? What is the game season number?"

3. **Missing Faction Variant**
   > "Detected Alliance achievement #15325. Expected Horde variant at #15326, but it's not in your list. Should I create paired entry or mark as faction-neutral?"

4. **Unknown PvP Season Number**
   > "Achievement appears to be PvP but no season number was found. Should I use `:IsPvP()` (no season) or can you provide the arena season number for `:PvP(N)`?"

5. **Output Location**
   > "Where should I place the generated code?
   > - Insert into [filename] after line X
   > - Display in chat"

## Example Transformation

**Input:**
```lua
{61792}, -- T-A-G that spells "Gotcha!"
{61793}, -- Deployed to the Void
{62506}, -- Abyss Anglers: Pressurized Eyeglass (Reward: Unlock Pressurized Eyeglass for purchase)
{20524}, -- The War Within Keystone Conqueror: Season One (Title, PvE Season 13)
{40234}, -- Forged Warlord: The War Within Season 1 (Title, PvP Season 38, Horde, counterpart: 40235)
{40083}, -- Tour of Duty: Isle of Dorn (PvP, no season)
```

**Output (V2):**
```lua
Ach(61792), -- T-A-G that spells "Gotcha!"
Ach(61793), -- Deployed to the Void
Ach(62506):NotCategorized(), -- Abyss Anglers: Pressurized Eyeglass (Reward: Unlock Pressurized Eyeglass for purchase)
Ach(20524):Title():PvE(13), -- The War Within Keystone Conqueror: Season One
Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38), -- Forged Warlord / Marshal: The War Within Season 1
Ach(40083):IsPvP(), -- Tour of Duty: Isle of Dorn
```

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
- `DataAddons/Shared/AchievementData.lua` — `AchBuilder` definition and `shared.Ach` factory
- `Api/AchievementDataApi.lua` — `KrowiAF.AddAchievementData` and `KrowiAF.SetAchievementPatch`
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

When asked "what new achievements does patch X.Y.Z have?", **always use `Find-NewAchievements.ps1`** as the authoritative source. Never derive the ID list by:
- Assuming only IDs above a threshold are new (Blizzard can assign any ID)
- Filtering by name prefix like `[DNT]` manually (use the Flags bitmask instead)
- Querying a single build without diffing against the previous build

**Mandatory workflow:**

```powershell
# 1. Ensure wow.tools.local is running (check first — do NOT start if already running)
$running = Get-Process "wow.tools.local" -ErrorAction SilentlyContinue
if (-not $running) { Start-Process "E:\World of Warcraft Addon Development\wow.tools.local\wow.tools.local.exe" }

# 2. Run the authoritative diff script
& ".github\skills\add-achievement-data\Find-NewAchievements.ps1" `
    -BuildNew "X.Y.Z.NNNNN" `
    -BuildOld "X.Y.Z.NNNNN"
```

The script handles:
- Full build diff (all IDs, not just above a threshold)
- Flags column bit `0x100000` → hidden/[DNT] entries filtered out
- Top-level category filter → Statistics (1) and Guild (15076) excluded

**After running the script, self-evaluate before presenting results:**

```powershell
& ".github\skills\add-achievement-data\Evaluate-FindNewAchievements.ps1" `
    -BuildNew "X.Y.Z.NNNNN" `
    -BuildOld "X.Y.Z.NNNNN" `
    -AgentIds "ID1,ID2,ID3,..." `
    -LuaFile "DataAddons\Retail\XX_Expansion\AchievementData.lua"
```

If the evaluator exits non-zero, fix the ID list and re-run. Do not present results until it passes. Max 3 attempts.
