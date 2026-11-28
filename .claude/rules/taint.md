---
paths:
  - "*.lua"
  - "*.xml"
  - "Gui/**"
  - "Features/**"
  - "Options/**"
  - "Settings/**"
  - "Plugins/**"
  - "Data/**"
---
# Taint and secret values

Most fixes (the changelog's dev notes, the root causes in `docs/work/*/spec.md`) are taint or secret-value errors; the workspace rules hold the general ones.

## This addon
- Never override Blizzard API functions (`GetAchievementCriteriaInfo`, `GetAchievementNumCriteria` and the like); that approach was removed years ago and its leftovers still cause bugs.
- The only globals the addon writes on purpose are the FrameXML UI functions it replaces in `addon.OverwriteFunctions` and the polyfills for removed API in `addon.LoadBlizzardApiChanges` (both in `Gui/BlizzardOverrides.lua`). They are listed in `.claude/tools/Check-Repo.globals`, and the `globals` rule fails on any other write to the global environment. A new global is allowlisted there with a reason, and needing one is a design smell.
- Do not compare or do arithmetic on values from `C_Calendar`, aura or objective-tracker APIs without considering `SecretInChatMessagingLockdown`.
- `TaintDiagnostics.lua` and `Diagnostics.lua` exist for probing this; `addon.Diagnostics.DebugEnabled()` gates debug paths.
- `krowi:taint-reviewer` reviews every change to GUI code, hooks, event handlers or lockdown-protected APIs.
- The known taint left in Blizzard's own achievement tabs and the fixes waiting for it: `docs/backlog.md` (the #300 section) and `docs/codebase-analysis.md`.

## The general rules
For contributors without Krowi's workspace kit, which holds these for every Krowi addon:
- Hook Blizzard functions only with `hooksecurefunc`, and Blizzard frames only with `HookScript`; never replace them.
- Never add or replace fields on Blizzard frames, and never assign into a `C_*` namespace: shim a missing API into a file-local function.
- Never make a Blizzard frame refresh from addon code (show, update or re-layout it): its code then runs tainted. `securecall` does not launder taint.
- Never set a CVar, call `SetBinding`/`SaveBindings` or close Blizzard's Settings window from addon code: each runs Blizzard's handlers tainted (`CVAR_UPDATE`, `UPDATE_BINDINGS`, the Settings commit).
- Secret values (12.x): fields from calendar, aura, tracker, chat and tooltip-data APIs turn secret under communication, encounter, Mythic+, PvP or map restrictions, and comparing or computing with them errors. Probe with `canaccesstable`, `canaccessvalue` or `issecretvalue` and stop cleanly.
- `C_UI.Reload` is protected: an addon cannot reload itself.