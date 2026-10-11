---
name: add-category-data
description: Maps achievement IDs from a completed AchievementData.lua patch block into the correct CategoryData.lua category tree for Krowi's Achievement Filter addon. Handles zone/instance grouping, subcategory classification, new-node creation, DB lookups for uiMapId and journalInstanceId, and insertion at the correct position in the existing file. Use when adding category data for a new patch, updating CategoryData.lua, mapping achievements to categories, or after add-achievement-data has produced a new patch block.
---

# Add Category Data

Reads the open AchievementData.lua, classifies every new achievement by zone/instance and subcategory, resolves map/instance IDs from wow.tools.local, then writes the result into the correct CategoryData.lua.

## Inputs

- **Patch version** from user (e.g. `"12.1.0 for Midnight"`)
- **Open AchievementData.lua** — source of all IDs to process
- **Existing CategoryData.lua** — determines insertion points

## Workflow

### 1. Locate files
Resolve expansion folder from patch string (e.g. `12.1.0 for Midnight` → `DataAddons/Retail/12_Midnight/`). Open both `AchievementData.lua` and `CategoryData.lua` for that expansion.

### 2. Extract IDs
Collect all `Ach(id)` entries from the target patch block (keyed by patch version). Preserve inline `-- Comment` names as classification hints.

### 3. Batch DB lookup
Look up all IDs in one call: `& ".claude\skills\add-category-data\_lookup_ids.ps1" -Ids <ids>` (the build resolves from the server; see [REFERENCE.md](REFERENCE.md) § DB Queries). Capture per ID: `Title_lang`, `Reward_lang`, `Faction`, `Category` and `Description_lang`.

### 4. Classify each achievement
For each ID determine:
1. **Section** — Zones / Delves / Dungeons / Raids (see REFERENCE.md § Section Rules)
2. **Zone or instance** — derived from achievement name/description + DB lookup
3. **Subcategory** — name-pattern rules first → description → WoW achievement category (`_lookup_category_names.ps1`) → flag to user if still unclear (see REFERENCE.md § Subcategory Rules)

### 5. Resolve map/instance IDs
- **New zone**: query `uimap` table by name; when multiple records exist pick the non-taxi playable zone record (see REFERENCE.md § uiMapId Lookup)
- **New dungeon/raid**: query `journalinstance` table by name (see REFERENCE.md § journalInstanceId Lookup)

### 6. Determine insertion points
Read existing CategoryData.lua to decide: zone/instance already exists → insert into it; does not exist → create new node. Apply ordering rules (see REFERENCE.md § Insertion Rules).

### 7. Generate and insert Lua
Write V2 builder calls only, following the existing chains in the file (see REFERENCE.md § Code Style). Never write the V1 positional format. Write with the Edit tool, which keeps the file's CRLF line endings.

### 8. Edge cases — stop and report before inserting
- Subcategory still ambiguous after all classification steps
- Multiple uimap records with no obvious winner
- Achievement ID not found in DB
- New top-level section type never seen in this expansion before

### 9. Self-evaluate before presenting to the user
After writing the Lua edits, run the feedback loop below. Do not stop until both checks pass
or you have exhausted 4 attempts — on each attempt, state what you changed and why.

1. Run `.claude/skills/add-category-data/_evaluate_coverage.ps1 -PatchKey <EE_PP_SS> -AchievementFile
   <DataAddons\...\AchievementData.lua>` (the build resolves itself). This is a fast, deterministic,
   DB-backed check that every achievement ID from the patch is placed somewhere in
   `DataAddons/**/CategoryData*.lua`, or is confirmed out-of-scope (`:NotCategorized()` tag or
   a known-excluded `achievement_category`). If it FAILs, place the missing IDs or, if genuinely
   out of scope, confirm with the user and add the category to the script's allowlist.
2. Walk through `.claude/skills/add-category-data/RUBRIC.md` — a judgment-call checklist
   covering placement (cross-expansion insertion, PvP/Events/Housing/Collections exclusions,
   Keystone Hero+Victor pairing, zone-vs-expansion-scoped world events) and ordering (season
   MythicPlus lists, raid root/Glory/Mythic order, Prey tier blocks, zone patch-chronology).
   Report which items you checked and fix any "no" before presenting your result.
3. Regenerate the category snapshot with `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\snapshot-categories.lua" "$PWD" Both -write`
   and read the `git diff` of `.claude/tools/headless/snapshots/CategoryTree.*.txt`: it must show the new
   placements and nothing else. The diff is committed with the category change (lint rule `category-snapshot`).

See [REFERENCE.md](REFERENCE.md) for all lookup queries, classification tables, insertion rules, and code examples.