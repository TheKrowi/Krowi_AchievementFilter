# add-category-data — Reference

## DB Queries

Run the designated scripts with parameters, never an inline query (a hook blocks one). Each resolves the build from the server; `-Client Classic` picks the Classic build.

### Batch achievement lookup
```powershell
& ".claude\skills\add-category-data\_lookup_ids.ps1" -Ids 61864,61865,61866
```
One line per id: `id|Title_lang|Reward_lang|Faction|Category|Description_lang|flags=0x...`, or `id|NOTFOUND`. Faction is -1 for both, 0 Horde, 1 Alliance; Category is the WoW achievement category id; flag `0x100000` means hidden.

### Achievement category names
```powershell
& ".claude\skills\add-category-data\_lookup_category_names.ps1" -Ids 15270,15259
```
One line per category: `id|Name|parent=<id>`.

### uiMapId lookup (zones)
```powershell
& ".claude\skills\add-category-data\_lookup_name.ps1" -Table uimap -Name "Voidstorm"
```
Prints the matching rows. Pick the record that is the playable zone, not a taxi/flight-path map: when two records share the name, column 5 tells the real zone from the taxi overlay.

### journalInstanceId lookup (dungeons / raids)
```powershell
& ".claude\skills\add-category-data\_lookup_name.ps1" -Table journalinstance -Name "Magisters Terrace"
```
Column 0 is the ID (the journalInstanceId for `:Dungeon` / `:Raid` and `GetInstanceInfoName`), column 1 the name. `-Table areapoi` finds a delve's areaPoiId the same way.

---

## Section Rules

Determine which top-level block an achievement belongs to:

| Section | Builder | Signals |
|---------|---------|---------|
| **Zones** | `expansion:Zones{}` → `zones:Zone(uiMapId)` | Zone name in title, "Sojourner of", "Explore", "Tour of Duty", reputation, skyriding/breaknecking/skyrocketing races |
| **Delves** | `expansion:Delves{}` → `delves:Delve(areaPoiId)`, `delves:Seasonal{}` | "Stories", "Discoveries", delve map name in title, "Nemesis", "Let Me Solo", delve-wide progression |
| **Dungeons** | `expansion:Dungeons{}` → `dungeons:Dungeon(journalId)` | Dungeon name in title, "Heroic:", "Mythic:", "Keystone Hero:", glory/mythic sub-achievements |
| **Raids** | `expansion:Raids{}` → `raids:Raid(journalId)` | Raid name in title, "Ahead of the Curve", "Cutting Edge", raid glory, mythic boss kills |

New section types (e.g. Delves did not exist before TWW) — flag to user before adding. Each typed container can be called once per expansion (the builder asserts it). Real files call them in this order: `expansion:Character`, `:Zones`, `:Delves`, `:Dungeons`, `:Raids`, `:Professions`, `:PetBattles`, then the `expansion:Named(...)` blocks for expansion-wide features (Prey, Ritual Sites, ...).

---

## Subcategory Rules

Apply in order — stop at the first match:

### 1. Name patterns (authoritative)

| Pattern in Title_lang | Subcategory | V2 call |
|-----------------------|-------------|---------|
| `Sojourner of`, `Loremaster of`, zone story quest name | Quests | `zone:Quests{}` |
| `Explore`, `Adventurer of`, `Treasures of`, `Glyph Hunter`, `The Highest Peaks` | Exploration | `zone:Exploration{}` |
| `Tour of Duty:`, battleground/arena names, world PvP | PvP | `zone:PvP{}` |
| Faction name + `Diplomat`, `Champion`, reputation-grind series | Reputation | `zone:Reputation{}` |
| `Bronze`, `Silver`, `Gold`, `Advanced:`, `Reverse:`, `Challenge:` + race keyword | Races (zone-specific label: "Skyriding Races", "Skyrocketing Races", "Breaknecking Races", "Dragonriding Races", etc.) | `zone:Named(addon.L["Skyriding Races"], { ... }):Merge()` |
| `Mythic:` + boss name | Mythic sub-block inside raid | `raid:Mythic{}` |
| `Glory of the ... Raider` | The meta goes in the expansion's raid list; the achievements it requires go in the raid's Glory block | `expansion:Raids{}`; `raid:Glory{}` |
| `Heroic:`, `Mythic:` + instance name, `Keystone Hero:` | The dungeon's own list | `dungeons:Dungeon(journalId, { ... })` |

