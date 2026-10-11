# Plan: Achievement guides and waypoints
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi (maintainer) on 2026-10-11 in plan mode, with the option defaults and the waypoint-provider rule under "Settled in this plan". It touches shared GUI code, the data API and the options, so it waited for that gate.


## Context
Players have to leave the game to learn how to do an achievement. For 60962 "Legendary Research of the Ebon Blade" the description says "research all upgrades", but the criteria are really the two Tier VII class-hall talents, 486 "Frost and Death" and 487 "Roster of Champions". Their criteria names are empty, so the addon shows nothing useful. The NPC (Archivist Zubashi, 97485, Acherus uiMap 647/648) is listed nowhere with coordinates. The maintainer decided:
- structured guide steps, with names from the game and one tip;
- four surfaces, each an option: tooltip, right-click menu, row icon with a side panel, and expanded row;
- Blizzard and TomTom waypoints, with a provider option;
- scope: 60962 only.

## Settled in this plan (confirm at this gate)
- **Option group "Guide"** in the Achievements tab, profile key `Achievements.Guide`:
  - `Tooltip = true`
  - `RightClickMenu = true`
  - `Icon = true` (row icon and side panel)
  - `ExpandedRow = false` (it changes row heights)
  - `WaypointProvider = 1`: 1 Both, 2 Map pin (Blizzard), 3 TomTom
- **"Both" shows every provider that can place the point.** Without TomTom that is just the map pin, so it doubles as the automatic default. When the chosen provider cannot place the point, the action is shown disabled with the reason in its label, for example "Set waypoint (TomTom is not loaded)". The menu library has no tooltips on Classic, so the reason cannot go in a tooltip.
- **Coordinates are percent (0-100)**, as `/way` and Wowhead use them, and are divided by 100 for `UiMapPoint` and TomTom.
- **The data table is keyed `KrowiAF.GuideData.Legion`**, like `TransmogSetData.Legion`.
- **The NPC step carries the NPC id** (for the snapshot) and its name through `addon.L`, as PetBattleLinkData does.
- **The side panel registers with `addon.Gui:RegisterFrameForClosing`**, so Escape closes it (`Gui/FramesForClosing.lua`).

## Step 0 — prerequisites (maintainer)
1. **In-game probe.** On a Death Knight in Acherus, next to Archivist Zubashi, on Retail:
   `/dump C_Map.GetBestMapForUnit("player")`, `/dump C_Map.GetPlayerMapPosition(C_Map.GetBestMapForUnit("player"), "player")`, `/dump C_Map.CanSetUserWaypointOnMap(647), C_Map.CanSetUserWaypointOnMap(648)`, `/dump C_Garrison.GetTalentInfo(486)`.
   Then `/dump C_Garrison.GetTalentInfo(486)` once more on another class. The answers give:
   - the NPC's map and coordinates;
   - whether the map pin works in Acherus (if not, it shows its reason there);
   - whether the talent state can be shown on other classes (if not, they get the name only).

   **Results, Death Knight, Retail, 2026-10-11:**
   - Zubashi stands on uiMap 648, the second Acherus floor (parent 647 in `raw/MapVerifier.csv`), at x 0.4774, y 0.5376. In percent rounded to 0.1 that is `:Npc(97485, addon.L["Archivist Zubashi"], 648, 47.7, 53.8)`.
   - `CanSetUserWaypointOnMap` is true on 647 and on 648, so the map pin serves 60962. `waypoint-map-pin-disallowed` stays as a stubbed scenario.
   - `GetTalentInfo(486)` returns everything the renderer needs: name "Frost and Death", tier 6, tree 128, `researched` false, `isBeingResearched` false, `researchDuration` 86400 (1 day), and a cost of 10000 in currency 1220 (Order Resources). `talentAvailability` is 5, `UnavailableTierUnavailable` (`Blizzard_APIDocumentationGenerated/GarrisonConstantsDocumentation.lua:367`), so this character has not unlocked Tier VII yet.
   - A Paladin in their own class hall gets the same table back, `talentAvailability` 5 included. The name and cost resolve on any class, but the state is meaningless there: a Paladin can never research a Death Knight talent, and the game reports it as "tier unavailable", not as "wrong class". So the renderer shows the state only when tree 128 belongs to the player's class (see `Guide.lua` below), and every other class gets the name only.
