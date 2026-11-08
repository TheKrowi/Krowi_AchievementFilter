# Plan: Features that switch off, proven on Reward preview (106, step 1)
Spec: [spec.md](spec.md). Status: accepted

## Context
KAF 106 splits the addon into a core plus 15 switchable features (grill closed 2026-11-01). This is the proof of concept: Reward preview moves into `Features/RewardPreview/` with a per-profile switch, the core gets the registry and the slots it uses, and the four proofs every later feature PR repeats are built (headless start check, `feature-boundary` lint, in-game off/on through `/kaftest matrix`, memory off/on). Intent and spec accepted 2026-11-08 (design option 1; rows grey at once; off help page has one line and no Show me; profile live refresh stays until its owner moves; settings stay AceConfig). Worktree `feature-2026-11-08-feature-split-poc`, branch `feature/2026-11-08-feature-split-poc`.

## Order of work

### 0. Before-run and the reload probe (no code change)
1. `Deploy.ps1 -WhatIf`, deploy this worktree (= `main` + docs) to Retail; `Run-GameTests.ps1 escape, menu, guide, options, help, tooltip`; same on Mists (`-Client Classic`). All green, or the difference explained, before any code changes (playbook rule for GUI work). Gate row `before-run`.
2. Probe `C_UI.Reload` from a timer: `Send-GameInput.ps1 -Command '/run C_Timer.After(2, C_UI.Reload)'` on Retail and Mists; the marker going away and coming back (`-State`) proves a reload with no key press. Decides between the self-reloading matrix and the fallback (the kit types `/reload` per step). Recorded in the spec's Verification.

### 1. Test first (commit `test: the feature switch and boundary, recorded before the registry`)
- **`Tests/Features.lua`** (new, in `Tests/Files.xml`): `addon.Tests.Suites.features` and `Ready.features` in Menu.lua's shape (`Tests/Menu.lua:35-46, 98-139, 271-287`). Scenarios for Reward preview: `switch-saved` (a `Features.RewardPreview` default exists), `started-matches-switch`, `frame-matches-switch` (`_G.KrowiAF_RewardPreview`), `row-icon-matches-switch`, `menu-entry-matches-switch`, `data-matches-switch`, `no-slot-entry-while-off`. Recorded = today (no switch, frame made at load, always present), Target = the spec. Plus an observation: memory after a full collect (`UpdateAddOnMemoryUsage`/`GetAddOnMemoryUsage` as `Tests/Memory.lua:321-327`).
- **Headless `suites.features`** in `.claude/tools/headless/run-tests.lua` after `suites.popups` (`:2582-2690`), using `optionsEnv.New` twice (switch off, switch on), never the shared `Get`. `headless/options-env.lua` gains an `opts` argument to `New(root, client, opts)`: `opts.Profile` preset into `KrowiAF_Options` before the `Options:Load` step (`:361`), and `opts.OnFileCall`, a wrapper around `CreateFrame`, `hooksecurefunc`, `HookScript`, `SetScript`, `RegisterEvent`, `RegisterUnitEvent`, `C_Timer.*` and `SlashCmdList` writes that records `debug.getinfo` sources during the file loop (`:325-342`). The suite fails a call from a `Features/` file, and with the switch off fails any `Start`, slot entry owned by the feature, frame or data. Every scenario is a real headless check (a headless SKIP is a `unit-tests` Error, `run-tests.lua:2841`).
- **Lint `feature-boundary`** in `.claude/tools/Check-Repo.ps1`, modelled on `settings-panel-close` (`:512-538`), always on (in `$alwaysOn`), documented in the header (`:7-82`) and in `.claude/tools/README.md`: collect each `Features/<Name>/` folder's names (`addon.*` and `KrowiAF.*` assignments, XML `name=` frames and templates, `*Mixin` globals); Error when a core file (own Lua/XML outside `Features/`, `Tests/`, `Libs/`, `.claude/`, `docs/`; `Plugins/<P>/<Name>.lua` counts as feature `<Name>`) names one, or a feature names another's. Comments blanked, line numbers kept. Passes on an empty `Features/`.
- Run headless `features` (Recorded met, Targets open), `Check-Repo.ps1 -ChangedOnly`.

