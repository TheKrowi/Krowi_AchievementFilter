# Copilot Instructions — Krowi's Achievement Filter

## Project Summary

This is a **World of Warcraft addon** (Lua + XML) called "Krowi's Achievement Filter" (prefix `KrowiAF`, acronym `KAF`). It replaces the default WoW Achievements UI with enhanced tabs (Achievements, Expansions, Events, PvP, Specials), adding 6400+ achievements across 1200+ categories with advanced filtering, sorting, searching, and tracking. It supports both **Retail** (mainline) and **Classic** (Wrath, Cata, Mists) WoW clients.

- **Language**: Lua 5.1 (WoW embedded) + WoW XML UI definitions
- **Runtime**: World of Warcraft client (not standalone; no external build system, no npm/pip/cargo)
- **Size**: ~368 Lua files, ~102 XML files across the addon and its bundled libraries
- **License**: All Rights Reserved (see `LICENSE`)

## Build & Validation

**There is no build step, CI pipeline, test suite, linter, or packaging script in this repository.** The addon is loaded directly by the WoW client from the `.toc` file. There are no GitHub Actions workflows, no Makefile, no shell/batch scripts, and no `.pkgmeta` file.

- **No commands to run.** Changes are validated by loading the addon in the WoW client.
- **No automated tests exist.** Do not attempt to run `luacheck`, `busted`, or any test framework — none is configured.
- The `.gitignore` only excludes Excel temp files (`~$*xlsx`).
- VS Code Lua language server diagnostics are configured in `.vscode/settings.json` with an extensive list of WoW global API functions in `Lua.diagnostics.globals`. When adding code that uses new WoW API globals, they may need to be added to this list to suppress diagnostics.

### Validation Approach

Since there is no automated validation, ensure correctness by:
1. Following existing code patterns exactly (naming, style, structure).
2. Ensuring any new Lua files are registered in the appropriate `Files.xml` manifest.
3. Ensuring any new saved variables are declared in `Krowi_AchievementFilter.toc` under `## SavedVariables`.
4. Verifying that XML template names and frame references match across `.xml` and `.lua` files.

## Project Layout

### Entry Point & Load Order

The WoW client reads `Krowi_AchievementFilter.toc` which defines the **exact load order** — this is critical. Files are loaded sequentially in the order listed in the `.toc` and nested `Files.xml` manifests. The load order is:

1. `Libs/Files.xml` — Third-party and custom libraries (Ace3, LibStub, Krowi_* libs)
2. `Api/Files.xml` — Public API, enums (`KrowiAF.Enum.*`), data registration functions
3. `Plugins/Files.xml` — Plugin integrations (ElvUI, GW2_UI, BetterWardrobe, IAT, Zygor)
4. `Localization/Files.xml` — Locale strings (enUS first, then all other locales, then `Shared.lua`)
5. `Krowi_AchievementFilter.lua` — Main addon bootstrap, event handling, load orchestration
6. `Globals.lua` — Global utility functions (achievement chain helpers, zone lookup, filter counting)
7. `Diagnostics.lua`, `Options/Files.xml`, `Icon.lua`, `Tutorials.lua`, `BrowsingHistory.lua`
8. `Objects/Files.xml` — Core data objects (Achievement, Category, Event, Tab, CompareFunc, Flags, BuildVersion)
9. `Filters.lua`, `SearchOptions.lua`
10. `Gui/FilesModern.xml` (Retail) or `Gui/FilesClassic.xml` (Classic) — All UI frames/widgets
11. `Data/Files.xml` — Static data, event timers, tooltip data, saved data management
12. `Data/Retail/` or `Data/Classic/` — Game-version-specific data (e.g., exported UI maps)
13. `DataAddons/Shared/`, `DataAddons/Retail/` or `DataAddons/Classic/` — Achievement/category/event data per expansion
14. `DataAddons/Loaders/Files.xml` — Post-processing loaders that wire up data tables

Game-version-conditional loading uses `[AllowLoadGameType mainline]` and `[AllowLoadGameType wrath, cata, mists]` directives in the `.toc`.

