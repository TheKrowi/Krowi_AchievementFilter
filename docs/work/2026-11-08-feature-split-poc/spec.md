# Spec: Features that switch off, proven on Reward preview (106, step 1)
Intent: [intent.md](intent.md). Status: accepted

## Requirements

The registry and the switch
1. A core registry, `addon.Features`, takes each feature's registration when its files load, and at `ADDON_LOADED` starts, in registration order, every feature whose switch is on in the current profile. A feature that is off never starts in that session.
2. Loading a feature's files makes nothing: no frame, hook, script, event, timer or slash command. A feature's files only register it.
3. Reward preview's switch is saved per profile at `Features.RewardPreview`, default on. No existing saved key moves or changes meaning, so no migration runs.
4. With the switch on, Reward preview behaves exactly as in 105.0 on Retail and Mists: the row icons (single and choice-of-many), hover and pinned previews, the chooser, the right-click entry, the side-panel chain with the guide panel, Escape, its six settings, its help page and Show me.
5. With the switch off and the game reloaded: no `KrowiAF_RewardPreview` frame exists, rows show no preview icon, the right-click menu has no Preview Reward entry, no reward preview data is kept (neither KAF's own nor a plugin's), and a plugin's call to `KrowiAF.AddRewardPreviewData` returns without an error.

The options window
6. Every feature section opens with the switch: a check box labelled with the existing phrase "Enable", whose description says what turning it off does and carries the reload mark. Changing it lights the window's reload bar ("Some changes take effect after a reload." with "Reload now").
7. While the switch is off, every other row of the section is greyed out; the switch itself never is.
8. Every profile action in the window (switch to, new, copy, delete, reset) lights the reload bar.
9. Reward preview's section, help page and Overview card stay where they are, with the same rows in the same order below the switch.
10. While the feature is off its help page still opens; it has no Show me button and says that the feature is off and how to turn it on.

The boundary
11. The core names nothing a feature defines, and a feature names nothing another feature defines; Tests are exempt. A feature reaches the core through the slots: achievement data fields, row icons, achievement menu entries, side panels, options section, help page.
12. The public surface stays: `KrowiAF.AddRewardPreviewData`, `KrowiAF.Enum.RewardPreviewType` and the frame name `KrowiAF_RewardPreview` (while on).

The proofs
13. A headless start check fails when a feature's file makes anything while loading, or when the registry starts a feature that is off, or a feature that is off holds a slot entry or data after the data load.
14. A lint rule, `feature-boundary`, fails on any reference across the boundary in requirement 11.
15. An in-game suite, `features`, checks on each run that every feature's state matches its switch (frames, slot entries, data, the row icon and menu entry for Reward preview) and records the addon's memory after login.
16. An automatic run (`/kaftest matrix`, driven by `Run-GameTests.ps1 -Matrix`) runs every in-game suite with all features on, all off and each feature alone, on Retail and Mists, reloading the game itself between steps, and puts every switch back at the end. Its record is a gate of 106's release.
17. The data snapshots and the headless pipeline stay unchanged.
18. Reward preview's six options are reviewed (what each does, its name, its description, its help text), and the proposals are put to Krowi at the look gate.

## Design

### The folder
`Features/Files.xml` loads after the interface files and before `Data/Files.xml` on both clients (`Krowi_AchievementFilter.toc`), and includes `Features/RewardPreview/Files.xml`. Everything of Reward preview moves there:

| New file | From |
|---|---|
| `RewardPreview.lua` | new: the registration and `Start` |
| `Api.lua` | `Api/RewardPreviewDataApi.lua` (the enum and `KrowiAF.AddRewardPreviewData`) |
| `Data.lua` | `Data/RewardPreviewData.lua` |
| `Window.xml`, `Window.lua`, `WindowMixin.lua` | `Gui/RewardPreview/` (the frame becomes the virtual template `KrowiAF_RewardPreviewTemplate`) |
| `RowIcon.lua` | `Gui/WindowFrames/AchievementButton/AchievementButtonExtraIconFactory.lua:221-304` |
| `MenuEntry.lua` | `Gui/RightClickMenu/AchievementMenu/RewardPreview.lua` |
| `Options.lua` | `Options/Layout.lua:538-591, 1220-1273`, `Options/Defaults.lua:97-102`, `Options/Window/Map.lua:171-175` |
| `Help.lua` | `Options/Window/Help/Help.lua:227-233`, `Options/Window/Help/ShowMe.lua:134-145, 276-285` |

