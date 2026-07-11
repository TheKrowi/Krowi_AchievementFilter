---
name: add-zone-data
description: Add achievement IDs to the correct ZoneData.lua entries in Krowi's Achievement Filter. Covers all entry types (zone, dungeon, raid, delve, battleground), map ID lookup via MapVerifier CSVs and wow.tools.local, and autonomous self-validation via Evaluate-ZoneData.ps1. Use when adding achievements to existing zone entries, creating new zone entries, or after add-achievement-data produces new IDs that need zone coverage.
---

# Add Zone Data

## Orchestration Workflow

Given a list of achievement IDs, the parent agent:
0. **Pre-flight: verify wow.tools.local is reachable.** Run:
   ```powershell
   & "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\add-zone-data\_start_server.ps1"
   ```
   The script starts wow.tools.local if needed and waits up to 60 seconds. If it still isn't reachable after that, **stop immediately** — do not proceed and do not waste tokens on lookups that will all return NOT_FOUND.
1. **Performs all lookups directly** (see scripts below) and builds a compact decisions JSON — do **not** delegate to a subagent for this step; `Explore` subagents cannot make HTTP calls to `localhost:5000`.
2. Groups `add` decisions by expansion → runs **Write subagent** per expansion → minimal file diffs
3. Applies all diffs via `multi_replace_string_in_file`
4. Runs both evaluators (Step 3)
5. Updates the decisions log (Step 4)

**File location rule:** one `ZoneData.lua` per expansion, never split by patch.
```
DataAddons/Retail/XX_ExpansionName/ZoneData.lua
DataAddons/Shared/XX_ExpansionName/ZoneData.lua   ← Retail+Classic shared
DataAddons/Shared/ZoneData.lua                     ← cross-expansion (delve base tables, etc.)
```

**Resuming work ("next N"):** The decisions log (`raw/ZoneDataDecisions.md`) contains a **Highest ID Analyzed** line near the top. Read that value, add 1, and use that as the starting point for the next batch. After completing a batch, update the **Highest ID Analyzed** line to the largest ID processed in that batch (across all three sections — Main Log, Statistics, and Not Found).

---

## Data Lookups via Script (VS Code 1.104+)

**Rule: no terminal command may contain specific values (IDs, map IDs, patterns, search terms) inline.** VS Code 1.104+ shows a network-warning popup for commands containing `Invoke-RestMethod` / `Invoke-WebRequest` / `curl` / `wget`, and the user will reject any inline command that embeds specific values. All lookups must go through the designated scripts below.

| Script | Placeholder var | Purpose | Output format |
|---|---|---|---|
| `_lookup_ids.ps1` | `$ids = @()` | DB lookup via wow.tools.local | `id\|Title\|Description` |
| `_check_csv.ps1` | `$ids = @()` | Check ZonesPerAchievement.csv for existing entries | `id\|PRESENT\|zones=...` or `id\|NOT_PRESENT` |
| `_zone_search.ps1` | `$terms = @()` | Search ActiveZones.csv by zone name (partial, case-insensitive) | `term\|id\|name` |
| `_linkgroups_search.ps1` | `$ids = @()` | Find the link group (primary map ID) for any map ID | `id\|primary=N\|primaryName=...\|ids=...` |
| `_find_zonefile.ps1` | `$ids = @()` | Find which ZoneData.lua files reference specific map IDs (word-boundary match) | `file\|line N: ...` |

**Usage pattern for every script:**

**Step A** — Set values via `replace_string_in_file`:
```
oldString: $ids = @()          # (or $terms = @())
newString: $ids = @({{VALUES}})
```

**Step B** — Run the script:
```powershell
& "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\add-zone-data\_SCRIPTNAME_.ps1"
```

**Step C** — Reset immediately after reading the output:
```
oldString: $ids = @({{VALUES}})
newString: $ids = @()
```

**Never create separate temp scripts.** The five scripts above are the only designated lookup tools. Use them for every lookup — DB queries, CSV searches, and file searches alike.

---

## Subagent 1 — Lookup

Invoke: `runSubagent("Explore", prompt)` where prompt is the template below, filled with the actual IDs and expansion hint.

