---
name: add-zone-data
description: Add achievement IDs to the correct ZoneData.lua entries in Krowi's Achievement Filter. Covers all entry types (zone, dungeon, raid, delve, battleground), map ID lookup via MapVerifier CSVs and wow.tools.local, and autonomous self-validation via Evaluate-ZoneData.ps1. Use when adding achievements to existing zone entries, creating new zone entries, or after add-achievement-data produces new IDs that need zone coverage.
---

# Add Zone Data

## Orchestration Workflow

Given a list of achievement IDs, the parent agent:
1. Runs **Lookup subagent** → compact decisions JSON
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

---

## DB Lookup via Script (VS Code 1.104+)

VS Code 1.104+ shows a network-warning popup for any terminal command containing `Invoke-RestMethod`, `Invoke-WebRequest`, `curl`, or `wget` — even with auto-approve enabled. To avoid this, **never call `Invoke-RestMethod` directly in a terminal command**. Instead, write a PS1 script to disk and execute it.

Whenever the parent agent needs to query the local DB from the terminal, use this pattern:

**Step A — Overwrite the script's `$ids` line** using `replace_string_in_file` on `.github/skills/add-zone-data/_lookup_ids.ps1`. Replace the placeholder with the actual IDs, e.g. `@(151, 152, 174)`:

```
oldString: $ids = @()
newString: $ids = @({{IDS}})
```

**Step B — Run the script** (terminal command contains no network verbs):

```powershell
& "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\add-zone-data\_lookup_ids.ps1"
```

Use `replace_string_in_file` for Step A, then `run_in_terminal` for Step B. After the run, reset the IDs back to `@()` so the script stays clean for next time.

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
  Skip with "no geographic association" if title/description matches any of:
  - "Level N" or level milestone
  - Proficiency/skill rank (Journeyman/Expert/Artisan/Grand Master + profession or skill)
  - Pet, mount, or toy collection count
  - Pure cumulative counter: quests completed/abandoned, total kills, critters killed, deaths,
    arena/BG battles or wins, daily quests → reason="statistics tracking"

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

## Step 3 — Validate (parent runs both, max 3 fix attempts)

```powershell
cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\raw"
.\Evaluate-ZoneData.ps1 -SkipDbCheck
.\Evaluate-ZoneDataDecisions.ps1
```

If either fails: analyze output, fix the reported issues, re-run both. Escalate to user after 3 failed attempts.

`Evaluate-ZoneData.ps1` checks: duplicates, inactive map IDs, unknown map IDs, missing achievement IDs.  
`Evaluate-ZoneDataDecisions.ps1` checks: skipped IDs absent from ZoneData files, added/present IDs present in at least one ZoneData file.

---

## Step 4 — Update decisions log (parent writes)

File: `raw/ZoneDataDecisions.md` — three sections:

**Main Log** `| ID | Title | Decision | Zone ID | Zone Name | Reason | Date |`
- Decisions: `✅ added`, `✅ already present`, `⏭ skipped`
- Covers all non-statistics entries with a contextual reason.

**Statistics-Tracking Achievements (Skipped)** — `| ID | Title |` compact table, no per-row reason.

**IDs Not Found in Game DB (Skipped)** — comma-separated bare IDs in numeric order, no table.
