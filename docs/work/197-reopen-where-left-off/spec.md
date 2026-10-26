# Spec: The achievement window does not reopen where the player left it
Intent: [intent.md](intent.md). Status: done

## Requirements
1. On a new install, once the game has loaded the player's key bindings, a Y that still runs Blizzard's Toggle Achievements (`TOGGLEACHIEVEMENT`) moves to the binding of the micro button's tab (the addon's Achievements tab unless the player chose another), and is saved in the account's key bindings.
2. That happens once per account, in the account's binding set. A character with its own binding set is never changed, and neither is a Y the player bound to anything else.
3. Accounts whose first run is already behind them are not changed (Decision); for them Bind to Y in the options stays the way to move Y.
4. The first run marks the move as pending. It stays pending until it has run on the loaded account bindings, so it waits while the bindings are not loaded yet, a character binding set is active, or the player is in combat, and tries again at the next login.
5. With Y moved and the default options (Reset view on open off, Toggle window once opened on), pressing Y after closing the window reopens the tab, category and achievement the player left.
6. The first-run swap of the tab order and the micro button's tab stays as it is and does not run again.
7. No error and no chat line on the first run (today a new player gets "Error switching achievement tabs: ... attempt to call global 'GetBindingByKey' (a nil value)").
8. Retail, Mists Classic and Titan behave the same.
9. The fix leaves a scenario behind (Verification).

## Root cause
**Y never moves to the addon, so it keeps opening Blizzard's Achievements tab.** With Y on `TOGGLEACHIEVEMENT`, every press goes through `ToggleAchievementFrame` to the addon's replacement of `AchievementFrame_ToggleAchievementFrame`, which opens tab 1, Blizzard's own Achievements tab (`Gui/BlizzardOverrides.lua:33-49`). That tab is hidden in the addon's tab strip by default (`Api/TabDataApi.lua:6`), so the player sees Blizzard's list, never the addon's tab and the achievement they left. The addon's own toggle keeps the view (`Gui/Gui.lua:200-232`), but only the micro button and the addon's tab bindings reach it.

The first-run setup is meant to move Y once: `SwitchAchievementTabs` (`Gui/Gui.lua:339-357`), run from `gui:TabsOrderGetActiveKeys` (`:367-383`) during `ADDON_LOADED` while the options are built (`Options/General.lua:16-18`). It fails twice over:

