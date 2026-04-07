# How To: Add Achievements for a New Patch

Use this guide when a WoW patch releases new achievements that belong to an **existing** expansion (e.g. patch 12.1.0 adding achievements to the Midnight expansion). For an entirely new expansion, see [`add-expansion.md`](add-expansion.md).

**Commit type:** `data(<expansion>): <description>` — e.g. `data(midnight): add 12.1.0 achievements (23)`

---

## 1. Locate the Expansion Data Folder

Find the right folder under `DataAddons/Retail/`:

```
DataAddons/Retail/
  01_Vanilla/
  02_TheBurningCrusade/
  ...
  12_Midnight/         ← current expansion at time of writing
```

All steps below use `DataAddons/Retail/12_Midnight/` as the example. Substitute the correct expansion folder.

---

## 2. Add Achievements to `AchievementData.lua`

Open `DataAddons/Retail/12_Midnight/AchievementData.lua`.

Add a new table keyed by `"<major>_<minor>_<patch>"` (zero-padded two digits):

```lua
KrowiAF.AchievementData["12_01_00"] = {
    {KrowiAF.SetAchievementPatch, 12, 1, 0},  -- Required: identifies the patch
    {41234},                                   -- Simple achievement: just the ID
    { -- Achievement with a reward type
        41235,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Faction-split achievement (Alliance version links to Horde version)
        41236,
        faction.Alliance,
        41237,  -- Horde counterpart ID
    },
    { -- Temporarily obtainable (available before a specific version)
        41238,
        {
            {"Before", "Version", {12, 1, 0}},
        },
    },
}
```

**Reference:** `Api/ApiDocumentation.lua` for the full list of supported fields and patterns. `RewardType` values are in `KrowiAF.Enum.RewardType`; faction values are in `KrowiAF.Enum.Faction`.

The local aliases at the top of the file (`local shared`, `local faction`, `local rewardType`) are used throughout — use them.

---

## 3. Add Achievements to `CategoryData.lua`

Open `DataAddons/Retail/12_Midnight/CategoryData.lua`.

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

Open `DataAddons/Retail/12_Midnight/ZoneData.lua`.

If the patch adds new zone achievements (exploration, quests within a new map area), add them into the appropriate zone table or create a new local table. Zone data feeds the "Current Zone" and "Selected Zone" special categories.

---

## 5. Update `TooltipData.lua` (if achievements have extra tooltip info)

Open `DataAddons/Retail/12_Midnight/TooltipData.lua`.

Some achievements display extra information in the tooltip (which achievements are part of a chain, linked follow-ups, etc.). Only update this file if the new achievements have tooltip extras.

---

## 6. Update `TransmogSetData.lua` (if achievements are linked to transmog sets)

Open `DataAddons/Retail/12_Midnight/TransmogSetData.lua`.

If any new achievement is tied to unlocking a transmog set (e.g. a raid set), add the set ID → achievement ID mapping here.

---

## 7. Update `BuildVersionData.lua` (only for the first data of a new patch)

Open `DataAddons/Retail/12_Midnight/BuildVersionData.lua`.

If `12.1.0` is a new patch that doesn't have an entry yet, add it to `Minors`:

```lua
KrowiAF.BuildVersionData.Midnight = { -- 12
    Major = 12,
    Minors = {
        { -- 12.0
            Minor = 0,
            Patches = {
                { Patch = 0, BuildVersionId = "120000", Name = addon.L["Midnight"] },
                { Patch = 1, BuildVersionId = "120001", Name = addon.L["Midnight"] },
            },
        },
        { -- 12.1
            Minor = 1,
            Patches = {
                { Patch = 0, BuildVersionId = "120100", Name = addon.L["Midnight"] },
            },
        },
    },
}
```

Skip this step if the patch already has an entry.

---

## 8. Verify `Files.xml` Includes Your Files

Open `DataAddons/Retail/12_Midnight/Files.xml`. Confirm the files you edited are not commented out:

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
5. If you added `RewardType`, verify the reward filter shows the achievement correctly.

---

## 10. Update the Changelog

Add an entry to `_Packaging/Changelog.md` and `_Packaging/ReleaseNotes.md`:

```markdown
### Added
- 12.1.0 achievements (23)
```