### 2. Description_lang (col 0)
The Description_lang field of the batch lookup. Description mentioning quest objectives, exploration tasks, PvP activities, reputation grind → map to that subcategory.

### 3. WoW achievement category (col 7)
The Category field of the batch lookup is the WoW achievement category id. `_lookup_category_names.ps1 -Ids <id>` gives its name (e.g. "Quests", "Exploration", "Player vs. Player"), which maps directly to the KAF subcategory.

### 4. Flag to user
If still unclear after steps 1–3, report the ID, name, and description to the user and wait for direction before inserting.

### A zone's own achievements
Zone-spanning meta achievements (zone completion, "do X things across this zone", the "`<Zone>` Uncoiled" style) that fit no named subcategory are the zone's own achievements. They go in the id list of the zone call itself, `zones:Zone(uiMapId, { ... })`, never in a separate block. A zone without its own achievements is written `zones:Zone(uiMapId)`; add the list when the first one arrives.

---

## Merge Rules

`:Merge()` sets `CanMerge = true` on the node it is called on (`Api/CategoryDataBuilder.lua`). When the player turns on the Merge Small Categories filter, a category with that flag and fewer achievements than the threshold (default 10) is folded into its parent, which then shows its achievements (`category:GetAchievementNumbers` in `Objects/Category.lua`). A category without the flag is never folded.

These merge implicitly; do not write `:Merge()` on them:
- the four zone helpers `zone:Quests{}`, `:Exploration{}`, `:PvP{}`, `:Reputation{}`
- the 13 profession helpers, `professions:Alchemy{}` to `professions:Tailoring{}`

Nothing else merges unless `:Merge()` is written. `:Named` never merges, on any builder, also under a zone. Write `:Merge()` on:
- a named zone subcategory: races, Dragon Glyphs, Primal Storms and the like (`isleOfDorn:Named(addon.L["Skyriding Races"], { ... }):Merge()`)
- a named node that stands in for a zone helper under a node that is not a zone, such as `dragonIsles:Named(CT.Quests, { ... }):Merge()` in Dragonflight
- a profession without a helper: `professions:Named(CT.Archaeology, { ... }):Merge()`
- other small leaves where the file already does so, e.g. a raid's `:Named(CT.Reputation, { ... }):Merge()` (The War Within) and the season blocks in the MythicPlus helpers

In an expansion file, never merge the expansion root, the typed containers, a `Zone`, `Dungeon`, `Raid` or `Delve`, or the `:Glory{}` and `:Mythic{}` blocks; none in the tree is merged today.

---

## Insertion Rules

| Content type | Where to insert |
|---|---|
| New achievements in an existing subcategory | Append to that call's list, e.g. `eversong:Exploration{ ... }` |
| A new zone-wide achievement | Append to the zone call's own list, `zones:Zone(2395, { ... })`; turn `zones:Zone(2022)` into `zones:Zone(2022, { ... })` if it has none yet |
| A new expansion-wide achievement | The matching list: `KrowiAF.NewExpansion(CT.Midnight, { ... })`, `expansion:Zones{ }`, `:Delves{ }`, `:Dungeons{ }` or `:Raids{ }` |
| New zone | A new `zones:Zone(uiMapId, ...)` chain after the last zone chain of the Zones section, before `expansion:Delves`; patch-chronological (see RUBRIC.md) |
| New dungeon | A new `dungeons:Dungeon(journalId, { ... })` after the last `dungeons:Dungeon` call |
| New raid | A new `raids:Raid(journalId, { ... })` chain after the last raid and its `:Glory`/`:Mythic` calls |
| New delve | A new `delves:Delve(areaPoiId, { ... })` after the last `delves:Delve` call; seasonal tiers go in `delves:Seasonal{ }` |
| New section (e.g. Delves for first time) | The typed container, in the order under Section Rules — flag to user first |
| New expansion-wide feature | `expansion:Named(label, { ... })` after the last `expansion:Named` block — flag to user first |

