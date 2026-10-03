# Spec: The world map button disappears on Classic after resizing the map
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. On Classic, the world map button draws above the map canvas and its pins when the map opens, after it is maximized, after it is minimized again, and after any number of further switches.
2. The same holds when another addon changes the map's strata (ElvUI's smaller world map, GW2_UI's map skin and Leatrix Maps all call `WorldMapFrame:SetFrameStrata`).
3. While the map is small, the button stays one strata above the map, as it is today (HIGH over a MEDIUM map), so it does not draw over windows at higher strata.
4. Retail and Wrath Classic keep their button exactly as it is, and the library is not edited.
5. Other addons' buttons from the same library keep their parent, strata and place.
6. A scenario records the defect and the fix, headlessly and in game.

## Root cause
The button is a child of `WorldMapFrame`, and only its own strata keeps it in front of the map. The game moves a frame's children to the new strata whenever the frame's strata changes, and on Mists Blizzard changes the map's strata on every resize.

- `Gui/WorldMapButton/WorldMapButton.lua:8` creates the button with `Krowi_WorldMapButtons-1.4:Add`. The library sets `HasNoOverlay = major <= 3` (`Libs/Krowi_WorldMapButtons/Krowi_WorldMapButtons.lua:17`), so on Mists (5.5.4) it creates the button with `WorldMapFrame` as parent (`:89`). The button gets frame level 2, the map's level plus one. The template gives it `frameStrata="HIGH"` (`Gui/WorldMapButton/WorldMapButton.xml:5`), and the map is MEDIUM (`MapCanvasFrameTemplate`, `Blizzard_MapCanvas/Blizzard_MapCanvas.xml:52`). As long as the strata differ, the button draws above the whole map.
- The in-game probe on 2026-10-02 shows the levels inside the map: `WorldMapFrame` 1, `ScrollContainer` 2, `ScrollContainer.Child` (the canvas) 3. Pins on the canvas take absolute levels from 2000 up (`MAP_CANVAS_PIN_FRAME_LEVEL_DEFAULT`, `Blizzard_MapCanvas/MapCanvas_PinFrameLevelsManager.lua:3`).
- `WorldMapMixin:SynchronizeDisplayState` (`Blizzard_WorldMap/Cata/Blizzard_WorldMap.lua:6` and `:39`, the file the Mists TOC loads) calls `self:SetFrameStrata("FULLSCREEN")` when the map is maximized and `self:SetFrameStrata("MEDIUM")` when it is minimized. The probe confirms the map and its canvas follow (MEDIUM → FULLSCREEN → MEDIUM). The game moves the button along with them. It then shares the map's strata at level 2, under the canvas at 3, and the canvas covers it. Nothing sets HIGH again, so the button stays covered until `/reload` builds it from the template. Blizzard's own floor dropdown has the same `frameStrata="HIGH"` in its template, and Blizzard works around the same thing on minimize by raising its level (`:61`).
- The first open of a small map does not change the strata. `HandleUserActionMinimizeSelf` reaches `SetDisplayState`, which calls `Minimize()` only when the map is maximized (`Blizzard_WorldMap/Wrath/QuestLogOwnerMixin.lua`), so the button looks fine until the first resize. A map that opens full size calls `Maximize()` and hides the button on the first open.
- RareScanner sets `rwm.HasNoOverlay = true` before `Add` (`RareScanner/Core/Service/RSMap.lua`). That makes its button a child of `ScrollContainer` at TOOLTIP. A resize pulls it into the map's strata as well, but there it sits at level 3, level with the canvas, and draws in front of it. Pins at 2000 and up still draw over it.
- Retail is unaffected: `Blizzard_WorldMap/Mainline/Blizzard_WorldMap.lua` never calls `SetFrameStrata`, and the addons that do (ElvUI, GW2_UI, Leatrix Maps) do it only on Classic. Wrath Classic is unaffected because `HasNoOverlay` is true there; the ElvUI plugin restores TOOLTIP after ElvUI's smaller map (`Plugins/ElvUI.lua:823`).

Found on the way, out of scope: on Mists, the library's `HookDefaultButtons` (`Krowi_WorldMapButtons.lua:48`) compares `f.OnLoad == WorldMapTrackingOptionsButtonMixin.OnLoad`. Both sides are nil for Blizzard's zone timer and floor dropdown, so the library lists them as buttons. `SetPoints` then re-anchors them to the top right after every map change, and our button is named `Krowi_WorldMapButtons3`. This belongs upstream in the library.

## Design
Keep the button one strata above the map's, on Classic, whenever the button is a child of `WorldMapFrame`:

- After `Add`, set the button's strata to the one above `WorldMapFrame:GetFrameStrata()`, using the order BACKGROUND, LOW, MEDIUM, HIGH, DIALOG, FULLSCREEN, FULLSCREEN_DIALOG, TOOLTIP. TOOLTIP stays TOOLTIP. On a MEDIUM map that gives HIGH, the strata the button has today.
- Post-hook `WorldMapFrame:SetFrameStrata` with `hooksecurefunc` and apply the same rule. Blizzard's resize, ElvUI, GW2_UI and Leatrix Maps all set the map's strata through that call. The game moves the button first; the hook then lifts it back one strata above. A FULLSCREEN map puts the button at FULLSCREEN_DIALOG, a HIGH map (ElvUI's smaller map) at DIALOG.
- Guard: not `addon.Util.IsMainline`, and `button:GetParent() == WorldMapFrame`. Retail keeps its code path. Wrath, where the library parents the button to `ScrollContainer`, is unchanged, and so is the ElvUI plugin's Wrath hook. A client where another addon set `HasNoOverlay` before our `Add` is unchanged too.

The button keeps its parent, anchor and place in the library's row. Its strata is the only thing that changes, so requirements 1 to 5 hold.

## Options considered
1. **Keep the button one strata above the map (recommended).** The button stays visible at the top right in both sizes and under every map addon that changes the strata. It draws above pins, as it does today on the first open. The cost is one secure post-hook on a Blizzard frame, reviewed for taint.
2. **Copy RareScanner: create the button under the canvas container.** This would set the library's `HasNoOverlay` before `Add` and restore it after. The button survives the resize the way RareScanner's does. But in the map's strata it sits under the pins, so a pin in the corner covers it or takes its click. Until the first resize it is at TOOLTIP, drawing over any window that overlaps the small map. It also relies on the button drawing in front of a canvas at the same level. No hook.
3. **Fix the button's strata with `SetFixedFrameStrata(true)` at FULLSCREEN_DIALOG.** The button is always visible, with no hook. But on the small map it draws over the windows and dialogs that overlap the map's corner. Whether the Mists client has the API is unverified.
4. **Fix it in the library**, for example by choosing the canvas container on every Classic client. Not chosen: the maintainer put the fix in this repository, and the library's existing path is option 2 with the same drawbacks.

## Areas of concern
- **Taint and secret values:** `hooksecurefunc(WorldMapFrame, "SetFrameStrata", ...)` is a post-hook. Blizzard's call runs securely, and the hook runs afterwards and only calls `SetFrameStrata` on the addon's own unprotected button. It never writes a Blizzard field or calls a protected function. The map can be resized in combat, and a strata change on an insecure frame is allowed then. No secret values are read. The `taint-reviewer` subagent reviews the diff.
- **Retail and Classic:** Retail is excluded by `IsMainline`; Wrath by the parent check. Cata Classic runs the same map code as Mists and is fixed with it.
- **Plugins and skins:** ElvUI's smaller world map on Mists sets the map to HIGH (`ElvUI/Game/Shared/Modules/Maps/Worldmap.lua:61`), and the hook lifts the button to DIALOG. GW2_UI's map skin (HIGH) and Leatrix Maps (MEDIUM) go through the same call. `Plugins/ElvUI.lua` stays as it is. RareScanner's and Atlas's buttons are not touched.
- **Saved variables and migrations:** none.
- **Localization:** none.
- **Data snapshots:** none, no data or category files change.

## Verification
- New suite `worldmap` in `Tests/WorldMap.lua` and the headless runner. The headless model: the map frame and its canvas at the probe's levels; the engine rule that a strata change moves the children with it; the library's real `Add`; Blizzard's `SynchronizeDisplayState` strata calls. A scenario passes when the button's strata ranks above the canvas's; the same strata counts as covered, because pins share it from level 2000 up. Classic only; on Retail the scenarios are skipped as not applicable.
  - Small map, first open: Recorded above (HIGH over MEDIUM), Target above.
  - After maximizing: Recorded covered (FULLSCREEN, level 2, canvas at 3), Target above (FULLSCREEN_DIALOG).
  - After maximizing and minimizing again: Recorded covered (MEDIUM, level 2), Target above (HIGH).
  - Another addon sets the map to HIGH (ElvUI's smaller map): Recorded covered, Target above (DIALOG).
- In game on Mists Classic: `/kaftest worldmap` opens the map, switches its size through `WorldMapFrame.MaximizeMinimizeFrame`, then restores the `miniWorldMap` CVar, the map's size and whether it was open. Before the fix it must reproduce the Recorded rows, after it the Target rows. A manual check confirms the button is visible and clickable in both sizes, with RareScanner enabled.
- `Check-Repo.ps1 -ChangedOnly`, `Read-GameErrors.ps1 -Client Classic` after the in-game runs, and a Retail `/reload` to confirm the button there is unchanged.

## Decision
Option 1, keep the button one strata above the map, chosen by Krowi on 2026-10-03. The intent was accepted with it.