2. **Commit the class-hall zone work on `dev` first.** Done: the zone work is committed on `dev` (37308b5a, 60962 at `07_Legion/ZoneData.lua:144`), and this branch starts at `dev`'s head (e76b27ed), so it needs no rebase.

## Files that change
**Data**
- New `Api/GuideDataApi.lua`:
  - `KrowiAF.GuideData = {}`.
  - `KrowiAF.AddGuideData(id, steps)` reports `LoadDiagnostics.Kind.UnregisteredAchievement` with the detail "guide", asserts against a second guide, and sets `achievement.Guide`. It is a copy of `Api/TransmogSetDataApi.lua`.
- New `Api/GuideDataBuilder.lua`:
  - `KrowiAF.Guide(id)` returns `setmetatable({KrowiAF.AddGuideData, id, {}}, GuideBuilder)`, the pattern of `Api/AchievementDataBuilder.lua:144-146`, so no loader is needed.
  - Methods `:Travel(spellId)`, `:Npc(npcId, name, uiMapId, x, y)`, `:Criteria()` and `:Tip(text)` append flat `{Type = ..., ...}` steps.
- `Api/Files.xml`: register both files.
- `Data/Data.lua`:
  - `RegisterGuideDataTasks`, a copy of `RegisterTransmogSetDataTasks` (`:98-105`).
  - It is called after the achievement tasks (`:152-160`), because groups run in registration order.
- New `DataAddons/Retail/07_Legion/GuideData.lua`, holding the 60962 guide: Travel 50977 (Death Gate), Npc 97485 at the step-0 coordinates, Criteria, and the tip. Register it in `07_Legion/Files.xml` between EventData and PetBattleLinkData.
- Headless:
  - `.claude/tools/headless/load-data.lua:42` and `client-env.lua:313-314`: add `GuideData` and `RegisterGuideDataTasks`.
  - `snapshot-data.lua`: add `Guide` to `achievementFields` (`:334-336`) and a GUIDE section, modelled on TRANSMOG (`:474-487`). It prints ids only (step types, spell, NPC, map, x, y), which keeps the snapshot's "ids only" rule. Then regenerate the snapshots.

**Shared logic** (new folder `Gui/Guide/`, one `Guide.xml` listed in both `Gui/FilesModern.xml` and `Gui/FilesClassic.xml`)
- `Guide.lua` (`addon.Gui.Guide`) renders one achievement's guide for every surface: `GetLines(achievement)` returns `{Text, Waypoint = {MapId, X, Y, Title}}`.
  - Travel: the spell name.
  - Npc: "Talk to <name>, <map name>", the map name through `C_Map.GetMapInfo`.
  - Criteria: for each criterion of type 198, `GetAchievementCriteriaInfo` gives the asset, and `C_Garrison.GetTalentInfo(asset)` gives the name and one of four states: researched, researching, locked (`talentAvailability` is `Enum.GarrisonTalentAvailability.UnavailableTierUnavailable`, shown as "locked, finish the previous tier first"), or not yet. Krowi added the locked state on 2026-10-11 after the step-0 probe. It is guarded when the API is missing.
    - The state shows only when the talent's `treeID` is among `C_Garrison.GetTalentTreeIDsByClassID(Enum.GarrisonType.Type_7_0_Garrison, classId)`, with `classId` the third return of `UnitClass("player")` (not secret; `Globals.lua:222` already reads it, and Blizzard does the same at `Blizzard_OrderHallUI/Blizzard_OrderHallTalents.lua:670-671`). Any other class gets the name only.
  - Tip.
- `Waypoint.lua`:
  - Providers:
    - **Map pin**: needs `C_Map.SetUserWaypoint` and `UiMapPoint`; checks `C_Map.CanSetUserWaypointOnMap`; sets the waypoint, then `C_SuperTrack.SetSuperTrackedUserWaypoint(true)`.
    - **TomTom**: `C_AddOns.IsAddOnLoaded("TomTom")`, then `TomTom:AddWaypoint(map, x/100, y/100, {title, from = addon.Metadata.Title})`.
  - `GetActions(waypoint)` returns `{Text, Func, Enabled}` for the provider option.