### Root Files

| File | Purpose |
|------|---------|
| `Krowi_AchievementFilter.toc` | Addon metadata + load manifest (Interface version, SavedVariables, dependencies) |
| `Krowi_AchievementFilter.lua` | Main entry: event handling (`ADDON_LOADED`, `PLAYER_LOGIN`), load orchestration |
| `Globals.lua` | Shared utility functions used across the addon |
| `Bindings.xml` | Key binding definitions for tab toggles and browsing history |
| `Filters.lua` | Filter definitions (completion, faction, reward type, sort, build version) |
| `SearchOptions.lua` | Search configuration (what fields to search: IDs, names, descriptions, etc.) |
| `Diagnostics.lua` | Debug/trace logging controlled by options |
| `Icon.lua` | Minimap/data broker icon behavior |
| `Tutorials.lua` | In-game tutorial system |
| `BrowsingHistory.lua` | Achievement navigation history (back/forward) |

### Key Directories

| Directory | Purpose |
|-----------|---------|
| `Api/` | Public API surface (`KrowiAF` global table). Defines enums, data registration functions (AchievementDataApi, CategoryDataApi, etc.), and the plugin API. `ApiDocumentation.lua` contains example data structures. |
| `Objects/` | Core OOP-style objects: `Achievement`, `Category`, `Event`, `Tab`, `BuildVersion`, `Flags`, `CompareFunc`, `SaturationStyle`. Each uses metatables (`__index` pattern). |
| `Gui/` | All UI code. Split into `FilesModern.xml` (Retail) and `FilesClassic.xml` (Classic). Sub-folders: `WindowFrames/` (main frames: AchievementsFrame, CategoriesFrame, FilterButton, Search, SummaryFrame, AchievementButton), `AchievementTooltip/`, `AchievementCalendar/`, `EventReminder/`, `RightClickMenu/`, `DataManager/`, `WorldMapButton/`, `FloatingAchievementTooltip/`, `BrowsingHistory/`, `Collections/`. |
| `Data/` | Runtime data management: `Data.lua` (central data registry), `EventData.lua`, `TooltipData.lua`, `TemporaryObtainable.lua`, `SpecialCategories.lua`, `DataIntegrityManager.lua`, `SavedData/` (persistence). Sub-folders `Retail/` and `Classic/` hold game-version-specific exported maps. |
| `DataAddons/` | All achievement, category, event, zone, tooltip, transmog set, pet battle link, build version, and custom criteria **data definitions** organized by expansion (`01_Vanilla/` through `12_Midnight/`). `Shared/` has data common to both Retail and Classic. `Loaders/` contains post-processing scripts that wire raw data into the addon's runtime tables. |
| `Options/` | AceConfig-based options panels: `Defaults.lua`, `General.lua`, `Layout.lua`, `EventReminders.lua`, `Profiles.lua`, `Plugins.lua`, `Credits.lua`. |
| `Plugins/` | Third-party addon integrations: `ElvUI.lua`, `GW2_UI/`, `BetterWardrobe.lua`, `InstanceAchievementTracker.lua`, `ZygorGuidesViewer.lua`, `AchievementsTabFixes.lua`. |
| `Localization/` | Locale files per language (`enUS`, `deDE`, `frFR`, `ptBR`, `ruRU`, `zhCN`, `zhTW`) plus `.Plugins.lua` and `.WrathClassic.lua` variants. `enUS.lua` is auto-generated from CurseForge — do not manually edit the auto-generated section below the `AUTOGENTOKEN` comment. `Shared.lua` has helper functions used across locales. |
| `Libs/` | Bundled libraries: Ace3 suite (AceDB, AceConfig, AceGUI, AceEvent, AceTimer, AceSerializer), LibStub, CallbackHandler, LibDataBroker, LibDBIcon, LibDeflate, LibSerialize, MetaLua, TaintLess, and custom `Krowi_*` libraries (Krowi_Util, Krowi_Menu, Krowi_PopupDialog, Krowi_Tutorials, Krowi_ProgressBar, Krowi_WorldMapButtons). **Do not modify files in `Libs/` unless specifically asked** — these are vendored dependencies. |
| `_Packaging/` | Release notes, changelog, and CurseForge description (not loaded by the addon). |
| `Media/` | Texture assets (`.blp` files). |

