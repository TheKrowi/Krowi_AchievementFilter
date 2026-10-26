# Project Instructions — Krowi's Achievement Filter

This is the canonical instruction file for every assistant and contributor working in this repository. `CLAUDE.md` imports it and adds only what is specific to Claude Code; `CONTRIBUTING.md` covers the contributor workflow and points here. When this file and another document disagree, fix the other document. Every issue, feature and fix follows the work-item lifecycle in `docs/sdlc-playbook.md` (see Work-Item Lifecycle below). This file holds the rules; the detail behind them is in the references listed under Where Non-Code Material Lives, read when a task needs it.

## Project Summary

**Krowi's Achievement Filter** (prefix `KrowiAF`, acronym `KAF`) is a World of Warcraft addon written in Lua 5.1 + WoW XML. It replaces the Blizzard Achievements UI and adds Expansions / Events / PvP / Specials tabs backed by about 8400 hand-curated achievement records across 1200+ categories, with filtering, sorting, searching and tracking. It ships for both **Retail** (mainline) and **Classic** (Wrath, Cata, Mists) from the same tree.

- **Language**: Lua 5.1 (the WoW embedded interpreter) + WoW XML UI definitions
- **Runtime**: the World of Warcraft client only (no standalone runtime, no npm/pip/cargo)
- **Size**: about 395 Lua files and 109 XML files including the bundled libraries
- **License**: All Rights Reserved (see `LICENSE`)

## Build & Validation

**There is no build step, no external linter or test framework, and no CI.** The WoW client loads the addon directly from the `.toc` file and is the only full validator. Do not run or invent `luacheck`, `busted`, a Makefile or GitHub Actions; the offline checks install nothing. Packaging and publishing are done by the sibling Krowi Addon Manager project, driven by the `krowi:release` skill (see Git Workflow).

**The maintainer's tooling lives in Krowi_ClaudeKit**, a private repo next to this one (`E:\World of Warcraft Addon Development\Krowi_ClaudeKit`). It holds every tool, hook, skill and agent the Krowi repos share: the vendored Lua 5.1.5, `Deploy`, the game readers, the worktree tools, the release and work-item skills, and the taint reviewer. This repo keeps what is its own: the repo lint, the headless pipeline and its snapshots, the scenario suites, the data skills and their lookup scripts. Those reach the kit through `.claude/tools/KitPath.ps1`. Without the kit, `Check-Repo.ps1` runs the rules that need no Lua and warns about the rest. A contributor without the kit follows the rules in this file, and the maintainer runs the full checks before merging.

- **Deploy to the game**: the kit's `Deploy.ps1` (and the VS Code `fsdeploy` config in `.vscode/settings.json`, on save) mirrors the addon into the Retail and Classic AddOns folders. Run it with `-WhatIf` before asking for an in-game check, since a reload on a stale install proves nothing.
- **Reload in game**: `/reload`. Enable errors with `/luaerror on` or BugSack + BugGrabber.
- **Static checks**: the Lua language server runs on `.luarc.json` plus the WoW API and FrameXML annotations of the VS Code extension `ketho.wow-api`, so `diagnostics.globals` lists only what no annotation covers: global strings, Classic-only frames and API, third-party addon globals, and the frames the addon creates by name in Lua or XML. Do not add a name the language server already resolves; add a new global string or third-party global sorted, or the `luarc` lint rule tells you.
- **Validation without the client**: follow existing patterns exactly; register every new Lua file in the right `Files.xml`; declare every new saved variable in the `.toc`; keep XML template names and Lua frame references in sync; run the offline checks below.

### Offline tooling (installs nothing)

