---
name: add-zone-data
description: Add achievement IDs to the correct ZoneData.lua entries in Krowi's Achievement Filter. Covers all entry types (zone, dungeon, raid, delve, battleground), map ID lookup via raw/MapVerifier.csv and wow.tools.local, criteria-tree fact-finding, and self-validation via Evaluate-ZoneData.ps1 and Evaluate-ZoneDataDecisions.ps1. Use when adding achievements to existing zone entries, creating new zone entries, or after add-achievement-data produces new IDs that need zone coverage.
---

# Add Zone Data

## How zone data works at runtime (read this first)

`zoneData:Zone(mapIds, ids)` fills `addon.Data.Maps[mapId].Achievements` for **each map id listed, and nothing else**. `addon.GetAchievementsInZone(mapID)` (Globals.lua) is a flat lookup: no parent walk, no link-group expansion, no continent inheritance. Consequences:

- An achievement shows on the world map for a sub-map (dungeon floor, city district, BG variant) only if that sub-map id is in the entry's map list. That is why entries list whole link groups, e.g. `zoneData:Zone({97, 98, 99, 106}, { ... })`.
- Putting an achievement on a continent map does not make it appear on the continent's zones, and vice versa.
- Raid entries use `zoneData:Zone(map, nil, {10-player ids}, {25-player ids})`; the third and fourth tables are shown by difficulty.
- `shared.*` tables (`DataAddons/Shared/ZoneData.lua`) and file-local tables (`delves`, `classHalls`, `argus`, ...) are spliced in by reference.

## Orchestration Workflow

Given a list of achievement IDs, the parent agent does everything itself; there are no subagents in this skill (`Explore` subagents cannot reach `localhost:5000`).

0. **Pre-flight.** Start the DB server and let the scripts resolve the builds:
   ```powershell
   & ".claude\skills\add-zone-data\_start_server.ps1"
   ```
   The script starts wow.tools.local if needed and waits up to 60 s (the first start can take longer; rerun once). If it is still unreachable, **stop**; every lookup would return NOT_FOUND. Build strings are never typed by hand: every script dot-sources `_builds.ps1`, which picks the newest `wow` (Retail) and `wow_classic` (Classic) build from `/casc/builds` (falling back to `?remote=true`). To prepare a patch that is still on the PTR, set `$env:KAF_RETAIL_PRODUCT = "wowxptr"` (or `"wowt"`) in the shell first: Retail then resolves to the newest build of that product, so the new ids and their criteria are found. New maps of such a patch are not in `raw/MapVerifier.csv` until they are verdicted in game (`sync-mapverifier`); their entries wait for that.
