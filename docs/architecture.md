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

AceConfig-based options panels: `Defaults.lua`, `General.lua`, `Layout.lua`, `EventReminders.lua`, `Profiles.lua`, `Plugins.lua`, `Credits.lua`.

### `Libs/`

Vendored libraries: the Ace3 suite, LibStub, CallbackHandler, LibDataBroker, LibDBIcon, LibDeflate, LibSerialize, MetaLua, TaintLess, and the `Krowi_*` libraries. `Krowi_Menu`, `Krowi_ProgressBar`, `Krowi_WorldMapButtons`, `Krowi_Tutorials`, `Krowi_Util`, `Krowi_PopupDialog` are git submodules pointing at `TheKrowi/*` repos, which is why fixes belong upstream.

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

`wiki/achievement-data/achievement-data-format.md` (Registration Pipeline) follows one achievement through these steps.