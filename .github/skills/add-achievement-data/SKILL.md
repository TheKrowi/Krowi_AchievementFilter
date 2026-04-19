---
name: add-achievement-data
description: Transform raw achievement lists (IDs + comments) into properly formatted Lua achievement data entries for Krowi's Achievement Filter addon. Handles reward type mapping, season references, faction detection, and maintains consistent code style.
---

Transform raw achievement lists (IDs + comments) into properly formatted Lua achievement data entries for the Krowi's Achievement Filter addon. Handles reward type mapping, season references, faction detection, and maintains consistent code style.

Provide your achievement list in this format and I'll:
1. Scan the currently open AchievementData.lua file to detect the expansion and latest patch
2. Confirm the target patch with you (append to existing or create new)
3. Parse achievements, detect rewards, seasons, and factions
4. Generate properly formatted Lua code matching the file's style
5. Insert or display the results

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

### 1. Parse Achievement ID
Extract numeric ID from each entry. IDs must be valid positive integers.

### 2. Extract Comment
Capture the comment after `--`. Comments contain:
- Achievement name (required)
- Reward type hint in parentheses (optional)
- Season/Event references (optional)
- Faction indicator (optional)

### 3. Reward Type Detection
Map comment text to `rewardType` enum values:

| Keyword in Comment | RewardType |
|-------------------|-----------|
| "Mount:", "Mount: " | `Mount` |
| "Title:", "Title: " | `Title` |
| "Pet:", "Pet: " | `Pet` |
| "Toy:" | `Toy` |
| "Tabard:" | `Tabard` |
| "Transmog:" | `Transmog` |
| "Unlock ..., **for purchase**" | `NotCategorized` |
| "Unlock ... travel method" | `Mount` |
| "Unlock ... decor" | `HousingDecor` |
| "Character Unlock:", "Character Title:" | `Title` |
| "Seasonal Character Title:" | `Title` |
| "Shop Sign" | `HousingDecor` |
| Bronze Cache | `RemixBronze` |
| (no clear match) | Ask for clarification |

**Rules:**
- If multiple reward types apply (e.g., "Title and Mount"), return array: `{rewardType.Title, rewardType.Mount}`
- If comment contains "Reward:" but no recognizable keyword, ask user for clarification
- If no reward hint in comment, entry defaults to simple format (ID + comment)

### 4. Season/Event Reference Detection
Extract from comment text:

| Pattern | Action |
|---------|--------|
| "Season X" (X = number) | Detect context (PvP or PvE) from surrounding text (e.g., "Gladiator", "Keystone", "Raid") |
| "PvE Season", "Keystone", "Raid", "Dungeon" | Use `{"PvE Season", X}` |
| "PvP Season", "Gladiator", "Duelist", "Rival" | Use `{"PvP Season", X}` |
| Event name (e.g., "Remix Event", "Bronze Cache") | Try to find matching event ID in codebase or ask user |

### 5. Faction Detection
Scan comment for faction keywords:

| Text | Action |
|------|--------|
| Contains "Alliance" | Mark as `faction.Alliance`; look for Horde variant (same ID ±1) |
| Contains "Horde" | Mark as `faction.Horde`; look for Alliance variant (same ID ±1) |
| Contains "Darkspear Troll" or race-specific text | Identify faction from context |
| No faction keyword | Default to faction-neutral (no faction property) |

**Faction Pairing:**
If detecting Alliance variant, automatically look for Horde variant (typically ID+1 or ID-1, or same ID with faction flag). Create paired entries:
```lua
{
    ALLIANCE_ID,
    faction.Alliance,
    HORDE_ID,
},
```

### 6. Generate Lua Entry
Build Lua table entry based on detected properties:

**Format Decision Tree:**
```
If (faction only AND no other properties)
  → Use 3-element format: {ID, faction.X, otherFactionID}

Else If (has RewardType OR Event/Season OR other metadata)
  → Use extended format: {ID, {...metadata table...}}

Else If (has faction AND metadata)
  → Use 4-element format: {ID, faction.X, {...metadata...}} (if otherFactionID) 
                      OR {ID, {...metadata including faction...}}

Else
  → Use simple format: {ID}, -- Comment
```

### 7. Code Style Matching
Maintain consistency with current file:

**Indentation:**
- Use tabs (not spaces)
- Inner tables indented 2 levels from entry

**Comments:**
- Format: `{...}, -- Achievement Name (optional: (Reward: ...) info)`
- Keep comments after closing brace/bracket on same line

**Spacing:**
- One blank line between logical groups
- No trailing commas on last entries in array

**Table Formatting:**
- Multi-line tables: opening brace on line with ID, closing brace own line
- Single-property tables: same line (`{ RewardType = value }`)
- Multiple properties: each on own line with proper indentation

**Example:**
```lua
{ -- Achievement Name (Reward: Description)
    12345,
    faction.Alliance,
    {
        RewardType = rewardType.Mount,
        {"PvE Season", 13},
    },
},
```

## Edge Cases & Exceptions

### Multiple Reward Types
```lua
{ -- Two Minutes to Midnight (Title: Thorn of Twilight and Mount: Light-Forged Mechsuit)
    42300,
    {
        RewardType = {rewardType.Title, rewardType.Mount},
    },
},
```

### Temporary Availability
```lua
{ -- Level 50 (Legacy)
    10,
    {
        {"Before", "Version", {9, 0, 1}},
    },
},
```

### Empty Data Table (Rare, Valid)
```lua
{ -- WoW's 16th Anniversary
    14271,
    {
        {},
    },
},
```

