# Plan: Options window with the explanations built in
Spec: [spec.md](spec.md). Status: accepted

Covers stage 1 (the window over today's AceConfig tables, with the tests that become stage 2's regression suite), the seam the help-content track fills, and the tutorial's removal once that track lands. Stage 2's definition format gets its own spec addendum and gate. Approved by Krowi on 2026-10-25 (non-routine: it adds `KrowiAF_SavedData.OptionsWindow`, registers a Settings canvas category and removes an embedded library).

## Files that change
- **New, `Krowi_Options/`** (addon-neutral, LibMan `Krowi_Options` minor 1, loaded from the TOC right after `Libs\Files.xml`):
  - `Files.xml`, `Krowi_Options.lua`;
  - `Window.xml`/`WindowMixin.lua`, `Rows.xml`/`RowMixins.lua`, `Compound.lua`, `Search.lua`, `HelpPane.lua`.
- **New, `Options/Window/`** (included from `Options/Files.xml` after `Credits.lua`):
  - `Files.xml`, `AceConfigSource.lua`, `Map.lua`, `Window.lua`, `Stub.lua`;
  - `Changelog.lua` (generated);
  - `Help.lua` (the seam, filled by the help track).
- **New tests and tools:**
  - `Tests/Options.lua`;
  - `.claude/tools/headless/options-env.lua`;
  - `.claude/tools/Build-ChangelogLua.ps1`.
- **Changed:**
  - `Krowi_AchievementFilter.toc`: `Krowi_Options\Files.xml`; later the `Tutorials.lua` line goes.
  - `Options/General.lua`, `Layout.lua`, `EventReminders.lua`, `Profiles.lua`, `Plugins.lua`, `Credits.lua`: the six `AddToBlizOptions` lines go; `CloseSettingsPanel` moves to `addon.Options`.
  - `Gui/WindowFrames/FilterButton/FilterButtonMixin.lua`: a wrapped Options entry with "!"; Help opens Overview.
  - `Icon.lua`: unchanged, it calls `addon.Options:Open()`.
  - `Tests/Files.xml`, `Tests/Escape.lua`, `Tests/README.md`, `.claude/tools/headless/run-tests.lua`.
  - `.claude/release-gate.ps1`, `.claude/tools/Check-Repo.ps1` (the library-names rule covers `Krowi_Options/`), `.claude/tools/Check-Repo.jobs`.
  - `Localization/*.lua`; `.github/copilot-instructions.md` (suite list, layout); `docs/architecture.md`; `_Packaging/Changelog.md`.
- **Removed after the help track merges:**
  - `Tutorials.lua`, the `Libs/Krowi_Tutorials` submodule (`.gitmodules`, `Libs/Files.xml:19`, `Libs/Libs.lua:12`), `Krowi_AchievementFilter.lua:48`;
  - `Options/General.lua:49-73,305-310`, `FilterButtonMixin.lua:200-205,234-247`, `Plugins/InstanceAchievementTracker.lua:35-43`;
  - the 35 tutorial-only keys in every locale (and `Shared.lua:76,115` if unused), the 16 tutorial Media files;
  - the tutorial mentions in `README.md`, `_Packaging/Description.md`, the instruction file and `docs/architecture.md`.

## Order of work
### Design decisions
1. **Defaults without a db path.**
   - The default is read by calling the node's own `get` against a defaults-only proxy profile: `setmetatable({}, {__index = function(_, k) touched = true; return copy[k] end})`, where `copy` is a deep copy of `addon.Options.Defaults.profile` built once per section draw.
   - It is installed with `rawset(addon.Options.db, "profile", proxy)`, `get()` runs in `pcall`, and the real profile is restored on every path. AceDB's `profile` is a plain rawset field (`AceDB-3.0.lua:196,211`), no callback fires, and the defaults have no `'*'`/`'**'` keys.
   - An option has a default only when its `get` touched the proxy and it has a `set`. `Map.lua` adds a `NoDefault` list for the tab order.