The kit carries Lua 5.1.5 (`Krowi_ClaudeKit\tools\lua51\`), the exact interpreter WoW embeds; prefer it over any Lua on PATH, because Lua 5.4 and LuaJIT accept syntax the game rejects. `.claude/tools/README.md` documents this repo's tools and lint rules in detail, the kit's `README.md` and `WowAddons.md` the shared ones.

```powershell
& ".claude\tools\Check-Repo.ps1" -ChangedOnly  # lint the changed files, errors instead of warnings; -Luals adds the language server
& ".claude\tools\Check-Repo.ps1"               # whole tree, about 12 s plus 30 s for the language server
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\load-data.lua" "$PWD" Both     # headless data load
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" escape   # one scenario suite; -check for the lint form
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\check-syntax.lua" "Globals.lua"   # syntax only
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\Strip-Semicolons.ps1" -DryRun                 # verified semicolon strip; -Path to limit
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\Find-Symbol.ps1" addon.Gui.Search             # defs and refs through the local aliases; a bare member, -List, -Defs
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\New-Worktree.ps1" feature/2026-10-11-thing    # a parallel session's own checkout; Remove-Worktree.ps1 once merged
```

- **Repo lint** `Check-Repo.ps1`: a rule per mechanical convention in this file, plus the zone, Map Verifier, work-item, category-snapshot, data-snapshot, data-load and scenario checks. A deliberate exception goes in `Check-Repo.ignore` with a comment.
- **Data snapshots** `snapshot-categories.lua` and `snapshot-data.lua`: what each client builds (category tree; achievements, zone placements, registries) recorded under `.claude/tools/headless/snapshots/`. A data change shows there as a reviewable diff; regenerate with `-write` and commit the diff with the change that caused it.
- **Headless data pipeline** `load-data.lua`: the real data load for both clients with WoW globals stubbed; reports every builder error, duplicate registration and `LoadDiagnostics` drop with file and line. Only `Both` cross-checks Shared references. Extend the stubs in `runClient` when a new WoW global is used at load time.
- **Scenario suites** in `Tests/` (`escape`, `special`, `navigation`, `worldmap`, `obtainable`, `tooltip`, `guide`, `menu`, `memory`, `events`, `schedules`, `tracking`, `options`, `help`; `scheduler` and `sources` are game-only probes, `pictures` makes the help pictures) run headlessly through `run-tests.lua` and in game through `/kaftest <suite>` (debug mode on, out of combat). A scenario carries `Recorded`, the behaviour of the current code verified in game, and `Target`, the desired behaviour; it passes while the code behaves as recorded, so a behaviour change is a reviewable diff and the open targets stay visible without failing anything. Each suite and the in-game runner: `Tests/README.md`.
- **Closing the loop with the game**: the kit's `Deploy.ps1` mirrors the addon into the client's AddOns folder (incremental, `-WhatIf` to preview), you `/reload` in game, then the kit's `Read-GameErrors.ps1` prints the errors BugGrabber recorded for this addon and this repo's `Read-GameTests.ps1` prints the last `/kaftest` run with every line that differs from the headless run marked. Saved variables are written only on `/reload` or logout, so both readers show when the file was last written. For a layout bug, ask for a screenshot (Print Screen in game, written at once): the kit's `Read-GameScreenshot.ps1` prints the newest one's path to open with the Read tool, and warns when the client saves tga, which the Read tool cannot display.

```powershell
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\Deploy.ps1" -WhatIf            # -Client Classic|Ptr|Xptr|... (Xptr = _xptr_, the second test realm)
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\Read-GameErrors.ps1"           # -Hours 0 -All -Client Classic|Ptr|Xptr|...
& ".claude\tools\Read-GameTests.ps1"                                                           # -Client Classic|Ptr|Xptr, -Run <n>
& ".claude\tools\Request-GameTests.ps1" tracking                                               # only on the maintainer's request, client closed: run suites at the next login; -Client Classic
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\Read-GameScreenshot.ps1"       # -Count 3 -Minutes 0 -Client Classic|Ptr|Xptr|...
```
- **Blizzard UI source**: the kit's `Update-UiSource.ps1` keeps read-only shallow clones of Gethe/wow-ui-source in `..\wow-ui-source\live` and `..\wow-ui-source\classic` next to the repo (`-Branch ptr2` and others on request). Grep them for FrameXML, secure templates and `Blizzard_APIDocumentationGenerated` (signatures and secret-value flags) instead of fetching from the web, and never run anything from them. The export can lag a live patch; the layout and the `ketho.wow-api` annotations are in `.claude/tools/README.md`.

### Data-verification scripts

The data skills query a local game-database server (wow.tools.local at `http://localhost:5000`; start it with `& ".claude\skills\add-zone-data\_start_server.ps1"`) through designated scripts. Each `SKILL.md` documents its workflow, `.claude/tools/README.md` lists every script with its command, and `.claude/skills/verify-achievement-data/API.md` is the query reference.

**Rule for lookup scripts**: pass the values as parameters (`-Ids 1,2,3`, `-Terms "x"`, `-Names "x"`), or edit the placeholder (the parameter's default in the script's `param()` block, `[string[]] $Ids = @()`), run the script, and reset the placeholder. A build is never typed: every script resolves it through the kit's `Get-WowBuilds.ps1` (dot-sourced after `.claude/tools/KitPath.ps1`), `-Client Classic` picks the Classic build, and `$env:KAF_RETAIL_PRODUCT = "wowxptr"` points Retail at a patch still on the PTR. Never write ad-hoc inline `Invoke-RestMethod`/`curl` commands with IDs embedded; the maintainer rejects them, the `lookup-placeholders` lint rule catches a placeholder left filled in, and in Claude Code the kit's pre-tool guard hook blocks an inline query to the server.

## Project Layout

### Entry Point & Load Order

The WoW client reads `Krowi_AchievementFilter.toc`, which defines the **exact load order**. Files load sequentially in the order listed in the `.toc` and the nested `Files.xml` manifests, and a file can only use what earlier files defined. Every new `.lua` file must be added to the right `Files.xml` or it silently never loads. The order is:

1. `Libs/Files.xml` — bundled libraries, then `Krowi_Options/Files.xml` — the options window, a library kept inside the addon until it moves to `Krowi_Libraries`
2. `Api/Files.xml` — public API (`KrowiAF`), enums, data registration functions and builders
3. `Plugins/Files.xml` — plugin integrations (BetterWardrobe, ElvUI, GW2_UI, InstanceAchievementTracker, ZygorGuidesViewer, AchievementsTabFixes, EllesmereUI)
4. `Localization/Files.xml` — enUS first, then the other locales, then `Shared.lua`
5. `Krowi_AchievementFilter.lua`, `Globals.lua`
6. `Diagnostics.lua`, `TaintDiagnostics.lua`, `Options/Files.xml`, `Libs/Krowi_Util/Icon.lua`, `Icon.lua`, `BrowsingHistory.lua`
7. `Objects/Files.xml`
8. `Filters.lua`, `SearchOptions.lua`
9. `Gui/FilesModern.xml` (Retail) or `Gui/FilesClassic.xml` (Classic)
10. `Data/Files.xml`
11. `DataAddons/Shared/Files.xml`, then `DataAddons/Retail/Files.xml` or `DataAddons/Classic/Files.xml`
12. `DataAddons/Loaders/Files.xml` — post-processing loaders that wire the data tables to their processors
13. `Tests/Files.xml`

Game-version-conditional loading uses `[AllowLoadGameType mainline]` and `[AllowLoadGameType wrath, cata, mists]` directives in the `.toc`. In code, use `addon.Util.IsModern`, `addon.Util.IsMainline`, `addon.Util.IsClassicWithAchievements`, `addon.Util.IsWrathClassic`, `addon.Util.IsMistsClassic` (from `Libs/Krowi_Util`); the `util-flags` lint rule fails on one that Krowi_Util does not define. `IsModern` (Retail and WoW Forever) answers "does this client run Retail's interface?": frames, templates, atlases, skins; every `addon.MenuBuilder:New` passes `modern = addon.Util.IsModern`. Older interface code that branches on `not IsClassicWithAchievements` agrees with `IsModern` on every client with achievements, Forever included; new code uses `IsModern`. `IsMainline` (Retail only) answers "is this Retail's content?": achievement data, categories, maps, saved data, world events. KAF does not load on Forever yet (no 16001 in the `.toc`).

### Root Files

| File | Purpose |
|------|---------|
| `Krowi_AchievementFilter.toc` | Metadata and load manifest (Interface versions, SavedVariables, OptionalDeps) |
| `Krowi_AchievementFilter.lua` | Entry point: event handling (`ADDON_LOADED`, `PLAYER_LOGIN`), load orchestration |
| `Globals.lua` | Shared utilities: achievement chain helpers, `addon.GetAchievementInfo`/`GetAchievementInfoTable`, custom-criteria wrappers, zone lookup, filter counting, transmog set checks, modifier keys, month and weekday names |
| `Bindings.xml` | Key bindings for tab toggles and browsing history |
| `Filters.lua`, `SearchOptions.lua` | Filter definitions (completion, faction, reward type, sort, build version); which fields a search covers (IDs, names, descriptions, ...) |
| `Diagnostics.lua`, `TaintDiagnostics.lua` | Debug/trace logging controlled by options; taint probing helpers |
| `Icon.lua`, `BrowsingHistory.lua` | Minimap / data broker icon; achievement navigation history (back/forward) |

### Key Directories

| Directory | Purpose |
|-----------|---------|
| `Api/` | Public API (`KrowiAF`, created in `API.lua`): enums, data registration functions, fluent builders, `PluginsApi`; `ApiDocumentation.lua` holds example data structures |
| `Objects/` | Metatable classes: `Achievement`, `Category`, `Event`, `Tab`, `BuildVersion`, `Flags`, `CompareFunc`, `SaturationStyle` |
| `Gui/` | All UI code (`FilesModern.xml` Retail, `FilesClassic.xml` Classic), one sub-folder per feature; `BlizzardOverrides.lua` holds every FrameXML override, API polyfill and hook on Blizzard's frame |
| `Data/` | Runtime data: task runner, registry (`Data.lua`), `LoadDiagnostics`, achievement cache, temporary obtainability, events, tooltips, special categories, migrations (`DataIntegrityManager.lua`), `SavedData/` |
| `DataAddons/` | All **data definitions** (achievement, category, zone, tooltip, transmog set, pet battle link, guide, build version, event, custom criteria) per expansion (`01_Vanilla/` to `12_Midnight/`): `Shared/` identical on both clients, `Retail/` and `Classic/` client-specific, `Loaders/` the post-processing that wires them into the runtime |
| `Options/` | The settings as AceConfig tables; `Window/` maps them onto the options window's 22 feature sections and wires the window (`/kaf`, `addon.Options.Open`, the Settings > AddOns stub) |
| `Krowi_Options/` | The options window: navigation, rows, help pane, search, Defaults; addon-neutral, registered through LibMan as `Krowi_Options_1`. Not under `Libs/`, so it is edited here |
| `Plugins/` | Third-party addon integrations; the plugin API is `Api/PluginsApi.lua` (`KrowiAF.PluginsApi`) |
| `Localization/` | One file per locale (`enUS`, `deDE`, `esES`, `esMX`, `frFR`, `itIT`, `koKR`, `ptBR`, `ruRU`, `zhCN`, `zhTW`), `.Plugins.lua` and `.WrathClassic.lua` variants, `Shared.lua` helpers |
| `Libs/` | Vendored libraries, several of them git submodules of `TheKrowi/*` repos. **Do not edit `Libs/` unless asked**; fixes belong upstream |
| `Media/` | Texture assets (`.blp`) |
| `Tests/` | The `/kaftest` runner and the scenario suites it shares with the headless runner; loaded last, only active in debug mode |
| `_Packaging/` | Changelog, release notes, CurseForge description. Not loaded by the game |
| `docs/`, `raw/`, `.claude/` | Non-code material (see Where Non-Code Material Lives); offline tooling, skills, subagents and hooks. Not loaded by the game, not shipped |

The file map of `Api/`, `Gui/`, `Data/`, `Options/` and `Libs/` is in `docs/architecture.md`.

## Architecture

### Two namespaces

Every file starts `local _, addon = ...` (or `local addonName, addon = ...`). `addon.*` is the private namespace (`addon.Data`, `addon.Gui`, `addon.Objects`, `addon.Options`, `addon.Filters`, `addon.Diagnostics`, `addon.Plugins`, ...). `KrowiAF` is the public surface: enums (`KrowiAF.Enum.Faction`, `RewardType`, `EventType`, ...), data-registration tables (`KrowiAF.AchievementData`, `KrowiAF.CategoryData`, ...), the builder `KrowiAF.Ach`, and `KrowiAF.PluginsApi`. `KROWI_LIBMAN` is the library manager from `Libs/Krowi_Util/LibMan.lua`. Data files write only to `KrowiAF.*`; runtime code reads `addon.Data.*`.

### Three-phase boot (`Krowi_AchievementFilter.lua`)

1. `ADDON_LOADED` for this addon: options, saved-data migrations (`Data/DataIntegrityManager.lua`), plugins, GUI parts that do not depend on Blizzard's frame.
2. `ADDON_LOADED` for `Blizzard_AchievementUI` (load-on-demand): `addon.Gui:LoadWithBlizzard_AchievementUI()` hooks and reshapes `AchievementFrame`. Anything touching Blizzard achievement frames goes here, not in phase 1.
3. `PLAYER_LOGIN`: `addon.Data:LoadOnPlayerLogin()` builds all achievement/category/zone objects, then `addon.BuildCacheAsync` (in `Data/AchievementCache.lua`) walks every achievement ID. Both run as coroutine-style task groups yielding on a per-frame time budget. **`addon.Data.Achievements` is empty until phase 3 completes**; code that needs populated data must hook into `PostLoadOnPlayerLogin` / `PostBuildCache` in `Data/Data.lua`.

### Data pipeline

Data files declare bare tables and never call processing functions; the loaders and `Data/Data.lua` turn each table into tasks at login (chunk execution model: `docs/architecture.md`). Registering the same ID twice hits an `assert`, so each achievement lives in exactly one place: Shared (`DataAddons/Shared/EE_.../`, identical on both clients) or the Retail/Classic file (client-specific entries only). Classic-only patches are never migrated to Shared.

A `"Version"` anchor in an `Obtainable()` names the patch **as Retail shipped it**; Classic maps it to its own patch through `DataAddons/Classic/ContentTimeline.lua`, and every anchor must resolve on Retail. Never round an anchor to a nearby patch: register the patch the data refers to. How anchors resolve per client, and every `Obtainable()` form with its boundaries: `docs/obtainability.md`.

A drop is a data defect until proven intentional: every place in the data API that skips or drops an entry reports it to `addon.Data.LoadDiagnostics` (`Data/LoadDiagnostics.lua`) with one of its `Kind`s instead of returning silently, and the headless pipeline fails on an unreported one. Add the `Report` call with any new drop site.

Per-expansion folder contents: `AchievementData`, `CategoryData`, `ZoneData` (one per expansion, never per patch), `TooltipData`, `TransmogSetData`, `PetBattleLinkData`, `GuideData` (the `KrowiAF.Guide` builder, `Api/GuideDataBuilder.lua`; coordinates measured in game with the debug `/kafwhere`), `CustomCriteriaData`, `EventData`, `BuildVersionData`.

### Objects and filters

`Achievement` carries patch, faction, reward type, PvP/season flags, and a list of temporary-obtainable records; `Data/TemporaryObtainable.lua` resolves those to Past/Current/Future using season anchors registered via `KrowiAF.AddSeasonData`. `Filters.Validate` returns a signed integer (negative = rejected by rule `i`, `1` = show, `2` = always visible), not a boolean.

### Event reminders: where an event's times come from

Krowi's policy (2026-10-21):
- **The current expansion's events** come from Blizzard's event scheduler, `C_EventScheduler` (rows with `KrowiAF.Enum.EventSource.Scheduler`, `Data/EventScheduler.lua`), because Blizzard updates their times without an addon change.
- **Older expansions' events** run on KAF's fixed schedules: `KrowiAF.EventSchedules` in `DataAddons/Retail/<expansion>/EventSchedules.lua`, read by `Data/EventSchedules.lua`, for rows with `EventSource.FixedSchedule`. A reminder on a fixed schedule makes no POI or widget read.
- **Families whose zone, show or storm order is not known yet** keep their POI and widget reads and are only watched.
- **When an expansion ends,** its scheduler events move to fixed schedules, from the times recorded while the scheduler still listed them (`/kaftest scheduler`).
- **The watcher** (`Data/EventObserver.lua`) learns each region's starts and rotations from the POIs it sees, every 300 s, for every player. Debug mode prints its findings: new starts, disagreements with the shipped schedules, and the order of the watched families, which is how a family's rotation gets confirmed before it is made fixed.
- The work items: `docs/work/2026-10-21-event-scheduler` and `docs/work/2026-10-21-fixed-event-schedules`.

### Taint is the recurring bug class

Most recent fixes (see the dev notes in `_Packaging/Changelog.md` and the root causes in `docs/work/*/spec.md`) are taint or secret-value errors. Never override Blizzard API functions (`GetAchievementCriteriaInfo`, `GetAchievementNumCriteria` and the like); that approach was removed years ago and its leftovers still cause bugs. The only globals the addon writes on purpose are the FrameXML UI functions it replaces in `addon.OverwriteFunctions` and the polyfills for removed API in `addon.LoadBlizzardApiChanges` (both in `Gui/BlizzardOverrides.lua`); they are listed in `.claude/tools/Check-Repo.globals` and the `globals` lint rule fails on any other write to the global environment. Do not compare or do arithmetic on values from `C_Calendar`, aura, or objective-tracker APIs without considering `SecretInChatMessagingLockdown`. `TaintDiagnostics.lua` and `Diagnostics.lua` exist for probing this; `addon.Diagnostics.DebugEnabled()` gates debug paths.

### Background jobs allocate nothing when nothing changed

**A background job** is code that can run with every addon window closed: an OnUpdate script, a `C_Timer.NewTicker`, an event handler.

**Why it matters:** memory displays (`GetAddOnMemoryUsage`) count garbage until the game collects it, and the game can go an hour without collecting. So a job that allocates on every run makes the addon's memory climb for as long as the game runs, even though it keeps nothing (docs/work/2026-10-18-memory-growth).

**The rules:**
- **No allocation on a run where nothing it reports changed:**
  - walk tables in place instead of building key lists;
  - pass functions and arguments to `pcall` instead of closures;
  - do not call an API that returns a new table when its answer cannot have changed;
  - check the cheap condition before the call that allocates.
- **Measured:** each job has a scenario in the `memory` suite (`Tests/Memory.lua`).
- **Listed:** each job is listed in `.claude/tools/Check-Repo.jobs`, enforced by the `background-jobs` lint rule. A job that only runs once, rarely or while something the player opened is shown is listed with that reason instead of a scenario.

### Saved variables and migrations

Declared in the `.toc` `## SavedVariables` line: `KrowiAF_DebugTable`, `KrowiAF_Options`, `KrowiAF_SavedData`, `KrowiAF_Filters`, `KrowiAF_SearchOptions`, `KrowiAF_Achievements`, `KrowiAF_MapVerifier`. A new one that is not listed there is lost on logout. Schema changes go through numbered solutions in `Data/DataIntegrityManager.lua`, which run in order on version upgrade.

### Localization

`Localization/enUS.lua` opens with a few lines of code, then the `AUTOGENTOKEN` comment, then the string list with its `-- [[ Exported at ... ]] --` line. Add new strings directly below that `Exported at` line, never above the marker; every locale file has the same layout and the same rule. A string that is added or renamed is updated in **every** locale file, not only enUS: carry an existing translation over to a renamed key, and translate a new one. Plugin strings go in `enUS.Plugins.lua`, Wrath-specific strings in `enUS.WrathClassic.lua`. Guide: `docs/how-to/update-localization.md`.

## Adding New Data (the most common task)

### Achievement data format — V2 (current standard)

All achievement entries use `KrowiAF.AchievementData` with the fluent `Ach()` builder (`Api/AchievementDataBuilder.lua`), on every expansion and both clients, including new patches added to old expansion files. All first-party data is V2, achievement and category data alike; the V1 positional parser in `Api/CategoryDataApi.lua` remains only for plugins and must not be removed, because it is the documented plugin entry point (`Api/ApiDocumentation.lua`).

File header (add `local _, addon = ...` only if `addon` is actually used):

```lua
local Ach = KrowiAF.Ach
local faction = KrowiAF.Enum.Faction -- only if FactionSplit is used
```

New patch table, keyed `EE_PP_SS` (expansion, major, minor; Shared files add the suffix `_S`). The patch record is derived from the key by `Data/Data.lua`; do not write it:

```lua
KrowiAF.AchievementData["11_01_00"] = {
    Ach(12345), -- Name
    Ach(12346):Mount(), -- reward type
    Ach(12347):Title():PvE(15), -- reward + season
    Ach(12348):FactionSplit(faction.Alliance, 12349), -- faction split
}
```

### Category data format — V2 (current standard)

Every first-party `CategoryData*.lua` is V2. A category is built with the fluent builder, never as a positional table:

```lua
local expansion = KrowiAF.NewExpansion(CT.Midnight, { 62387 })   -- an expansion, in DataAddons/*/XX_*/CategoryData.lua
KrowiAF.CategoryData.Events = KrowiAF.NewTabCategory("Events", addon.L["Events"], 884)   -- a tab root

local zones = expansion:Zones{ 62386 }      -- typed containers: :Character :Zones :Delves :Dungeons :Raids :Professions :PetBattles
local quelThalas = zones:Zone(2537)         -- :Zone(uiMapId), :Raid/:Dungeon(journalId), :Delve(areaPoiId) — a zone may hold zones
quelThalas:Quests{ 62110, 42045 }           -- zone sub-containers :Quests :Exploration :PvP :Reputation, which merge
theWakingShores:Named(addon.L["Primal Storms"], { 16463 }):Merge():WithId(1363)   -- anything else (Dragonflight); :Named NEVER merges, :Merge() is explicit
```

- `:Merge()` is always written out; the only implicit merges are the zone sub-containers and the 13 profession helpers.
- `:WithId(n)` ids are the plugin contract (`KrowiAF.NewInjection(971)`) and never change; without one a category draws an auto-allocated id, a parse position that must not be relied on or persisted.
- `:Key("Name")` gives a category a stable string handle for `KrowiAF.NewInjection`, preferred for anything new that another file must attach to.
- **A change to a category file must leave `.claude/tools/headless/snapshots/` unchanged**, or its reviewed diff is committed with it (`category-snapshot` lint rule; the builder's design is in `docs/how-to/migrate-category-data.md`).

### Steps for adding new achievements

1. Achievement data in `DataAddons/<Retail|Classic|Shared>/XX_ExpansionName/AchievementData.lua` (the `add-achievement-data` skill; `docs/obtainability.md` for `Obtainable()` windows).
2. Category data in the corresponding `CategoryData.lua`, in the V2 form above (`Api/CategoryDataBuilder.lua`; the `add-category-data` skill and its `REFERENCE.md`).
3. Zone associations in the expansion's `ZoneData.lua` (the `add-zone-data` skill holds the rules, `docs/zone-decisions.md` the reasons behind them, `raw/ZoneDataDecisions.md` the per-achievement log); tooltip extras in `TooltipData.lua`.
4. `BuildVersionData.lua` when a new patch version is introduced, or when an `Obtainable()` anchor names a patch not yet registered (`minor:Patch(n, addon.L["Name"])`); when a Classic re-release reaches new content, add its Retail patches to `DataAddons/Classic/ContentTimeline.lua`.
5. No manual wiring: the `DataAddons/Loaders/` scripts process the tables. Run the headless pipeline (or the repo lint) and the data-verification scripts, then regenerate the snapshots (`snapshot-data.lua` and, for category changes, `snapshot-categories.lua`, both with `-write`), read their diff as the review of what the data change did, and commit it with the data.

Step-by-step guides in `docs/how-to/`: `add-patch-achievements.md`, `add-expansion.md`, `add-event.md`, `update-localization.md`.

## Code Style Conventions

These rules apply to **all** new and edited code. Follow them without being asked.

- **Files**: UTF-8 without BOM, CRLF line endings, 4-space indent, no final newline (`.editorconfig`). The `bom` and `line-endings` lint rules enforce the first two.
- **Editing tools**: edit with an editor, the Edit/Write tools, or PowerShell. Git Bash `sed -i` and `awk` on this machine rewrite the whole file with LF endings (and `awk` adds a final newline) even when the pattern does not match, so a "no-op" `sed` silently breaks the `line-endings` rule on every file it touched. Use Bash only for read-only work: grep, diff, git, running the vendored Lua. In Claude Code a pre-tool hook denies in-place `sed`/`awk`/`perl` and Bash redirects into repo files.

### File header

Every file starts with the vararg unpack. Use `_` for unused positional variables. Do **not** add a `-- [[ Namespaces ]] --` (or similar) banner above it.

```lua
-- correct: addonName not used
local _, addon = ...

-- correct: both used
local addonName, addon = ...
```

### Semicolons

Do **not** end statements with semicolons. The whole tree has been stripped of them, so any trailing semicolon is new. The `semicolon` lint rule fails on one on an added line; the kit's `Strip-Semicolons.ps1` re-runs the same verified strip if a batch of them ever comes back (a CurseForge locale export, an upstream merge).

### Naming

| Kind | Convention | Example |
|------|-----------|---------|
| Local variables | `camelCase` | `local myValue` |
| Module tables | `camelCase` local, `PascalCase` on `addon.*` | `local gui = addon.Gui` |
| Object constructors / methods | `PascalCase` | `function category:New()` |
| Module-level private helpers | `PascalCase` for named functions, `camelCase` for locals | `local function VersionLessThan(a, b)` |

### Module pattern

```lua
local _, addon = ...
addon.MyModule = {}
local myModule = addon.MyModule

function myModule.DoThing()
    ...
end
```

### OOP pattern

```lua
local myObject = {}
myObject.__index = myObject

function myObject:New(...)
    local instance = setmetatable({}, myObject)
    ...
    return instance
end

function myObject:DoThing()
    ...
end
```

### Forward declarations

Declare at the top of the relevant scope, not at the top of the file unless necessary:

```lua
local Foo, Bar

function Foo()
    Bar()
end

function Bar()
    ...
end
```

### Nil-safe defaults

Use `or {}` for lazy table initialisation:

```lua
self.Children = self.Children or {}
KrowiAF_SavedData.Fixes = KrowiAF_SavedData.Fixes or {}
```

### Other

- String concatenation uses the `..` operator.
- WoW API calls are used directly (no wrappers unless specifically needed), and never overridden (see Taint above).
- Never write to the global environment except through `addon.OverwriteFunctions` / `addon.LoadBlizzardApiChanges`; every new global must be allowlisted in `.claude/tools/Check-Repo.globals` with a reason, and needing one is a design smell.

## Work-Item Lifecycle

Work moves through the six stages of Anthropic's AI-native SDLC Playbook, adapted in `docs/sdlc-playbook.md`: Plan, Design, Build, Test, Deploy and Maintain. The kit's `krowi:process-issue` skill runs it in Claude Code, with this repo's steps from the playbook.

- Each GitHub issue, feature or fix gets a folder `docs/work/<issue>-<slug>/` (templates in the kit's `skills/process-issue/templates/`; without the kit, copy the shape of an existing work folder). It holds `intent.md` (what is wanted and why), `spec.md` (requirements, root cause, design, options, areas of concern, the decision) and `plan.md` (files that change, order of work, risks, proof). They are committed on the work branch, and each is the next stage's input. Routine data work under a data skill, documentation-only changes and releases need no folder.
- The maintainer holds every gate: accepting the intent, approving the spec's design choice, approving a non-routine plan, the in-game before-run for GUI work, approving the merge of the PR, and the release. An agent stops at each gate with a recommendation and records the answer in the artifact. It merges a PR only when the maintainer tells it to, and then with a merge commit (`gh pr merge <n> --merge`). It never pushes work-item commits straight to `main` and never releases.
- A bug fix is built test first. A scenario in `Tests/` records the buggy behaviour as `Recorded` and the spec's behaviour as `Target`; then only the code is fixed, and `Recorded` is set to `Target`. Every fixed bug leaves its scenario behind.
- Review passes, severity and exclusions are in `REVIEW.md`. What a work item taught goes back into this file, a skill, a lint rule or a scenario (`docs/sdlc-playbook.md`, stage 6).

## Git Workflow

- Parallel sessions never share a checkout: each works in its own worktree under `.claude/worktrees/`, made by the kit's `New-Worktree.ps1` (from `main`, submodules included), and is merged back through its own PR; never switch the branch of a checkout another session works in. The game is not isolated: the last deploy wins. Right before a commit, check `git branch --show-current` and `git status`, and commit by explicit path. Detail: the workspace rules in the kit's `WowAddons.md`, Parallel sessions and git.
- `main` is the only long-lived branch. Every change is a short-lived branch off `main` with a PR back into it. Releases are cut on `main`: the addon manager makes a `Release X.Y` commit and tag there and uploads to Wago, CurseForge and GitHub.
- Conventional Commits with a custom `data:` type: `data(midnight): add 12.1.0 achievements (23)`, `fix(retail): ...`, `feat(classic): ...`, `locale(enUS): ...`, `chore:`, `refactor(gui):`, `docs:`. The full type and scope tables are in `CONTRIBUTING.md`.
- Every user-visible change gets a line in `_Packaging/Changelog.md` under the next version's `### Added` / `### Fixed`, written for players. A `(dev note: ...)` is the maintainer's own aside to players (this is the change, and this is my insight into it), not a technical explanation: an agent does not write one, and the root cause of a fix lives in its work folder's `spec.md`. `ReleaseNotes.md` is generated from it at release time; do not edit it by hand. The version header needs a date (`## 100.2 - 2026-09-04`) before release or the generator skips it.
- PR checklist (`.github/pull_request_template.md`): work folder, a reproducing scenario for a bug fix, `Files.xml` registration, SavedVariables, enUS strings below the `Exported at` line, changelog, lint and the `REVIEW.md` passes, tested Retail/Classic.
- GitHub issues and PRs: `gh` calls may be executed without asking first, reads and writes alike (view, comment, close, label, create a PR against `TheKrowi/Krowi_AchievementFilter`). When the fix for a reported issue is on `main` (the maintainer merged its PR, or committed it there themselves), close the issue as completed with a one-line comment naming the commit and when it ships, the way the maintainer's own closing comments read; when a PR's `Closes #N` already closed it, add only the comment. `gh` resolves on PATH from both PowerShell and Git Bash (`C:\Program Files\GitHub CLI`), logged in as `TheKrowi`; call it as plain `gh`, because Claude Code's permission rules match only that form, not a full path. Merging a PR is not among the calls made without asking; see Work-Item Lifecycle.

## Where Non-Code Material Lives

- Reference read on demand: `.claude/tools/README.md` (every tool and lint rule, the headless pipeline, deploy targets, the data-verification scripts), `Tests/README.md` (each scenario suite, the in-game runner), `docs/architecture.md` (file map, data chunk execution model), `docs/obtainability.md` (every `Obtainable()` form, its boundaries and how it resolves per client), `docs/zone-decisions.md` (the reasons behind the zone placement rules, decisions D1 to D15), `docs/how-to/` (step-by-step guides). The data formats themselves are in the data skills under `.claude/skills/`.
- `docs/sdlc-playbook.md` the work-item lifecycle; `docs/work/<issue>-<slug>/` one folder per work item, templates in the kit's `skills/process-issue/templates/`; `docs/backlog.md` the follow-ups that are not a work item yet; `REVIEW.md` at the root the review policy every review pass reads. None of it ships: the release zip skips `docs/` and every `.md` file.
- `docs/codebase-analysis.md` a quality review listing known debt (O(n^2) `GetMergedCategory`, the V1 category parser kept for plugins) and the fixed items with their root causes; its priority table carries the status of each item, so check it before trusting the prose above it. `docs/harness-roadmap.md` is the same for the tooling: the harness steps done, planned and decided against.
- `raw/` scratch reports and zone-data PowerShell tooling; `raw/MapVerifier.csv` is the canonical Map Verifier state (`sync-mapverifier` skill, `mapverifier` lint rule); `raw/ZoneDataDecisions.md` tracks the highest achievement ID analysed for zone coverage.

## External Resources

Use these references when looking up WoW API, UI source code, frame definitions, or global strings.

| Resource | URL |
|----------|-----|
| WoW UI source (local clone) — Retail / Classic | `../wow-ui-source/live`, `../wow-ui-source/classic` (the kit's `Update-UiSource.ps1`); grep here first, the web rows below are the fallback |
| Warcraft Wiki (API reference) | https://warcraft.wiki.gg/wiki/Warcraft_Wiki |
| FrameXML browser — Retail | https://www.townlong-yak.com/framexml/live |
| FrameXML browser — Classic | https://www.townlong-yak.com/framexml/classic |
| WoW UI source (GitHub) — Retail | https://github.com/Gethe/wow-ui-source/tree/live/Interface/AddOns |
| GlobalStrings — Retail (enUS) | https://www.townlong-yak.com/framexml/live/Helix/GlobalStrings.lua |
| GlobalStrings — Classic (enUS) | https://www.townlong-yak.com/framexml/classic/Helix/GlobalStrings.lua |
| GlobalStrings — Retail (other locales) | https://www.townlong-yak.com/framexml/live/Helix/GlobalStrings.lua/`<LOCALE>` (e.g. `/FR`, `/DE`, `/ES`, `/PT`, `/RU`, `/CN`, `/TW`, `/KR`) |
| WoW UI bug tracker | https://github.com/Stanzilla/WoWUIBugs |
| wow.tools.local (local game DB) | http://localhost:5000 — API query reference: `.claude/skills/verify-achievement-data/API.md` |

## Trust These Instructions

Trust the information in this file first. Search the codebase only when the information here is incomplete or turns out to be wrong for the task at hand, and then fix this file.