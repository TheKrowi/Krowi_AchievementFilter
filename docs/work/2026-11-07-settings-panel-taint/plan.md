# Plan: KAF's options leave Blizzard's Settings window to Blizzard (KAF 105.0)
Spec: [spec.md](spec.md). Status: accepted

## Context
The Krowi_Options 2.0 taint review found two KAF problems; Krowi chose to fix both in KAF 105.0. Work item `docs/work/2026-11-07-settings-panel-taint` (worktree `Krowi_AchievementFilter\.claude\worktrees\fix-2026-11-07-settings-panel-taint`, intent/spec committed 819f37b8).
1. **Open options** in Blizzard's Settings > AddOns closes Settings with `SettingsPanel:Close(true)` from KAF's code (`Options/Options.lua:9-14`, called from `Options/Window/Stub.lua:31` and debug screenshot mode `Options/General.lua:66`), which saves the key bindings and commits settings under KAF's taint. Fix: KAF's window opens on top of Settings; Settings stays open.
2. **Show me on the Maps page** works through a see-through secure button laid one strata above KAF's window (`Options/Window/Help/ShowMe.lua`). Blizzard's code shows the game menu never opens over KAF's window by itself (Escape and the micro button close it first), but after fix 1 Settings and KAF's window are open together, and a click on Settings brings Settings to the front with the see-through button still on top. Krowi's decision (after the correction): **"Off while Settings is open"**: while Blizzard's Settings window is open, the Maps page shows its note instead of Show me; when Settings closes, Show me is back. Taken without asking, then dropped again (gates.md): the game menu was to get the same treatment, but every way to it reaches `CloseAllWindows` first, so it never shows over KAF's window; only Settings turns Show me off.
Proof (Krowi): a lint rule, a headless scenario, and an automatic in-game step using the kit's real clicks (`KrowiGameInput.ClickAt`, no kit change).

Class: the change replaces an existing lint rule (`settings-close`), so `Get-ChangeClass` will say harness; the gates asked so far cover it.

## Files that change
Addon code (I write these myself, small):
1. `Options/Options.lua`: remove `options.CloseSettingsPanel` and its comment.
2. `Options/Window/Stub.lua`: OnClick calls `options.Open()` only; the comment says the window opens on top of Settings, which stays open.
3. `Options/General.lua`: screenshot mode drops the call and the local alias (line 37).
4. `Options/Window/Help/ShowMe.lua`, the map route:
   - `ShowMeSecure(owner, close)`: when `SettingsPanel` is shown, release the button and answer false, so the library hides Show me and shows the Maps page's existing note (no new string). (The game menu was planned too and dropped: it never shows over KAF's window, see gates.md.)
   - Once (guarded flag, the frame checked to exist): `SettingsPanel:HookScript("OnShow"/"OnHide", ...)`, each calling a refresh: if KAF's window is shown, `window.Controller:Refresh()` (the library's public tab Refresh, which runs UpdateShowMe), so Show me goes off and comes back at once. Placed where the route is set up (file load), or lazily at the first `ShowMeSecure`; the hooks only release or refresh, nothing else.
   - A read-only test seam on `help.maps`: whether the see-through button is laid (`help.maps.SecureLaid()` or similar), since `mapButton` is file-local.

Tests and tooling (Opus builds from a brief; a read-only review after; I verify):
5. `.claude/tools/Check-Repo.ps1`: the rule `settings-close` (which recommends `Close(true)`) becomes `settings-panel-close` [Error]: addon code (not `Tests/`) never calls `SettingsPanel:Close`, `:ExitWithCommit`, `:ExitWithoutCommit`, `:Hide`, or `HideUIPanel(SettingsPanel)`. Header lines 29-31 and `.claude/tools/README.md` row 62 updated. Test first: it fails on the current `Options/Options.lua:13`.
6. Headless (`help` suite): a scenario "the Maps page's Show me while Blizzard's Settings window or the game menu is open": Recorded `laid` (today), Target `off` (note shown); with models for `SettingsPanel`, `GameMenuFrame` and the minimap map button (a fresh `optionsEnv.New` like `suites.popups`, so the shared load stays untouched). After the fix Recorded = Target.
7. In game (`options` suite, async already; the mouse wait brought back from `Tests/Pictures.lua`'s `WaitForMouse`, with click requests as in Krowi_Options' `show-me-secure-click`), at the end of the suite, one real click per step:
   - click the game menu micro button (real) → the game menu shows;
   - click its Options button (found by its text) → Settings shows;
   - open KAF's window on Maps from test code (`options.Open(_, "maps")`, KAF's own window): Show me off, the note shown, no see-through button laid;
   - click Settings' close button (real) → Settings hides, the game menu shows again: Show me still off;
   - click the menu's Return to Game (real) → the game menu hides: Show me back, the see-through button laid over it.
   Each step skips if the previous left things otherwise. Test code never opens, closes or hides a Blizzard window itself; a failed click can leave Settings or the game menu open for the player to close. Buttons are found by reading Blizzard frames (no calls into them), checked on live and classic (Mists) source.