2. **Defaults and resets** go through each option's own `set`.
3. **Profiles** are drawn on AceDB's API (`GetProfiles`, `SetProfile`, `CopyProfile`, `DeleteProfile`, `ResetProfile`) for `addon.Options.db` and `addon.Filters.db`.
4. **The window is built on first open.** One section at a time in ScrollBox lists; `PLAYER_REGEN_DISABLED/ENABLED` registered only while shown.
5. **`addon.Options.Open(_, sectionId)`** accepts `sectionId` only when it is a string: Retail's menu calls a callback as `responder(data, menuInputData, menu)` (`wow-ui-source/live/.../Blizzard_Menu/Menu.lua:892`). The filter menu entry is wrapped. Krowi_Util is not changed.
6. **Load order:** `Krowi_Options/` from the TOC after `Libs\Files.xml`; `Options/Window/` from `Options/Files.xml`. The library-names rule (`Check-Repo.ps1:475`) is extended to `Krowi_Options/`.
7. **Description suffixes** are stripped by the strings their builders produce (`string.K_AddReloadRequired("")`, `string.K_AddDefaultValueText("", {v = ""}, "v")`), not by `L["Requires a reload"]`, which every embedded Krowi_Util copy re-colours (`Libs/Krowi_Util/Localization/Shared.lua:26`). `Layout.lua:273` puts the reload text first and is compared without colour codes.
8. **Escape from the first open:** the window template is `hidden="true"`, and KAF registers it with `gui:RegisterFrameForClosing` through an `OnCreated(frame)` callback before its first `Show` (`Gui/FramesForClosing.lua:31-36` hooks `OnShow` when called).
9. **Secure buttons** from the help track (the map's Show me) are parented to `UIParent`, never to the window, so the window never becomes protected.

### Track A: stage 1 (`feature/2026-10-25-options-revamp`)
1. **The headless options environment and suite, test first.**
   - `.claude/tools/headless/options-env.lua` is built on `client-env.New`, with a wider file selector (the client's TOC files except AceGUI, AceConfigDialog and `Tests/`), a fake AceConfig registry and Dialog (as in `mockup/dump-options.lua:202-243`), the real AceDB and the boot calls in order.
   - Upper-case global strings return their own key name.
   - One environment is cached per client per run.
   - Every load or step error is a FAIL line with its file and line.
   - `suites.options` in `run-tests.lua` and `Tests/Options.lua`, with `Recorded` today's behaviour and `Target` the spec: `settings-entry` (six pages, then one stub), `every-option-mapped-once`, `set-through-window-equals-aceconfig`, `disabled-hidden-agree`, `defaults-restore-acedb`, `derived-default-matches-text`, `changed-dot`, `plugins-present` (ElvUI, GW2 UI and EllesmereUI stubbed as loaded), `retail-only-hidden-on-classic`.
   - Registered in `Tests/Files.xml`, `Tests/README.md` and the instruction file.
   - Commit: `test: options suite records today's settings pages`.
2. **`Krowi_Options/` core.**
   - The window: ButtonFrameTemplate, portrait, `UIPanelCloseButtonNoScripts`; navigation, page and pane ScrollBoxes; help strip, reload bar, resize grip (the reward preview's pattern, `RewardPreview.xml:40-52`, `RewardPreviewMixin.lua:12-21,157-161`); position, size, pane state and last section saved into the consumer's table.
   - The rows: toggle (`checkbox-minimal`/`checkmark-minimal`), range (`MinimalSliderWithSteppersTemplate`), select (`WowStyle1DropdownTemplate`), execute and key (`UIPanelButtonTemplate`), input (`InputBoxTemplate`), note, sub-heading, All/None; each with a changed dot, a reload mark and a hover handler.
   - The compound controls: tab list, grid, family.
   - Search and the help pane.
   - The option interface: `Label, Desc, Type, Get, Set, Default, HasDefault, IsDisabled, IsHidden, Values, Min, Max, Step, NeedsReload, Locked, ShowIf`.
   - An early in-game smoke test on Retail and Mists proves the dropdown and slider templates before the rows are finished.
3. **`Options/Window/AceConfigSource.lua`.**
   - Resolves dotted paths in `addon.Options.OptionsTable` the way `InjectOptions:GetTable` does.
   - Evaluates values and functions with an `info`-like table.
   - Strips the suffixes (decision 7) and derives the defaults (decision 1).
   - Skips empty description rows; other descriptions become notes, headers become sub-headings.
4. **`Options/Window/Map.lua`.**
   - A first version is generated by a one-off script from `mockup/MockupSpec.ps1` and the dump tree, which holds both the names and the keys, then edited by hand.
   - The sections: `overview tabs window categories summary achievements filters search tooltips rightclick popout rewards guides calendar maps criteria events eventlist keys plugins profiles advanced about`, with group, `ChangedIn`, tile, groups and paths.
   - The Plugins subtree is mapped whole; the Advanced content tools carry `ShowIf` = Enable debug info.
5. **Wiring** (`Window.lua`, `Stub.lua`):
   - `addon.Options.Open` and `/kaf` (`SLASH_KAF1`, exempt from the globals rule);
   - the filter menu entries; `KrowiAF_SavedData.OptionsWindow = { Point, Size, PaneCollapsed, LastSection, Seen }`;
   - the stub canvas: name, one line, version, "Open options" and the other ways in, registered with `Settings.RegisterCanvasLayoutCategory(frame, addon.Metadata.Title)` and `Settings.RegisterAddOnCategory`. Its button calls `addon.Options.CloseSettingsPanel` (moved from `General.lua:42-47`, still used by Screenshot Mode), then `Open`;
   - the six `AddToBlizOptions` lines go.
6. **Overview, New and landing.**
   - `Seen[sectionId] = version` when a section opens; the landing rule; tiles.
   - `Build-ChangelogLua.ps1` writes `Options/Window/Changelog.lua` from the changelog section of the TOC's `## Version:`.
7. **Aids:** search; changed dots with right-click reset; Defaults with a confirmation (Krowi_PopupDialog); the reload bar with `ReloadUI()`; combat greying; the Advanced split.
8. **Strings.**
   - New interface keys in `Localization/enUS.lua` below the "Exported at" line and in every locale file, with drafted translations.
   - Section names reuse existing keys.
   - `krowi:localization` exports them by mid-week.
9. **Gates and suites.**
   - Escape scenario `options-window`, alone and under the calendar (`FrameKeys`, `RegisteredKeys`, a getter, a headless frame in `run-tests.lua:385-393`).
   - `release-gate.ps1`: per-client suite lists (Retail `escape`, `options`; Classic `options`), parsing the 5xxxx interface and reading the `Classic` folder, plus the changelog check.
   - `Check-Repo.jobs` lines for the shown-only handlers.
   - Set every `options` scenario's `Recorded` to `Target`.

### Track B: help content (a second session; worktree `feature/2026-10-25-options-help` off `main`; its own PR and `plan-help.md`)
- **The seam:** `addon.Options.Window.Help[sectionId] = { Title, Blocks = { {Heading}, {Text}, {Term, Text}, {Picture, Width, Height} }, ShowMe }`. A missing entry shows nothing.
- **Deliverables:**
  - `Options/Window/Help.lua` and its strings (the middle-ground texts of `mockup/MockupSpec.ps1`);
  - `Tests/Pictures.lua` (`/kaftest pictures`, game-only);
  - `.claude/tools/Make-HelpPictures.ps1` (crop, the old soft edge, a TGA writer) into `Media/Help/`;
  - the Show me functions with the map's secure route (decision 9);
  - its own taint review.

### After Track B merges
- The tutorial's removal (Files that change).
- **Left alone:** the saved key `KrowiAF_SavedData.FeaturesTutorial` stays as dead data, and ElvUI's "Skin Tutorials" row stays (it is ElvUI's own setting).

### Close
- Changelog lines (Added: the options window with the explanations; Changed: the tutorial is part of the options).
- `docs/architecture.md`.
- This file updated where the build departed. Already known: `SLASH_*` names are exempt from the globals rule (`Check-Repo.ps1:442`), so the spec's `Check-Repo.globals` line for `/kaf` is not needed.
- Status `done`, PR.

### Departures during the build
- **The headless options environment stands on its own** (`.claude/tools/headless/options-env.lua`), not on `client-env.New`. It loads every file of the TOC, the libraries included, so Krowi_Util, AceLocale and AceDB build the namespace as in game; `client-env.lua` builds it by hand and loads only the data files. It also:
  - runs the data load after the options steps;
  - stands in stubs for the frames the GUI load creates (`KrowiAF_*Frame`, the world map button), which some setters refresh.
- **The model before the window.** Steps 3 and 4 (`Source.lua`, `Map.lua`) and a model layer (`Options/Window/Model.lua`) came before step 2, so the suite could test the option objects headlessly before any frame exists. The window draws from the same model.
- **The tab list reuses the eight order dropdowns' setters**, which already swap two tabs (`Api/TabDataApi.lua` SetOrder). The map names the order and show groups instead of eight entries.
- **`Option:Set` skips a value the option already holds.** A tab's show toggle flips the tab whatever value it gets (`Api/TabDataApi.lua` InjectTabsShowOptionsTable), and AceConfig never sets an unchanged value.
- **The scenario `disabled-hidden-agree` became `options-fingerprint`.** In stage 2 there is no AceConfig left to compare against, so a regression check must record facts: every option's id, type and derived default, hashed independently of order. Labels are left out, because headless global strings are stand-ins, and so is the disabled state, which follows the player's settings. Stage 2's definitions keep today's paths as their ids.
- **The round trip separates values from side effects.** A setter whose refresh errors on something the headless load does not build still stores its value. Those errors are an observation; in game the BugGrabber step covers them.
- **The help track branches off this branch** (`New-Worktree.ps1 feature/2026-10-25-options-help -Base feature/2026-10-25-options-revamp`) and opens its PR into it, leaving one PR to `main`.
- **The library registers as `Krowi_Options_1`, minor 0,** following the other Krowi libraries' name-with-major form.
- **Rows refresh in place.** A change rebuilds the page only when it shows or hides rows. Rebuilding on every change re-initialised the slider being dragged, so only clicks moved it (Retail smoke test, 2026-10-25).
- **Option labels wrap to two lines** instead of being cut off while the help pane is open; scroll bars show only when a list scrolls.
- **The window has HIGH strata, like `SettingsPanel`.** The stub's button opens it above the panel when the panel cannot close (in combat, or with unapplied settings).
- **`addon.Options.CloseSettingsPanel`** (moved from `General.lua` to `Options/Options.lua`) also returns while the panel is closed, since the window's Screenshot Mode button now reaches it from outside the panel.
- **Combat greying counts the `PLAYER_REGEN_DISABLED` handler as combat** (`window:InCombat()`), because `InCombatLockdown()` is still false inside it.
- **Show me's secure route:** `ShowMeSecure(button, close)` runs only while the maps section's own help is drawn, and `ShowMeSecure(nil)` releases the help track's button as soon as the pane draws anything else or the window hides (agreed with the help track).
- **The filter menu's Help entry opens Overview now,** not after the help track merges (requirement 1); the tutorial code it called goes with the tutorial.
- **The Overview's changelog lines leave out the "(dev note: ...)" asides and code marks,** so the list stays short; the changelog keeps them.
- **Defaults confirms inside the window, not through Krowi_PopupDialog** (taint review, 2026-10-25). Krowi_PopupDialog and a StaticPopup both write the dialog into Blizzard's shared popup frames and list. A Blizzard dialog shown at the same time (deleting an item, a summon, Mists' battleground port) would then run its protected accept tainted. The button turns into Yes, with No and the question beside it.
- **Every button inherits `UIPanelButtonNoTooltipTemplate`.** On Retail, `UIPanelButtonTemplate`'s OnLeave hides GameTooltip whoever owns it, which runs the widget-set cleanup tainted (the #811 family).
- **For stage 2: the key binding options' keys are auto-numbered** (`Binding523Key1`, from the injection's running order). Removing the tutorial button took one number out and moved them all, so the fingerprint was re-recorded with that reason (8bb98662 / 06ba645e). Stage 2 gives them fixed ids (the binding command), or every unrelated option added before them moves the fingerprint again.
- **For the extraction:** `Window.xml` and `Rows.xml` define the `Krowi_Options*Mixin` globals and the templates unconditionally, so a second embedded copy would overwrite them even when `NewLibrary` returns nil; the extraction guards them or loads the XML only for the copy that wins.

