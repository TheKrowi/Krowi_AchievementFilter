# How To: Add Achievements for a New Patch

Use this guide when a WoW patch releases new achievements that belong to an **existing** expansion (e.g. patch 11.1.0 adding achievements to The War Within expansion). For an entirely new expansion, see [`add-expansion.md`](add-expansion.md).

**Commit type:** `data(<expansion>): <description>` — e.g. `data(thewarwithin): add 11.1.0 achievements (23)`

---

## 1. Locate the Expansion Data Folder

Find the right folder under `DataAddons/Retail/`:

```
DataAddons/Retail/
  01_Vanilla/
  02_TheBurningCrusade/
  ...
  11_TheWarWithin/     ← canonical V2 reference expansion
  12_Midnight/
```

All steps below use `DataAddons/Retail/11_TheWarWithin/` as the example. Substitute the correct expansion folder.

---

## 2. Add Achievements to `AchievementData.lua`

Open `DataAddons/Retail/11_TheWarWithin/AchievementData.lua`.

### File header (V2 format)

New expansion files and any new file you create must use this header:

```lua
local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction -- only needed if AutoFactionSplit or FactionSplit is used
```

### Adding to a file that already has V1 entries

Older expansion files (01–12, excluding 11) still contain V1-format entries (`KrowiAF.AchievementData`). When adding a **new patch** to such a file:

1. Add the `shared`/`Ach` imports to the file header if not present.
2. Use `KrowiAF.AchievementData` for your new patch table (V2).
3. The V1 entries in the same file are unaffected — both formats are supported simultaneously.

### Adding a new patch table

Add a new table keyed by `"<major>_<minor>_<patch>"` (zero-padded two digits):

```lua
KrowiAF.AchievementData["11_01_00"] = {
    {KrowiAF.SetAchievementPatch, 11, 1, 0},  -- Required: identifies the patch
    Ach(41234),                                -- Simple achievement: just the ID
    Ach(41235):Mount(),                        -- Achievement with a reward type
    Ach(41236):AutoFactionSplit(faction.Alliance, 41237):Title(), -- Lower-ID Name / Higher-ID Name
    Ach(41238):Obtainable("Before", "Version", {11, 1, 0}),  -- Temporarily obtainable
    Ach(41239):PvE(14),                        -- Tied to a PvE season
    Ach(41240):Title():PvP(39),                -- PvP achievement with reward type
    Ach(41241):IsPvP(),                        -- PvP achievement, no reward
}
```

**Full method reference:**

| Method | Description |
|--------|-------------|
| `:Mount()` `:Pet()` `:Title()` `:Toy()` `:Tabard()` `:Transmog()` | Reward types |
| `:Teleport()` `:HousingDecor()` `:AlliedRace()` `:Other()` | More reward types |
| `:NotCategorized()` `:Garrison()` `:RemixBronze()` `:TradersTender()` | More reward types |
| `:WarbandCampsite()` `:RemixInfiniteKnowledge()` `:KeystoneResilience()` | More reward types |
| `:PvE(season)` | Ties achievement to a PvE season number |
| `:PvP(season)` | Marks as PvP and ties to a PvP season number |
| `:IsPvP()` | Marks as PvP without a season |
| `:IsRealmFirst()` | Marks as a Realm First achievement |
| `:AutoFactionSplit(faction, altId)` | Collapses a symmetric faction pair into one entry; auto-registers the mirror |
| `:FactionSplit(faction, altId)` | Explicit faction link — use only when the two sides have different reward types |
| `:Obtainable(...)` | Adds a temporary availability window |

Multiple methods can be chained: `Ach(id):Title():PvE(13):IsPvP()`

**Reference:** `Api/ApiDocumentation.lua` for annotated examples of all patterns.

---

## 3. Add Achievements to `CategoryData.lua`

Open `DataAddons/Retail/11_TheWarWithin/CategoryData.lua`.

Add the achievement IDs to the appropriate category/subcategory. Categories are organised as nested tables that mirror the in-game achievement tree. Find the relevant parent category (zone, dungeon, raid, etc.) and insert the IDs:

```lua
{ -- New Dungeon
    "The Arcantina",
    {
        41250, -- Normal: The Arcantina
        41251, -- Heroic: The Arcantina
        41252, -- Mythic: The Arcantina
    },
},
```

If this patch adds a brand new sub-category that doesn't exist yet, add it at the correct position in the hierarchy following the surrounding patterns.

---

## 4. Update `ZoneData.lua` (if new zones were added)

Open `DataAddons/Retail/11_TheWarWithin/ZoneData.lua`.

If the patch adds new zone achievements (exploration, quests within a new map area), add them into the appropriate zone table or create a new local table. Zone data feeds the "Current Zone" and "Selected Zone" special categories.

---

## 5. Update `TooltipData.lua` (if achievements have extra tooltip info)

Open `DataAddons/Retail/11_TheWarWithin/TooltipData.lua`.

Some achievements display extra information in the tooltip (which achievements are part of a chain, linked follow-ups, etc.). Only update this file if the new achievements have tooltip extras.

---

## 6. Update `TransmogSetData.lua` (if achievements are linked to transmog sets)

Open `DataAddons/Retail/11_TheWarWithin/TransmogSetData.lua`.

If any new achievement is tied to unlocking a transmog set (e.g. a raid set), add the set ID → achievement ID mapping here.

---

## 7. Update `BuildVersionData.lua` (only for the first data of a new patch)

Open `DataAddons/Retail/11_TheWarWithin/BuildVersionData.lua`.

If `11.1.0` is a new patch that doesn't have an entry yet, add it to `Minors`:

```lua
KrowiAF.BuildVersionData.TheWarWithin = { -- 11
    Major = 11,
    Minors = {
        { -- 11.0
            Minor = 0,
            Patches = {
                { Patch = 0, BuildVersionId = "110000", Name = addon.L["The War Within"] },
                { Patch = 1, BuildVersionId = "110001", Name = addon.L["The War Within"] },
            },
        },
        { -- 11.1
            Minor = 1,
            Patches = {
                { Patch = 0, BuildVersionId = "110100", Name = addon.L["The War Within"] },
            },
        },
    },
}
```

Skip this step if the patch already has an entry.

---

## 8. Verify `Files.xml` Includes Your Files

Open `DataAddons/Retail/11_TheWarWithin/Files.xml`. Confirm the files you edited are not commented out:

```xml
<Ui>
    <Script file="AchievementData.lua" />
    <Script file="BuildVersionData.lua" />
    <Script file="CategoryData.lua" />
    <Script file="ZoneData.lua" />
    <!-- TooltipData.lua, TransmogSetData.lua etc. — uncomment if you added data -->
</Ui>
```

If you added data to a file that is currently commented out (e.g. `TooltipData.lua`), uncomment that line.

---

## 9. Test In-Game

1. Load the addon in WoW (`/reload` or restart the client).
2. Open the Achievements window and navigate to the relevant expansion and category.
3. Verify the new achievements appear in the correct category.
4. Check the "Added in patch X.Y.Z" badge in the achievement tooltip.
5. If you added a reward method (e.g. `:Mount()`), verify the reward filter shows the achievement correctly.

---

## 10. Update the Changelog

Add an entry to `_Packaging/Changelog.md` and `_Packaging/ReleaseNotes.md`:

```markdown
### Added
- 11.1.0 achievements (23)
```