8. `Tests/README.md` (options row: the new game-only steps), `Tests/Options.lua` header, `run-tests.lua` help row; changelog line under 105.0 `### Fixed` (player words, no dev note).

## Order of work
1. Before-run gate (playbook): `/kaftest options help escape` on Retail and Mists with today's main, green.
2. Test first: the lint rule and the headless scenario (Recorded = today), commit `test: reproduce ...`.
3. The fix (changes 1-4), Recorded = Target, the live steps (7), docs (8).
4. Headless all suites, `Check-Repo.ps1`, `krowi:taint-reviewer`, a code review.
5. After-run in game, Retail and Mists: `options help escape` with the live steps (kit-started, nobody at the PC), screenshots read; a real-input check of fix 1 by me (game menu > Options > AddOns > Krowi's Achievement Filter > Open options: KAF's window over Settings, Settings still open after closing KAF's window), `Read-GameErrors.ps1` clean.
6. Look gate (Krowi sees the screenshots on a published page), PR, merge on Krowi's word.

## Proof
The before-run green first; the lint rule and the headless scenario as the tests written first (Recorded today); after the fix Recorded = Target, all suites headless, then options, help and escape in game on Retail and Mists with the live steps, and the real-input check of fix 1.

## Risks
- Real clicks on Blizzard's buttons: found by text/name, clicked only through the kit's guarded `ClickAt`; a wrong find could press another game menu button: the step checks the button's text right before asking and never asks for Logout/Exit.
- The Maps note text was written for "no minimap map button"; if it reads wrong while Settings is open, a new string is needed (all locales): checked when building, raised with Krowi if so.
- Escape with KAF's window over Settings: observed and recorded in the after-run, not changed.

## Results
- Before-run, KAF main, 21:35-21:41: options/help/escape green on Retail (30+1 skip, 5, 34) and Mists (30+1 skip, 5, 33+1 skip), the skips as in every earlier run.
- Test first (7c30632e): the lint rule fails on Options/Options.lua:13; the help scenario recorded "settings: laid; menu: laid; neither: laid" (Target settings off).
- Fix (ff20891c), Recorded = Target; headless help/options/escape and -check green; lint 0 errors.
- After-run 22:00 on both clients: settings-close failed, a test flaw (Lower() left KAF's window on top at the same level, the click landed on it; Settings left open made escape skip): fixed in 2ba55fb4 (KAF's window closed first). After-run 22:04-22:08: options 36 passed, 0 failed, 1 skipped on Retail and Mists, all six settings steps PASS with real clicks; help 5+1 skip (the headless-only scenario); escape 34 / 33+1 skip.
- Real-input check of fix 1 on Retail, 22:36: game menu > Options > AddOns > Krowi's Achievement Filter > Open options: KAF's window on top of Blizzard's Options window, which stays open; closing KAF's window shows Settings again; Settings' Close returns to the game menu; BugGrabber 0 errors in the hour.
- Escape order with KAF's window over Settings: not observed by hand. On Retail, by Blizzard's source, Settings' Escape handler is registered at `GameMenuEscPriority.Framework` (6, `Blizzard_SettingsDefinitions_Frame/Interface.lua:3`), before the later handler levels (9 and 10, `CloseAllWindows` at 10; `Blizzard_GameMenuEsc.lua:33-57`), so Escape closes Settings first and KAF's window stays (its OnHide hook then brings Show me back). Mists not checked.
- Taint review: no findings; notes: in game the refresh hook's branch with KAF's window open never runs (both closes close KAF's window), only the headless model covers it; a rebind in KAF's window while Settings' Keybindings page is open refreshes those rows tainted (the #197 side effect, contrived).
- Look gate: Krowi, "Keep it like this (Recommended)".
- Code review (read-only agent): nothing wrong in the fix; fixed from it: the help scenario now proves Settings' OnShow and OnHide hooks with a stand-in controller (a mutation that disables them fails it), the in-game checks read the seam strictly, the settings-close texts say the test closes the window first (so the game-menu-over-window case rests on Blizzard's source only), stale game-menu wording, the lint rule also catches `_G.`, `SetShown` and a click on Settings' close buttons, a scenario that returns nothing without a reason fails instead of skipping.
- Krowi's idea at the look gate (a see-through button over Open options clicking Settings' X): Blizzard's close always goes back to the game menu; Krowi chose "A only" (as now).