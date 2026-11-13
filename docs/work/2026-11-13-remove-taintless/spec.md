# Spec: Remove the TaintLess library
Intent: [intent.md](intent.md). Status: done

## Requirements
1. `Libs/Files.xml` no longer includes `TaintLess\TaintLess.xml`, and `Libs/TaintLess/` is gone from the repo.
2. Nothing in the shipped addon, the headless tooling or `docs/architecture.md` names TaintLess any more, except the 70.0 changelog entry (history) and the old options-revamp mockup in `docs/work/` (a closed work folder's record).
3. The changelog's next version says that the library is gone.
4. The offline checks stay green: `Check-Repo.ps1 -ChangedOnly`, the headless suites `options`, `menu`, `escape`, `tracking`, the headless data load (`Both`).
5. In game, after the removal: the suites `escape`, `menu`, `options`, `tracking` pass on Retail and Mists, and on Mists the honor queue still queues after a KAF menu was opened (Verification).

## Root cause
No bug. Why TaintLess does nothing for KAF any more, hook by hook (`Libs/TaintLess/TaintLess.xml`). Each hook installs only when its guard holds; the guards read Blizzard globals at load.

| Hook | Lines | Guards | State on Retail (`wow-ui-source\live`) and Mists (`...\classic`) |
|---|---|---|---|
| RefreshOverread | 39-49 | the old drop-down (`UIDropDownMenu_InitializeHelper`) | Live code on both: the old drop-down still exists (`Blizzard_SharedXML\Mainline\UIDropDownMenu.lua:41`, `...\Classic\UIDropDownMenu.lua:42`). VERIFIED |
| DisplayModeTaint | 52-60 | the old drop-down's open menu | Same as above. VERIFIED |
| EditModeOpenDrop | 63-86 | `FriendsFrameStatusDropDown` | Dead: the frame is in neither tree, so the hook returns at line 66 without installing. VERIFIED |
| ObjectiveTrackerUpdate | 89-123 | `ObjectiveTrackerFrame.HeaderMenu` | Dead: `HeaderMenu` is in neither tree, returns at line 92. VERIFIED |
| CUFProfilesSetSelectedValue | 126-153 | `SetActiveRaidProfile` | Dead in practice: no Lua in either tree calls it (raid profiles switch through `CompactUnitFrameProfiles_ActivateRaidProfile`, `classic\...\GameDialogDefs.lua:1677`), so the hook never fires from Blizzard's code. INFERRED (it is a C function, not in the generated API docs, so whether it still exists is unknown) |
| EncounterJournalLoad | 156-166 | `EncounterJournal_InitLootFilter`, Retail builds only (line 157) | Dead: the function is in neither tree; the hook installs but its condition never matches. VERIFIED |

Where the two live hooks matter:
- **Retail:** KAF's menus use Blizzard's modern menus (`Libs/Krowi_Menu/Krowi_MenuBuilder.lua:277-281`, `MenuUtil.CreateContextMenu` at line 140), and no Blizzard Retail code outside the old drop-down's own file calls `UIDropDownMenu_Initialize` (the only other hit, `live\...\Blizzard_PVPUI\Mists\`, is the Mists copy). So on Retail KAF never touches the old drop-down and the hooks guard nothing of KAF's. VERIFIED by source; the one KAF frame that inherits `UIDropDownMenuTemplate`, `Gui/WorldMapButton/WorldMapButton.xml:55`, is never initialised or opened (no Lua file refers to its `DropDown` key).
- **Mists (and Titan):** KAF's menus are Blizzard's old drop-down, driven from addon code: `Krowi_MenuBuilder.lua:293-294` sets the root menu to `Krowi_Menu`, which is a `UIDropDownMenuTemplate` frame (`Libs/Krowi_Menu/Krowi_Menu.lua:16`) opened with `UIDropDownMenu_Initialize` (line 101). That leaves addon-written (tainted) fields on the shared `DropDownList` buttons and in `UIDROPDOWNMENU_OPEN_MENU`. Blizzard's `UIDropDownMenu_Refresh` reads `button.checked` and `button.notCheckable` on every button up to `UIDROPDOWNMENU_MAXBUTTONS`, not only the shown ones (`classic\...\Classic\UIDropDownMenu.lua:784-808`). The honor queue type drop-down shares those lists (`classic\...\Blizzard_PVPUI\Mists\Blizzard_PVPUI.lua:260`); a click in it writes `HonorQueueFrame.type` (line 325), and the queue button reads it (line 373) before calling `C_PvP.JoinBattlefield` (lines 374, 379), which has `HasRestrictions = true` (`classic\...\Blizzard_APIDocumentationGenerated\PvpInfoDocumentation.lua:377`). So a tainted read there would block the queue with "AddOn has been blocked from an action only available to the Blizzard UI". RefreshOverread and DisplayModeTaint exist to purge exactly those tainted keys. The chain is VERIFIED in source; that it actually blocks the queue in today's client is INFERRED: no report, no reproduction.

No KAF code and no embedded library refers to TaintLess or its `*_PATCH_VERSION` globals (grep over the tree, `Libs/` with the submodules filled, 2026-11-13). It was added in commit `9aa23d6d` (2024-04-20, release 70.0, `_Packaging/Changelog.md:1057`).

## Design
Delete the library and every pointer to it:
- `Libs/Files.xml:2` and the blank line after it.
- `Libs/TaintLess/TaintLess.xml` (the folder's only tracked file).
- `"^Libs/TaintLess/"` from the skip list in `.claude/tools/headless/options-env.lua:86`, which would otherwise name a folder that no longer exists.
- TaintLess from the vendored-library list in `docs/architecture.md:122`.
- A changelog line under 106.0, `### Changed`.

Left as they are: the 70.0 changelog entry (released history) and `docs/work/2026-10-25-options-revamp/mockup/dump-options.lua:282` (a closed work folder's mockup).

## Options considered
1. **Remove TaintLess on every client (chosen, Krowi 2026-11-13).** Four of six hooks are dead; the two live ones guard nothing on Retail. Risk: on Mists and Titan, a blocked honor queue after a KAF menu was opened, if the inferred chain holds.
2. **Keep TaintLess loaded on Classic only** (the fallback if the Mists check fails): the file comes back and loads only on Classic (an XML include has no client condition and the file may only be shipped unmodified, so the how is worked out then, through the `.toc`). Not chosen up front, because nothing shows it helps.
3. **Keep it as it is.** Rejected by the intent.

## Areas of concern
- **Taint and secret values:** the subject of the change. The removal adds no addon code; it only stops a third party's hooks. The Mists risk is above; Retail has none (KAF does not use the old drop-down there). The removal also stops TaintLess's own writes to globals (`*_PATCH_VERSION`) and its `hooksecurefunc` calls from KAF.
- **Clients:** Retail, Mists, Titan (`## Interface: 120105, 50504, 38002`). Titan has no local install: its in-game state is unchecked and follows Mists' (same old drop-down).
- **Blizzard API changes:** none used or added.
- **Other addons, plugins and skins:** an addon that ships its own TaintLess still installs the hooks (they are global, versioned by `*_PATCH_VERSION`), so a player with such an addon keeps them; KAF only stops supplying its copy. No KAF plugin refers to TaintLess.
- **Saved variables and migrations:** none.
- **Localization:** none.
- **Embedded libraries:** `Libs/TaintLess` is vendored, tracked in this repo, not a submodule (`git ls-files Libs/TaintLess`); no `Krowi_Libraries` change, no LibStub minor.
- **Data snapshots:** none; the headless data load must stay at 0 problems.
- **Player-facing text:** one changelog line.

## Verification
- No new scenario: this is a removal, not a bug fix, and no check can prove a taint that does not happen offline. The existing suites are the regression check; the `escape` suite already opens an old drop-down (`Tests/Escape.lua:409-423`).
- Offline: `Check-Repo.ps1 -ChangedOnly`; headless `options`, `menu`, `escape`, `tracking` (all green before the change, 2026-11-13); headless data load `Both` (0 problems before).
- In game, after deploying the branch:
  - Retail: `Run-GameTests.ps1 escape, menu, options, tracking`; `Read-GameErrors.ps1` shows no new KAF row.
  - Mists: the same suites, then a manual check: open a KAF right-click menu (an achievement's right-click menu), close it, open the PvP window's honor queue, pick a type in its type drop-down and press the queue button. Pass: the queue starts, no "AddOn has been blocked" message, `Read-GameErrors.ps1` shows no new row (BugGrabber logs blocked actions as `ADDON_ACTION_BLOCKED`).
  - If the Mists check fails: fall back to option 2, keep TaintLess loaded on Classic only (Krowi was told of this fallback at the design gate).

### Results, 2026-11-13
- Offline: `Check-Repo -ChangedOnly` 0 errors; headless options 28, menu 8, escape 34, tracking 9 passed on Retail and Classic, 0 failed; data load 0 problems.
- Retail 12.1.5, the branch's build: escape 34/0/0, menu 8/0/0, options 37/0/1, tracking 17/0/0 (passed/failed/skipped); no KAF error in BugGrabber.
- Mists 5.5.4, the branch's build: escape 33/0/1, menu 8/0/0, options 37/0/1, tracking 16/0/0; no KAF error from the suites.
- Mists, the manual check, on Krowi (Mirage Raceway), with ElvUI, GW2_UI and InstanceAchievementTracker (which carry their own TaintLess) disabled there:
  1. Branch build: the KAF Filter menu, then the honor queue type drop-down (Bonus Battlegrounds), Random Battlegrounds, Join Battle: **blocked**, `[ADDON_ACTION_FORBIDDEN] AddOn 'Krowi_AchievementFilter' tried to call the protected function 'JoinBattlefield()'` from `Blizzard_PVPUI/Mists/Blizzard_PVPUI.lua:379` (`HonorQueueFrame_Queue`). Screenshot `H:\World of Warcraft\_classic_\Screenshots\WoWScrnShot_111326_194351.jpg`.
  2. Control, branch build after a `/reload`, no KAF menu opened, same clicks: not blocked; the game answered "You must select at least one role" (the call went through; no role was picked, so nothing was queued). `WoWScrnShot_111326_194453.jpg` and the capture after the second press.
  3. Control, `main`'s build (TaintLess restored in the working tree only, then deployed; `UIDD_REFRESH_OVERREAD_PATCH_VERSION` 5 and `UIDROPDOWNMENU_OPEN_PATCH_VERSION` 3 confirmed loaded), after a `/reload`, the KAF Filter menu, same clicks: **blocked the same way** (BugGrabber's counter went to x2). `WoWScrnShot_111326_194833.jpg`.
- So the blocked honor queue after a KAF menu on Mists is an existing bug of `main` that TaintLess does not prevent; the removal neither causes nor worsens it. Requirement 5's Mists clause fails equally with and without TaintLess. The fallback (option 2) would not help, so it was not built. The cause lies elsewhere in the old drop-down's shared state, for a work item of its own (in Krowi_Menu).

## Decision
Option 1, remove TaintLess entirely, on every client. Krowi, 2026-11-13: "remove".