- `GuidePanel.xml`, `GuidePanel.lua` and `GuidePanelMixin.lua`: a singleton `KrowiAF_GuidePanel`, modelled on `Gui/RewardPreview/` (`TooltipBorderBackdropTemplate`, HIGH strata, title, close button). `TogglePin(button, achievement)` anchors it TOPLEFT to the button's TOPRIGHT, as in `RewardPreview.lua:38-91`. It holds one FontString per line and one small button per waypoint action, closes when its owner window hides, and registers for Escape.

**Surfaces**
- **Tooltip.** New `Gui/AchievementTooltip/Guide.lua` replaces the `Comment.lua` placeholder: delete that file and its commented line in `Files.xml:15`, and add `Guide.lua` in the same place.
  - `CheckAdd` checks the option and `achievement.Guide`, as in `AddedInVersion.lua:1-10`.
  - `Add` writes the header, then white wrapped lines (`AddLine(text, 1, 1, 1, true)`).
- **Right-click menu.** New `Gui/RightClickMenu/AchievementMenu/Guide.lua`, after `GoTo.lua` in that `Files.xml`. It is a "Guide" submenu (the `GoTo.lua:16-31` pattern) holding "Open guide" (the panel, when the icon option is on) and the waypoint actions (`CreateButtonAndAdd(menu, text, func, isEnabled)`).
- **Row icon.** In `AchievementButtonExtraIconFactory.lua`, `SetExtraIconGuide`:
  - It is gated by the option and `achievement.Guide`, and goes before reward preview, which stays last (`:261-271`).
  - Its `OnClickCallback` calls `TogglePin`, and its tooltip `Lines` says "Guide: click to open".
  - Any new icon field is added to `ResetExtraIcons` (`:42-61`).
  - The atlas is checked in both UI sources.
- **Expanded row.** In `AchievementButtonMixin.lua:DisplayObjectives`:
  - The block is inserted between `:309` and `:311`: a guide block anchored under the objectives, its height added to the row's.
  - It hides on collapse (like `:566-570`) and has its own cache next to `:289`.
  - The block is shared and reparented, like `KrowiAF_AchievementsObjectives`, with its own instance for the popout (`AchievementPopoutMixin.lua:81-85` picks up the height).
  - Waypoint actions are small buttons, since no hyperlink pattern exists in `Gui/`.

**Options, strings, docs**
- `Options/Defaults.lua`: add `Achievements.Guide`.
- `Options/Layout.lua`: a "Guide" group with four toggles and a select, modelled on `:1782-1789`, using `KAF_AddDefaultValueText`. The row-option setters call `KrowiAF_AchievementsFrame:ForceUpdate()`, as at `:510-517`.
- `OPTIONS.md`: document the new group.
- `Localization/*.lua`, 11 locales: new keys below `Exported at` (Guide, the option names with their Desc, Set waypoint, Open guide, Talk to, Travel, the four research states, the disabled reasons, Map pin, "Archivist Zubashi" and the tip).
  - A Blizzard global string is used wherever an exact one exists.
  - Translations are drafted by the agent and flagged to the maintainer.
- `Globals.lua`: a debug-only `/kafwhere`, next to `/kafait` (`:172`). It prints the player's map id and percent coordinates as a ready `:Npc(...)` argument list. It reads no unit identity, so no secret values.
- `.luarc.json`: add the `TomTom` global between `TableToString` and `UNTRACK_ACHIEVEMENT_TOOLTIP`.
- `_Packaging/Changelog.md`: one line under 102.1 `### Added`.
- `docs/architecture.md`: add `Gui/Guide/` to the file map.

**Tests**
- New `Tests/Guide.lua`, registered in `Tests/Files.xml`. Add `suites.guide` in `run-tests.lua`, with stubs modelled on the tooltip suite (`:719-797`): `C_Spell`, `C_Map`, `GetAchievementCriteriaInfo` (type 198, assets 486 and 487), `C_Garrison` (with `GetTalentTreeIDsByClassID` returning tree 128 or not), `UnitClass`, `TomTom` present or absent, and the options. Add the suite to `Tests/README.md` and to the instruction file's suite list (line 40).

