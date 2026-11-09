# Architecture reference

The rules (the two namespaces, the three-phase boot, taint, background jobs) are in `CLAUDE.md`, and the rules for one area of code (data, events, features, localization, tests, release) are in `.claude/rules/`. This file is the load order, the file map and the mechanics behind them, read when a task touches that part of the code.

## Load order

The WoW client reads `Krowi_AchievementFilter.toc`, which defines the **exact load order**. Files load sequentially in the order listed in the `.toc` and the nested `Files.xml` manifests, and a file can only use what earlier files defined. Every new `.lua` file must be added to the right `Files.xml` or it silently never loads (the `files-xml` rule). The order is:

1. `Libs/Files.xml` — bundled libraries, the options window's `Krowi_Options` among them
2. `Api/Files.xml` — public API (`KrowiAF`), enums, data registration functions and builders
3. `Plugins/Files.xml` — plugin integrations (BetterWardrobe, ElvUI, GW2_UI, InstanceAchievementTracker, ZygorGuidesViewer, AchievementsTabFixes, EllesmereUI)
4. `Localization/Files.xml` — enUS first, then the other locales, then `Shared.lua`
5. `Krowi_AchievementFilter.lua`, `Globals.lua`, `Slots.lua` — the core's extension points for the features
6. `Diagnostics.lua`, `TaintDiagnostics.lua`, `Options/Files.xml`, `Features.lua` (the feature registry), `Libs/Krowi_Util/Icon.lua`, `Icon.lua`, `BrowsingHistory.lua`
7. `Objects/Files.xml`
8. `Filters.lua`, `SearchOptions.lua`
9. `Gui/FilesModern.xml` (Retail) or `Gui/FilesClassic.xml` (Classic), then `Features/Files.xml` — one folder per switchable feature
10. `Data/Files.xml`
11. `DataAddons/Shared/Files.xml`, then `DataAddons/Retail/Files.xml` or `DataAddons/Classic/Files.xml`
12. `DataAddons/Loaders/Files.xml` — post-processing loaders that wire the data tables to their processors
13. `Tests/Files.xml`

Game-version-conditional loading uses `[AllowLoadGameType mainline]` and `[AllowLoadGameType wrath, cata, mists]` directives in the `.toc`.

### Root files

| File | Purpose |
|------|---------|
| `Krowi_AchievementFilter.toc` | Metadata and load manifest (Interface versions, SavedVariables, OptionalDeps) |
| `Krowi_AchievementFilter.lua` | Entry point: event handling (`ADDON_LOADED`, `PLAYER_LOGIN`), load orchestration |
| `Globals.lua` | Shared utilities: achievement chain helpers, `addon.GetAchievementInfo`/`GetAchievementInfoTable`, custom-criteria wrappers, zone lookup, filter counting, transmog set checks, modifier keys, month and weekday names |
| `Bindings.xml` | Key bindings for tab toggles and browsing history |
| `Filters.lua`, `SearchOptions.lua` | Filter definitions (completion, faction, reward type, sort, build version); which fields a search covers (IDs, names, descriptions, ...) |
| `Diagnostics.lua`, `TaintDiagnostics.lua` | Debug/trace logging controlled by options; taint probing helpers |
| `Icon.lua`, `BrowsingHistory.lua` | Minimap / data broker icon; achievement navigation history (back/forward) |

### Key directories

