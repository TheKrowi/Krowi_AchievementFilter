# add-category-data Skill — REFERENCE.md

> Source: e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\add-category-data\REFERENCE.md
> Collected: 2026-06-19
> Published: Unknown

## DB Queries

### Batch achievement lookup
```powershell
$ids   = @(61864, 61865, 61866)   # IDs from patch block
$build = "12.0.7.67808"           # retail build
$pat   = "^(" + ($ids -join "|") + ")$"
$body  = "draw=1&start=0&length=$($ids.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$resp  = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" `
             -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows  = ($resp.Content | ConvertFrom-Json).data
$byId  = @{}
$rows | ForEach-Object { $byId[$_[3]] = $_ }
# Access: $byId["61864"][0]  → Description_lang
#         $byId["61864"][1]  → Title_lang
#         $byId["61864"][2]  → Reward_lang
#         $byId["61864"][5]  → Faction (-1=both, 0=Horde, 1=Alliance)
#         $byId["61864"][7]  → Category (WoW achievement category ID)
```

### uiMapId lookup (zones)
```powershell
$name  = "Voidstorm"
$body  = "draw=1&start=0&length=20&search[value]=$name"
$resp  = Invoke-WebRequest "http://localhost:5000/dbc/data/uimap/?build=$build" `
             -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
($resp.Content | ConvertFrom-Json).data | Format-Table
# Pick the record that is the playable zone — not a taxi/flight-path map.
# When two records exist for the same name, check column 5 to distinguish the real zone from the taxi overlay.
```

### journalInstanceId lookup (dungeons / raids)
```powershell
$name  = "Magisters Terrace"
$body  = "draw=1&start=0&length=10&search[value]=$name"
$resp  = Invoke-WebRequest "http://localhost:5000/dbc/data/journalinstance/?build=$build" `
             -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
($resp.Content | ConvertFrom-Json).data | Format-Table
# Column 0 = ID (journalInstanceId to use in GetInstanceInfoName)
# Column 1 = Name_lang
```

---

## Section Rules

Determine which top-level block an achievement belongs to:

| Section | Signals |
|---------|---------|
| **Zones** | Zone name in title, "Sojourner of", "Explore", "Tour of Duty", reputation, skyriding/breaknecking/skyrocketing races |
| **Delves** | "Stories", "Discoveries", delve map name in title, "Nemesis", "Let Me Solo", delve-wide progression |
| **Dungeons** | Dungeon name in title, "Heroic:", "Mythic:", "Keystone Hero:", glory/mythic sub-achievements |
| **Raids** | Raid name in title, "Ahead of the Curve", "Cutting Edge", raid glory, mythic boss kills |

New section types (e.g. Delves did not exist before TWW) — flag to user before adding, confirm placement relative to existing sections. Convention: solo/open-world content before Dungeons, Dungeons before Raids.

---

## Subcategory Rules

Apply in order — stop at the first match:

### 1. Name patterns (authoritative)

| Pattern in Title_lang | Subcategory |
|-----------------------|-------------|
| `Sojourner of`, `Loremaster of`, zone story quest name | Quests |
| `Explore`, `Adventurer of`, `Treasures of`, `Glyph Hunter`, `The Highest Peaks` | Exploration |
| `Tour of Duty:`, battleground/arena names, world PvP | PvP |
| Faction name + `Diplomat`, `Champion`, reputation-grind series | Reputation |
| `Bronze`, `Silver`, `Gold`, `Advanced:`, `Reverse:`, `Challenge:` + race keyword | Races (zone-specific label: "Skyriding Races", "Skyrocketing Races", "Breaknecking Races", "Dragonriding Races", etc.) |
| `Mythic:` + boss name | Mythic sub-block inside raid |
| `Glory of` | Glory sub-block inside raid |
| `Heroic:`, `Mythic:` + instance name, `Keystone Hero:` | Dungeon root block |

### 2. Description_lang (col 0)
Available directly from the batch query (`$byId[id][0]`). Description mentioning quest objectives, exploration tasks, PvP activities, reputation grind → map to that subcategory.

### 3. WoW achievement category (col 7)
Available directly from the batch query (`$byId[id][7]`). This is the WoW achievement category ID — cross-reference against `http://localhost:5000/dbc/?dbc=achievement_category&build=BUILD&locale=enUS` to get the category name (e.g. "Quests", "Exploration", "Player vs. Player"). Maps directly to the KAF subcategory.

