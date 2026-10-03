# Plan: The world map button disappears on Classic after resizing the map
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi (maintainer) on 2026-10-03 in plan mode. It adds a hook on a Blizzard frame, so it waited for that gate.

## Context
On Mists Classic the library parents our button to `WorldMapFrame` at level 2, with the template's HIGH strata. Blizzard's `SynchronizeDisplayState` sets the map to FULLSCREEN or MEDIUM on every resize, and the game moves the button into that strata. There the canvas (level 3) and its pins (2000 and up) cover it until `/reload`. Decision (spec option 1): keep the button one strata above the map. The strata is set after `Add` and again after every `WorldMapFrame:SetFrameStrata` through a secure post-hook, on Classic only and only while the button is a child of `WorldMapFrame`.

## Files that change
- `Tests/WorldMap.lua` (new) and `Tests/Files.xml` (registered after `Navigation.lua`): the `worldmap` suite in the shape of `Tests/Navigation.lua` (scenario table, `RunScenario`, `worldMap.Run(env)`, `gameEnv`, `addon.Tests.Suites.worldmap`).
  - **Scenario start state:** each scenario starts from the state after a `/reload` (map closed and small, MEDIUM, button HIGH) and runs its steps.
  - **What it records:** `above` when the button's strata ranks above the canvas's, otherwise `covered`. The same strata counts as covered, because pins share it from level 2000 up. Only strata names go into the line, so the game and the model can be diffed.
  - **Retail:** `Run` returns no scenarios and one observation; a SKIP would fail the lint in `-check` mode.
  - **`gameEnv` drives the player's paths:**
    - Setup refuses with a reason when Show world map icon is off, when the button is not a child of `WorldMapFrame`, or when ElvUI, GW2_UI or Leatrix_Maps is loaded. It snapshots whether the map is open, `IsMaximized()` and the `miniWorldMap` CVar.
    - Reset: `MaximizeMinimizeFrame:Minimize()` if maximized, `HideUIPanel(WorldMapFrame)`, `WorldMapFrame:SetFrameStrata("MEDIUM")`, button HIGH.
    - OpenSmall and OpenLarge set `miniWorldMap` to 1 or 0 and call `ToggleWorldMap()`.
    - Maximize and Minimize call `WorldMapFrame.MaximizeMinimizeFrame:Maximize()` and `:Minimize()`, the calls Blizzard's own `OnShow` makes.
    - Teardown runs Reset, then restores the CVar, the size and whether the map was open.
- `.claude/tools/headless/run-tests.lua`:
  - **Frame model:** `SetFrameStrata(s)` sets the frame and every descendant (the engine rule). `GetFrameStrata()` returns the frame's own strata, else its parent's, else MEDIUM. `NewFrame` records children in the parent.
  - **`suites.worldmap`:** a minimal `LibStub`; the real `Libs/Krowi_WorldMapButtons/Krowi_WorldMapButtons.lua`, `Gui/WorldMapButton/WorldMapButtonMixin.lua` and `Gui/WorldMapButton/WorldMapButton.lua`; the template `KrowiAF_WorldMapButton_Template` (mixin plus HIGH); and a suite-local `hooksecurefunc` that also posts after a table method.
  - **Mists map model** (`Blizzard_WorldMap/Cata/Blizzard_WorldMap.lua`, `Wrath/QuestLogOwnerMixin.lua`):
    - `WorldMapFrame` MEDIUM with `ScrollContainer.Child`, and `GetCanvasContainer`.
    - `Maximize`/`Minimize` through `SynchronizeDisplayState`, and a no-op `OnMapChanged`.
    - `SetDisplayState`, `MaximizeMinimizeFrame`, `ToggleWorldMap`, and `GetCVarBool`/`SetCVar` for `miniWorldMap`.
  - The header's suite list names the suite.
