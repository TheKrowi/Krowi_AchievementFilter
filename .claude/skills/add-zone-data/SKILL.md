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
   The script starts wow.tools.local if needed and waits up to 60 s (the first start can take longer; rerun once). If it is still unreachable, **stop**; every lookup would return NOT_FOUND. Build strings are never typed by hand: every script dot-sources `_builds.ps1`, which picks the newest `wow` (Retail) and `wow_classic` (Classic) build from `/casc/builds` (falling back to `?remote=true`).
1. **Look up every id** with `_lookup_ids.ps1` (both builds; `builds=` in the output says where the id exists). Then apply the Skip rules and, for the rest, `_check_zonedata.ps1` (already placed?), `_zone_search.ps1` / `_linkgroups_search.ps1` (which map, which link group), and `_lookup_criteria.ps1` (the game's own list of zones, NPCs or bosses behind the achievement; this is the Rule 4 fact).
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
  - event achievements without a fixed place; Housing neighbourhood achievements (no ZoneData precedent yet)

---

## Zone Placement Rules (confirmed with user — do not infer new rules from existing file conventions)

These rules were confirmed with the user, not inferred from existing ZoneData.lua content. "It's already there" is never sufficient justification; existing data can itself be an inconsistent legacy convention. If a case challenges a rule or falls outside them, STOP and ask the user rather than extrapolating.

1. **No continent entries** (decided 2026-09-04). An achievement links to zones and their sub-zones, never to a Continent-type map (`12` Kalimdor, `13` Eastern Kingdoms, `101` Outland, `113` Northrend, `424` Pandaria, `572` Draenor, `619` Broken Isles, `875` Zandalar, `876` Kul Tiras, `1550` The Shadowlands, `2537` Quel'Thalas, `947` Azeroth). Continent-spanning achievements (Loremaster, Explorer, Safari/Tamer, event metas, Pathfinder) go on every zone one of their criteria is in. An achievement whose progress can be made **anywhere on a continent** with no zone in its criteria (e.g. "200 different world quests in the Broken Isles") goes on **every zone of that continent**. A player is never "in" a continent (`C_Map.GetBestMapForUnit` returns the zone or sub-zone), so continent entries only ever duplicated zone data.
   **Sub-zone** = a map whose `link` column in `raw/MapVerifier.csv` points at the zone (floors, districts, micro-maps that share the zone's content); the primary plus its linked maps form the link group (`_linkgroups_search.ps1`). List the whole group as the map argument, in one entry; never give a sub-zone its own entry next to the group's. A map with its own exploration or quest achievements is a sibling zone, not a sub-zone: fix the link in the in-game Map Verifier and export (`sync-mapverifier` skill) instead of special-casing the data. Decided 2026-09-05 and applied: Bloodmyst Isle 106 is its own zone (unlink it from 97 in the MapVerifier on the next export), Dalaran `{125, 126}` is one entry with the combined list, The Proscenium is part of Isle of Dorn `{2248, 2328}`, and every delve, class hall and city entry lists its whole group (`{715, 747}`, `{1164, 1165, 1166, 1167}`, `{2259, 2314}`, `{2300, 2301}`, `{2313, 2347}`). `raw/Evaluate-ZoneData.ps1` Check 5 flags partial groups, entries spanning two groups, and Continent maps.
2. **Zone-name/file-path prose must be verified against the actual file**, never derived from a map id by memory or CSV. Use `_check_zonedata.ps1` (achievement → maps and files) and read the real `zoneData:Zone(N, { -- ZoneName` header before writing a zone name or file path into the log.
3. **Zone revamps** (old zone replaced by a new, unlinked map id in a later expansion) default to **no backfill**: pre-existing achievements stay on their original map id; the new map id is used only for achievements introduced by the revamping patch. Cataclysm's Old World split (Northern/Southern Barrens etc.) is a known, handled special case. If a revamp is not a clean 1:1 replacement, ask.
4. **"Ambiguous" test**: a zone assignment must be backed by a specific, checkable fact: a criterion naming the zone/NPC/boss (`_lookup_criteria.ps1`), a quest-giver or faction headquarters location (Warcraft Wiki), or an instance. "The title sounds like it's set there" is not sufficient. Two or more equally strong candidates, or none, means ambiguous → ask. Multi-zone quest chains and reputation achievements are expected to need this research.
5. **Partial-coverage backfill is not automatic.** If an already-present achievement turns out to be missing from a zone it also qualifies for (found while checking criteria), do not edit it; flag it in the log's Reason cell and let the user decide. (Precedent 763/764 auto-backfilled; that is no longer the default.)
6. **Removals flow back into the log.** Any commit that removes an achievement id from a ZoneData file (for example the dangling-reference cleanup driven by the headless pipeline) re-classifies the row in `raw/ZoneDataDecisions.md` in the same commit: `🗑 removed` when the id left the game, otherwise `⏭ skipped` with the reason.

---

## Entry Type Rules

Determine the type from the map's `verdict` column in `raw/MapVerifier.csv` (Zone, Dungeon, Raid, Delve, Battleground, City, Continent, Scenario, ClassHall; a linked sub-zone takes its primary's verdict).

- **zone** → zone meta only: Sojourner, Explore, Adventurer, Treasures, Tour of Duty, racing, reputation, zone-specific quest completions. No dungeon/raid/delve ids.
- **dungeon** → Normal/Heroic/Mythic clear, Keystone Hero/Victor, boss feats only. List the whole link group (all floors) as the map argument.
- **raid** → N/H/M clear, AotC/CE, Glory, season title, Mythic boss kills, boss feats. AotC/CE belong to the raid whose final boss grants them. Glory shared across raids goes in each raid entry. WotLK-era 10/25 splits use `Zone(map, nil, {10}, {25})`.
- **delve** → Stories + Discoveries ids for that delve + the seasonal table refs (S1 release: `delvesS1, delvesS2Progress, delvesS3Progress`; S2: `delvesS2, delvesS3Progress`; S3: `delvesS3`). Boss lairs (Zekvir/Nullaeus): boss feats + `delves` only.
- **battleground** → all BG-specific achievements (Victory, Veteran, Perfection, All-Star, ...), plus `shared.GenericBattleground`.

Key facts: `shared.CrossExpansionDelves` is the first item of every expansion's `delves` table; `shared.OldWorldPetAchievements` belongs in Vanilla/TBC/WotLK zone entries; local tables (`quelThalas`, `delves`, `delvesS1`, ...) are defined once per file — reference, never redefine. Add ids as `N, -- Title` lines (title from the DB), no trailing semicolons.

---

## Step 3 — Validate (max 3 fix attempts, then escalate)

```powershell
cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
& "raw\Evaluate-ZoneData.ps1"                    # duplicates, map ids, every id exists on Retail or Classic, parser warnings
& "raw\Evaluate-ZoneDataDecisions.ps1"           # the log vs the files vs the DB; -SkipDb for the offline subset
& ".claude\skills\add-zone-data\_check_scripts_reset.ps1"
```

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