Assign a chain to a local only when sub-calls follow it (`local eversong = zones:Zone(2395, { ... })`, then `eversong:Quests{ ... }`). The local is the camelCased place name: `quelThalas`, `theRingingDeeps`, `venomousAbyss`.

---

## Standard Order Within a Zone

The parser adds a node's own ids before its children (`ParseCategoryV2` in `Api/CategoryDataApi.lua`), and the files are written in that order. Omit any call that has no achievements:

1. The zone call with its own achievements, `zones:Zone(uiMapId, { ... })`
2. `:Quests{}`
3. `:Exploration{}`
4. `:PvP{}`
5. `:Reputation{}`
6. Named zone subcategories, each `:Named(label, { ... }):Merge()`: races (label varies by expansion: "Skyriding Races", "Dragonriding Races", etc.) and expansion-specific ones ("Dragon Glyphs", "Primal Storms"), in the order the expansion's other zones use. Dragonflight writes Dragon Glyphs, Dragonriding Races, Primal Storms.

---

## Raid Order Within a Raid Instance

1. `raids:Raid(journalId, { ... })` with the raid's own achievements: boss-group/meta achievements, then the Normal → Heroic → Mythic clears, then AotC and CE, then any other non-glory achievement
2. `raid:Glory{ ... }`, in boss encounter order
3. `raid:Mythic{ ... }`, in boss encounter order
4. Any other raid subcategory, e.g. `liberationOfUndermine:Named(CT.Reputation, { ... }):Merge()` (The War Within)

The "Glory of the ... Raider" meta itself goes in `expansion:Raids{ ... }`, not in the raid.

---

## MythicPlus Helper Pattern

Seasonal M+ lists live in `DataAddons/Shared/CategoryData.lua` as `shared.GetXxxMythicPlus(categoryName)`. Each helper returns a detached `KrowiAF.NewCategory(categoryName)` with one `category:Named(addon.L["Season"] .. " " .. n, { ... })` per season, because the same subtree is used twice: under the expansion's Dungeons and under the Mythic+ category of the Specials tab. A new season is a new `category:Named` block after the last one in the helper; season list order is in RUBRIC.md.

A new expansion gets a new helper modelled on `shared.GetMidnightMythicPlus`, wired in both places:

```lua
-- DataAddons/Retail/12_Midnight/CategoryData.lua, right after expansion:Dungeons{ ... }
dungeons:MythicPlus(shared.GetMidnightMythicPlus)

-- DataAddons/Retail/CategoryData_Specials.lua
mythic:Insert(shared.GetMidnightMythicPlus(CT.Midnight))
```

`dungeons:MythicPlus(fn)` calls `fn(addon.L["Mythic+"])` and adds the result as a child of Dungeons. The Midnight helper, lists shortened:

```lua
shared.GetMidnightMythicPlus = function(categoryName)
    local category = KrowiAF.NewCategory(categoryName)
    local season1 = category:Named(addon.L["Season"] .. " " .. 1, {
        61267, -- Keystone Hero: Magisters' Terrace
        -- ...
        63104, -- Umbral Champion: Midnight Season 1
    })
    season1:Named(addon.L["KeystoneResilience"], {
        61233, -- Midnight Season 1: Resilient Keystone 12
        -- ...
        61253, -- Midnight Season 1: Resilient Keystone 30
    }):Merge()
    -- Season 2 follows the same shape
    return category
end
```