- `.github/copilot-instructions.md`: name the `worldmap` suite in the headless suites paragraph.
- `Gui/WorldMapButton/WorldMapButton.lua`: `KeepAboveMap(button)` takes the strata after `WorldMapFrame:GetFrameStrata()` in the order BACKGROUND, LOW, MEDIUM, HIGH, DIALOG, FULLSCREEN, FULLSCREEN_DIALOG, TOOLTIP. `Load` keeps the `Add` call and returns early on Retail or when the parent is not `WorldMapFrame`. Otherwise it calls `KeepAboveMap` and `hooksecurefunc(WorldMapFrame, "SetFrameStrata", ...)`.
- `_Packaging/Changelog.md`: one line under 101.1 `### Fixed`, without a dev note, matching the other 101.1 entries after the maintainer's edit; the root cause stays in `spec.md`.
- `docs/codebase-analysis.md`, at stage 6: the library's `HookDefaultButtons` nil == nil finding on Mists, deferred upstream.

## Order of work
1. Write `Tests/WorldMap.lua`, register it, extend the frame model and add `suites.worldmap`, and name the suite in the instruction file. The suite's scenarios:

   | Name | Steps | Recorded | Target |
   |------|-------|----------|--------|
   | `small-map-opened` | OpenSmall | above | above |
   | `large-map-opened` | OpenLarge | covered | above |
   | `maximized` | OpenSmall, Maximize | covered | above |
   | `maximized-and-minimized` | OpenSmall, Maximize, Minimize | covered | above |
   | `addon-sets-map-strata` | OpenSmall, AddonStrata (`WorldMapFrame:SetFrameStrata("HIGH")`, as ElvUI's smaller map and GW2_UI do) | covered | above |

2. Run the suite headlessly: Classic 5 PASS with 4 open, Retail no scenarios. Then `Check-Repo.ps1 -ChangedOnly`.
3. In-game before-run on Classic:
   1. `Deploy.ps1 -WhatIf -Client Classic`, then deploy.
   2. The maintainer runs `/kaftest worldmap`, then `/reload`.
   3. `Read-GameTests.ps1 -Client Classic` must match the headless lines.
   4. Commit `test: reproduce the Classic world map button in the worldmap suite`.
4. Fix `Gui/WorldMapButton/WorldMapButton.lua`, set `Recorded = Target` on the four open scenarios, and rerun: 5 PASS, 0 open.
5. Changelog line, and this plan updated wherever the work departed from it.

## Risks
- **The engine rule:** if the button keeps HIGH after a resize, the before-run will not reproduce `covered`. The fix stops there and the spec reopens.
- **Taint from the in-game run:** it drives Blizzard's map from insecure code (`ToggleWorldMap`, `MaximizeMinimizeFrame`). That taints the map's display state until the `/reload` the procedure already ends with. The run happens only in debug mode and out of combat.
- **ElvUI:** it reparents the map (`SetParent(E.UIParent)`) right after setting HIGH. If `SetParent` alone changes the strata, the hook does not see it. This is covered by an optional manual check with ElvUI's smaller map on.
- **Merge overlap:** the until-cutoff branch also adds a suite (`obtainable`) to `run-tests.lua`, `Tests/Files.xml` and the instruction file. Whichever PR merges second resolves those lists.

## Proof
- `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" worldmap`: Classic 5 PASS with 0 open after the fix; Retail no scenarios. `Check-Repo.ps1 -ChangedOnly` clean.
- The `taint-reviewer` subagent on the diff.
- In-game after-run on Classic: deploy, `/reload`, `/kaftest worldmap`, `/reload`. `Read-GameTests.ps1 -Client Classic` shows 5 PASS and 0 open, and `Read-GameErrors.ps1 -Client Classic` shows nothing new.
- Manual check on Classic with RareScanner enabled: the button is visible and clickable in both sizes after several switches.
- Retail: deploy and `/reload`; the button looks and works as before, and `Read-GameErrors.ps1` shows nothing new.