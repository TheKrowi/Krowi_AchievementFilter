---
paths:
  - "DataAddons/**"
  - "Api/**"
  - "Data/**"
  - ".claude/skills/**"
  - "raw/**"
---
# Data rules

Data work runs under the data skills (`add-achievement-data`, `add-category-data`, `add-zone-data`, `verify-achievement-data`, `migrate-to-shared`, `sync-mapverifier`); they hold the formats and the workflows. Step-by-step guides: `docs/how-to/` (`add-patch-achievements.md`, `add-expansion.md`, `add-event.md`, `update-localization.md`). Every `Obtainable()` form, its boundaries and how it resolves per client: `docs/obtainability.md`. The zone rules' reasons: `docs/zone-decisions.md` (D1 to D15); the per-achievement log: `raw/ZoneDataDecisions.md`.

## The pipeline
- Data files declare bare tables and never call processing functions; the loaders (`DataAddons/Loaders/`) and `Data/Data.lua` turn each table into tasks at login (`docs/architecture.md`, Data chunk execution).
- Registering the same id twice hits an `assert`, so each achievement lives in exactly one place: Shared (`DataAddons/Shared/EE_.../`, identical on both clients) or the Retail/Classic file (client-specific entries only). Classic-only patches are never migrated to Shared.
- A `"Version"` anchor in an `Obtainable()` names the patch **as Retail shipped it**; Classic maps it to its own patch through `DataAddons/Classic/ContentTimeline.lua`, and every anchor must resolve on Retail. Never round an anchor to a nearby patch: register the patch the data refers to.
- A drop is a data defect until proven intentional: every place in the data API that skips or drops an entry reports it to `addon.Data.LoadDiagnostics` (`Data/LoadDiagnostics.lua`) with one of its `Kind`s instead of returning silently, and the headless pipeline fails on an unreported one. Add the `Report` call with any new drop site.
- Per-expansion folder contents: `AchievementData`, `CategoryData`, `ZoneData` (one per expansion, never per patch), `TooltipData`, `TransmogSetData`, `PetBattleLinkData`, `GuideData` (the `KrowiAF.Guide` builder, `Api/GuideDataBuilder.lua`; coordinates measured in game with the debug `/kafwhere`), `CustomCriteriaData`, `EventData`, `BuildVersionData`.

## Formats
- All first-party data, achievement and category data alike, is V2: the fluent `Ach()` builder (`Api/AchievementDataBuilder.lua`) on every expansion and both clients, including new patches added to old expansion files, and the category builder (`Api/CategoryDataBuilder.lua`). The V1 positional parser in `Api/CategoryDataApi.lua` remains only for plugins and must not be removed, because it is the documented plugin entry point (`Api/ApiDocumentation.lua`).
- An achievement patch table is keyed `EE_PP_SS` (expansion, major, minor; Shared files add the suffix `_S`). The patch record is derived from the key by `Data/Data.lua`; do not write it. A data file adds `local _, addon = ...` only if it uses `addon`.
- Categories: `:Merge()` is always written out; the only implicit merges are the zone sub-containers and the 13 profession helpers, and `:Named` never merges. `:WithId(n)` ids are the plugin contract (`KrowiAF.NewInjection(971)`) and never change; without one a category draws an auto-allocated id, a parse position that must not be relied on or persisted. `:Key("Name")` gives a category a stable string handle for `KrowiAF.NewInjection`, preferred for anything new that another file must attach to.

## After a data change
- `BuildVersionData.lua` gets the patch when a new patch version is introduced, or when an `Obtainable()` anchor names a patch not yet registered (`minor:Patch(n, addon.L["Name"])`); when a Classic re-release reaches new content, its Retail patches go into `DataAddons/Classic/ContentTimeline.lua`.
- No manual wiring: the loaders process the tables. Run the headless pipeline (only `Both` cross-checks Shared references) or the repo lint, and the data-verification scripts. Then regenerate the snapshots (`snapshot-data.lua` and, for category changes, `snapshot-categories.lua`, both with `-write`), read their diff as the review of what the change did, and commit it with the data. A change to a category file leaves `.claude/tools/headless/snapshots/` unchanged, or its reviewed diff is committed with it (`category-snapshot` rule; the builder's design: `docs/how-to/migrate-category-data.md`).
- Delegate to the `data-verifier` subagent before calling any data line dead.

## Lookup scripts
- The data skills query the local game-database server, wow.tools.local at `http://localhost:5000`; start it with `& ".claude\skills\add-zone-data\_start_server.ps1"`. `.claude/tools/README.md` lists every script with its command; `.claude/skills/verify-achievement-data/API.md` is the query reference. Explore subagents cannot reach the server: do these lookups from the main agent.
- Pass the values as parameters (`-Ids 1,2,3`, `-Terms "x"`, `-Names "x"`), or edit the placeholder (the parameter's default in the script's `param()` block, `[string[]] $Ids = @()`), run the script, and reset the placeholder; the `lookup-placeholders` rule catches one left filled in.
- A build is never typed: every script resolves it through the kit's `Get-WowBuilds.ps1` (dot-sourced after `.claude/tools/KitPath.ps1`); `-Client Classic` picks the Classic build, and `$env:KAF_RETAIL_PRODUCT = "wowxptr"` points Retail at a patch still on the PTR.
- Never write ad-hoc inline `Invoke-RestMethod`/`curl` commands with ids in them: the maintainer rejects them, and the kit's guard hook blocks an inline query to the server.