### Shared Helper Functions (Optional, Only in Modern Expansions)
Expansion 11+ (The War Within) can use helper functions:
```lua
Ach(19559), -- Azj-Kahet
Ach(20523, PvE(13)), -- The War Within Keystone Explorer
PvE(13), -- returns {"PvE Season", 13}
Title(), -- returns {RewardType = rewardType.Title}
```

**Note:** Only use if codebase imports `shared` helpers. Verify in file header.

## Patch Version Determination

Before generating output, determine the target patch using **Option D** approach:

### Step 1: Infer Expansion from Current File
- Check currently open file path (from VS Code editor context)
- Extract expansion folder name from path, e.g.:
  - `DataAddons/Retail/12_Midnight/AchievementData.lua` → Expansion: Midnight (12)
  - `DataAddons/Classic/05_MistsOfPandaria/AchievementData.lua` → Expansion: Mists of Pandaria (05)
  - If no file open, ask user to specify

### Step 2: Scan File for Existing Patches
- Read the currently open AchievementData.lua file
- Find all patch keys: `KrowiAF.AchievementData["X_Y_Z"]`
- Extract patch versions: parse as `{major=X, minor=Y, patch=Z}`
- Identify the **latest patch** (highest version)

Example scan:
```lua
KrowiAF.AchievementData["12_00_00"] = { ... }  -- Latest: 12.0.0
KrowiAF.AchievementData["12_00_01"] = { ... }  -- Latest: 12.0.1
KrowiAF.AchievementData["12_01_00"] = { ... }  -- Latest: 12.1.0
KrowiAF.AchievementData["12_01_05"] = { ... }  -- Latest: 12.1.5
```
Result: Latest patch = `12.1.5`

### Step 3: Present Confirmation Dialog
Ask user to confirm or create new patch:

```
Detected: Retail Midnight expansion

Latest patch in file: 12.1.5

Options:
A) Add to existing patch 12.1.5 (achievements appended to current patch)
B) Create new patch 12.1.6 (achievements in separate patch section)
C) Specify custom patch version (e.g., 12.2.0)
```

### Step 4: Output Patch Marker
- If appending to existing patch: **no new patch marker needed**, just append entries
- If creating new patch: **insert new patch section** with marker:
  ```lua
  KrowiAF.AchievementData["12_01_06"] = {
      {KrowiAF.SetAchievementPatch, 12, 1, 6},
      -- new achievement entries...
  };
  ```

## Output Options

After confirming patch, ask user:
```
Where should the generated code be placed?
A) Insert into currently open file (append to confirmed patch section)
B) Create new file for manual review
C) Show in chat for manual copy-paste
```

## Validation Checklist

Before returning output, verify:

- [ ] All achievement IDs are valid positive integers
- [ ] All comments are non-empty
- [ ] Faction pairing logic found correct variants (or asked user)
- [ ] Reward types map to actual `rewardType` enum values
- [ ] Season/Event references are in correct format
- [ ] Lua syntax is valid (no missing commas, balanced braces)
- [ ] Indentation is consistent (all tabs, matching file style)
- [ ] No duplicate entries
- [ ] Comments don't contain actual reward descriptions (move to RewardType property)

## Clarification Questions

Ask user for input when:

1. **Ambiguous Reward Type**
   > "Achievement #61803 has comment '(Reward: Amani Appearances)' which doesn't clearly map to a standard rewardType. Should this be NotCategorized, Other, or Transmog?"

2. **Unclear Season/Event**
   > "Found 'Season 1' but context is ambiguous. Is this PvE (Keystone/Raid) or PvP (Arena/Battleground)?"

3. **Missing Faction Variant**
   > "Detected Alliance achievement #15325. Expected Horde variant at #15326, but it's not in your list. Should I create paired entry or mark as faction-neutral?"

4. **Output Location**
   > "Where should I place the generated code? 
   > - Insert into [filename] after line X
   > - Create temporary file  
   > - Display in chat"

## Example Transformation

**Input:**
```lua
{61792}, -- T-A-G that spells "Gotcha!"
{61793}, -- Deployed to the Void
{ -- Abyss Anglers: Pressurized Eyeglass (Reward: Unlock Pressurized Eyeglass for purchase)
    62506,
    {
        RewardType = rewardType.NotCategorized,
    },
},
```

**Output (same, as simple entries need no transformation):**
```lua
{61792}, -- T-A-G that spells "Gotcha!"
{61793}, -- Deployed to the Void
{ -- Abyss Anglers: Pressurized Eyeglass (Reward: Unlock Pressurized Eyeglass for purchase)
    62506,
    {
        RewardType = rewardType.NotCategorized,
    },
},
```

**Processing:**
- #61792: No reward/season/faction → stays simple
- #61793: No reward/season/faction → stays simple  
- #62506: Has reward hint, already in extended format → verify format correctness, keep as-is

## Integration Notes

- Achievement data is organized by expansion: `DataAddons/Retail/{XX_ExpansionName}/AchievementData.lua`
- Each expansion file has structure: header with `KrowiAF.AchievementPatch()`, followed by achievement entries
- Always insert new achievements after patch marker, in ID order (ascending)
- Validate against existing IDs to prevent duplicates
- Ensure `.toc` file is loaded if testing locally

## Related Files
- `Api/AchievementDataApi.lua` — Defines achievement data parsing logic
- `DataAddons/Shared/AchievementData.lua` — Shared helper functions
- `Api/ApiDocumentation.lua` — Full achievement data structure spec
- Active expansion files in `DataAddons/Retail/{XX}/AchievementData.lua`
