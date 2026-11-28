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
  - "Tests/**"
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
For contributors without Krowi's workspace kit, which holds these for every Krowi addon. The exceptions this addon already has were reviewed; a new one needs `krowi:taint-reviewer` and a reason in the spec.
- Hook Blizzard functions with `hooksecurefunc` and Blizzard frames with `HookScript`. Replacing a Blizzard function happens only through the allowlisted `addon.OverwriteFunctions` above.
- Never add or replace fields on Blizzard frames, and never assign into a `C_*` namespace: shim a missing API into a file-local function.
- Code that makes a Blizzard frame show, update or re-layout runs Blizzard's code tainted. The calls the addon makes on purpose (opening and closing windows such as `HideUIPanel(WorldMapFrame)` in `Gui/WorldMapButton/WorldMapButtonMixin.lua`) stay as they are; do not add one without the review. `securecall` does not launder taint.
- `SetBinding` and `SaveBindings` fire `UPDATE_BINDINGS` at once, which runs Blizzard's binding displays tainted for the session. The addon calls them on purpose, with that cost accepted: from the key binding options (`Options/Options.lua`, `Options/General.lua`) and for the Y key move of #197 (`Gui/Gui.lua`). Bindings are read or moved at `PLAYER_LOGIN`, never at `ADDON_LOADED`.
- Setting a CVar runs every `CVAR_UPDATE` handler tainted, and closing Blizzard's Settings window from addon code runs its commit tainted: leave both to the player. An in-game test routine never sets a CVar (the `miniWorldMap` calls in `Tests/WorldMap.lua` predate the rule; `docs/backlog.md`).
- Secret values (12.x): fields from calendar, aura, tracker, chat and tooltip-data APIs turn secret under communication, encounter, Mythic+, PvP or map restrictions, and comparing or computing with them errors. Probe with `canaccesstable`, `canaccessvalue` or `issecretvalue` and stop cleanly.
- `C_UI.Reload` is protected: an addon cannot reload itself.