## Order of work
1. **Scenarios first.** Write `Tests/Guide.lua` and `suites.guide`, with Recorded set to today's behaviour ("none"):
   - `tooltip-60962`
   - `tooltip-60962-other-class` (talent names without a state)
   - `tooltip-60962-locked` (Tier VII not unlocked, as on the step-0 Death Knight)
   - `menu-60962`
   - `waypoint-both-without-tomtom`
   - `waypoint-both-with-tomtom`
   - `waypoint-tomtom-missing`
   - `waypoint-map-pin-disallowed`
   - `options-off`
   - `no-guide-11223` (Recorded and Target both "none")

   Run the headless suite and confirm everything passes and is open. Deploy, then you run `/kaftest guide`, and `Read-GameTests.ps1` must be green. Commit `test: guide suite for achievement guides`.
2. **Data.** The API, builder, registration, headless registries and the 60962 guide with the step-0 coordinates, plus its strings in every locale. Run `load-data.lua Both` (no drops), then `snapshot-data.lua -write`; the diff must show 60962's guide and nothing else. Commit `feat(data): guide data and the 60962 guide`.
3. **Milestone A: renderer, waypoints, options, tooltip and right-click menu.** Add `/kafwhere`. Set Recorded to Target for these scenarios, then run the suite and `Check-Repo -ChangedOnly -Luals`. In game on Retail, with and without TomTom: hover, right-click, set the waypoint. Commit.
4. **Milestone B: row icon and side panel, then the expanded row.** Check the row heights with and without objectives, and under GW2_UI if available. In game again. Commit.
5. **Wrap up.** Changelog, `OPTIONS.md`, architecture, `.luarc.json`. Run the `taint-reviewer` on the diff, `/code-review`, the in-game after-run on Retail and a `/reload` on Classic with `Read-GameErrors.ps1` on both. Set the work files to `done`, open the PR against `dev`, and wait for the merge gate.

## Risks
- **Taint from super-tracking.** A user waypoint changes what the objective tracker and the map show. Mitigation: a click-only call path, the `taint-reviewer`, and an in-game check that sets a waypoint and then enters combat with no errors.
- **Expanded-row height.** It is off by default, the block is anchored to the objectives frame (so GW2_UI's re-anchoring still holds), and its height is added after the description and reward adjustments, so the `CollapsedHeight` test at `:303` is unchanged.
- **Icon pool.** An icon field not cleared in `ResetExtraIcons` leaks to a recycled row. It is added there, and a no-guide scenario covers it.
- **Classic.** `C_Garrison`, `C_Spell`, `UiMapPoint` and the map pin may be missing. Every call is guarded by an existence check, and no Classic guide data is written; the Classic `/reload` checks this.
- **Stale data.** Coordinates come only from the step-0 probe or `/kafwhere`. Costs and times come live from `C_Garrison`, never typed.
- **Scope.** Four surfaces is a lot of GUI for one guide. Milestone A works on its own, and B can be deferred if the in-game check of A changes the maintainer's mind.

## Proof
- `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" guide`: every scenario PASS, none open.
- `load-data.lua "$PWD" Both`: no errors or drops. The snapshot diff is limited to 60962.
- `Check-Repo.ps1 -ChangedOnly -Luals`: 0 errors.
- In game on Retail: `/kaftest guide` is green in `Read-GameTests.ps1`. Hovering 60962 on a Death Knight shows the Guide section with the live talent state, and on another class the talent names without a state. Right-click → Guide → Set waypoint puts the pin or TomTom arrow on Zubashi. The icon opens the panel and Escape closes it. The expanded-row option adds the block. `Read-GameErrors.ps1` is clean.
- On Classic: `/reload`, open the window and hover an achievement. Nothing new appears, and `Read-GameErrors.ps1 -Client Classic` is clean.

## Found on the way (separate work items, not in this one)
- `PetBattleLinks.lua:25,36,70` and `Options/General.lua:62` call `LibStub` with names nothing registers (`Krowi_PopupDialog-1.0`, `Krowi_MenuBuilder-1.0`). Unless another installed addon still ships those libraries, the Xu-Fu links and the general tutorial raise an error.
- `AchievementMenu.lua:27` passes `disabled` (true) as the builder's `isEnabled`, so the "(Missing)" entries stay clickable.
- `achievement:AddTransmogSet` has no callers, so `achievement.TransmogSets` is always nil and the `MostProgress.lua:7` condition on it never fires.