---

## Code Style

Every `CategoryData*.lua` in `DataAddons/` uses the V2 fluent builder in `Api/CategoryDataBuilder.lua`. Never write V1: no positional tables, no `tinsert(KrowiAF.CategoryData.Expansions, { ... })`. The V1 parser in `Api/CategoryDataApi.lua` stays only as the plugin entry point.

### Builder calls

| Call | Makes |
|---|---|
| `KrowiAF.NewExpansion(CT.Midnight, { ... })` | The expansion root, with its own achievements |
| `expansion:Character{}`, `:Zones{}`, `:Delves{}`, `:Dungeons{}`, `:Raids{}`, `:Professions{}`, `:PetBattles{}` | Typed containers, once each per expansion; `expansion:Zones()` when it has no achievements of its own |
| `zones:Zone(uiMapId, { ... })` | A zone, named by the map; takes `:Quests{}`, `:Exploration{}`, `:PvP{}`, `:Reputation{}`, and `:Zone(...)` for a nested zone |
| `zones:ZoneNamed(uiMapId, { ... })` | A plain category named after a map, without the zone helpers (Slayer's Rise, Vaults of Atal'Utek) |
| `delves:Delve(areaPoiId, { ... })`, `delves:Seasonal{}` | A delve; the seasonal tier list |
| `dungeons:Dungeon(journalId, { ... })`, `dungeons:MythicPlus(fn)` | A dungeon; the Mythic+ subtree (see MythicPlus Helper Pattern) |
| `raids:Raid(journalId, { ... })` | A raid; takes `:Glory{}` and `:Mythic{}` |
| `professions:Alchemy{}` ... `professions:Tailoring{}` | The 13 profession helpers |
| `node:Named(label, { ... })` | Any other category; never merges |
| `node:InstanceNamed(journalId, { ... })` | A plain category named after an instance |
| `:Merge()`, `:WithId(n)`, `:Key("Name")` | Merge flag (see Merge Rules); a declared id that plugins inject into and that never changes; a stable string handle for `KrowiAF.NewInjection` |
| `node:Ids{ ... }`, `node:Insert(child)` | Append ids to an existing node; attach a detached `KrowiAF.NewCategory` |

Use the table-call form when the list is the only argument (`zone:Quests{ ... }`) and parentheses otherwise (`zones:Zone(2395, { ... })`). A new category normally needs neither `:WithId` nor `:Key`; never change an existing `:WithId` number, and give `:Key` to a node that another file must attach to.

### Names

The builder names zones, instances and delves itself: `:Zone`/`:ZoneNamed` call `addon.GetMapName(uiMapId)`, `:Raid`/`:Dungeon`/`:InstanceNamed` call `addon.GetInstanceInfoName(journalInstanceId)`, `:Delve` calls `addon.GetAreaPoiNameName(areaPoiId)`. A `:Named` label is a `CT.<Key>` value, an `addon.L["..."]` string, or one of the same lookups: the three above, `addon.GetLFGDungeonInfo(dungeonId)` and `addon.GetCovenantName(covenantId)` (all in `Localization/Shared.lua`), or `addon.GetAchievmentName(achievementId)` (spelled that way, in `Globals.lua`). The full `CT` table is `shared.CT` at the top of `DataAddons/Shared/CategoryData.lua`; check it for an existing key before adding a label. A new `addon.L` label is a new string in every locale file.

### Examples from the data

A zone with its own achievement, the four helpers and a merged named subcategory (`DataAddons/Retail/11_TheWarWithin/CategoryData.lua`):