1. **Look up every id** with `_lookup_ids.ps1` (both builds; `builds=` in the output says where the id exists). Then apply the Skip rules and, for the rest, `_check_zonedata.ps1` (already placed?), `_zone_search.ps1` / `_linkgroups_search.ps1` (which map, which link group), and `_lookup_criteria.ps1` (the game's own list of zones, NPCs or bosses behind the achievement; this is the fact Rules 2, 3 and 9 demand).
2. **Edit the ZoneData.lua files** (one per expansion, see below) following the Entry Type Rules.
3. **Validate** (Step 3).
4. **Update the decisions log** (Step 4).

**File location rule:** one `ZoneData.lua` per expansion, never split by patch.
```
DataAddons/Retail/XX_ExpansionName/ZoneData.lua
DataAddons/Shared/XX_ExpansionName/ZoneData.lua   ← Retail+Classic shared
DataAddons/Shared/ZoneData.lua                     ← cross-expansion (shared.* tables, Azeroth continent)
```

**Default invocation (no arguments):** process the next 25 ids of the sequential sweep. Read **Highest ID Analyzed** in `raw/ZoneDataDecisions.md`, start at that value + 1, process 25 ids inclusive, then set Highest ID Analyzed to the largest id processed. Highest ID Analyzed describes the sequential sweep only; patch batches (ids handed over from `add-achievement-data`) do not move it.

---

## Data Lookups via Script (VS Code 1.104+)

**Rule: no terminal command may contain specific values (ids, map ids, patterns, search terms) inline.** VS Code shows a network-warning popup for commands containing `Invoke-RestMethod` / `Invoke-WebRequest` / `curl` / `wget`, and the user rejects inline commands that embed values. All lookups go through the designated scripts; never create temp scripts.

| Script | Placeholder | Purpose | Output |
|---|---|---|---|
| `_lookup_ids.ps1` | `$ids = @()` | DB lookup on both builds (exact id match) | `id\|Title\|Description\|builds=retail,classic` or `id\|NOT_FOUND\|\|builds=` |
| `_lookup_criteria.ps1` | `$ids = @()` | Criteria tree: the zone/NPC/boss names the game uses per criterion | header line per id, indented criteria |
| `_check_zonedata.ps1` | `$ids = @()` | Is the id already in a `Zone()` entry, on which primaries, in which files (parses the Lua) | `id\|PRESENT\|primaries=...\|maps=...\|files=...` or `id\|NOT_PRESENT` |
| `_zone_search.ps1` | `$terms = @()` | Search `raw/MapVerifier.csv` by map name (partial, case-insensitive regex) | `term\|id\|name\|verdict\|expansion\|link` |
| `_linkgroups_search.ps1` | `$ids = @()` | Link group (primary map id) for any map id | `id\|primary=N\|primaryName=...\|ids=...` |
| `_find_zonefile.ps1` | `$ids = @()` | Text search for a MAP id in ZoneData files (also hits achievement ids and comments) | `file\|line N: ...` |

Support files (not run directly): `_builds.ps1` (build resolution), `_zonedata_parser.ps1` (shared Zone() parser used by `_check_zonedata.ps1` and both evaluators).

**Usage pattern for every script:**

- **Step A** — set values via `replace_string_in_file`: `$ids = @()` → `$ids = @({{VALUES}})` (or `$terms`).
- **Step B** — run: `& "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.claude\skills\add-zone-data\_SCRIPTNAME_.ps1"`
- **Step C** — reset immediately: `$ids = @({{VALUES}})` → `$ids = @()`.

`_check_scripts_reset.ps1` verifies the reset; `Check-Repo.ps1` also flags a dirty placeholder.

**Map data comes from one file, `raw/MapVerifier.csv`** (verdict, expansion, link group per map id; see the `sync-mapverifier` skill). Whether an achievement is placed is answered by `_check_zonedata.ps1`, which parses the ZoneData files; there is no derived achievement-to-zone export any more.

---

## Skip rules

An id goes to one of three places in the log:

- **Not Found list**: `_lookup_ids.ps1` says `NOT_FOUND` on **both** builds. An id that exists only on Classic is a real id (Shared files serve Classic) and is logged in the Main Log or the Statistics table like any other.
- **Statistics table**: the DB says it is a statistic — achievement `Flags` bit 1 set, or category root "Statistics" (id 1). These never appear in the addon. Titles like "Total deaths", "Largest hit dealt", "Flags captured" are typical, but the DB fact decides, not the title (`Evaluate-ZoneDataDecisions.ps1` checks it).
- **Main Log, `⏭ skipped`, with a reason**: everything else that has no geographic association:
  - "Level N" and other character-progression milestones
  - proficiency/skill ranks (Journeyman/Expert/Artisan/Grand Master + profession or skill)
  - pet, mount, toy, tabard collection counts
  - cumulative achievements that look like counters but are achievements (quest counts, honorable kills, arena-rating series "Just the Two of Us", "Three's Company", "High Five")
  - PvP arena performance and gladiator/elite season titles
  - Feats of Strength for real-world events (BlizzCon, WWI) and legendary-item FoS whose source instance no longer exists (Atiesh)
  - Realm First! feats (decided 2026-09-05; a rule of its own, not the real-world-event rule, and one the user may want to revisit). Their children stay placed; the feat itself is not
  - hidden tracking achievements the addon does not register (Allied Races unlock requirements, `<Hidden>` unlock flags, raid-portal trackers, "(copy)" and "char specific hidden copy" duplicates): a `Zone()` line for an unregistered id is a data-load error
  - event achievements without a fixed place; Housing neighbourhood achievements (no ZoneData precedent yet)

---

## Zone Placement Rules (confirmed with user 2026-09-04/05 — do not infer new rules from existing file conventions)

These rules were confirmed with the user, not inferred from existing ZoneData.lua content. "It's already there" is never sufficient justification; existing data can itself be an inconsistent legacy convention (the reconciliation sweep in `raw/ZoneDataDecisions.md` section 4 lists the known violations). If a case challenges a rule or falls outside them, STOP and ask the user rather than extrapolating.

**Decision order for one id.** Work top-down; each step narrows the next.
1. Existence and statistics → Skip rules above.
2. Facts → `_lookup_criteria.ps1`. Classify the id as a **leaf** (criteria name zones, areas, NPCs, bosses, quests or instances) or a **meta** (criteria are other achievements).
3. Facts → maps: Rules 1 to 6 below.
4. Maps → verdict filter: Entry Type Rules.
5. Maps → whole link group, then the file: Rules 7 and 8.
6. Log: Step 4.

1. **No continent entries** (decided 2026-09-04, confirmed 2026-09-05 including removal of the existing blocks). An achievement links to zones and their sub-zones, never to a Continent-type map (`12` Kalimdor, `13` Eastern Kingdoms, `101` Outland, `113` Northrend, `424` Pandaria, `572` Draenor, `619` Broken Isles, `875` Zandalar, `876` Kul Tiras, `1550` The Shadowlands, `2274` Khaz Algar, `2537` Quel'Thalas, `947` Azeroth; the `verdict` column in `raw/MapVerifier.csv` decides, not the file header). A player is never "in" a continent (`C_Map.GetBestMapForUnit` returns the zone or sub-zone), so continent entries only ever duplicated zone data. Known cost, accepted: the World Map button is disabled on continent maps; making it aggregate child zones is a runtime change, not data.
   **Sub-zone** = a map whose `link` column in `raw/MapVerifier.csv` points at the zone (floors, districts, micro-maps that share the zone's content); the primary plus its linked maps form the link group (`_linkgroups_search.ps1`). List the whole group as the map argument, in one entry; never give a sub-zone its own entry next to the group's. A map with its own exploration or quest achievements is a sibling zone, not a sub-zone: fix the link in the in-game Map Verifier and export (`sync-mapverifier` skill) instead of special-casing the data. Decided 2026-09-05 and applied: Bloodmyst Isle 106 is its own zone (unlink it from 97 in the MapVerifier on the next export), Dalaran `{125, 126}` is one entry with the combined list, The Proscenium is part of Isle of Dorn `{2248, 2328}`, and every delve, class hall and city entry lists its whole group (`{715, 747}`, `{1164, 1165, 1166, 1167}`, `{2259, 2314}`, `{2300, 2301}`, `{2313, 2347}`). `raw/Evaluate-ZoneData.ps1` Check 5 flags partial groups, entries spanning two groups, and Continent maps.
2. **Leaf placement follows the criteria, one map per named place, across every expansion.** Every zone a criterion names gets the id (6558 Local Pet Mauler names 67 zones from Durotar to Vale of Eternal Blossoms, so it belongs on all 67, Cataclysm and Pandaria ones included). A criterion naming an **area** inside a zone (Goldshire, a bonfire, a shrine) resolves to the zone map that contains it; an **NPC, rare or boss** resolves to every zone where it spawns (Warcraft Wiki), or to the instance when it is an instance boss; a **quest** resolves to the zone where it is completed (Rule 5). An achievement whose progress can be made **anywhere on a continent** with no zone named ("200 different world quests in the Broken Isles") goes on **every zone of that continent**. A leaf with **no place at all** (win 10 pet battles anywhere, a Mythic+ rating threshold, a level, a collection count) is `⏭ skipped`; the world is not a zone.
3. **A meta is placed on every map one of its children is placed on, instances included** (literal form confirmed 2026-09-05 after the tranche 2 review). Follow criteria-of-criteria down to the leaves (7520 The Loremaster, 6590 World Safari, 46 Universal Explorer land on every zone their leaves cover). There is no boundary between open world and instances: The Flame Warden sits in the Slave Pens because Ice the Frost Lord does, Brewmaster in Blackrock Depths, Back from the Beyond on its raids and dungeons as well as its zones. When the union spans expansions, put it in a `shared.*` table in `DataAddons/Shared/ZoneData.lua` and splice that table into every zone entry it applies to (`shared.OldWorldPetAchievements` is this pattern). Two exclusions, both listed in `raw/Evaluate-ZoneCriteria.ps1`: a meta does not inherit from a child that sits somewhere by convention rather than by criteria (the four season-independent Legion keystone achievements on the Shadowlands dungeons, decision D11), and hidden tracking achievements the addon does not register are never placed (Allied Races unlock requirements, `<Hidden>` flags, "(copy)" duplicates; a `Zone()` line for an unregistered id is a data-load error).
4. **Reputation** → every open-world zone that grants the reputation, per the faction's Warcraft Wiki reputation-sources table (quests, dailies, world quests, reputation mobs); the quartermaster's zone always included; an instance only when the reputation is instance-only or the criterion names it. Shattered Sun Offensive is Isle of Quel'Danas, not Eastern Kingdoms and not Magisters' Terrace.
5. **Quest chains and storylines** → every zone where a quest of the chain is completed, per the `questpoiblob` export (quest id → UiMapID) or Warcraft Wiki. Turn-in-only hops in a city count, because the player stands there when the achievement completes; a capital that only hosts the intro breadcrumb pickup does not (D10: Stormwind, Orgrimmar and Dornogal for the Midnight chains). Zone-quest achievements ("Silverpine Forest Quests") resolve to that one zone.
6. **Cities** (verdict City) hold only content progressed inside the city: fishing, city reputation, holiday hubs, city quest chains, cooking dailies, pet trainers. Never duplicated on the geographically surrounding zone (Orgrimmar is not repeated on Durotar, Dornogal not on Isle of Dorn): `C_Map.GetBestMapForUnit` returns the city map inside the walls.
7. **Zone revamps** (old zone replaced by a new, unlinked map id in a later expansion) default to **no backfill**: pre-existing achievements stay on their original map id; the new map id is used only for achievements introduced by the revamping patch. Cataclysm's Old World split (Northern/Southern Barrens etc.) is a known, handled special case. If a revamp is not a clean 1:1 replacement, ask.
8. **The zone's expansion chooses the file**, never the achievement's patch or client. One `Zone()` block per link group in the whole tree, in the folder of the expansion that introduced that map (15579 Return to Lordaeron, a Dragonflight achievement, lives under Tirisfal Glades in `Shared/01_Vanilla/ZoneData.lua`). Retail-only ids in a Shared file are fine; the game skips them on Classic. A revamped map with a new id (Rule 7) belongs to the revamping expansion's folder. The runtime merges repeated map ids, so this is a readability convention, but the lint treats a second block as an error.
9. **"Ambiguous" test**: a zone assignment must be backed by a specific, checkable fact: a criterion naming the zone/area/NPC/boss/quest (`_lookup_criteria.ps1`), a Warcraft Wiki location for an NPC, quest or reputation source (Rules 2, 4, 5), or an instance. "The title sounds like it's set there" is not sufficient. Two or more equally strong candidates, or none, means ambiguous → ask.
10. **Backfill.** A one-time reconciliation sweep (decided 2026-09-05, tracked in `raw/ZoneDataDecisions.md` section 4) brings existing data under these rules in dedicated data commits. After it, the rules are binding for old and new data alike: an already-present achievement found missing from a zone it qualifies for under Rules 2 to 6 is fixed in the same change and logged as `✅ added` with the fact in Reason. Until the sweep has landed, such a finding is logged in the Reason cell and left for the sweep.
11. **Zone-name/file-path prose must be verified against the actual file**, never derived from a map id by memory or CSV. Use `_check_zonedata.ps1` (achievement → maps and files) and read the real `zoneData:Zone(N, { -- ZoneName` header before writing a zone name or file path into the log.
12. **Removals flow back into the log.** Any commit that removes an achievement id from a ZoneData file (for example the dangling-reference cleanup driven by the headless pipeline, or the continent-block removal) re-classifies the row in `raw/ZoneDataDecisions.md` in the same commit: `🗑 removed` when the id left the game, otherwise `⏭ skipped` with the reason, or an updated Zone ID cell when the id moved.

---

## Entry Type Rules

Determine the type from the map's `verdict` column in `raw/MapVerifier.csv` (a linked sub-zone takes its primary's verdict). The verdict filters what Rules 2 to 6 produced; it never adds a map.

- **Zone** → open-world content: Sojourner, Explore, Adventurer, Treasures, Tour of Duty, racing, reputation (Rule 4), quest chains (Rule 5), criteria-named zones and metas (Rules 2, 3), world PvP zones. No dungeon/raid/delve/scenario ids, even when the instance entrance is in the zone.
- **City** → Rule 6 content only.
- **Dungeon** → Normal/Heroic/Mythic clear, Keystone Hero/Victor for that dungeon, boss feats, and the dungeon metas of the expansion (Dungeonmaster, Dungeon Hero, Glory, Rule 3). Season-wide Mythic+ achievements (Keystone Explorer/Conqueror/Master/Hero of a season, season titles) go on every dungeon of that season's pool (D11, decided 2026-09-05: the instance analogue of "anywhere on continent X"; the pool comes from the game's season table, not from memory). Season-independent keystone achievements ("complete a level N keystone", any season) are "anywhere" leaves and are skipped. List the whole link group (all floors) as the map argument.
- **Raid** → N/H/M clear, AotC/CE, Glory, season title, Mythic boss kills, boss feats. AotC/CE belong to the raid whose final boss grants them. Glory shared across raids goes in each raid entry. WotLK-era 10/25 splits use `Zone(map, nil, {10}, {25})`.
- **Delve** → Stories + Discoveries ids for that delve + the seasonal table refs (S1 release: `delvesS1, delvesS2Progress, delvesS3Progress`; S2: `delvesS2, delvesS3Progress`; S3: `delvesS3`). Boss lairs (Zekvir/Nullaeus): boss feats + `delves` only.
- **Battleground** → all BG-specific achievements (Victory, Veteran, Perfection, All-Star, ...), plus `shared.GenericBattleground`.
- **Scenario** and **ClassHall** → instance-like: only achievements earned inside them (criteria name the scenario or the class-campaign/order-hall content). No zone metas, holiday or exploration ids.
- **StartingZone** → the achievements of that intro experience only (decided 2026-09-05: Welcome to Draenor on the intro Tanaan Jungle 577, Exile's Reach on 1409). The map stays Skip-like for the world map; a player is on it while levelling through the intro, which is what the Current Zone view needs. An intro map still marked Skip in the MapVerifier has to be re-verdicted in game and exported (`sync-mapverifier`), never in the CSV.
- **Continent**, **TaxiAndAdventure**, **Skip** → never an entry. `raw/Evaluate-ZoneData.ps1` flags Continent and inactive maps that appear.

Key facts: `shared.CrossExpansionDelves` is the first item of every expansion's `delves` table; `shared.OldWorldPetAchievements` (the Pet Mauler trio, Continental Tamer, World Safari) belongs in every zone the Mauler criteria name, Vanilla through Pandaria, Cataclysm zones included; the name is historical. Local tables (`quelThalas`, `delves`, `delvesS1`, ...) are defined once per file — reference, never redefine. Add ids as `N, -- Title` lines (title from the DB), no trailing semicolons.

---

## Step 3 — Validate (max 3 fix attempts, then escalate)

```powershell
cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
& "raw\Evaluate-ZoneData.ps1"                    # duplicates, map ids, every id exists on Retail or Classic, whole link groups, no Continent maps, parser warnings
& "raw\Evaluate-ZoneCriteria.ps1"                # R2: criteria-named zones covered; R3: metas cover their children's maps. Exports 3 DBC tables once per build into .claude\cache\dbc\ (git-ignored), then offline
& "raw\Evaluate-ZoneDataDecisions.ps1"           # the log vs the files vs the DB; -SkipDb for the offline subset
& ".claude\skills\add-zone-data\_check_scripts_reset.ps1"
```

`Evaluate-ZoneCriteria.ps1` is the Rule 2/3 fact-checker: its `[R2 ]` and `[R3 ]` lines are placement errors, `[R2? ]` (inner map, decision D8) and `[R3+ ]` (meta on a map no child is on) are information. For a batch of edits, write a plan file (`map,token,op` lines) and apply it with `_apply_zone_plan.ps1 -PlanFile <path>` (`-WhatIf` first): it inserts `N, -- Title` lines (titles from the cached export) or table references into the right `Zone()` block by primary map id, or removes them, and keeps CRLF. Quest-chain facts (Rule 5) come from the `questpoiblob` export in the same cache: quest id → UiMapID.

Both evaluators resolve the builds themselves. `Evaluate-ZoneDataDecisions.ps1` prints `[ERROR]`, `[WARN ]`, `[INFO ]` lines with a check id (S-* structure, L-* log vs ZoneData, D-* log vs DB) and exits 1 on any ERROR. Its offline subset also runs from `Check-Repo.ps1` (rule `zone-decisions`) whenever the log or a ZoneData file changed.

---

## Step 4 — Update the decisions log

File: `raw/ZoneDataDecisions.md`. Three sections with an HTML end-marker each; keep every section in ascending id order (insert at the right place, not blindly before the marker).

**Main Log** `| ID | Title | Decision | Zone ID | Zone Name | Reason | Date |`
- Decision is exactly one of `✅ added`, `✅ already present`, `⏭ skipped`, `🗑 removed`. Partial adds are `✅ added` with the detail in Reason.
- Title exactly as the DB has it (the evaluator compares character-exact).
- Zone ID: comma-separated **link-group primary** map ids the id is really tagged on, all of them, never sub-maps, never free text. `—` only for skipped/removed rows.
- Zone Name: human summary; may abbreviate ("Kalimdor + 16 zones").
- Reason: the checkable fact; file paths in backticks are verified against the files.
- Marker: `<!-- END_MAIN_LOG -->`.

**Statistics-Tracking Achievements (Skipped)** `| ID | Title |`, DB statistics only. Marker `<!-- END_STATS_LOG -->`.

**IDs Not Found in Game DB (Skipped)**: comma-separated bare ids, ascending, absent on both builds. Marker `<!-- END_NOTFOUND -->`.

Finish by updating **Highest ID Analyzed** (sequential sweep only) and running Step 3 again.
