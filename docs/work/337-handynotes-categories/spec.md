# Spec: Categories never load on Retail with HandyNotes: Dragonflight enabled
Intent: [intent.md](intent.md). Status: draft

## Requirements
To be written once the root cause is known.

## Root cause
**Not found yet.** What is established, from reading the code on 2026-10-13:

**How the symptom arises.**
- The message comes from `Gui/WindowFrames/AchievementsFrame/AchievementsFrameMixin.lua:119-120`. It shows when the selected tab's `GetCategories()` returns nil.
- `GetCategories()` reads `addon.Tabs[index].Categories` (`Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonMixin.lua:37-39`). Only `SetCategoryRootForTab` sets it (`Api/CategoryDataApi.lua:5-9`), from `KrowiAF.CreateCategories`.
- The login load (`Data/Data.lua:155-180`) runs its task groups in this order:
  1. the achievement data, patch by patch;
  2. the custom criteria;
  3. the categories;
  4. the events, tooltips, pet battle links, transmog sets, guides and zones.

  Each group is inserted at the front (`Data/Data.lua:36-123`), and `StartTasksGroups` takes them from the back (`Data/TaskRunner.lua:45-64`).
- `RunTask` has no error handling (`Data/TaskRunner.lua:3-9`). A task that raises stops the runner for good. So **an error in any achievement data or custom criteria task leaves every tab without categories**, which is exactly this symptom.
- Such an error is raised from a `C_Timer.After` callback and reaches the error handler. A player without BugSack, and with "Display Lua errors" off (the client's default), sees nothing. That fits "no Lua errors".
- Separately, the achievement cache never checks what `coroutine.resume` returns (`Data/AchievementCache.lua:170,173`), so an error there is lost even with BugSack. It cannot cause this message, because the cache runs after the categories exist. It is a silent failure of the same kind, though.

**Checked in HandyNotes: Dragonflight v156** (the latest release, 2026-09-15; the copy in the maintainer's Retail AddOns folder):
- **Globals.** `luac -l` over every file finds only:
  - `SLASH_MOUNTID1` and `SLASH_PETID1`;
  - LibUIDropDownMenu's `L_*` globals;
  - `_G[...]` writes of its own names (`HandyNotes_Dragonflight`, its mixins and its dev helpers).

  This addon reads none of them.
- **Ace libraries.** None is newer than this addon's copy, so none replaces it.
- **`Krowi_WorldMapButtons-1.4`.**
  - It ships minor 9 (`libs/Krowi_WorldMapButtons-1.4`) and this addon ships 11.
  - HandyNotes: Dragonflight loads first, alphabetically. It registers minor 9 and calls `:Add` from its `OnInitialize` (`core/core.lua:206`), before this addon's files load. This addon's minor 11 then upgrades the same table in place.
  - Both versions were read in full. The upgrade keeps `lib.Buttons` and redefines the functions. HandyNotes' button keeps minor 9's `RefreshOverlayFrames` hook.
  - No error path was found on Retail, but this is not ruled out in game.
- **Achievement code.** There is no achievement API override, no `Blizzard_AchievementUI` load and no achievement frame hook in its code.

**Not reproduced on the maintainer's install, 2026-10-13.** Retail 12.1.0, enUS client, on Frostmane\Krowi with HandyNotes, HandyNotes: Dragonflight v156 and this addon enabled.
- The categories loaded, and the trace ended with "On Player Login: Finished loading data in 4368 ms".
- BugGrabber recorded no error from this addon or from HandyNotes.

The difference must lie in the reporter's setup: the deDE client, another addon, or their saved variables. **Next step:** ask the reporter for the BugSack log, the trace lines and their addon list (see Verification).

## Design
Pending the root cause.

## Options considered
Pending the root cause. Whatever the trigger turns out to be, two hardening options are on the table:
- **Report a failed load.** The task runner and the cache coroutine would pass errors to the error handler, with the failing task group named. The window would show a "failed to load" message in place of "reopen the window".
- **Keep loading past a failed group.** The runner would skip a failing group and record it in `LoadDiagnostics`, so the categories still load. That costs the data in that one group.

## Areas of concern
To be filled in with the design.

## Verification
The reproduction, at the maintainer's next in-game session:
1. On a Retail character with HandyNotes, HandyNotes: Dragonflight and this addon enabled (Krowidhone on Doomhammer already has all three), turn on "Enable trace info" in the addon's debug options.
2. `/reload`, then open the achievement window.
3. With trace info on, chat shows each task group's "Start loading data" and "Finished loading data". The last "Start" without a "Finished" is the group that stopped.
4. `Read-GameErrors.ps1 -All` lists every addon's errors from BugGrabber, not only this addon's.

If it does not reproduce on enUS, ask the reporter for three things: the BugSack log after a `/reload`, the trace lines from step 3, and their HandyNotes plugin list.

**Parked, 2026-10-17.** It did not reproduce (see Root cause). Krowi sent the reporter the request on Discord: Lua errors on (`/console scriptErrors 1` or BugSack), "Trace-Informationen einschalten", then `/reload` with HandyNotes: Dragonflight enabled, and a screenshot of the "loading data" chat lines, any error, and the HandyNotes plugin list. The item waits for that answer. Either hardening option above can go ahead without it, once Krowi approves the intent and picks a design.

## Decision