## Risks
- **Unused templates.** `WowStyle1DropdownTemplate` and `MinimalSliderWithSteppersTemplate` are new to KAF. They load at startup on `classic` and `classic_titan` (`Blizzard_Menu/Classic/MenuTemplates.xml:3`, `Shared/Slider/MinimalSlider.xml:34`). The smoke test in step 2 proves them in game; the fallbacks are Krowi_Menu and a plain `Slider`.
- **Defaults derivation.** It can fail for gets that read beyond `addon.Options.db.profile`. The proxy's `touched` flag catches those, and the suite lists them.
- **Plugin notes** are added at load (`DisableOptions`). The window is built on first open, after them.
- **The headless environment loads the whole TOC.** The stubs live in `client-env.lua`; `dump-options.lua` already proved both clients.
- **The week.** The help track's pictures need Krowi in game on Retail and Mists, and its steps that need the mouse wait for him.

## Proof
- **Headless:**
  - `& $lua .claude/tools/headless/run-tests.lua $PWD options`: every `options` scenario PASS with `Recorded` = `Target` on Retail and Classic;
  - `run-tests.lua -check` clean (the `unit-tests` rule);
  - `Check-Repo.ps1` and `Find-DeprecatedApi.ps1` clean.
- **In game, Retail then Mists:**
  - `Deploy.ps1 -WhatIf`, deploy, `/reload`.
  - `/kaftest options`, then `/reload`. The run:
    - opens the window through each scriptable way in, the first open after a `/reload` included, and checks Escape closes it;
    - walks every section, setting only toggle, range, select and input rows;
    - checks the saved values and BugGrabber, screenshots each section, and puts the settings back.
  - `Read-GameTests.ps1` shows no FAIL and no unexplained difference from headless; `Read-GameErrors.ps1` shows no new row.
  - Krowi clicks "Open options" in the stub.
  - `/kaftest escape` is green.
- **Taint:** `krowi:taint-reviewer` on the diff. In game: open from the stub, then combat, the map and a bag; no `ADDON_ACTION_BLOCKED`, nothing new in the taint diagnostics.
- **Plugins loaded:** runs with ElvUI, GW2 UI and EllesmereUI show their groups and notes.
- **Release gate:** green `options` runs on the newest Retail and Mists builds; the changelog file is current.
- **Review:** `/code-review` on the PR.