1. **The API it calls no longer exists.** `GetBindingByKey` became `C_KeyBindings.GetBindingByKey` in Retail 11.2.7, Mists 5.5.1, TBC 2.5.5 and Era 1.15.8 ([Warcraft Wiki](https://warcraft.wiki.gg/wiki/API_GetBindingByKey): "Removed API"). Every wow-ui-source clone calls only the namespaced one (`live/.../Blizzard_SharedXML/KeyCommand.lua:99`, `KeyBindingsDocumentation.lua:33`; the same in `classic` and `classic_titan`). So `Gui.lua:352` errors, `SafeSwitchAchievementTabs` (`:359-364`) catches it and prints it, and `:378` saves `AchievementTabsSwitched = true` anyway, so it is never tried again.
2. **It runs before the key bindings are loaded.** Even with the right API, at `ADDON_LOADED` there are no bindings at all: no binding set and no key on `TOGGLEACHIEVEMENT`. The defaults arrive about a second later, and the player's own bindings only after `VARIABLES_LOADED`, before `PLAYER_LOGIN`. This explains the 2024 report, from before the API moved.

**Reproduction** (the probe in [probe/](probe/), a standalone addon that records each step; Retail 12.1.5, account WoW1, Krowi-Frostmane, cold start, 2026-10-26):

| ms | Step | `GetBindingByKey` | Binding set | Key of `TOGGLEACHIEVEMENT` |
|---:|------|------|---:|------|
| 873 | `ADDON_LOADED` Krowi_AchievementFilter | no such API | 0 | none |
| 2059 | `UPDATE_BINDINGS` #2 (defaults) | no such API | 0 | Y |
| 10134 | `VARIABLES_LOADED` | no such API | 0 | Y |
| 10140 | `UPDATE_BINDINGS` #4 (the account's bindings) | no such API | 1 | none (Y is the addon's Expansions tab there) |
| 11886 | `PLAYER_LOGIN` | no such API | 1 | none |

**On the maintainer's four Retail accounts** the flag is saved on all four, and the move took on none:
- WoW3 and the second Battle.net account still have Y on Blizzard's binding (no `bind Y` line in `bindings-cache.wtf`);
- WoW1 and WoW6 have Y on `KrowiAF_OPEN_TAB_Expansions`, which is the manual Bind to Y (the micro button's tab), not the switch, which binds the Achievements tab.

**Why it went unnoticed:** `.luarc.json` lists `GetBindingByKey` in `diagnostics.globals` (`:99`), so the language server accepts the dead name. The kit's `Find-DeprecatedApi.ps1` and the `removed-api` lint rule only know names that still have an alias in some Blizzard_Deprecated file, and this one lost its alias before the clones were taken.

Why toggling the options fixed it for the first reporter stays unexplained: the toggles do not touch the binding. Perhaps the reporter opened the window through the micro button afterwards.

## Design
- **Split the first run.** `SwitchAchievementTabs` keeps the tab-order swap and the micro button's tab under `AchievementTabsSwitched` at `ADDON_LOADED`. It loses the binding part, and the first run (`Gui/Gui.lua:376-379`) sets `KrowiAF_SavedData.FirstTimeSetUp.YBindingPending = true` instead.
- **New `addon.Gui:MoveYToMicroButtonTab()`**, called last in the `PLAYER_LOGIN` branch of `Krowi_AchievementFilter.lua`, after `LoadPlayerLogin` has resolved the micro button's tab (`addon.ChangeAchievementMicroButtonOnClick`, `Globals.lua:330-343`), so an error in it cannot stop the loads before it. It does nothing when:
  - `YBindingPending` is not set (every account whose first run happened before this fix);
  - the active binding set is not the account's (`GetCurrentBindingSet() ~= Enum.BindingSet.Account`), which also covers bindings not loaded yet (0);
  - the player is in combat lockdown.

  Otherwise:
  - if `C_KeyBindings.GetBindingByKey("Y")` is `TOGGLEACHIEVEMENT` and the micro button's tab has a binding other than that, it calls `SetBinding("Y", <that binding>)` and `SaveBindings(Enum.BindingSet.Account)`. If the game refuses the binding (`SetBinding` returns false), nothing is saved and the move stays pending;
  - either way it clears `YBindingPending`.

  `SetBinding` with the key only adds Y to the command, so the player's other keys for it stay.
- **Only new installs get the move** (requirement 3): `YBindingPending` is set only by a first run, and existing accounts already have `AchievementTabsSwitched`. No `DataIntegrityManager` step.
- **Backlog:** a line in `docs/backlog.md` for option 4, Blizzard's toggle opening tab 1.
- **`.luarc.json`** drops `GetBindingByKey` from `diagnostics.globals`, so the language server flags the bare global again.
- **Changelog**, `### Fixed`: "On a new install, Y now opens the addon's window and reopens where you left off, instead of Blizzard's Achievements tab." (wording settled in the build).

## Options considered
1. **Recommended: fix the move and run it once for every account, existing players included.**
   - In game, on Retail, Mists and Titan, after the update: on the first login of a character that uses the account's key bindings, Y opens the addon's window on the micro button's tab (Achievements by default) and from then on reopens where the player left off.
   - Players whose Y is bound to anything else, and characters with their own key bindings, see no change. A player who wants Blizzard's window back rebinds Y in Blizzard's Key Bindings once, and the addon never moves it again.
   - It fixes the problem for the people who reported it. The original design meant every player to get this, and nobody has had it since 11.2.7, so nobody chose Blizzard's Y in reaction to the move.
2. **Fix the move for new installs only.**
   - In game: new players get option 1's behaviour. Existing players keep Blizzard's window on Y until they press Bind to Y in the options, which they must first find.
   - Smaller in effect, but it leaves both reporters and every current player with the bug.
3. **Also cover characters with their own key bindings, once per character.**
   - In game: as option 1, and also on characters that use their own key bindings.
   - Needs a per-character record in the account's saved data (keyed by character GUID).
   - Left out: those players set up their own bindings on purpose and have Bind to Y.
4. **Not in this fix, offered separately: Blizzard's toggle reopens the addon's last tab** (toasts, chat links, a Y still on Blizzard's binding).
   - It changes `AchievementFrame_ToggleAchievementFrame`, a replaced Blizzard global, for every way into the window, which is a wider and more taint-sensitive change.
   - It would fix the symptom even without the move, but players who rely on toasts opening Blizzard's tab would see a change. A follow-up in `docs/backlog.md` if wanted.

## Areas of concern
- **Taint and secret values** (the `krowi:taint-reviewer` pass of the build, 2026-10-26):
  - **Blizzard's binding display runs tainted for one session per install.** `SetBinding` and `SaveBindings` fire `UPDATE_BINDINGS` synchronously (`KeyBindingsDocumentation.lua:175-179`, `SynchronousEvent = true`), so Blizzard's handlers run inside the addon's `PLAYER_LOGIN` handler:
    - the micro buttons' `tooltipText` (`Blizzard_MicroMenu/Mainline/MainMenuBarMicroButtons.lua`);
    - the action buttons' `bindingAction` and hotkey text (`Blizzard_ActionBar/Shared/ActionButton.lua:483, 950`);
    - the minimap zone text's `tooltipText` (`Minimap.lua:123`).

    Hovering those runs the rest of their tooltip tainted until the next `/reload`. None of these handlers calls a protected function or builds a widget tooltip (the #300 path). It happens only in the session where the move runs. The options' Bind to Y button makes the same two calls on a click (`Options/General.lua:56-62`). An addon has no taint-free way to rebind a key, so this is accepted.
  - **Combat:** `SetBinding` and `SaveBindings` carry no documented restriction, and the lockdown is most likely not on at `PLAYER_LOGIN` even after a `/reload` in combat. The `InCombatLockdown()` guard stays as a precaution; the move then tries again at the next login.
  - **Secret values:** `C_KeyBindings.GetBindingByKey` marks its arguments `AllowedWhenUntainted`, and has no secret return. The argument here is the literal "Y".
  - No Blizzard frame field or function is written by the addon itself. The `PLAYER_LOGIN` handler is the addon's own.
- **Side effect:** once Y moves, Blizzard's Toggle Achievements has no key left. Blizzard's micro button tooltip then shows no "(Y)". This is how the original first run was meant to leave it, and how Bind to Y leaves it.
- **Clients:**
  - `C_KeyBindings.GetBindingByKey` and `Enum.BindingSet.Account` exist on Retail, Mists and Titan (`live`, `classic`, `classic_titan` clones). The `ACCOUNT_BINDINGS` global is only defined by Classic's load-on-demand `Blizzard_BindingUI`, so it is not used.
  - `TOGGLEACHIEVEMENT` defaults to Y on all three.
  - The binding load order was measured on Retail only; the Mists after-run checks it there.
  - Forever does not load the addon.
- **Blizzard API changes:** this is one (above). The other bare globals the addon calls were not rescanned for the same blind spot; that is a kit follow-up (Verification).
- **Other addons, plugins and skins:**
  - A Y bound to another addon's command is not touched.
  - GW2_UI hooks `AchievementFrame_ToggleAchievementFrame` (`Plugins/GW2_UI/GW2_UI.lua:131`), and this design does not change that function.
- **Saved variables and migrations:**
  - One new field, `KrowiAF_SavedData.FirstTimeSetUp.YBindingPending` (account-wide; `KrowiAF_SavedData` is already declared in the `.toc`), set by a first run and cleared once the move ran. No migration.
  - `AchievementTabsSwitched` keeps its meaning (the tab order).
- **Localization:** none; no new strings (the old error print goes).
- **Embedded libraries:** none.
- **Data snapshots:** none; no data changes.
- **Player-facing text:** the changelog line above.

## Verification
- **Permanent test:** a scenario for the move.
  - `Recorded` is today's behaviour: with Y on `TOGGLEACHIEVEMENT` at the first run, Y stays there and the first run is marked done.
  - `Target`:
    - a first run leaves the move pending;
    - nothing changes while the bindings are not loaded, a character set is active or the player is in combat;
    - then Y is on the micro button tab's binding and the move is no longer pending;
    - an account without a pending move keeps Blizzard's Y.
  - The headless runner stubs the binding API (`.claude/tools/headless/options-env.lua:166-172` has `SetBinding`/`SaveBindings`; `C_KeyBindings.GetBindingByKey` and `GetCurrentBindingSet` are added).
  - The suite, and whether the in-game run may change and restore a real binding, are settled in `plan.md`.
- **Checks:** `Check-Repo.ps1`, the scenario suites, `krowi:taint-reviewer` (binding API at login), `/code-review`.
- **Known limits of the test:**
  - `y-on-new-install` calls the move the way `PLAYER_LOGIN` does, not through the handler itself; the in-game new-install login checks that wiring.
  - It is headless only, so `Read-GameTests.ps1` lists its in-game SKIP as a difference, like the guide suite's headless-only cases. The release gate counts only failures.
  - `C_KeyBindings.GetBindingByKey` is asked without a binding context. An override binding another addon puts on Y at login might be reported instead of the saved one; the move is then skipped (rare, not handled).
- **In game, Retail:**
  - Log in on an account that never ran the addon (WoW4 or WoW5 have no saved variables of it). Y then runs `KrowiAF_OPEN_TAB_Achievements`.
  - Press Y, select an achievement, close the window and press Y again: it reopens on that achievement.
  - On WoW3, an existing account, Y stays Blizzard's.
  - `Read-GameErrors.ps1` shows nothing new, and no chat line appears.
- **In game, Mists:** the same on an account that never ran the addon (WoW3, WoW5 or WoW6 there).
- **Write-back (stage 6):**
  - the kit's deprecated-API check misses a global whose alias Blizzard already deleted. A check for globals that no clone defines would have caught this; that goes into the kit.
  - `.luarc.json` let it through, and the `luarc` lint rule could refuse a global that no client defines.

## Decision
Option 2, new installs only, chosen by Krowi on 2026-10-26 over the recommended option 1. Existing players keep Y as it is, and Bind to Y in the options stays their way to move it. Option 4 (Blizzard's toggle opening tab 1) goes to `docs/backlog.md` as its own item.