| Directory | Purpose |
|-----------|---------|
| `Api/` | Public API (`KrowiAF`, created in `API.lua`): enums, data registration functions, fluent builders, `PluginsApi`; `ApiDocumentation.lua` holds example data structures |
| `Objects/` | Metatable classes: `Achievement`, `Category`, `Event`, `Tab`, `BuildVersion`, `Flags`, `CompareFunc`, `SaturationStyle` |
| `Gui/` | All UI code (`FilesModern.xml` Retail, `FilesClassic.xml` Classic), one sub-folder per feature; `BlizzardOverrides.lua` holds every FrameXML override, API polyfill and hook on Blizzard's frame |
| `Data/` | Runtime data: task runner, registry (`Data.lua`), `LoadDiagnostics`, achievement cache, temporary obtainability, events, tooltips, special categories, migrations (`DataIntegrityManager.lua`), `SavedData/` |
| `DataAddons/` | All **data definitions** (achievement, category, zone, tooltip, transmog set, pet battle link, guide, build version, event, custom criteria) per expansion (`01_Vanilla/` to `12_Midnight/`): `Shared/` identical on both clients, `Retail/` and `Classic/` client-specific, `Loaders/` the post-processing that wires them into the runtime |
| `Options/` | The settings as AceConfig tables; `Window/` maps them onto the options window's 22 feature sections and wires the window (`/kaf`, `addon.Options.Open`, the Settings > AddOns stub) |
| `Plugins/` | Third-party addon integrations; the plugin API is `Api/PluginsApi.lua` (`KrowiAF.PluginsApi`) |
| `Localization/` | One file per locale (`enUS`, `deDE`, `esES`, `esMX`, `frFR`, `itIT`, `koKR`, `ptBR`, `ruRU`, `zhCN`, `zhTW`), `.Plugins.lua` and `.WrathClassic.lua` variants, `Shared.lua` helpers |
| `Libs/` | Vendored libraries, several of them git submodules of `TheKrowi/*` repos, the options window (`Krowi_Options`, registered as `Krowi_Options_2`, with its own translations) among them. **Do not edit `Libs/` unless asked**; fixes belong upstream, in `Krowi_Libraries` |
| `Media/` | Texture assets (`.blp`) |
| `Tests/` | The `/kaftest` runner and the scenario suites it shares with the headless runner; loaded last, only active in debug mode |
| `_Packaging/` | Changelog, release notes, CurseForge description. Not loaded by the game |
| `docs/`, `raw/`, `.claude/` | Non-code material; offline tooling, skills, subagents, hooks and path rules. Not loaded by the game, not shipped |

## File map

### Features: `Features.lua`, `Slots.lua`, `Features/`

KAF splits into a core and switchable features (docs/work/2026-11-08-feature-split-poc, release 106). Each feature lives in `Features/<Name>/` and registers while its files load; loading them makes nothing.

