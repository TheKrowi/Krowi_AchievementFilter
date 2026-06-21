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
Query all IDs in one request against the `achievement` table (build = retail, e.g. `12.0.7.67808`). See [REFERENCE.md](REFERENCE.md) § DB Queries for the PowerShell snippet. Capture per-ID: `Title_lang` [col 1], `Reward_lang` [col 2], `Faction` [col 5].

### 4. Classify each achievement
For each ID determine:
1. **Section** — Zones / Delves / Dungeons / Raids (see REFERENCE.md § Section Rules)
2. **Zone or instance** — derived from achievement name/description + DB lookup
3. **Subcategory** — name-pattern rules first → description → WoW DB category in browser UI → flag to user if still unclear (see REFERENCE.md § Subcategory Rules)

### 5. Resolve map/instance IDs
- **New zone**: query `uimap` table by name; when multiple records exist pick the non-taxi playable zone record (see REFERENCE.md § uiMapId Lookup)
- **New dungeon/raid**: query `journalinstance` table by name (see REFERENCE.md § journalInstanceId Lookup)

### 6. Determine insertion points
Read existing CategoryData.lua to decide: zone/instance already exists → insert into it; does not exist → create new node. Apply ordering rules (see REFERENCE.md § Insertion Rules).

### 7. Generate and insert Lua
Follow exact formatting from existing entries (see REFERENCE.md § Code Style). Write using `replace_string_in_file` or `multi_replace_string_in_file`.

### 8. Edge cases — stop and report before inserting
- Subcategory still ambiguous after all classification steps
- Multiple uimap records with no obvious winner
- Achievement ID not found in DB
- New top-level section type never seen in this expansion before

See [REFERENCE.md](REFERENCE.md) for all lookup queries, classification tables, insertion rules, and code examples.
