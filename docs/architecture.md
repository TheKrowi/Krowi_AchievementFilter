# Architecture reference

The rules (the two namespaces, the three-phase boot, where data lives, taint) are in `.github/copilot-instructions.md` under Architecture. This file is the file map and the mechanics behind them, read when a task touches that part of the code.

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
| `AchievementTooltip/`, `AchievementCalendar/`, `AchievementPopout/`, `EventReminder/`, `PetBattleLinks/`, `DataManager/`, `WorldMapButton/`, `FloatingAchievementTooltip/`, `BrowsingHistory/`, `Collections/`, `RewardPreview/`, `SnapFrame/` | one folder per feature |
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