- **The registry** (`Features.lua`, `addon.Features`): `Register{Name, Title, Switch, Start, OnNotStarted}`, `AddOptions`, `AddHelp`, `AddDataFields`. `StartAll` runs at `ADDON_LOADED` right after `addon.Options:Load` and starts every feature whose switch (a saved path in the profile, on by default) is on; a switch takes effect after a reload. A feature's settings and help page are there whether it is on or off: its section opens with the switch, and its other rows grey out while the switch is off.
- **The slots** (`Slots.lua`, `addon.Slots`): the core's extension points, filled from a feature's `Start`, each entry tagged with its owner; a part of the core not split yet may add its entry when its file loads, with no owner. `AchievementData.AddField` takes the builder's fields the core does not process itself (the reward ids); `RowIcons.Add` draws icons on the achievement rows after the built-in ones; `RowParts.Add` adds a part to each achievement row when the row is made (the menu button); `AchievementMenu.Add` adds entries to the achievement's right-click menu, merged by `Order`. A slot may have a host feature that reads its entries: the right-click menu hosts `AchievementMenu`, sets its opener with `SetOpener`, and the core opens it with `AchievementMenu.Open(caller, achievement)`, which does nothing while the menu is off or for an achievement the addon does not register. `Gui/SidePanels.lua` is the side-panel service the reward preview and the guide panel share.
- **The boundary:** the core names nothing a feature defines and a feature names nothing another defines (the `feature-boundary` lint rule); Tests are exempt.
- **The proofs:** the `features` suite (headless: two whole-addon boots, off and on, with every file's load watched; in game: the state the switches give, and the memory), the `feature-boundary` rule and `/kaftest matrix`.
- **Reward preview** (`Features/RewardPreview/`) is the first: the registration and `Start` (`RewardPreview.lua`), its public API and data fields (`Api.lua`), the entries' lookups (`Data.lua`), the window, a template made at start (`Window.xml`, `Window.lua`, `WindowMixin.lua`), the row icons, the menu entry, the settings and the help page.
- **Right-click menu** (`Features/RightClickMenu/`, docs/work/2026-11-09-right-click-menu) is the second: the registration and `Start` (`RightClickMenu.lua`), the menu with its own sections (`AchievementMenu.lua`, Wowhead, Go to and its parts, Transmog Sets, More), the row's menu button (`RowButton.xml`, `RowButton.lua`), the settings and the help page. The entries of features not split yet live next to their owners and add themselves to the slot: Guide (`Gui/Guide/MenuEntry.lua`), Pop Out (`Gui/AchievementPopout/MenuEntry.lua`), Xu-Fu's Pet Guides (`Gui/PetBattleLinks/MenuEntry.lua`). The event reminder side button's menu is the core's `Gui/EventReminder/Menu/` until Event reminders is split.

### `Api/`

The public API surface: the `KrowiAF` global, created in `Api/API.lua`; the enums; the data registration functions (`AchievementDataApi`, `CategoryDataApi`, ...); the fluent builders (`AchievementDataBuilder`, `CategoryDataBuilder`, `ZoneDataBuilder`, `BuildVersionDataBuilder`); and `PluginsApi`. `ApiDocumentation.lua` holds example data structures.

### `Gui/`

All UI code, split into `FilesModern.xml` (Retail) and `FilesClassic.xml` (Classic).

| File or folder | Role |
|---|---|
| `Gui.lua` | the tabs, the sub-frames, the reshaping of `AchievementFrame` |
| `FramesForClosing.lua` | Escape handling |
| `BlizzardOverrides.lua` | `addon.OverwriteFunctions`, `addon.LoadBlizzardApiChanges`, `addon.HookFunctions`: the FrameXML functions the addon replaces, the polyfills for removed API and the hooks on Blizzard's achievement frame, all run in boot phase 2 |
| `MovableFrames.lua` | `addon.MakeMovable`, `MakeWindowMovable`, `MakeWindowStatic` |
| `WindowFrames/` | AchievementsFrame, CategoriesFrame, FilterButton, Search, SummaryFrame, AchievementButton, ... |
| `AchievementTooltip/`, `AchievementCalendar/`, `AchievementPopout/`, `EventReminder/`, `PetBattleLinks/`, `DataManager/`, `WorldMapButton/`, `FloatingAchievementTooltip/`, `BrowsingHistory/`, `Collections/`, `SnapFrame/` | one folder per feature |
| `Guide/` | achievement guides (data in `KrowiAF.GuideData`, `Api/GuideDataBuilder.lua`): `Guide.lua` renders the steps for every surface, `Waypoint.lua` places a map pin, super-tracked POI or TomTom waypoint, `Content.lua` lays out lines and buttons for the side panel (`Panel.lua`) and the block under an expanded row; the tooltip and right-click menu sections live with their own folders |

### `Data/`

Runtime data management.

| File or folder | Role |
|---|---|
| `TaskRunner.lua` | `addon.StartTasksGroups`, the frame-budgeted task-group runner |
| `Data.lua` | the central registry; registers the data chunks as task groups |
| `LoadDiagnostics.lua` | `addon.Data.LoadDiagnostics`, the collector every drop site in the data API reports to; each task group starts with a `SetSource` task so a report names its data file, and the summary prints in debug mode after login |
| `AchievementCache.lua` | `addon.BuildCacheAsync`, the coroutine that walks every achievement id after the data load, plus `ResetCache` and `OnAchievementEarned` |
| `TemporaryObtainable.lua` | resolves an achievement's temporary-obtainable records to Past/Current/Future |
| `EventData.lua`, `CustomWidgetEventTimers.lua`, `CustomWorldEventTimers.lua` | events and their timers |
| `TooltipData.lua` | tooltip data |
| `SpecialCategories.lua` | the special category matrix: Summary, Watch List, Excluded, ... |
| `SpecialCategoryAchievements.lua` | `addon.WatchAchievement`, `ExcludeAchievement`, `IncludeAchievement`, ...: adding achievements to the special categories and building their mirrored sub-category trees |
| `DataIntegrityManager.lua` | saved-variable migrations |
| `SavedData/` | persistence |

The cache build, the special category trees, the task runner, the Blizzard overrides and the movable-window helpers lived in `Globals.lua` until 2026-09-19 (`docs/codebase-analysis.md`, THE UGLY §3).

### `Options/`

The settings as AceConfig tables: `Defaults.lua`, `General.lua`, `Layout.lua`, `EventReminders.lua`, `Profiles.lua`, `Plugins.lua`, `Credits.lua`. They stay registered with AceConfigRegistry (plugins and `KrowiAF_GetOptions` read them), but Settings > AddOns no longer shows them: the options window draws them (docs/work/2026-10-25-options-revamp).

`Window/` is the addon's side of the options window:
- `Map.lua`: the 22 feature sections in three groups, and where each AceConfig option shows in them.
- `Source.lua`: turns map entries into the window's rows and option objects: label, description, value, derived default, disabled and hidden, through the options' own get and set.
- `Model.lua`: what the `options` suite asks without drawing (coverage, round trip, fingerprint, defaults, changed lines, search, section reset).
- `Window.lua`: hands all of it to the `Krowi_Options` library (`Libs/`); holds the landing rule, the New marks, the Overview, `addon.Options.Open` and `/kaf`.
- `Stub.lua`: the one Settings > AddOns page, with the button that opens the window.
- `Changelog.lua`: generated at release by `.claude/tools/Build-ChangelogLua.ps1`, the Overview's copy of the changelog's top entry.

### `Libs/`

Vendored libraries: the Ace3 suite, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, LibDeflate, LibSerialize, MetaLua, TaintLess, and the `Krowi_*` libraries. `Krowi_Menu`, `Krowi_ProgressBar`, `Krowi_WorldMapButtons`, `Krowi_Util`, `Krowi_PopupDialog` and `Krowi_Options` are git submodules pointing at `TheKrowi/*` repos, which is why fixes belong upstream, in `Krowi_Libraries`.

`Krowi_Options` (`Krowi_Options_2`) is the options window, addon-neutral and translated on its own CurseForge project; it was made here and became a library of its own in 2.0 (docs/work/2026-11-04-krowi-options-library). `WindowMixin.lua`/`WindowFrame.lua` hold the window: navigation, the page of rows, the help pane or its strip with tooltips, search, Defaults asked inside the window, the reload bar, resizing and the saved place. `RowMixins.lua`/`RowFrames.lua` hold one row type per element: check box, slider, dropdown, button, text box, key binding, note, heading, grid, tab list, link. Its frames are built in Lua, each list row hung on its list's frame as `frame.Row`.

## Data chunk execution

Data files declare bare tables and never call processing functions:

```lua
KrowiAF.AchievementData["11_01_00"] = {   -- key = EE_PP_SS (expansion, major, minor); "_S" suffix = Shared
    Ach(41234):Mount(),                    -- V2 fluent builder, Api/AchievementDataBuilder.lua
}
```

- `DataAddons/Loaders/*.lua` (loaded last) prepend the processor function at index 1 of each chunk (e.g. `KrowiAF.AddEventData`).
- `Data/Data.lua`'s `Register*DataTasks` push each chunk into `TasksGroups`; the runner (`addon.StartTasksGroups`, `Data/TaskRunner.lua`) calls `chunk[1](unpack(rest))`.
- For achievements, `Data.lua` also inserts `{KrowiAF.SetAchievementPatch, major, minor, patch}` derived from the table key (first-party data files never write that line themselves), and `Ach()` entries resolve to `KrowiAF.AddAchievementData`, which constructs `addon.Objects.Achievement`.
- The task groups run at `PLAYER_LOGIN` (boot phase 3), yielding on a per-frame time budget.

Shared and client files write into the same `KrowiAF.AchievementData` table, so the same key in both would make the later file overwrite the earlier one's entries; that is why a Shared file adds `_S` to its keys. The suffix has no meaning at runtime: `Data.lua` reads the patch from the first three parts of the key.

## Objects and obtainability

`Achievement` (`Objects/`) carries patch, faction, reward type, PvP/season flags, and a list of temporary-obtainable records; `Data/TemporaryObtainable.lua` resolves those to Past/Current/Future using season anchors registered via `KrowiAF.AddSeasonData`. Every `Obtainable()` form: `docs/obtainability.md`.

## External references

Grep the local clones of Blizzard's UI source first (`..\wow-ui-source\live`, `..\wow-ui-source\classic`, kept by the kit's `Update-UiSource.ps1`, `-Branch ptr2` and others on request) for FrameXML, secure templates and `Blizzard_APIDocumentationGenerated` (signatures and secret-value flags), and never run anything from them. The export can lag a live patch. The web rows are the fallback.

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