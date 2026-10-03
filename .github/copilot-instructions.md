# Project Instructions — Krowi's Achievement Filter

This is the canonical instruction file for every assistant and contributor working in this repository. `CLAUDE.md` imports it and adds only what is specific to Claude Code; `CONTRIBUTING.md` covers the contributor workflow and points here. When this file and another document disagree, fix the other document. Every issue, feature and fix follows the work-item lifecycle in `docs/sdlc-playbook.md` (see Work-Item Lifecycle below).

## Project Summary

**Krowi's Achievement Filter** (prefix `KrowiAF`, acronym `KAF`) is a World of Warcraft addon written in Lua 5.1 + WoW XML. It replaces the Blizzard Achievements UI and adds Expansions / Events / PvP / Specials tabs backed by about 8400 hand-curated achievement records across 1200+ categories, with filtering, sorting, searching and tracking. It ships for both **Retail** (mainline) and **Classic** (Wrath, Cata, Mists) from the same tree.

- **Language**: Lua 5.1 (the WoW embedded interpreter) + WoW XML UI definitions
- **Runtime**: the World of Warcraft client only (no standalone runtime, no npm/pip/cargo)
- **Size**: about 395 Lua files and 109 XML files including the bundled libraries
- **License**: All Rights Reserved (see `LICENSE`)

## Build & Validation

**There is no build step, test suite, external linter or CI in this repository.** The WoW client loads the addon directly from the `.toc` file and is the only full validator. Do not run or invent `luacheck`, `busted`, a Makefile or GitHub Actions; the offline checks that exist live under `.claude/tools/` and install nothing (see below). Packaging and publishing are done by the sibling Krowi Addon Manager project (`.claude/skills/release/SKILL.md` documents how to drive it).