The help picture stays in `Media/` beside the other help pictures, which the `pictures` suite writes there.

### The registry (core, new file `Features.lua`, loaded with the root files before `Options/Files.xml`)
A feature registers once, at file load:

```lua
addon.Features.Register({
    Name = "RewardPreview",                 -- its folder
    Title = addon.L["Reward preview"],
    Switch = "Features.RewardPreview",      -- its saved path in the profile
    Options = { Rows = ..., Defaults = ..., Section = ... },
    Help = { ... },
    Start = Start,
})
```

- `Options` and `Help` are wired whether the feature is on or off, because its section and help page show either way.
- `Start` runs only while the switch is on. It makes the window from its template and adds the feature's entries to the slots. The registry calls each `Start` through `xpcall` with `CallErrorHandler`, so one feature's error neither stops the others nor the boot.
- While a `Start` runs, the registry tells the slots whose entry they receive, so every slot entry knows its owner. That is what the start check reads.
- `addon.Features.StartAll()` runs in `LoadKrowi_AchievementFilter` right after `addon.Options:Load(true)` (`Krowi_AchievementFilter.lua:38`, the AceDB is made there) and before `PluginsApi:LoadPlugins` (`:40`). That is before the rows can be built (Blizzard_AchievementUI may load before PLAYER_LOGIN) and before the data load at PLAYER_LOGIN, which pushes the reward ids.
- `addon.Features.IsStarted(name)` answers for this session. A feature asks it about itself (its public API does); the core never names a feature.
- A later feature that needs Blizzard's achievement window or PLAYER_LOGIN gets a core slot for that when it moves; Reward preview needs neither. The walk-through of Event reminders and the Right-click menu (stage 4) says whether the slots below fit them.

