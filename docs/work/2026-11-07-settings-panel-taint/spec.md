# Spec: KAF's options leave Blizzard's Settings window to Blizzard
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. The Settings stub's "Open options" (`Options/Window/Stub.lua`) opens KAF's window without closing Blizzard's Settings window: the window shows on top of it (both HIGH, the window shown later), and Settings is still open when KAF's window closes.
2. Debug mode's screenshot mode (`Options/General.lua`) no longer closes Blizzard's Settings window.
3. No addon code closes or hides Blizzard's Settings window (`SettingsPanel:Close`, `:ExitWithCommit`, `:ExitWithoutCommit`, `HideUIPanel(SettingsPanel)`, `SettingsPanel:Hide()`): `options.CloseSettingsPanel` goes, and a repo lint rule fails on any of these in addon code.
4. When Blizzard's Settings window (`SettingsPanel`) or the game menu (`GameMenuFrame`) shows, the map route's secure button over Show me (`Options/Window/Help/ShowMe.lua`) lets go, through the release it already has (`ReleaseMapButton`, deferred to the end of combat when the lockdown runs). Hovering Show me again lays it back over, as today after the window moves.
5. The hooks are script post-hooks (`HookScript("OnShow", ...)`) set once, where both frames exist (Retail, Mists); nothing is written on Blizzard's frames and no Blizzard function is replaced.
6. Escape with KAF's window over Blizzard's Settings window: the in-game check says which closes first; it is recorded, not changed here.

## Root cause
1. `Options/Options.lua:9-14` calls `SettingsPanel:Close(true)` from the stub's OnClick (`Options/Window/Stub.lua:31`) and from screenshot mode (`Options/General.lua:66`). `Close` runs `ExitWithCommit` → `Commit` → `CommitSettings` and `CommitBindings` → `SaveBindings(GetCurrentBindingSet())` (`wow-ui-source/live/Interface/AddOns/Blizzard_Settings_Shared/Blizzard_SettingsPanel.lua:224-268, 308-315`), then `HideUIPanel(self)`, a plain `Hide` for this unmanaged panel, whose `OnHide` (line 204) saves again and calls `UpdateMicroButtons`, all in KAF's insecure execution. KAF chose the close in docs/work/2026-10-11-latent-bugs to avoid `ToggleGameMenu`'s protected `SpellStopCasting`; the binding save was not weighed then.
2. `Options/Window/Help/ShowMe.lua:414-426` lays the secure button at strata DIALOG, level 2, over the window's Show me (a click into the toplevel window lifts its children over anything in its strata, so the button must be one strata higher). `SettingsPanel` is HIGH (`Blizzard_SettingsPanel.xml:4`), so the button stays above it; `GameMenuFrame` is DIALOG (`Blizzard_GameMenu/Shared/GameMenuFrame.xml:4`), and the button can lie above it too. Nothing lets the button go when they open.

## Design
- Fix 1: the stub's OnClick calls `options.Open()` only; screenshot mode drops its close; `options.CloseSettingsPanel` and its comment go (no caller left). A lint rule `settings-panel-close` in `.claude/tools/Check-Repo.ps1` fails on the patterns of requirement 3 in addon code (not under `Tests/`, `docs/`, `.claude/`), with an entry in `.claude/tools/README.md`.
- Fix 2: in `ShowMe.lua`, where the map route is set up, `SettingsPanel:HookScript("OnShow", ReleaseMapButton)` and the same on `GameMenuFrame`, each once and only if the frame exists; `ReleaseMapButton` already guards combat (`ReleasePending`).

## Options considered
- **Fix 2 by script post-hooks on the two windows' OnShow (recommended).** The button goes the moment either opens; a `HookScript` adds a handler after Blizzard's, which runs untainted.
- **Fix 2 by a check when the mouse comes over the button.** No hook on Blizzard frames: the button's OnEnter lets go when either window is shown. The button stays above them until the mouse arrives; a fast click can still land on it.
- **Fix 1 by hiding Settings without committing.** Not possible from addon code without running its OnHide (a binding save) tainted; leaving it open is the only clean way.
- **Testing:** the lint rule is the permanent test for fix 1 (a mechanical pattern). Fix 2: a scenario in the `help` suite's headless model (the two windows' OnShow lets the button go, Recorded "stays", Target "lets go"), and in game a check with real input: Escape opens the game menu for real (`Send-GameInput.ps1 -Key Escape`), with debug mode's red tint on the button and a screenshot before and after. Test code never opens the game menu or Settings itself.
- **Automating that in-game check inside `/kaftest`** would need the kit's marker to press Escape (a kit change); not proposed now.

## Areas of concern
- **Taint**: the point of the change. Fix 1 removes KAF's call into Blizzard's commit. Fix 2 adds two script post-hooks on Blizzard frames, which run after Blizzard's handler and do not taint it; the handler only hides or defers the addon's own secure button. The `krowi:taint-reviewer` reads the diff.
- **Clients**: Retail and Mists; `SettingsPanel` and `GameMenuFrame` exist on both (the hooks are guarded anyway). KAF does not load on Era, Anniversary, Forever.
- **Escape**: with KAF's window over Settings, which one Escape closes first is checked in game (requirement 6); the `escape` suite runs.
- **Other addons, skins**: none touch the map route's button; ElvUI and others skin SettingsPanel without changing its OnShow.
- **Saved variables, localization, data snapshots**: none.
- **Player-facing text**: a changelog line under `### Fixed`.

## Verification
- `Check-Repo.ps1`: the new rule fails on the current code (Recorded), passes after the fix.
- Headless: the `help` suite's new scenario, Recorded "stays" before, Target "lets go" after; `options` and `escape` suites unchanged.
- In game, Retail and Mists: before the fix, `/kaftest help options escape` green (the before-run gate); after, the same green; then the real-input check: KAF's window on Maps with debug mode (the red box), Escape for the game menu (screenshots: the red box gone), and Settings > AddOns > Krowi's Achievement Filter > Open options (KAF's window over Settings, Settings still open after closing KAF's window), `Read-GameErrors.ps1` clean.

## Decision
Krowi, 2026-11-07:
- Fix 2: "Vanish when they open (Recommended)": script post-hooks on `SettingsPanel` and `GameMenuFrame` OnShow.
- Proof: "Also an automatic in-game step" (not the recommendation). Taken without asking, how: the step needs no Escape key and no kit change. It uses the kit's real click (`KrowiGameInput.ClickAt`, Krowi_ClaudeKit #21): with KAF's window on Maps and the secure button laid over Show me, a real click on the game menu's micro button opens `GameMenuFrame` (the button must have let go), a real click on its Options button opens `SettingsPanel` (still let go), a real click on Settings' close button and on the menu's Return to Game puts things back, and hovering Show me lays the button over again. The step finds Blizzard's buttons by reading them (no call into Blizzard's code) and clicks only them. Fix 1 stays covered by the lint rule (every turn) and one real-input check by Claude: reaching KAF's entry in the AddOns list can need scrolling, which the marker cannot do.

## Requirements added by the decision
7. A live step in the `help` suite (game only): the map route's button lets go when the game menu and Blizzard's Options window open through real clicks over KAF's window, and comes back on hover after they close; the window and both Blizzard windows end as they began.