### 4. Flag to user
If still unclear after steps 1–3, report the ID, name, and description to the user and wait for direction before inserting.

### Bare / catch-all block
Achievements that are zone-spanning meta-achievements (e.g. zone-completion, "do X things across this zone") and do not fit any named subcategory go into a flat `{ id, id, ... }` table **after** all named subcategory blocks within their zone. Each zone has at most one bare block.

---

## canMerge Rules

`true` on **every** named subcategory leaf (Quests, Exploration, PvP, Reputation, Races).
`false` / omit on zone nodes, instance nodes, expansion root, Dungeons, Raids, Delves, Glory, Mythic sub-blocks.

---

## Insertion Rules

| Content type | Where to insert |
|---|---|
| New achievements in existing zone subcategory | Append inside that subcategory's `{ }` list |
| New achievements in existing zone bare block | Append inside the existing bare `{ }` block |
| New zone | Append after the last zone in the `Zones` block (before closing `},`) |
| New dungeon | Append before the expansion-wide flat dungeon list at the end of the `Dungeons` block |
| New raid | Append before the expansion-wide flat raid list at the end of the `Raids` block |
| New delve | Append before the expansion-wide flat delve list at the end of the `Delves` block |
| New section (e.g. Delves for first time) | After Zones, before Dungeons — flag to user first |

---

## Standard Subcategory Order Within a Zone

Follow this order (omit any that have no achievements):

1. Quests
2. Exploration
3. Player vs. Player
4. Reputation
5. Races (label varies by expansion: "Skyriding Races", "Dragonriding Races", etc.)
6. Any expansion-specific subcategories (e.g. "Dragon Glyphs", "Primal Storms", "Abundance: ...")
7. Bare/catch-all `{ }` block

---

## Raid Sub-block Order Within a Raid Instance

1. Glory sub-block (`addon.L["Glory"]`)
2. Mythic sub-block (`addon.L["Mythic"]`)
3. Flat block: normal/heroic/mythic clears, AotC, CE, seasonal meta

---

## MythicPlus Helper Pattern

Seasonal M+ achievement lists live in `DataAddons/Shared/CategoryData.lua` as `shared.GetXxxMythicPlus`. New expansion → add a new helper there following the same pattern. The helper is then called in the expansion's `CategoryData.lua` inside the Dungeons block:

```lua
{ -- Dungeons
    CT.Dungeons,
    shared.GetMidnightMythicPlus(addon.L["Mythic+"]),
    { -- First Dungeon
        addon.GetInstanceInfoName(1234),
        { ... },
    },
    ...
}
```

---

## Code Style

```lua
{ -- Zone Name
    addon.GetMapName(2405),           -- uiMapId from uimap lookup
    { -- Quests
        CT.Quests,
        true,
        {
            61864, -- Sojourner of Voidstorm
        },
    },
    { -- Exploration
        CT.Exploration,
        true,
        {
            61865, -- Explore Voidstorm
        },
    },
    { -- Player vs. Player
        CT.PvP,
        true,
        {
            61866, -- Tour of Duty: Voidstorm
        },
    },
    {
        61999, -- Zone Meta Achievement
    },
},

{ -- Dungeon Name
    addon.GetInstanceInfoName(1350),  -- journalInstanceId
    {
        62100, -- Dungeon Name
        62101, -- Heroic: Dungeon Name
        62102, -- Mythic: Dungeon Name
        62103, -- Keystone Hero: Dungeon Name
    },
},

{ -- Raid Name
    addon.GetInstanceInfoName(1360),
    { -- Glory
        addon.L["Glory"],
        { 62200, -- Glory achievement },
    },
    { -- Mythic
        addon.L["Mythic"],
        {
            62210, -- Mythic: Boss One
            62211, -- Mythic: Boss Two
        },
    },
    {
        62220, -- Raid Name (Normal)
        62221, -- Heroic: Raid Name
        62222, -- Mythic: Raid Name
        62223, -- Ahead of the Curve: Final Boss
        62224, -- Cutting Edge: Final Boss
    },
},
```

- No semicolons
- Inline `-- Comment` after every achievement ID (use `Title_lang` from DB as the authoritative name)
- Comma after closing `},` of every block except the last in its parent