### The slots (core)
- **Achievement data fields.** The builder (`Api/AchievementDataBuilder.lua:85-141`) keeps writing `MountId`, `PetSpeciesId`, `HousingDecorId` and `CreatureDisplayId`: they are the data format. `KrowiAF.AddAchievementData` (`Api/AchievementDataApi.lua:64-95`) stops calling `KrowiAF.AddRewardPreviewData`; it hands each of those fields to the handler a started feature added for it (`addon.Slots.AchievementData.AddField(name, handler)`), or drops it when none did. The builder makes no other fields, so nothing unknown can be dropped and nothing needs reporting to `LoadDiagnostics`.
- **Row icons.** `SetExtraIcons` (`AchievementButtonExtraIconFactory.lua:307-318`) keeps its built-in icons, then calls every added provider in its `Order`. Reward preview's provider has the highest order, as its "Always last" today (`:317`), because it adds a varying number of icons. The factory's reset (`:54-55`) clears a generic `icon.Data` instead of `RewardEntry` and `RewardGroup`, which become `icon.Data.Entry` and `icon.Data.Group`.
- **Achievement menu entries.** `AchievementMenu:CreateMenu` (`Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua:44-54`) merges its own sections with the added entries by `Order`. Each section file gets an explicit `Order` (10, 20, ..., Go to's attached sections keep riding on Go to), so the file order stops being the only thing that sets the position; Preview Reward keeps its place between Pop Out and Transmog sets.
- **Side panels.** Already a core service with no names in it (`Gui/SidePanels.lua`: `GetOwnerWindow`, `HookOwnerWindowHide`, `AnchorSidePanel`, `RegisterSidePanel`). Only its comments name the two panels; they are rewritten. The guide panel and the preview never name each other in code.
- **Options section.** The core injects the feature's rows under `Features.args.<Name>` of the options table, with two things in front: the switch (`Enabled`, label `L["Enable"]`, its `get`/`set` on the `Switch` path, a reload mark) and an inline group around the feature's rows whose `disabled` reads the switch. `Option:IsDisabled()` walks the ancestors (`Options/Window/Source.lua:194-216`), so the whole group greys while the switch sits outside it. The feature's defaults go into `Defaults.profile` before the AceDB is made. Its section joins `Map.Sections`, which the window reads at draw time (`Source.lua:561-565`), at its `Order` in its navigation group: the navigation groups (`Map.lua:17-21`) give every section an explicit order instead of listing feature section ids, and a feature section brings its own.
- **Help page.** The core puts the feature's help under its section id (today `help.rewards`) and wires its Show me scene through the loop at `ShowMe.lua:328-338` only while the feature is started. While off, the page leads with one line saying the feature is off and how to turn it on, and has no `ShowMe` (the library then shows no button, `Libs/Krowi_Options/WindowHelp.lua:197-224`).

### The window
`Window.xml` declares `KrowiAF_RewardPreviewTemplate` as `virtual="true"`, otherwise unchanged. `Start` makes `CreateFrame("Frame", "KrowiAF_RewardPreview", UIParent, "KrowiAF_RewardPreviewTemplate")`, so the name stays for anyone who looks it up and `OnLoad` (`RewardPreviewMixin.lua:154-169`, its model scene from Blizzard's templates) runs at start instead of at file load. The setters of the default width and height (`Options/Layout.lua:581-591`) move into `Options.lua` and keep checking that the frame exists.

### The public API
`KrowiAF.AddRewardPreviewData` and the enum stay defined when `Api.lua` loads, on or off. Before `StartAll` it queues the call; `Start` takes the queue, and an off feature's queue is dropped at the end of `StartAll`. After that it stores while started and returns at once while not.

### The switch in the options window
- The switch's description is one new phrase for every feature (`Feature Switch Desc`: turning {feature} off stops it completely, its settings are kept) with the reload mark. The off line on the help page is a second new phrase (`Feature Off Help`). Both go into every locale file and to CurseForge.
- Greying reads the saved switch, so unticking greys the rows at once while the reload bar asks for the reload; ticking it again before the reload ungreys them.
- Profile actions: the window's profile rows (`Source.lua:291-336`) say they need a reload (`Custom:GetNeedsReload()` returns true, `:296`), which lights the bar for every one of them with no library change. The partial live refresh after a profile action (`Options/Layout.lua:27-37, 2029-2060`, `Options/General.lua:25-35`, `Options/EventReminders.lua:16-26`) stays until the PR that moves its owner, which removes it; `Filters` keep their own live profiles.

### The boundary lint (`feature-boundary`, `.claude/tools/Check-Repo.ps1`)
- A feature is `Features/<Name>/`; a skin file `Plugins/<Plugin>/<Name>.lua` counts as that feature's. The core is every other own Lua and XML file outside `Tests/`, `Libs/`, `.claude/` and `docs/`.
- A feature's names are what its folder defines: `addon.*` and `KrowiAF.*` assignments, XML frame and template names, global mixins.
- Error when a core file names one of them, or a feature names another feature's. Comments are blanked first, line numbers kept, as in `settings-panel-close` (`Check-Repo.ps1:512-538`). It runs tree-wide, since a move can break a file nobody touched.

### The start check (headless)
A new suite `features` in `.claude/tools/headless/run-tests.lua` loads the whole addon through `headless/options-env.lua`:
- During the file-load loop (`options-env.lua:325-342`) it wraps `CreateFrame`, `hooksecurefunc`, `HookScript`, `SetScript`, `RegisterEvent`, `RegisterUnitEvent`, `C_Timer` and writes to `SlashCmdList`, and fails on any call whose caller (`debug.getinfo`) is a file under `Features/`. The core still makes frames at load (`Krowi_AchievementFilter.lua:19-23`) and stays allowed.
- It boots twice, switch off and switch on: off, `Start` never runs, no slot entry has the feature as owner, no `KrowiAF_RewardPreview` exists and the reward preview data is empty after the data load; on, all of them are there.

### The in-game suite and the memory
`Tests/Features.lua` (the same suite in game): per registered feature, its started state equals its switch, its frames exist exactly when on, its slot entries exist exactly when on; for Reward preview also the row icon on an achievement with a mount reward and the menu entry. It records the addon's memory after a full collect (`UpdateAddOnMemoryUsage`, `GetAddOnMemoryUsage`, as `Tests/Memory.lua:321-327` does) as an observation, with no threshold. Suites whose scenarios need an off feature skip those scenarios and say why (`escape` pins the preview, `pictures` takes its picture); `features` proves the absence instead, so no run consists of skips only (`Tests/README.md`, Adding a suite).

### The automatic run
- `/kaftest matrix` builds the plan from the registry: all on, all off, then each feature alone (with one feature the plan is all on, all off). It keeps the plan in `KrowiAF_DebugTable.Tests.Matrix` with the switches it found, sets the first step's switches in the current profile through each feature's `Switch` path, and reloads with `C_UI.Reload()`.
- After each reload, `PLAYER_ENTERING_WORLD` (`Tests/Tests.lua:337-358`) sees the plan, runs every in-game suite with the step as the run's argument, and moves on. With an argument a run stays out of `Tests.Runs` (`Tests/Tests.lua:100-103`), so the release gate's plain runs are not overwritten. While a plan runs, the history keeps as many runs as the plan makes, and the debug-mode cleanup (`:345-350`) waits for the plan's end.
- At the end it puts every switch back, reloads once more and only then signals done, so no reload follows the kit marker's done (it must stay up about 0.5 s, `Send-GameInput.ps1:391-393`).
- `Run-GameTests.ps1 -Matrix` types the command, waits with a timeout sized to the plan, reads every run made since its start and fails on any FAIL, a missing step or a step that passed nothing.
- `.claude/release-gate.ps1` gains a check: a green matrix record on the newest Retail and Mists builds, newer than the last change under `Features/`.
- `C_UI.Reload` is listed with no protection or restriction flags (`Blizzard_APIDocumentationGenerated/UIManagerDocumentation.lua:64-67` on live, the same on classic), but nothing says a call from a timer works without a key press. The build checks that first in game; if it does not, the plan signals each step and the kit types `/reload` instead (`Send-GameInput.ps1 -Command`), with the same plan and the same results.

### The options review
During the build each of the six options gets its answers (what it does, its name, its description, its help text), written into this work folder, and the proposals go to Krowi with the look gate. A renamed phrase follows the localization rule.

## Options considered
1. **Registration plus slot calls in `Start` (recommended).** The feature says what it is when it loads and adds its own entries when it starts; the registry only decides who starts. Each slot stays a small, named core function, and the owner tag makes "an off feature holds nothing" checkable.
2. **Fully declarative registration.** The feature lists its slot entries in the registration and the registry wires them. Less code per feature, but every new slot changes the registry, and features with their own frames and events still need a `Start`; two ways to do one thing.
3. **The reward ids stay on the achievement objects** and the feature reads them when it needs them. No data slot, but every achievement object carries the ids while the feature is off, and the core objects grow a field per feature that has data. Rejected against "a feature's own data loads only while it is on".
4. **The core keeps calling `KrowiAF.AddRewardPreviewData`.** The smallest change, but the core then names a feature's function, which the lint exists to stop.
5. **The window made on first show instead of at `Start`.** Saves the window's memory for players who keep the feature on and never open it; the grill chose `Start`, and this stays a possible follow-up once the memory figures are in.
6. **A switch that greys the rows only after the reload.** Rows stay editable until the reload; asked at the gate, since the player sees the difference.

## Areas of concern
- **Taint and secret values.** Nothing new touches Blizzard frames or functions. The window's template inherits what the frame inherits today (`TooltipBorderBackdropTemplate`, and Blizzard's model scene templates in `OnLoad`), now made at `ADDON_LOADED` instead of at file load, both outside combat. `C_UI.Reload` runs only from the test plan, in debug mode. The menu merge and the row icon providers run where the sections and icons run today. `krowi:taint-reviewer` reviews the diff.
- **Clients.** Retail and Mists (the TOC's `## Interface:`; Wrath and Cata through `AllowLoadGameType`). Reward preview loads on both today (`Gui/FilesModern.xml:17`, `Gui/FilesClassic.xml:16`); `Features/Files.xml` loads on both. The in-game runs cover both.
- **Blizzard API changes.** None used newly except `C_UI.Reload` (present on both clients). `Find-DeprecatedApi.ps1` runs on the moved files.
- **Other addons, plugins and skins.** No file in `Plugins/` names the reward preview. GW2_UI hooks `factory.GetNew` (`Plugins/GW2_UI/GW2_UI.lua:1170`), which stays. A plugin calling `KrowiAF.AddRewardPreviewData` keeps working while on, and gets no error while off.
- **Saved variables and migrations.** One new key per profile, `Features.RewardPreview` (AceDB stores it only when off). The six settings keep their keys under `Achievements`. The test plan lives in `KrowiAF_DebugTable`. No migration.
- **Localization.** Two new phrases (`Feature Switch Desc`, `Feature Off Help`) in every locale file and exported to CurseForge; "Enable" and "Reward preview" exist already. Renames from the options review follow the same rule.
- **Embedded libraries.** None change: the reload bar, the disabled rows and the help note use Krowi_Options 2.0 as it is.
- **Data snapshots.** The reward ids reach the same table through the data slot; `snapshot-data.lua` must show no diff with every feature on, which is how the headless pipeline runs.
- **Player-facing text.** A changelog line under 106 for the switch. The options fingerprint (`Tests/Options.lua:193-205`) changes, because paths move and a switch row is added; its new values are committed with the reviewed diff.
- **Background jobs.** None added; the reward preview has none today.
- **Gate class.** `feature`. The options suite's expected values and the escape and pictures suites change existing lines of the test tooling, which `Get-ChangeClass.ps1` may read as `harness`; the gates asked are the same ones.
- **Delivery.** This PR merges only after the kit's release skill has its hotfix mode. Until then, a fix for 105.0 ships from `main` as today.

## Verification
- Headless: the `features` suite (start check, off and on boots), the `options` suite (every option mapped once, the switch on top of every feature section, every other row of the section disabled while the switch is off, the new fingerprint), `menu`, `escape`, `guide`, `help` and `tooltip`, the data pipeline and both snapshots unchanged.
- Lint: `feature-boundary` passes on the PR, and fails on a scratch reference from `Gui/` to `addon.RewardPreviewData` (checked once, not committed).
- In game, Retail and Mists: the before-run of `escape`, `menu`, `guide`, `options`, `help` and `pictures` on `main`; after the build, `/kaftest matrix` through `Run-GameTests.ps1 -Matrix` on both clients, green; `Read-GameErrors.ps1` with no new row.
- Memory: the `features` suite's figures with Reward preview off and on, both clients, in the PR.
- Look gate: the switch, the greyed section, the help page while off and the options review, on a published page with screenshots of both clients.
- The PoC's own holds, for Krowi to judge: `Features/RewardPreview/` plus the registry and slots against today's trail, and the written walk-through of Event reminders and the Right-click menu against the same slots (in this folder, before the PR).

Found during the build (2026-11-08):
- **`C_UI.Reload` is protected.** Called from a timer (`/run C_Timer.After(2, function() C_UI.Reload() end)`) it is blocked on Retail 12.1.5 and Mists 5.5.4 (`[ADDON_ACTION_BLOCKED] ... tried to call the protected function 'Reload()'`, BugGrabber), though the generated API docs flag nothing. The matrix runs on the fallback: each step asks for a `/reload` and `Run-GameTests.ps1 -Matrix` types it.
- **A matrix run's step is stored in `MatrixStep`, not in the run's argument:** the suites read the argument as a step selector (`options`, `pictures`), so an unknown one would skip the whole suite.
- **The data-only headless loader** (`client-env.lua`, behind `load-data.lua` and the data snapshots) now also loads `Slots.lua` and each feature's `Api.lua`, with a stand-in registry that counts every feature as started, so the snapshots still record the reward ids.
- **In-game runs start only when Krowi says the PC is free** (correction in `gates.md`).

Results after the review fixes (2026-11-08, `Run-GameTests.ps1 -Matrix`; with one feature the plan is all on, all off, then the reload that puts the switch back):
- **Retail 12.1.5:** 582 passed, 0 failed, 56 skipped; no new BugGrabber row. Memory after a full collect: 69,689 KB on, 69,403 KB off (286 KB less).
- **Mists 5.5.4:** 404 passed, 0 failed, 36 skipped; no new BugGrabber row. Memory: 18,051 KB on, 17,997 KB off (54 KB less; the run before the review fixes measured 8 KB, so on Mists the figure is mostly noise).
- **Look gate screenshots** on both clients: switch on, unticked (rows greyed at once, reload bar), the help page after the reload (off line, no Show me). Published for Krowi at https://claude.ai/artifact/W88PXMKjL8xNhNNkmQ2bAD.

## Decision
Krowi, 2026-11-08: the design as written (option 1), with the rows greying out at once when the switch is unticked (not option 6), the help page of an off feature without Show me and with the one line, and the partial live refresh after a profile action kept until the PR that moves its owner. Earlier at the intent gate: settings move as AceConfig tables; options stage 2 comes after 106.