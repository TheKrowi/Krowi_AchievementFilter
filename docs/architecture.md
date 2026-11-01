# Architecture reference

The rules (the two namespaces, the three-phase boot, where data lives, taint) are in `.github/copilot-instructions.md` under Architecture. This file is the file map and the mechanics behind them, read when a task touches that part of the code.

## File map

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
| `AchievementTooltip/`, `AchievementCalendar/`, `AchievementPopout/`, `EventReminder/`, `RightClickMenu/`, `DataManager/`, `WorldMapButton/`, `FloatingAchievementTooltip/`, `BrowsingHistory/`, `Collections/`, `RewardPreview/`, `SnapFrame/` | one folder per feature |
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
| `TooltipData.lua`, `RewardPreviewData.lua` | tooltip and reward-preview data |
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
- `Window.lua`: hands all of it to `Krowi_Options`; holds the landing rule, the New marks, the Overview, `addon.Options.Open` and `/kaf`.
- `Stub.lua`: the one Settings > AddOns page, with the button that opens the window.
- `Changelog.lua`: generated at release by `.claude/tools/Build-ChangelogLua.ps1`, the Overview's copy of the changelog's top entry.

### `Krowi_Options/`

The options window itself, addon-neutral, registered through LibMan as `Krowi_Options_1` and loaded from the TOC right after `Libs/Files.xml`; it moves to `Krowi_Libraries` when it is extracted. `Window.xml`/`WindowMixin.lua` hold the window: navigation, the page of rows, the help pane or its strip with tooltips, search, Defaults asked inside the window, the reload bar, resizing and the saved place. `Rows.xml`/`RowMixins.lua` hold one row type per element: check box, slider, dropdown, button, text box, key binding, note, heading, grid, tab list, link.

### `Libs/`

Vendored libraries: the Ace3 suite, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, LibDeflate, LibSerialize, MetaLua, TaintLess, and the `Krowi_*` libraries. `Krowi_Menu`, `Krowi_ProgressBar`, `Krowi_WorldMapButtons`, `Krowi_Util`, `Krowi_PopupDialog` are git submodules pointing at `TheKrowi/*` repos, which is why fixes belong upstream.

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