- **Deploy to the game**: the VS Code `fsdeploy` config in `.vscode/settings.json` mirrors `**/*.{lua,blp,tga,xml}` (excluding `.github`, `.vscode`, `_Packaging`, `raw`, `wiki`, `docs`) into `H:\World of Warcraft\_retail_\Interface\AddOns\Krowi_AchievementFilter` and, since 2026-09-23, into the `_classic_` sibling too; the PTR target is commented out there. `.claude/tools/Deploy.ps1` does the same from a terminal and is the way to be sure a client's folder is current: run it with `-WhatIf` before asking for an in-game check, since a reload on a stale install proves nothing.
- **Reload in game**: `/reload`. Enable errors with `/luaerror on` or BugSack + BugGrabber.
- **Static checks**: `.luarc.json` at the repo root configures the Lua language server for any editor: Lua 5.1, the non-addon folders and `Libs/` ignored, the checks that stay off (`undefined-field` and the type-mismatch family; the code has no type annotations), and `diagnostics.globals`. The WoW API, `C_*` namespaces, widget API and the Blizzard FrameXML frames come from the VS Code extension `ketho.wow-api` (with Numy's FrameXML annotations switched on in `.vscode/settings.json`; the extension writes its library path into the user settings so nothing machine-specific lives in the repo), so `diagnostics.globals` holds only what no annotation covers: global strings, Classic-only frames and API, third-party addon globals, and the frames the addon creates by name in Lua or XML. The `luarc` lint rule keeps that list exact (every entry read by an addon file, none assigned by one, sorted), and the `luals` rule runs the language server tree-wide in a full lint. Do not add a name the language server already resolves; if a new global string or third-party global is used, add it sorted or the lint tells you.
- **Validation without the client**: follow existing patterns exactly; register every new Lua file in the right `Files.xml`; declare every new saved variable in the `.toc`; keep XML template names and Lua frame references in sync; run the offline checks below.

### Offline tooling under `.claude/tools/` (self-contained, installs nothing)

The repo carries its own Lua 5.1.5 (`.claude/tools/lua51/lua.exe`, `luac.exe`), the exact interpreter WoW embeds, built from the official lua.org source by `Build-Lua51.ps1` in that folder (its README documents provenance). Prefer it over any Lua on PATH: Lua 5.4 and LuaJIT accept syntax the game rejects.

- **Syntax check** one file, several, or the whole tree (about 0.4 s for 400 files). It strips the UTF-8 BOM first because WoW tolerates one and stock Lua 5.1 does not.

```powershell
& ".claude\tools\lua51\lua.exe" ".claude\tools\lua51\check-syntax.lua" "Globals.lua" "Data\Data.lua"
Get-ChildItem -Recurse -Filter *.lua | Where-Object FullName -notlike '*\.claude\*' | ForEach-Object FullName | & '.claude\tools\lua51\lua.exe' '.claude\tools\lua51\check-syntax.lua' -
```

- **Repo lint** `.claude/tools/Check-Repo.ps1`: unregistered or missing `Files.xml` entries, duplicate achievement IDs per client, saved variables missing from the `.toc`, Lua syntax, assignments to undeclared globals (rule `globals`, from `luac -l`; the deliberate FrameXML overrides and API polyfills are allowlisted per file in `Check-Repo.globals`), the `.luarc.json` globals list against what the code reads and assigns (rule `luarc`), the Lua language server's own diagnostics tree-wide (rule `luals`, only on full runs or with `-Luals`, only when the VS Code extensions `sumneko.lua` and `ketho.wow-api` are installed; pre-existing findings are warnings, findings in changed files errors), BOM and line endings, trailing semicolons and locale strings added above the `AUTOGENTOKEN` marker on changed lines, lookup-script placeholders left filled in, the zone-decisions log against the ZoneData files (rule `zone-decisions`), the Map Verifier CSV (rule `mapverifier`), the work-item folders under `docs/work/` (rule `work-items`: folder name, titles, status line, required headings), the headless data pipeline (rule `data-load`), the headless test suites against their recorded behaviour (rule `unit-tests`), and a changelog reminder. A deliberate exception goes in `Check-Repo.ignore` with a comment; a file whose registration is commented out in an XML is already treated as intentionally disabled.

```powershell
& ".claude\tools\Check-Repo.ps1"               # whole tree, about 12 s plus 30 s for luals (zone-decisions and mapverifier are 7 s); -Verbose prints per-rule timings
& ".claude\tools\Check-Repo.ps1" -ChangedOnly  # only files changed against HEAD, errors instead of warnings; -Luals adds the language-server run
```

- **Headless data pipeline** `.claude/tools/headless/load-data.lua` runs the data load for both clients in the vendored Lua with WoW globals stubbed: it loads `Api/`, `Objects/`, `Data/Data.lua` and `DataAddons/` in toc order inside a sandboxed environment per client, then drives the real task groups the way `LoadOnPlayerLogin` does. Unknown builder methods, misspelled enum members, non-numeric ids and seasons, malformed or mis-suffixed patch keys, duplicate registrations (including AutoFactionSplit mirrors), unregistered build versions, missing injection targets, and every drop the data API reports to `addon.Data.LoadDiagnostics` (references to achievements no data file registers, an event bound to a missing category, a V1 category node no parser branch takes, an `Obtainable()` that matches no form or uses an unknown anchor word) all surface with file and line, in about 0.5 s. An id that exists only on the other client and is referenced from a Shared file is skipped by design, as the game does. A metatable proxy on the achievement registry cross-checks the collector: a lookup of an unregistered id that no drop site reported fails as a "silent drop site", so a new skip cannot go quiet. `Version` anchors on a build version the client never registers are counted per client and printed as a `warning:` line (tracked debt until milestone anchors; `-v` lists them). Extend the stubs in `runClient` when a new WoW global is used at load time.

```powershell
& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\load-data.lua" "$PWD" Both     # what the lint runs; -v lists stubbed globals
# Retail or Classic alone also works, but then every Shared reference to an id that only the other client registers is reported (about 1200 lines on Classic); only Both cross-checks
```

- **Headless test suites** `.claude/tools/headless/run-tests.lua`: runs scenario suites from `Tests/` (shipped in the addon, loaded last) in the vendored Lua with WoW frames and the relevant FrameXML functions modelled from Blizzard's source. Each scenario carries `Recorded`, the behaviour of the current code verified in game, and `Target`, the desired behaviour; a scenario passes when the code still behaves as recorded, and the scenarios whose target is still open are counted separately, so a behaviour change is a reviewable diff of the scenario file and the open defects stay visible without failing anything. `-check` (what the `unit-tests` lint rule runs) prints a `<file>:<line>:` finding per failing scenario. The same scenarios run in game against the real frames: `/kaftest <suite>` (debug mode on, not in combat), or `/kaftest login <suite>` once to re-run after every `/reload` until `/kaftest login off`; a scenario is skipped there, with the reason stored, when state outside the scenario (a target, a foreign popup, an open menu, a UI panel) could have consumed a press. An addon cannot call `ToggleGameMenu` without `ADDON_ACTION_FORBIDDEN` from Blizzard's protected handlers, so the in-game press runs Blizzard's Escape chain as far as an addon may (the 12.1 handler registry on Retail, the legacy chain on Classic; the scenario file documents both and their sources) and the headless model implements the same primitives for both clients (`-client Retail|Classic`, both by default), providing only globals the game really has so a call to a Blizzard local fails there too. Scenarios can carry `RecordedClassic`/`TargetClassic` where the clients differ. The in-game press never shows the game menu itself (its OnShow builds Blizzard's menu buttons in addon execution) and is not made at all when outside state could consume it. A suite can register a readiness check (`addon.Tests.Ready[<suite>]`); a login run waits for it, a manual run reports why it cannot run. Suites: `escape` (Escape-key handling of the addon's frames), `special` (Watch List, Excluded and Tracking membership and the rebuilds their layout options trigger, driven through the real option setters in game and through the reset-and-reload functions headlessly, on fake achievements; the player's own watched and excluded achievements are snapshotted and restored), `navigation` (which navigation buttons each tab of the achievement window shows, Blizzard's 12.1 Back and the addon's browsing-history arrows, issue #325; tabs are selected through the addon's own toggle, and headlessly the real `LoadWithBlizzard_AchievementUI` runs against a model of Blizzard's tab switching; the window and its selected tab are restored), `worldmap` (whether the world map button stays in front of the Classic map when it resizes or another addon sets its strata; the map is opened and resized through the player's paths, and headlessly the real Krowi_WorldMapButtons library and button load against a model of the Mists map; no scenarios on Retail, whose map never sets its own strata; the map's size, open state and `miniWorldMap` CVar are restored, and it refuses to run while ElvUI, GW2_UI or Leatrix Maps is loaded).

```powershell
& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" escape           # -check for the lint form
```

- **Closing the loop with the game**: `Deploy.ps1` mirrors the addon into the client's AddOns folder (incremental, `-WhatIf` to preview), you `/reload` in game, then `Read-GameErrors.ps1` prints the errors BugGrabber recorded for this addon and `Read-GameTests.ps1` prints the last `/kaftest` run with every line that differs from the headless run marked. Saved variables are written only on `/reload` or logout, so both readers show when the file was last written.

```powershell
& ".claude\tools\Deploy.ps1" -WhatIf                    # -Client Classic|Ptr
& ".claude\tools\Read-GameErrors.ps1"                   # -Hours 0 -All -Client Classic
& ".claude\tools\Read-GameTests.ps1"                    # -Client Classic
```

- **Semicolon strip** `Strip-Semicolons.ps1`: removes trailing statement semicolons (a field separator inside a table constructor becomes a comma) through the lexer-aware `lua51/strip-semicolons.lua`, and replaces a file only when `luac -s` produces byte-identical bytecode before and after. Scope is every tracked `.lua` outside `Libs/` and the non-addon folders; `-DryRun` reports without writing, `-Path` limits it to given files.

```powershell
& ".claude\tools\Strip-Semicolons.ps1" -DryRun          # -Path Globals.lua, Filters.lua
```

`.claude/` is excluded from the release zip (any dot-directory is) and from fsdeploy, so nothing in it reaches players or the game folder.

### Data-verification scripts (the only "commands" in the repo)

These PowerShell scripts under `.claude/skills/` query a local game-database server (wow.tools.local at `http://localhost:5000`). Each `SKILL.md` documents the workflow; `.claude/skills/verify-achievement-data/API.md` is the query reference.

```powershell
# Start the DB server if it is not running (waits up to 60 s)
& ".claude\skills\add-zone-data\_start_server.ps1"

# Zone data: every Zone() entry (duplicates, map ids, ids exist on Retail or Classic) and the decisions log
# raw/ZoneDataDecisions.md against the files and the DB. Builds are resolved from the server, never typed.
& "raw\Evaluate-ZoneData.ps1"                                  # -SkipDbCheck for the offline part
& "raw\Evaluate-ZoneDataDecisions.ps1"                         # -SkipDb for the offline part (what Check-Repo runs)

# Verify a data file against the game DB (ids exist, faction splits, title rewards, comments)
& ".claude\skills\verify-achievement-data\Verify-AchievementData.ps1" "DataAddons\Retail\11_TheWarWithin\AchievementData.lua"
& ".claude\skills\verify-achievement-data\Verify-AchievementData.ps1" "<file>" -Checks id-exists,faction,title-reward,description-lang

# Check every achievement in a patch block is placed in some CategoryData.lua
& ".claude\skills\add-category-data\_evaluate_coverage.ps1"   # set $patchKey/$achievementFile/$build inside first

# Batch ID lookup: id|Title|Reward|Faction|RewardItemID
& ".claude\skills\add-achievement-data\_lookup_ids.ps1"        # set $ids (and $build) inside first
```

**Rule for lookup scripts**: edit the placeholder variable (`$ids = @()`, `$terms = @()`) inside the designated script, run it with the same unchanged command, then reset the placeholder. Never write ad-hoc inline `Invoke-RestMethod`/`curl` commands with IDs embedded; the maintainer rejects them, and the `lookup-placeholders` lint rule catches a placeholder left filled in.

## Project Layout

### Entry Point & Load Order

The WoW client reads `Krowi_AchievementFilter.toc`, which defines the **exact load order**. Files load sequentially in the order listed in the `.toc` and the nested `Files.xml` manifests, and a file can only use what earlier files defined. Every new `.lua` file must be added to the right `Files.xml` or it silently never loads. The order is:

1. `Libs/Files.xml` — bundled libraries (Ace3, LibStub, TaintLess, MetaLua, Krowi_* libs)
2. `Api/Files.xml` — public API (`KrowiAF`), enums, data registration functions and builders
3. `Plugins/Files.xml` — plugin integrations (BetterWardrobe, ElvUI, GW2_UI, InstanceAchievementTracker, ZygorGuidesViewer, AchievementsTabFixes, EllesmereUI)
4. `Localization/Files.xml` — locale strings (enUS first, then the other locales, then `Shared.lua`)
5. `Krowi_AchievementFilter.lua` — bootstrap, event handling, load orchestration
6. `Globals.lua` — shared utility functions (achievement chain helpers, achievement info wrappers, zone lookup, filter counting, transmog set checks, modifier keys, month and weekday names)
7. `Diagnostics.lua`, `TaintDiagnostics.lua`, `Options/Files.xml`, `Libs/Krowi_Util/Icon.lua`, `Icon.lua`, `Tutorials.lua`, `BrowsingHistory.lua`
8. `Objects/Files.xml` — core objects (Achievement, Category, Event, Tab, CompareFunc, Flags, BuildVersion, SaturationStyle)
9. `Filters.lua`, `SearchOptions.lua`
10. `Gui/FilesModern.xml` (Retail) or `Gui/FilesClassic.xml` (Classic) — all UI frames and widgets
11. `Data/Files.xml` — runtime data management, event timers, tooltip data, saved data
12. `DataAddons/Shared/Files.xml`, then `DataAddons/Retail/Files.xml` or `DataAddons/Classic/Files.xml` — achievement/category/zone/event data per expansion
13. `DataAddons/Loaders/Files.xml` — post-processing loaders that wire the data tables to their processors

Game-version-conditional loading uses `[AllowLoadGameType mainline]` and `[AllowLoadGameType wrath, cata, mists]` directives in the `.toc`. In code, use `addon.Util.IsMainline`, `addon.Util.IsClassicWithAchievements`, `addon.Util.IsWrathClassic` (from `Libs/Krowi_Util`).

### Root Files

| File | Purpose |
|------|---------|
| `Krowi_AchievementFilter.toc` | Addon metadata + load manifest (Interface versions, SavedVariables, OptionalDeps) |
| `Krowi_AchievementFilter.lua` | Main entry: event handling (`ADDON_LOADED`, `PLAYER_LOGIN`), load orchestration |
| `Globals.lua` | Shared utility functions used across the addon: achievement chain helpers, `addon.GetAchievementInfo`/`GetAchievementInfoTable`, the custom-criteria wrappers, zone lookup, filter counting, transmog set checks, modifier keys, month and weekday names. The cache build, the special category trees, the task runner, the Blizzard overrides and the movable-window helpers used to live here too and were split out on 2026-09-19 (see `Data/` and `Gui/` below) |
| `Bindings.xml` | Key binding definitions for tab toggles and browsing history |
| `Filters.lua` | Filter definitions (completion, faction, reward type, sort, build version) |
| `SearchOptions.lua` | Search configuration (which fields to search: IDs, names, descriptions, etc.) |
| `Diagnostics.lua`, `TaintDiagnostics.lua` | Debug/trace logging controlled by options; taint probing helpers |
| `Icon.lua` | Minimap / data broker icon behaviour |
| `Tutorials.lua` | In-game tutorial system |
| `BrowsingHistory.lua` | Achievement navigation history (back/forward) |

### Key Directories

| Directory | Purpose |
|-----------|---------|
| `Api/` | Public API surface (`KrowiAF` global, created in `Api/API.lua`): enums, data registration functions (`AchievementDataApi`, `CategoryDataApi`, ...), the fluent builders (`AchievementDataBuilder`, `CategoryDataBuilder`, `ZoneDataBuilder`, `BuildVersionDataBuilder`) and `PluginsApi`. `ApiDocumentation.lua` holds example data structures. |
| `Objects/` | Metatable classes (`x.__index = x; function x:New()`): `Achievement`, `Category`, `Event`, `Tab`, `BuildVersion`, `Flags`, `CompareFunc`, `SaturationStyle`. |
| `Gui/` | All UI code, split into `FilesModern.xml` (Retail) and `FilesClassic.xml` (Classic). Root files: `Gui.lua` (tabs, sub-frames, the reshaping of `AchievementFrame`), `FramesForClosing.lua` (Escape handling), `BlizzardOverrides.lua` (`addon.OverwriteFunctions`, `addon.LoadBlizzardApiChanges`, `addon.HookFunctions`: the FrameXML functions the addon replaces, the polyfills for removed API and the hooks on Blizzard's achievement frame, all run in boot phase 2), `MovableFrames.lua` (`addon.MakeMovable`, `MakeWindowMovable`, `MakeWindowStatic`). Sub-folders: `WindowFrames/` (AchievementsFrame, CategoriesFrame, FilterButton, Search, SummaryFrame, AchievementButton, ...), `AchievementTooltip/`, `AchievementCalendar/`, `AchievementPopout/`, `EventReminder/`, `RightClickMenu/`, `DataManager/`, `WorldMapButton/`, `FloatingAchievementTooltip/`, `BrowsingHistory/`, `Collections/`, `RewardPreview/`, `SnapFrame/`. |
| `Data/` | Runtime data management: `TaskRunner.lua` (`addon.StartTasksGroups`, the frame-budgeted task-group runner), `Data.lua` (central registry, registers the data chunks as task groups), `LoadDiagnostics.lua` (`addon.Data.LoadDiagnostics`, the collector every drop site in the data API reports to; each task group starts with a `SetSource` task so a report names its data file, and the summary prints in debug mode after login), `AchievementCache.lua` (`addon.BuildCacheAsync`, the coroutine that walks every achievement id after the data load, plus `ResetCache` and `OnAchievementEarned`), `TemporaryObtainable.lua`, `EventData.lua`, `CustomWidgetEventTimers.lua`, `CustomWorldEventTimers.lua`, `TooltipData.lua`, `RewardPreviewData.lua`, `SpecialCategories.lua` (the special category matrix: Summary, Watch List, Excluded, ...), `SpecialCategoryAchievements.lua` (`addon.WatchAchievement`, `ExcludeAchievement`, `IncludeAchievement`, ...: adding achievements to the special categories and building their mirrored sub-category trees), `DataIntegrityManager.lua` (saved-variable migrations), `SavedData/` (persistence). |
| `DataAddons/` | All achievement, category, zone, tooltip, transmog set, pet battle link, build version, event and custom criteria **data definitions**, organised per expansion (`01_Vanilla/` through `12_Midnight/`). `Shared/` holds data identical on both clients, `Retail/` and `Classic/` the client-specific entries, `Loaders/` the post-processing that wires raw tables into the runtime. |
| `Options/` | AceConfig-based options panels: `Defaults.lua`, `General.lua`, `Layout.lua`, `EventReminders.lua`, `Profiles.lua`, `Plugins.lua`, `Credits.lua`. |
| `Plugins/` | Third-party addon integrations (see load order step 3). The plugin API itself is `Api/PluginsApi.lua` (`KrowiAF.PluginsApi`). |
| `Localization/` | One file per locale (`enUS`, `deDE`, `esES`, `esMX`, `frFR`, `itIT`, `koKR`, `ptBR`, `ruRU`, `zhCN`, `zhTW`) plus `.Plugins.lua` and `.WrathClassic.lua` variants and `Shared.lua` helpers. See Localization below for the editing rules. |
| `Libs/` | Vendored libraries: Ace3 suite, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, LibDeflate, LibSerialize, MetaLua, TaintLess, and the `Krowi_*` libraries. `Krowi_Menu`, `Krowi_ProgressBar`, `Krowi_WorldMapButtons`, `Krowi_Tutorials`, `Krowi_Util`, `Krowi_PopupDialog` are git submodules pointing at `TheKrowi/*` repos. **Do not edit `Libs/` unless asked**; fixes belong upstream. |
| `Media/` | Texture assets (`.blp`). |
| `Tests/` | In-game test runner (`/kaftest`) and the scenario suites it shares with the headless runner under `.claude/tools/headless/`. Loaded last; only active in debug mode. |
| `_Packaging/` | Changelog, release notes and CurseForge description. Not loaded by the game. |
| `docs/`, `wiki/`, `raw/` | Non-code material, see Where Non-Code Material Lives. Not loaded by the game. |
| `.claude/` | Offline tooling (vendored Lua, lint, headless pipeline, deploy and error readers), skills, subagents and hooks. Not loaded by the game, not shipped. |

## Architecture

### Two namespaces

Every file starts `local _, addon = ...` (or `local addonName, addon = ...`). `addon.*` is the private namespace (`addon.Data`, `addon.Gui`, `addon.Objects`, `addon.Options`, `addon.Filters`, `addon.Diagnostics`, `addon.Plugins`, ...). `KrowiAF` is the public surface: enums (`KrowiAF.Enum.Faction`, `RewardType`, `EventType`, ...), data-registration tables (`KrowiAF.AchievementData`, `KrowiAF.CategoryData`, ...), the builder `KrowiAF.Ach`, and `KrowiAF.PluginsApi`. `KROWI_LIBMAN` is the library manager from `Libs/Krowi_Util/LibMan.lua`. Data files write only to `KrowiAF.*`; runtime code reads `addon.Data.*`.

### Three-phase boot (`Krowi_AchievementFilter.lua`)

1. `ADDON_LOADED` for this addon: options, saved-data migrations (`Data/DataIntegrityManager.lua`), plugins, GUI parts that do not depend on Blizzard's frame.
2. `ADDON_LOADED` for `Blizzard_AchievementUI` (load-on-demand): `addon.Gui:LoadWithBlizzard_AchievementUI()` hooks and reshapes `AchievementFrame`. Anything touching Blizzard achievement frames goes here, not in phase 1.
3. `PLAYER_LOGIN`: `addon.Data:LoadOnPlayerLogin()` builds all achievement/category/zone objects, then `addon.BuildCacheAsync` (in `Data/AchievementCache.lua`) walks every achievement ID. Both run as coroutine-style task groups yielding on a per-frame time budget. **`addon.Data.Achievements` is empty until phase 3 completes**; code that needs populated data must hook into `PostLoadOnPlayerLogin` / `PostBuildCache` in `Data/Data.lua`.

### Data pipeline (the "invisible magic")

Data files declare bare tables and never call processing functions:

```lua
KrowiAF.AchievementData["11_01_00"] = {   -- key = EE_PP_SS (expansion, major, minor); "_S" suffix = Shared
    Ach(41234):Mount(),                    -- V2 fluent builder, Api/AchievementDataBuilder.lua
}
```

`DataAddons/Loaders/*.lua` (loaded last) prepend the processor function at index 1 of each chunk (e.g. `KrowiAF.AddEventData`). `Data/Data.lua`'s `Register*DataTasks` push each chunk into `TasksGroups`; the runner (`addon.StartTasksGroups`, `Data/TaskRunner.lua`) calls `chunk[1](unpack(rest))`. For achievements, `Data.lua` also inserts `{KrowiAF.SetAchievementPatch, major, minor, patch}` derived from the table key (first-party data files never write that line themselves), and `Ach()` entries resolve to `KrowiAF.AddAchievementData`, which constructs `addon.Objects.Achievement`. Registering the same ID twice hits an `assert`, so each achievement lives in exactly one place: Shared (`DataAddons/Shared/EE_.../`, identical on both clients) or the Retail/Classic file (client-specific entries only). Classic-only patches are never migrated to Shared.

A `"Version"` anchor in an `Obtainable()` names the patch **as Retail shipped it**. `BuildVersionData.lua` only registers patches (provenance and the build-version filter); when each client reached a patch's content is a separate table. Retail has none: an anchor is its own patch. Classic's `DataAddons/Classic/ContentTimeline.lua` maps the Retail patch to the patch where Classic reached that content, `["5.4.0"] = "5.5.4", -- Siege of Orgrimmar`, and every patch it maps to also stands for itself. `KrowiAF.ResolveVersionAnchor` does the lookup; a Retail patch missing from the table means that content has not happened on this client, so an end anchor leaves the achievement obtainable with no end scheduled (not Time Limited) and a start anchor reads as future. Every anchor must resolve on Retail, the reference timeline; the headless pipeline fails otherwise and counts the unresolved ones on Classic as information. Never round an anchor to a nearby patch: register the patch the data refers to, the build-version filter lists only patches some achievement was added in.

A drop is a data defect until proven intentional. Any place in the data API that skips or drops an entry reports it to `addon.Data.LoadDiagnostics` (`Data/LoadDiagnostics.lua`) with one of its `Kind`s instead of returning silently; the headless pipeline reads that table and fails on a lookup of an unregistered id that nothing reported. When adding a new drop site, add the `Report` call with it.

Per-expansion folder contents: `AchievementData`, `CategoryData`, `ZoneData` (one per expansion, never per patch), `TooltipData`, `TransmogSetData`, `PetBattleLinkData`, `CustomCriteriaData`, `EventData`, `BuildVersionData`.

### Objects and filters

`Objects/*.lua` are metatable classes. `Achievement` carries patch, faction, reward type, PvP/season flags, and a list of temporary-obtainable records; `Data/TemporaryObtainable.lua` resolves those to Past/Current/Future using season anchors registered via `KrowiAF.AddSeasonData`. `Filters.Validate` returns a signed integer (negative = rejected by rule `i`, `1` = show, `2` = always visible), not a boolean.

### Taint is the recurring bug class

Most recent fixes (see the dev notes in `_Packaging/Changelog.md`) are taint or secret-value errors. Never override Blizzard API functions (`GetAchievementCriteriaInfo`, `GetAchievementNumCriteria` and the like); that approach was removed years ago and its leftovers still cause bugs. The only globals the addon writes on purpose are the FrameXML UI functions it replaces in `addon.OverwriteFunctions` and the polyfills for removed API in `addon.LoadBlizzardApiChanges` (both in `Gui/BlizzardOverrides.lua`); they are listed in `.claude/tools/Check-Repo.globals` and the `globals` lint rule fails on any other write to the global environment. Do not compare or do arithmetic on values from `C_Calendar`, aura, or objective-tracker APIs without considering `SecretInChatMessagingLockdown`. `TaintDiagnostics.lua` and `Diagnostics.lua` exist for probing this; `addon.Diagnostics.DebugEnabled()` gates debug paths.

### Saved variables and migrations

Declared in the `.toc` `## SavedVariables` line: `KrowiAF_DebugTable`, `KrowiAF_Options`, `KrowiAF_SavedData`, `KrowiAF_Filters`, `KrowiAF_SearchOptions`, `KrowiAF_Achievements`, `KrowiAF_MapVerifier`. A new one that is not listed there is lost on logout. Schema changes go through numbered solutions in `Data/DataIntegrityManager.lua`, which run in order on version upgrade.

### Localization

`Localization/enUS.lua` opens with a few lines of code, then the `AUTOGENTOKEN` comment, then the string list with its `-- [[ Exported at ... ]] --` line. Add new strings directly below that `Exported at` line, never above the marker; every locale file has the same layout and the same rule. A string that is added or renamed is updated in **every** locale file, not only enUS: carry an existing translation over to a renamed key, and translate a new one. Plugin strings go in `enUS.Plugins.lua`, Wrath-specific strings in `enUS.WrathClassic.lua`. Guide: `docs/how-to/update-localization.md`.

## Adding New Data (the most common task)

### Achievement data format — V2 (current standard)

All achievement entries use `KrowiAF.AchievementData` with the fluent `Ach()` builder, on every expansion and both clients, including new patches added to old expansion files. All first-party data is V2 — achievement data and, since 2026-09-21, category data too; the V1 positional parser in `Api/CategoryDataApi.lua` remains only for plugins and must not be removed, because it is the documented plugin entry point (`Api/ApiDocumentation.lua`).

File header (add `local _, addon = ...` only if `addon` is actually used):

```lua
local Ach = KrowiAF.Ach
local faction = KrowiAF.Enum.Faction -- only if FactionSplit is used
```

New patch table (the patch record is derived from the key by `Data/Data.lua`; do not write it):

```lua
KrowiAF.AchievementData["11_01_00"] = {
    Ach(12345), -- Name
    Ach(12346):Mount(), -- reward type
    Ach(12347):Title():PvE(15), -- reward + season
    Ach(12348):FactionSplit(faction.Alliance, 12349), -- faction split
}
```

### Category data format — V2 (current standard)

Every first-party `CategoryData*.lua` is V2 (migrated 2026-09-21). A category is built with the fluent builder, never as a positional table:

```lua
local expansion = KrowiAF.NewExpansion(CT.Midnight, { 62387 })   -- an expansion, in DataAddons/*/XX_*/CategoryData.lua
KrowiAF.CategoryData.Events = KrowiAF.NewTabCategory("Events", addon.L["Events"], 884)   -- a tab root

local zones = expansion:Zones{ 62386 }      -- typed containers: :Character :Zones :Delves :Dungeons :Raids :Professions :PetBattles
local quelThalas = zones:Zone(2537)         -- :Zone(uiMapId), :Raid/:Dungeon(journalId), :Delve(areaPoiId) — a zone may hold zones
quelThalas:Quests{ 62110, 42045 }           -- zone sub-containers :Quests :Exploration :PvP :Reputation, which merge
expansion:Named(CT.Prey, { 62191 }):Merge():WithId(2570)   -- anything else; :Named NEVER merges, :Merge() is explicit
```

- `:Merge()` is always written out. The only implicit merges are the zone sub-containers and the 13 profession helpers.
- `:WithId(n)` declares a category id. Declared ids are the plugin contract (`KrowiAF.NewInjection(971)`) and must never change; without one a category draws an auto-allocated id that is a parse position and must not be relied on or persisted.
- `:Key("Name")` gives a category a stable string handle for `KrowiAF.NewInjection` to target instead — preferred for anything new that another file must attach to.
- **Any change to a category file must leave `.claude/tools/headless/snapshots/` unchanged**, or the diff must be reviewed and committed with it. The `category-snapshot` lint rule enforces this; see `docs/how-to/migrate-category-data.md`.

### Steps for adding new achievements

1. Add the achievement data to the appropriate `DataAddons/<Retail|Classic|Shared>/XX_ExpansionName/AchievementData.lua`. Canonical references: `DataAddons/Retail/11_TheWarWithin/`, `Api/ApiDocumentation.lua`, `wiki/achievement-data/achievement-data-format.md`.
2. Add category data in the corresponding `CategoryData.lua`, in the V2 form above (`wiki/achievement-data/category-data-format.md`, `docs/category-data-reference.md`).
3. If achievements have zone associations, update the expansion's `ZoneData.lua` (`wiki/achievement-data/zone-data-format.md`, `raw/ZoneDataDecisions.md`).
4. If achievements have tooltip extras, update `TooltipData.lua`.
5. Update `BuildVersionData.lua` if a new patch version is introduced, or if an `Obtainable()` anchor names a patch not yet registered (`minor:Patch(n, addon.L["Name"])`; when a Classic re-release reaches new content, add its Retail patches to `DataAddons/Classic/ContentTimeline.lua`).
6. The `DataAddons/Loaders/` scripts process the tables automatically; no manual wiring is needed.
7. Run the headless pipeline (or the repo lint) and the data-verification scripts above.

Step-by-step guides in `docs/how-to/`: `add-patch-achievements.md`, `add-expansion.md`, `add-event.md`, `update-localization.md`.

## Code Style Conventions

These rules apply to **all** new and edited code. Follow them without being asked.

- **Files**: UTF-8 without BOM, CRLF line endings, 4-space indent, no final newline (`.editorconfig`). The `bom` and `line-endings` lint rules enforce the first two.
- **Editing tools**: edit with an editor, the Edit/Write tools, or PowerShell. Git Bash `sed -i` and `awk` on this machine rewrite the whole file with LF endings (and `awk` adds a final newline) even when the pattern does not match, so a "no-op" `sed` silently breaks the `line-endings` rule on every file it touched. Use Bash only for read-only work: grep, diff, git, running the vendored Lua.

### File header

Every file starts with the vararg unpack. Use `_` for unused positional variables. Do **not** add a `-- [[ Namespaces ]] --` (or similar) banner above it.

```lua
-- correct: addonName not used
local _, addon = ...

-- correct: both used
local addonName, addon = ...
```

### Semicolons

Do **not** end statements with semicolons. The whole tree was stripped on 2026-09-11 (7593 semicolons in 221 files, proven identical through `luac -s` bytecode), so any trailing semicolon is new. The `semicolon` lint rule fails on one on an added line; `.claude/tools/Strip-Semicolons.ps1` re-runs the same verified strip if a batch of them ever comes back (a CurseForge locale export, an upstream merge).

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

Work moves through the six stages of Anthropic's AI-native SDLC Playbook, adapted in `docs/sdlc-playbook.md`: Plan, Design, Build, Test, Deploy and Maintain. The `process-issue` skill runs it in Claude Code.

- Each GitHub issue, feature or fix gets a folder `docs/work/<issue>-<slug>/` (templates in `docs/work/_template/`). It holds `intent.md` (what is wanted and why), `spec.md` (requirements, root cause, design, options, areas of concern, the decision) and `plan.md` (files that change, order of work, risks, proof). They are committed on the work branch, and each is the next stage's input. Routine data work under a data skill, documentation-only changes and releases need no folder.
- The maintainer holds every gate: accepting the intent, approving the spec's design choice, approving a non-routine plan, the in-game before-run for GUI work, approving the merge of the PR, and the release. An agent stops at each gate with a recommendation and records the answer in the artifact. It merges a PR only when the maintainer tells it to, and then with a merge commit (`gh pr merge <n> --merge`). It never pushes work-item commits straight to `dev` and never releases.
- A bug fix is built test first. A scenario in `Tests/` records the buggy behaviour as `Recorded` and the spec's behaviour as `Target`; then only the code is fixed, and `Recorded` is set to `Target`. Every fixed bug leaves its scenario behind.
- Review passes, severity and exclusions are in `REVIEW.md`. What a work item taught goes back into this file, a skill, a lint rule or a scenario (`docs/sdlc-playbook.md`, stage 6).

## Git Workflow

- Branch from `dev`; PRs target `dev`. Releases are cut on `dev`: the addon manager makes a `Release X.Y` commit and tag there and uploads to Wago, CurseForge and GitHub. `main` is not updated as part of the release flow.
- Conventional Commits with a custom `data:` type: `data(midnight): add 12.1.0 achievements (23)`, `fix(retail): ...`, `feat(classic): ...`, `locale(enUS): ...`, `chore:`, `refactor(gui):`, `docs:`. The full type and scope tables are in `CONTRIBUTING.md`.
- Every user-visible change gets a line in `_Packaging/Changelog.md` under the next version's `### Added` / `### Fixed`. Non-obvious fixes carry a `(dev note: ...)` explaining the root cause, following the existing entries. `ReleaseNotes.md` is generated from it at release time; do not edit it by hand. The version header needs a date (`## 100.2 - 2026-09-04`) before release or the generator skips it.
- PR checklist (`.github/pull_request_template.md`): work folder, a reproducing scenario for a bug fix, `Files.xml` registration, SavedVariables, enUS strings below the `Exported at` line, changelog, lint and the `REVIEW.md` passes, tested Retail/Classic.
- GitHub issues and PRs: `gh` calls may be executed without asking first, reads and writes alike (view, comment, close, label, create a PR against `TheKrowi/Krowi_AchievementFilter`). When the fix for a reported issue is on `dev` (the maintainer merged its PR, or committed it there themselves), close the issue as completed with a one-line comment naming the commit and when it ships, the way the maintainer's own closing comments read; `Closes #N` in a PR does not fire because `dev` is not the default branch. `gh` is the portable install in `%LOCALAPPDATA%\Programs\gh\bin` on the user PATH, logged in as `TheKrowi`. Git Bash does not see it (Claude Code's Bash tool gets `command not found`), nor does a shell started before 2026-09-30, so call it from PowerShell by its full path: `& "$env:LOCALAPPDATA\Programs\gh\bin\gh.exe"`. Merging a PR is not among the calls made without asking; see Work-Item Lifecycle.

## Where Non-Code Material Lives

- `docs/sdlc-playbook.md` the work-item lifecycle; `docs/work/<issue>-<slug>/` one folder per work item (`intent.md`, `spec.md`, `plan.md`), templates in `docs/work/_template/`; `REVIEW.md` at the root the review policy every review pass reads. None of it ships: the release zip skips `docs/` and every `.md` file.
- `docs/how-to/` step-by-step guides; `docs/category-data-reference.md` the category tree reference; `docs/codebase-analysis.md` a quality review listing known debt (O(n^2) `GetMergedCategory`, the V1 category parser kept for plugins, and the fixed items with their root causes). Its priority table carries the status of each item; check it before trusting the prose above it.
- `wiki/` knowledge base on data formats with `index.md` and a `log.md` of changes.
- `raw/` scratch reports and zone-data PowerShell tooling; `raw/MapVerifier.csv` is the canonical Map Verifier state (map verdicts, link groups, expansions; round-tripped with the in-game tool through the `sync-mapverifier` skill, validated by the `mapverifier` lint rule); `raw/ZoneDataDecisions.md` tracks the highest achievement ID analysed for zone coverage.
- `_Packaging/` changelog, release notes, CurseForge description.

## External Resources

Use these references when looking up WoW API, UI source code, frame definitions, or global strings.

| Resource | URL |
|----------|-----|
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