```
You are resolving WoW achievement IDs for zone placement in Krowi_AchievementFilter.
Workspace root: e:\World of Warcraft Addon Development\Krowi_AchievementFilter

IDs to process: {{IDS}}
Expansion hint: {{EXPANSION_OR_UNKNOWN}}

For each ID in order:

STEP 1 — DB lookup
  POST http://localhost:5000/dbc/data/achievement/?build=12.0.7.68275
  Body: draw=1&start=0&length=1&search[value]=<ID>
  Response cols: col0=Description_lang, col1=Title_lang
  No result → decision=skip, reason="not in game DB" → go to next ID

STEP 2 — Skip rules (no map lookup needed)
  The following go in the **Statistics table** (not the main log):
  - Pure cumulative counters: quests completed/abandoned, total kills, critters killed, deaths,
    arena/BG battles or wins, daily quests
  - Arena rating milestones: "Just the Two of Us: X", "Three's Company: X", "High Five: X",
    and equivalent rating-bracket series

  The following go in the **Main log** as ⏭ skipped, reason="no geographic association":
  - "Level N" or level milestone
  - Proficiency/skill rank (Journeyman/Expert/Artisan/Grand Master + profession or skill)
  - Pet, mount, or toy collection count
  - PvP arena performance achievements (e.g. Hot Streak, Last Man Standing) — not rating milestones
  - PvP gladiator/elite season titles (Merciless/Vengeful/Brutal/Wrathful Gladiator, etc.)
  - Feats of Strength for real-world event exclusives (BlizzCon pets/mounts/toys, WWI items)
  - Legendary item FoS where the source instance no longer exists in the current game
    (e.g. Atiesh — required original 40-man Naxxramas which was removed)

STEP 3 — Zone lookup (non-skipped only)
  a. Check raw\MapVerifier_ZonesPerAchievement.csv — if achievementId column contains this ID
     → decision=already_present, use the mapId/mapName from that row
  b. Search raw\MapVerifier_ActiveZones.csv by name column using zone name derived from
     the achievement title or description. Only accept IDs in this file (never InactiveZones).
  c. For dungeons/raids with multiple floors, also check raw\MapVerifier_LinkGroups.csv
     and use the primary map ID.
  d. If zone is still ambiguous → decision=ambiguous (parent will ask user)

Return ONLY this JSON array, no prose, no markdown:
[
  {"id":N,"title":"...","decision":"add|skip|already_present|ambiguous","mapId":N_or_null,"mapName":"..._or_null","reason":"..."},
  ...
]
```

---

## Subagent 2 — Write

Invoke: `runSubagent("Explore", prompt)` after the Lookup subagent returns. One invocation per expansion. The subagent reads the target file and returns replacement specs — the **parent applies them** via `multi_replace_string_in_file`.

```
You are planning edits to a ZoneData.lua file for Krowi_AchievementFilter.
Workspace root: e:\World of Warcraft Addon Development\Krowi_AchievementFilter

Decisions (only "add" entries): {{DECISIONS_JSON}}
Target file: {{FILE_PATH}}

Read the target file. For each decision:
1. Find the zoneData:Zone() entry whose map ID list contains the decision's mapId.
2. Insert the achievement ID as a new line with inline comment: N, -- Title
3. If no entry exists for the mapId, create a new zoneData:Zone() block following the
   patterns in the file and the entry type rules below.

Entry type rules (determine from mapId context or zone name):
  zone     → zone meta only: Sojourner, Explore, Adventurer, Treasures, Tour of Duty,
             racing, rep, zone-specific quest completions. NO dungeon/raid/delve IDs.
  dungeon  → Normal/Heroic/Mythic clear, Keystone Hero/Victor, boss feats only.
  raid     → N/H/M clear, AotC/CE, Glory, Season title, Mythic boss kills, boss feats.
             AotC/CE belong to the raid whose final boss grants them.
             Glory shared across raids: include in each applicable raid entry.
  delve    → Stories + Discoveries IDs for this specific delve + seasonal table refs:
               S1 release: delvesS1, delvesS2Progress, delvesS3Progress
               S2 release: delvesS2, delvesS3Progress
               S3 release: delvesS3
             Boss lair (Zekvir/Nullaeus): boss feats + `delves` only; no Stories/Discoveries/season tables.
  bg       → all BG-specific achievements (Victory, Veteran, Perfection, All-Star, etc.)

Key facts:
  Builder API: zoneData:Zone(mapId, {ids}) or zoneData:Zone({id1,id2,...}, {ids})
  File header: local _, addon = ...\nlocal shared = addon.Data.ZoneData.Shared
    (only include `shared` line if the file already uses it or new entries need it)
  shared.CrossExpansionDelves must be the first item in every expansion's `delves` local table.
  shared.OldWorldPetAchievements belongs in Vanilla/TBC/WotLK zone entries.
  Local tables (quelThalas, delves, delvesS1, etc.) are already defined in the file —
    reference them; do not redefine.

Return ONLY this JSON array, no prose:
[{"oldString":"...","newString":"..."}]
Include 3–5 lines of unchanged context before and after each change in oldString.
```

---

## Step 3 — Validate (parent runs all three, max 3 fix attempts)

```powershell
cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\raw"
.\Evaluate-ZoneData.ps1 -SkipDbCheck
.\Evaluate-ZoneDataDecisions.ps1
```

Also run the scripts-reset check **before finishing**:
```powershell
& "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\add-zone-data\_check_scripts_reset.ps1"
```

If any evaluator fails: analyze output, fix the reported issues, re-run all three. Escalate to user after 3 failed attempts.

`Evaluate-ZoneData.ps1` checks: duplicates, inactive map IDs, unknown map IDs, missing achievement IDs.  
`Evaluate-ZoneDataDecisions.ps1` checks: skipped IDs absent from ZoneData files, added/present IDs present in at least one ZoneData file, **title in the main log matches the game DB exactly** (Check 3 — requires `wow.tools.local` running; reports `log: '...' | DB says: '...'` so the correct value is visible without a separate lookup).

---

## Step 4 — Update decisions log (parent writes)

File: `raw/ZoneDataDecisions.md` — three sections:

**Main Log** `| ID | Title | Decision | Zone ID | Zone Name | Reason | Date |`
- Decisions: `✅ added`, `✅ already present`, `⏭ skipped`
- Covers all non-statistics entries with a contextual reason.

**Statistics-Tracking Achievements (Skipped)** — `| ID | Title |` compact table, no per-row reason.

**IDs Not Found in Game DB (Skipped)** — comma-separated bare IDs in numeric order, no table.