### 2. The core (commit `feat: feature registry and core slots`)
- **`Slots.lua`** (root, new, in the TOC before `Api/Files.xml`'s first use at login; listed after `Globals.lua`): `addon.Slots.AchievementData.AddField(name, handler)`, `addon.Slots.RowIcons.Add({Order, Set})`, `addon.Slots.AchievementMenu.Add({Order, CheckAdd, Add})`. Each `Add` tags the entry with `addon.Features.Starting` (the owner) and keeps entries sorted by `Order`. `addon.Slots.Owned(name)` lists a feature's entries (for the tests).
- **`Features.lua`** (root, new, after `Options/Files.xml` in the TOC): `addon.Features.Register(def)`, `StartAll()`, `IsStarted(name)`, `List()`.
  - At `Register` (file load): merge `def.Options.Defaults` into `addon.Options.Defaults.profile`; build the feature's AceConfig group under `OptionsTable.args.Features.args[def.Name]`: `Enabled` toggle (order 1, label `L["Enable"]`, desc `L["Feature Switch Desc"]` with `{feature}` = `def.Title` plus `:K_AddReloadRequired()`, get/set on the `def.Switch` path) and an inline group `Settings` (order 2, `disabled` = switch off) holding `def.Options.Rows`; append `def.Options.Section` to `Map.Sections` and insert its id into `Map.Groups[n].Sections` at its `Order` (the library reads `config.Groups` at draw time, `Libs/Krowi_Options/WindowPage.lua:108`); put `def.Help` under `window.Help[sectionId]`.
  - The `Features` options page: `options.OptionsTable.args.Features` and an entry in `options.OptionsTables` with `RegisterOptionsTable` (as `Options/Layout.lua:11-13`), so AceConfig sees it.
  - `StartAll()`: for each registered feature whose switch is on, set `Starting`, `xpcall(def.Start, CallErrorHandler)`, clear `Starting`, record started; then for each not started: prepend the off line (`L["Feature Off Help"]`) to its help blocks and leave its `ShowMe` nil; for each started with a scene: wire `CanShowMe`/`ShowMe` as `ShowMe.lua:328-338` does. Called in `Krowi_AchievementFilter.lua` between `addon.Options:Load(true)` (`:38`) and `PluginsApi:LoadPlugins` (`:40`), and in `options-env.lua` between `:361` and `:366`.
- **Hosts:**
  - `Api/AchievementDataApi.lua:64-95`: the four reward-id blocks become one loop over `{"HousingDecorId", "MountId", "PetSpeciesId", "CreatureDisplayId"}` calling the field's slot handler with `(id, value)`; no handler, nothing.
  - `AchievementButtonExtraIconFactory.lua`: `SetExtraIcons` calls `addon.Slots.RowIcons` providers after the built-ins with `(self, achievement, factory.Get)`; the reset clears `extraIcon.Data` instead of `RewardEntry`/`RewardGroup` (`:54-55`). GW2_UI's `factory.GetNew` hook stays untouched.
  - `AchievementMenu.lua:44-54`: `CreateMenu` walks its `Sections` merged with the slot's entries by `Order`; each section file gets `section.Order` (WowheadLink 10, GoTo 20 with its attached sub-sections riding on it, Guide 30, PopOut 40, TransmogSets 60, PetBattleLinks 70, More 80).
  - `Options/Window/Map.lua:17-21`: each group gets `Key` and an `Orders` list beside `Sections` (core ids keep their positions; Reward preview's section brings `NavGroup = "window"`, `Order` between Pop Out and Guides).
  - `Options/Window/Help/Help.lua` exports its block builders as `window.HelpBlocks` (`Picture`, `Heading`, `Text`, `Term`, `Blocks`); `ShowMe.lua` exports `window.ShowMeKit` (`CanShow`, `Ready`, `PickAchievement`, `NotEarned`, `ShowAchievement`) for scenes registered later.
  - `Options/Window/Source.lua:296`: `Custom:GetNeedsReload()` returns true, so every profile row lights the reload bar.
  - `Gui/SidePanels.lua` and `Gui/Guide/Panel.lua`: comments only, no panel named by the other.

### 3. Reward preview into its folder (commit `feat: Reward preview as the first switchable feature`)
- `git mv` to keep history: `Api/RewardPreviewDataApi.lua` → `Features/RewardPreview/Api.lua`; `Data/RewardPreviewData.lua` → `Data.lua`; `Gui/RewardPreview/RewardPreview.lua` → `Window.lua`, `RewardPreviewMixin.lua` → `WindowMixin.lua`, `RewardPreview.xml` → `Window.xml`; `Gui/RightClickMenu/AchievementMenu/RewardPreview.lua` → `MenuEntry.lua`. Their old `Files.xml` lines go (`Api/Files.xml:15`, `Data/Files.xml:14`, `Gui/FilesModern.xml:17`, `Gui/FilesClassic.xml:16`, `Gui/RightClickMenu/AchievementMenu/Files.xml:15`); `Features/Files.xml` and `Features/RewardPreview/Files.xml` are added, the TOC loads `Features/Files.xml` after the Gui files and before `Data/Files.xml` on both clients.
- `Window.xml`: `name="KrowiAF_RewardPreviewTemplate" virtual="true"`, nothing else changed. `RewardPreview.lua` (new): the registration and `Start`, which creates `CreateFrame("Frame", "KrowiAF_RewardPreview", UIParent, "KrowiAF_RewardPreviewTemplate")`, adds the four data-field handlers, the row-icon provider (highest `Order`) and the menu entry (`Order` 50), and drains `Api.lua`'s queue.
- `Api.lua`: `KrowiAF.AddRewardPreviewData` queues before `StartAll`, stores while started, returns while not; the queue is dropped for an off feature (registry hook `def.OnNotStarted`).
- `RowIcon.lua`: `AchievementButtonExtraIconFactory.lua:221-304` moved; `RewardEntry`/`RewardGroup` become `icon.Data.Entry`/`icon.Data.Group`.
- `Options.lua`: the six rows (`Options/Layout.lua:1224-1273`) and their setters (`:538-591`) as `Rows`, defaults from `Options/Defaults.lua:97-102`, the section from `Map.lua:171-175` re-pointed at `Features.args.RewardPreview` (`Group` entries for the switch and the settings group); removed from Layout, Defaults and Map. Saved keys unchanged (`Achievements.*`); the switch `Features.RewardPreview`, default `true`.
- `Help.lua`: `help.rewards` (`Help.lua:227-233`) and `scenes.rewards` with `HasMountPreview` (`ShowMe.lua:134-145, 276-285`) moved, built with `window.HelpBlocks`/`window.ShowMeKit`.
- `.luarc.json:126` and `Check-Repo.globals` if a global name changes (the template's).
- Flip the `features` scenarios' Recorded to Target; headless green.

### 4. The other suites and their models
- `Tests/Escape.lua:276-304`: `PinRewardPreview` returns `false, "the reward preview is off"` while not started (SKIP with reason); references move to the feature's names.
- `Tests/Pictures.lua:655-684, 876, 909`: guard `Close()`, skip the rewards step in `Run` (`:1133-1146`) while off, read the defaults from the feature's registration.
- `Tests/Help.lua:17, 91, 149-169` and `Tests/Options.lua:162-205, 372-377`: new expected values (apps=7, the fingerprint, entries and cards unchanged in count unless the section list changes), with the diff read as the review; a new options check: in every feature section the first option is the switch, and with the switch off in `db.profile` (set directly, put back after) every other option and `With` is disabled.
- `run-tests.lua:421-423` (escape model) and `:1174` (guide stub) follow the new names.

### 5. The matrix run
- `Tests/Tests.lua`: `/kaftest matrix` (parser `:315-335`) builds the plan from `addon.Features.List()` (all on, all off, each alone) and the suites from `tests.Suites` minus the probes (new `addon.Tests.Probes = {scheduler, sources, pictures}`); keeps it in `KrowiAF_DebugTable.Tests.Matrix` with the switches found; sets the step's switches; `C_UI.Reload()`. The PLAYER_ENTERING_WORLD handler (`:337-358`): while a plan is pending, it raises `keep` to the plan's run count before any `Report`, skips `RunOnLogin` and the `DebugSwitchedByRun` cleanup, runs the step's suites through `RunEntries`, then the next step; at the end restores the switches, reloads once more, then `ShowSummary` (the only `Done()`).
- `Report` (`:58-109`) stores `MatrixStep` (not `Argument`, which the suites read as a step selector) and leaves `Runs` alone for a matrix run; `headless/read-runs.lua` skips those and gains a `matrix` mode printing one `matrix|build|passed|failed|skipped|time` line per client.
- `Run-GameTests.ps1`: a `-Matrix` parameter set (`$Entries` is mandatory today, `:49-54`) that types `/kaftest matrix`, waits with a timeout sized to steps × suites, expects that many runs since its start (`:138-165`).
- `.claude/release-gate.ps1`: a check after the library one (`:93-101`): a green matrix record on the newest Retail and Mists builds newer than `git log -1 -- Features/`.
- Fallback if step 0's probe fails: each step ends with `Done()`, `Run-GameTests.ps1 -Matrix` types `/reload` and waits again until the plan's end marker.

### 6. Text, docs, review
- Two phrases below `Exported at` in all 11 locale files: `Feature Switch Desc`, `Feature Off Help` (translated); export with `krowi:localization` after merge-ready.
- `_Packaging/Changelog.md`: a new `## 106.0` entry (no date) with one `### Added` line, e.g. "Reward preview can be turned off in its options section; it then loads nothing until it is turned on again."
- Docs: `.github/copilot-instructions.md` (load order gains `Features/Files.xml`, Slots/Features files, the boundary rule, `features` in the suite list), `Tests/README.md` (`features`, matrix), `docs/architecture.md` (registry and slots), `.claude/tools/README.md` (`feature-boundary`, `-Matrix`).
- `review-options.md`: the six options reviewed (what, name, description, help text), proposals for the look gate.
- `walkthrough.md`: Event reminders and the Right-click menu against the registry and slots, what fits and what a later PR adds.

## Risks
- **Template timing:** `OnLoad` (model scene from Blizzard templates) now runs at `ADDON_LOADED` instead of file load; the before/after escape and pictures runs show any difference.
- **Matrix and the kit:** a loading screen longer than 30 s fails `-WaitForDone`; debug mode, history and `RunOnLogin` must not undo the plan across reloads (all four clashes handled above).
- **Gate class:** existing test-tooling lines change (`Tests/Options.lua` expectations, `run-tests.lua`, `Tests.lua`), so `Get-ChangeClass.ps1` may say `harness`; then `Class` is raised and its gates asked before the PR.
- **Order numbers:** the menu, nav groups and row icons gain explicit orders; a wrong number moves an entry. The menu suite and the options suite's card and nav checks catch it.
- **Plugin queue:** an external addon calling `KrowiAF.AddRewardPreviewData` before KAF's `ADDON_LOADED` is queued; dropped when off.
- **Merge blocker:** the kit's release skill needs its hotfix mode before this PR merges (separate kit work item).

## Proof
- Headless: `features` (start check, off/on boots), `options`, `help`, `menu`, `escape`, `guide`, `tooltip`, `run-tests.lua` all suites via `Check-Repo.ps1`; `load-data.lua Both`; `snapshot-data.lua` and `snapshot-categories.lua` with no diff.
- Lint: `Check-Repo.ps1` (full) green; `feature-boundary` fails once on a scratch reference from `Gui/` to `addon.RewardPreviewData` (not committed).
- `Find-DeprecatedApi.ps1` on the moved files; `krowi:taint-reviewer` on the diff; `/code-review`.
- In game, Retail and Mists: deploy, `Run-GameTests.ps1 -Matrix` green (all on, all off, back on), `Read-GameErrors.ps1` no new row; memory figures off/on from the `features` observations into the PR.
- Look gate: a published page with screenshots of both clients (switch on top, greyed section, off help page) and the options review.