```lua
local isleOfDorn = zones:Zone(2248, {
    41186, -- Slate of the Union
})
isleOfDorn:Quests{
    20118, -- The Isle of Dorn
    20595, -- Sojourner of Isle of Dorn
}
isleOfDorn:Exploration{
    40831, -- Explore the Isle of Dorn
    40435, -- Adventurer of the Isle of Dorn
    40434, -- Treasures of the Isle of Dorn
    40166, -- Isle of Dorn Glyph Hunter
    40606, -- Flat Earthen
}
isleOfDorn:PvP{
    40083, -- Tour of Duty: Isle of Dorn
}
isleOfDorn:Reputation{
    41161, -- Council of Dornogal
    41162, -- Cornerstone of Dornogal
}
isleOfDorn:Named(addon.L["Skyriding Races"], {
    40316, -- Isle of Dorn: Bronze
    40317, -- Isle of Dorn: Silver
    40318, -- Isle of Dorn: Gold
    40319, -- Isle of Dorn Advanced: Bronze
    40320, -- Isle of Dorn Advanced: Silver
    40321, -- Isle of Dorn Advanced: Gold
    40322, -- Isle of Dorn Reverse: Bronze
    40323, -- Isle of Dorn Reverse: Silver
    40324, -- Isle of Dorn Reverse: Gold
}):Merge()
```

Delves, the second one a nemesis delve with `40732 Heavy-Handed` first (`DataAddons/Retail/12_Midnight/CategoryData.lua`):

```lua
delves:Delve(8443, { -- Atal'Aman
    61729, -- Atal'Aman Stories
    61863, -- Atal'Aman Discoveries
})
delves:Delve(8445, { -- Torment's Rise
    40732, -- Heavy-Handed
    61797, -- My Shady Nemesis
    61798, -- Lighting the Dark
    61799, -- Let Me Solo Him: Nullaeus
    61808, -- Fabled Let Me Solo Him: Nullaeus
})
```

The Dungeons container, its Mythic+ subtree and a dungeon (same file):

```lua
local dungeons = expansion:Dungeons{
    61567, -- Midnight Dungeon Hero
    61568, -- Glory of the Midnight Hero
    62195, -- Midnight Dungeon Tank
    62194, -- Midnight Dungeon Healer
    62193, -- Midnight Dungeon Damage Dealer
    62196, -- Midnight Dungeoneer
    62388, -- Illicit Rain: Five Stars
}
dungeons:MythicPlus(shared.GetMidnightMythicPlus)
dungeons:Dungeon(1311, { -- Den of Nalorakk
    61638, -- Den of Nalorakk
    61642, -- Heroic: Den of Nalorakk
    61643, -- Mythic: Den of Nalorakk
    62439, -- Keystone Hero: Den of Nalorakk
    63622, -- Keystone Victor: Den of Nalorakk
})
```

A raid: its own list first, then Glory, then Mythic (same file):

```lua
local march = raids:Raid(1308, { -- March on Quel'Danas
    61367, -- March on Quel'Danas
    61369, -- Heroic: March on Quel'Danas
    61371, -- Mythic: March on Quel'Danas
    61626, -- Ahead of the Curve: Midnight Falls
    61627, -- Cutting Edge: Midnight Falls
})
march:Glory{
    61381, -- Eggsistential Crisis
    62406, -- All the Things She Said
}
march:Mythic{
    61378, -- Mythic: Belo'ren, Child of Al'ar
    61379, -- Mythic: Midnight Falls
}
```

An expansion-wide feature (same file):

```lua
expansion:Named(addon.L["Curse Surges"], { -- Curse Surges
    63390, -- Turn the Surge
    63381, -- Cursebreaker
})
```

### Rules

- No semicolons; 4-space indent
- One id per line, each followed by a comma and an inline `-- Name` comment (use `Title_lang` from the DB as the authoritative name)
- The Midnight file adds the category's name as a comment to the opening line of `Raid`, `Dungeon`, `Delve`, `ZoneNamed` and expansion-level `Named` calls (`dungeons:Dungeon(1311, { -- Den of Nalorakk`); older files mostly do not. Follow the target file