### Addon Namespace Pattern

All Lua files use `local addonName, addon = ...;` (or `local _, addon = ...;`) to receive the shared addon table. The addon namespace is private. The public API is exposed via the `KrowiAF` global table (created in `Api/API.lua`). Key globals:
- `KrowiAF` — Public API and data registration
- `KrowiAF.Enum.*` — Enums (Faction, RewardType, EventType)
- `KrowiAF.AchievementData`, `KrowiAF.CategoryData`, etc. — Data registration tables
- `KROWI_LIBMAN` — Library manager (from `Krowi_Util/LibMan.lua`)
- `addon.*` sub-tables: `addon.Data`, `addon.Objects`, `addon.Gui`, `addon.Options`, `addon.Filters`, `addon.Diagnostics`, `addon.Plugins`, etc.

### Saved Variables

Declared in the `.toc`: `KrowiAF_DebugTable`, `KrowiAF_Options`, `KrowiAF_SavedData`, `KrowiAF_Filters`, `KrowiAF_SearchOptions`, `KrowiAF_Achievements`.

### Adding New Data (Common Task)

To add new achievements for a new patch or expansion content:
1. Add achievement data in the appropriate `DataAddons/Retail/XX_ExpansionName/AchievementData.lua` file following the pattern in `Api/ApiDocumentation.lua`.
2. Add category data in the corresponding `CategoryData.lua`.
3. If achievements have zone associations, update the corresponding `ZoneData.lua`.
4. If achievements have tooltip extras, update `TooltipData.lua`.
5. Update `BuildVersionData.lua` if a new patch version is introduced.
6. The `DataAddons/Loaders/` scripts automatically process data — no manual wiring needed beyond placing data in the correct tables.

For step-by-step guides on the most common data tasks, see `docs/how-to/`:
- `docs/how-to/add-patch-achievements.md` — adding achievements for a new patch
- `docs/how-to/add-expansion.md` — creating a new expansion data folder
- `docs/how-to/add-event.md` — adding a new in-game world event
- `docs/how-to/update-localization.md` — adding localization strings

### Code Style Conventions

- Semicolons at end of statements: **no** — do not add semicolons in new or changed code. Existing semicolons may remain, but removing them is advised when working on surrounding code.
- Local variables use `camelCase`; object constructors/methods use `PascalCase`.
- Tables as namespaces: `addon.ModuleName = {}; local moduleName = addon.ModuleName;`
- Metatables with `__index` for OOP: `obj.__index = obj; function obj:New(...) ... setmetatable({}, obj) ... end`
- String concatenation with `..` operator.
- WoW API calls are used directly (no wrappers unless specifically needed).

## Important Notes

- The `Localization/enUS.lua` file contains an auto-generated section from CurseForge (marked with `AUTOGENTOKEN`). Do not edit content after that marker manually.
- `Plugins/Plugins.lua` is entirely commented out — the plugin system now works through `Api/PluginsApi.lua` and the `KrowiAF.PluginsApi` global.
- Conditional loading for Retail vs Classic is handled in the `.toc` file via `[AllowLoadGameType]` directives and in code via `addon.Util.IsMainline`, `addon.Util.IsClassicWithAchievements`, etc.

## Contributing & Commit Convention

Branching, PR expectations, and commit conventions are documented in `CONTRIBUTING.md`. The short version:
- Branch from `dev`; PRs target `dev`; `dev` merges to `main` at release.
- Commits follow Conventional Commits with a custom `data:` type for achievement/event/zone data additions (the most frequent change type). Examples: `data(midnight): add 12.1.0 achievements (23)`, `fix(retail): achievement mouseover error`, `locale(enUS): add event filter strings`.

## Trust These Instructions

Always trust the information in this file first. Only perform additional codebase searches if the information here is incomplete or found to be incorrect for the specific task at hand.
