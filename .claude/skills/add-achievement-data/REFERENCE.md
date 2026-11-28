# add-achievement-data: reference

The blocks of [SKILL.md](SKILL.md) that only some runs need. Read the section a step there points to.

## Wowhead lookup

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

## Reward preview ids

### 3.5 Pet Reward Preview: SpeciesID Lookup

`:Pet()` optionally takes a battle pet **SpeciesID** — this is the only way to deterministically render the correct pet model in the reward preview (there's no reliable spell/item → species API). At runtime the game resolves name + display model from this id via `C_PetJournal.GetPetInfoBySpeciesID(speciesId)`. Always look this up when the achievement grants a battle pet.

1. Get the achievement's `Reward_lang` from the DB (already fetched in step 0.5 via `_lookup_ids.ps1`), e.g. `"Pet: Fledgling Warden's Companion"`. Strip the `"Pet: "` prefix to get the creature name.
2. Look up that creature name's SpeciesID using the designated script `.claude/skills/add-achievement-data/_lookup_pet_speciesid.ps1` — run it with `-Names "Fledgling Warden's Companion"` (add `-Client Classic` for a Classic entry). Never write a new ad-hoc query for this. The script chains two DB tables: `creature` (find the creature's `ID` by exact `Name_lang` match) → `battlepetspecies` (filter `CreatureID` column by that id, read its `ID` column — the SpeciesID).
   ```powershell
   .\.claude\skills\add-achievement-data\_lookup_pet_speciesid.ps1
   ```
   Output: `<Name>|CreatureID=<id>|SpeciesID=<id>` (or `NOTFOUND`).
3. Pass the SpeciesID value into the builder: `Ach(42319):Pet(4901), -- Azsuna (Pet: Fledgling Warden's Companion)`.
4. If the creature name search returns multiple/no matches, fall back to a manual lookup in the web UI: `/dbc/?dbc=creature&build=<build>&locale=enUS#page=1&colFilter[1]=<Name>` to find the creature's `ID`, then `/dbc/?dbc=battlepetspecies&build=<build>&locale=enUS#page=1&colFilter[3]=exact:<creatureId>` to find its `ID` (SpeciesID).
5. If no SpeciesID can be found at all (rare), fall back to a plain `:Pet()` with no argument rather than guessing an id.

### 3.6 Mount Reward Preview: MountId Lookup

`:Mount()` optionally takes a **mount id** (the `mount` DBC table's own `ID`, NOT the summoning spell id) — needed to deterministically render the correct mount model in the reward preview. At runtime the game resolves name/display via `C_MountJournal.GetMountInfoByID(mountId)` (name) and `C_MountJournal.GetMountInfoExtraByID(mountId)` (display/scene id). Always look this up when the achievement grants a mount.

1. Get the achievement's `Reward_lang` from the DB, e.g. `"Mount: Stormtouched Bruffalon"`. Strip the `"Mount: "` prefix to get the mount name.
2. Look up that mount name's id using the designated script `.claude/skills/add-achievement-data/_lookup_mount_id.ps1` — run it with `-Names "Stormtouched Bruffalon"` (add `-Client Classic` for a Classic entry). Never write a new ad-hoc query for this.
   ```powershell
   .\.claude\skills\add-achievement-data\_lookup_mount_id.ps1
   ```
   Output: `<Name>|MountID=<id>` (or `NOTFOUND`).
3. Pass the mount id value into the builder: `Ach(19486):Mount(1614), -- Across the Isles (Mount: Stormtouched Bruffalon)`.
4. If the name search returns multiple/no matches, fall back to a manual lookup in the web UI: `/dbc/?dbc=mount&build=<build>&locale=enUS#page=1&colFilter[0]=<Name>` and read the `ID` column (4th column).
5. If no mount id can be found at all (rare), fall back to a plain `:Mount()` with no argument rather than guessing an id.

### 3.7 Housing Decor Reward Preview: RecordID Lookup

`:HousingDecor()` optionally takes a **record id** (the `housedecor` DBC table's own `ID`) — needed to deterministically render the correct model in the reward preview. At runtime the game resolves the asset/scene via `C_HousingCatalog.GetCatalogEntryInfoByRecordID(Enum.HousingCatalogEntryType.Decor, recordId)`. Always look this up when the achievement grants a housing decoration.

1. Get the achievement's `Reward_lang` from the DB, e.g. `"Reward: Preyseeker's Twilight Effigy"`. Strip the `"Reward: "` prefix to get the decor item name.
2. Look up that decor name's id using the designated script `.claude/skills/add-achievement-data/_lookup_housingdecor_id.ps1` — run it with `-Names "Preyseeker's Twilight Effigy"`. Never write a new ad-hoc query for this.
   ```powershell
   .\.claude\skills\add-achievement-data\_lookup_housingdecor_id.ps1
   ```
   Output: `<Name>|RecordID=<id>` (or `NOTFOUND`).
3. Pass the record id value into the builder: `Ach(62184):HousingDecor(17454), -- Achievement Name (Reward: Preyseeker's Twilight Effigy)`.
4. If the name search returns multiple/no matches, fall back to a manual lookup in the web UI: `/dbc/?dbc=housedecor&build=<build>&locale=enUS#page=1&colFilter[0]=<Name>` and read the `ID` column (5th column).
5. If no record id can be found at all (rare), fall back to a plain `:HousingDecor()` with no argument rather than guessing an id.

## Edge cases and Obtainable() patterns

## Edge Cases & Exceptions

### Multiple Reward Types
```lua
Ach(42300):Mount(2608):Title():Obtainable("Before", "Version", {12, 0, 1}), -- Two Minutes to Midnight
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

### Keystone Hero with Multiple Seasons
```lua
Ach(20581):Teleport():PvE(14):PvE(15), -- Keystone Hero: Priory of the Sacred Flame
```
Each season is a record; the tooltip lists both, but only the last one (season 15) decides whether the achievement is Time Limited, past or future.

### Standalone PvP Flag (no season)
```lua
Ach(40083):IsPvP(), -- Tour of Duty: Isle of Dorn
Ach(40088):Pet():IsPvP(), -- A Champion's Tour: The War Within
```

### Realm First
```lua
Ach(6523):IsRealmFirst(), -- Realm First! Level 90 Shaman (Legacy)
```
`:IsRealmFirst()` adds the `Obtainable("Once")` record itself; none of the realm-first lines in the data write it.

### Anniversary Shorthand
```lua
Ach(40661):Anniv20(), -- Zoomies!
Ach(40976):Mount():Anniv20(), -- A Cool Twenty Years
```
`:Anniv20()` expands to `Obtainable("From", "Date", {2024, 11, 4}, "Until", "Date", {2025, 1, 7})`.

### Obtainable Patterns

The common forms; every form, what each one includes and excludes, and how a record becomes Past, Current or Future are in `docs/obtainability.md`.

| Pattern | Example |
|---------|---------|
| No longer obtainable from version | `Obtainable("Before", "Version", {11, 1, 0})` |
| Obtainable through the end of a version (inclusive) | `Obtainable("Until", "Version", {5, 0, 4})` |
| Obtainable during one version only | `Obtainable("Version", {12, 0, 7})` |
| Version window | `Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3})` |
| Available from version (open-ended) | `Obtainable("From", "Version", {11, 2, 7})` |
| Date window | `Obtainable("From", "Date", {2024, 7, 30}, "Until", "Date", {2024, 8, 26})` |
| In-game event | `Obtainable("Event", eventId)` |
| PvP season range | `Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18)` |
| Never obtainable | `Obtainable("Never")` |

- **A date window comes from the game's calendar.** For an anniversary or other dated event, run `.claude/skills/add-achievement-data/_lookup_holidays.ps1 -Terms "Anniversary"` (a holiday name fragment): it prints each holiday's decoded start, duration and end. For an event still on the PTR, set `$env:KAF_RETAIL_PRODUCT = "wowxptr"` (or `"wowt"`) first so the build resolves to the PTR. A window taken from a PTR build is provisional; recheck it once the event is on the live calendar.
- **A cutoff starts at the achievement's own patch.** The three-argument `Before` and `Until` forms take the patch block the entry sits in as their start. If the achievement can only be earned from a later patch, use the During form or a window instead. For example, a season achievement added one patch ahead of its season: the Mists Classic Season 3 Challenge Mode achievements were added in 5.5.3, but Season 3 started with 5.5.4, so they use `Obtainable("Version", {5, 5, 4})`.
- **A range that differs per client cannot stay in Shared.** Give the achievement an entry in both the Retail and the Classic file. Write the anchors as Retail patches; Classic maps them through `DataAddons/Classic/ContentTimeline.lua`. For example, 5313 is `Until 5.0.4` on Retail and `Before 5.0.4` on Classic.

## Clarification questions and a worked example

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

## Finding new achievements in a patch

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
& ".claude\skills\add-achievement-data\Find-NewAchievements.ps1" `
    -BuildNew "X.Y.Z.NNNNN" `
    -BuildOld "X.Y.Z.NNNNN"
```

The script handles:
- Full build diff (all IDs, not just above a threshold)
- Flags column bit `0x100000` → hidden/[DNT] entries filtered out
- Top-level category filter → Statistics (1) and Guild (15076) excluded

**After running the script, self-evaluate before presenting results:**

```powershell
& ".claude\skills\add-achievement-data\Evaluate-FindNewAchievements.ps1" `
    -BuildNew "X.Y.Z.NNNNN" `
    -BuildOld "X.Y.Z.NNNNN" `
    -AgentIds "ID1,ID2,ID3,..." `
    -LuaFile "DataAddons\Retail\XX_Expansion\AchievementData.lua"
```

If the evaluator exits non-zero, fix the ID list and re-run. Do not present results until it passes. Max 3 attempts.