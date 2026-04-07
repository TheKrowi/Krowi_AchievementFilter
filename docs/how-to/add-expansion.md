# How To: Add a New Expansion

Use this guide when WoW releases an entirely new expansion that needs its own data folder (e.g. expansion 13). Use [`add-patch-achievements.md`](add-patch-achievements.md) instead when adding data to an existing expansion.

**Commit type:** `data(<expansion>): initial expansion data folder` — e.g. `data(thenextexpansion): create initial data folder`

The canonical reference for all file structures is the most recent expansion folder, currently `DataAddons/Retail/12_Midnight/`.

---

## 1. Create the Expansion Folder

Create `DataAddons/Retail/13_TheNextExpansion/` (adjust number and name).

Copy `DataAddons/Retail/12_Midnight/` as your starting template. You'll replace all data but keep the file structure.

---

## 2. Create `Files.xml`

Create `DataAddons/Retail/13_TheNextExpansion/Files.xml`:

```xml
<Ui>
    <Script file="AchievementData.lua" />
    <Script file="BuildVersionData.lua" />
    <Script file="CategoryData.lua" />
    <!-- Uncomment these when you have data for them: -->
    <!-- <Script file="CustomCriteriaData.lua" /> -->
    <!-- <Script file="EventData.lua" /> -->
    <!-- <Script file="PetBattleLinkData.lua" /> -->
    <!-- <Script file="TooltipData.lua" /> -->
    <!-- <Script file="TransmogSetData.lua" /> -->
    <Script file="ZoneData.lua" />
</Ui>
```

Only include files you actually have data for. Comment out the rest.

---

## 3. Create `AchievementData.lua`

```lua
local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;
local rewardType = KrowiAF.Enum.RewardType;

KrowiAF.AchievementData["13_00_00"] = {
    {KrowiAF.SetAchievementPatch, 13, 0, 0},
    -- Add achievement entries here
}
```

See [`add-patch-achievements.md`](add-patch-achievements.md) for the full set of supported achievement entry patterns. Use `Api/ApiDocumentation.lua` as the canonical reference.

---

## 4. Create `BuildVersionData.lua`

```lua
local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.TheNextExpansion = { -- 13
    Major = 13,
    Minors = {
        { -- 13.0
            Minor = 0,
            Patches = {
                { -- 13.0.0
                    Patch = 0,
                    BuildVersionId = "130000",
                    Name = addon.L["The Next Expansion"]
                },
            },
        },
    },
};
```

The `Name` value is a localization key — add the English string to `Localization/enUS.lua` above the `AUTOGENTOKEN` marker (see [`update-localization.md`](update-localization.md)).

---

## 5. Create `CategoryData.lua`

Mirror the structure from `DataAddons/Retail/12_Midnight/CategoryData.lua`. The outer wrapper is:

```lua
local _, addon = ...
local shared = addon.Data.CategoryData.Shared

tinsert(KrowiAF.CategoryData.Expansions, { -- The Next Expansion
    addon.GetCategoryInfoTitle(<expansion_category_id>),
    { -- Character
        ...
    },
    { -- Zones
        ...
    },
    -- etc.
})
```

The category IDs passed to `addon.GetCategoryInfoTitle()` are WoW's internal achievement category IDs, found via the WoW achievement API or Wowhead.

---

## 6. Create `ZoneData.lua`

Start with:

```lua
local _, addon = ...
local shared = addon.Data.ZoneData.Shared

-- Add zone achievement tables here
-- Each zone is a local table, then referenced in KrowiAF.ZoneData
```

Use `DataAddons/Retail/12_Midnight/ZoneData.lua` as the reference.

---

## 7. Register in `DataAddons/Retail/Files.xml`

Open `DataAddons/Retail/Files.xml` and add the new expansion's `Files.xml` at the end of the existing expansion list (before the `CategoryData_*.lua` scripts):

```xml
<Include file="13_TheNextExpansion\Files.xml" />
```

---

## 8. Add the Tab/Root Category (if this is a brand new tab)

For expansions, the category is appended to `KrowiAF.CategoryData.Expansions` via `tinsert` in `CategoryData.lua` (step 5) — no additional wiring is needed.

If this is an entirely new **tab** (not just a new expansion category under the Expansions tab), see `Api/TabDataApi.lua` and `DataAddons/Loaders/TabData.lua` for how tabs are registered.

---

## 9. Update the TOC Interface Version

Open `Krowi_AchievementFilter.toc` and bump the `## Interface:` line to the new expansion's build number:

```
## Interface: 130000, 50503
```

The second value (`50503`) is the Classic interface version — update it if Classic also received a version bump.

---

## 10. Add Classic Support (if applicable)

If the expansion also releases on Classic clients, repeat steps 1–7 under `DataAddons/Classic/` and register in `DataAddons/Classic/Files.xml`. Add `[AllowLoadGameType wrath, cata, mists]` (or the new Classic type) to the `.toc` include for the Classic data file if needed.

---

## 11. Test In-Game

1. Reload the addon (`/reload`).
2. Open the Achievements window and verify the new expansion appears in the Expansions tab.
3. Navigate through the new expansion's categories and confirm achievements display correctly.
4. Verify patch badges appear in tooltips for the new `BuildVersionData` entry.
