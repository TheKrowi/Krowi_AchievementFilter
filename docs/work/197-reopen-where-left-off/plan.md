# Plan: The achievement window does not reopen where the player left it
Spec: [spec.md](spec.md). Status: accepted

Context: issue #197. On a new install, Y keeps opening Blizzard's own Achievements tab, so the window never reopens where the player left it. The first run's move of Y to the addon has never worked:
- it calls `GetBindingByKey`, a global removed in 11.2.7 and 5.5.1;
- it runs at `ADDON_LOADED`, before any key bindings exist (the probe, spec Root cause).

Krowi's decision (2026-10-26): move Y at login, on new installs only.

## Files that change
- `Gui/Gui.lua`
  - `SwitchAchievementTabs` (`:339-357`) loses its four binding lines (`:352-356`); the tab-order swap and `MicroButtonTab` stay.
  - The first run in `gui:TabsOrderGetActiveKeys` (`:376-379`) also sets `KrowiAF_SavedData.FirstTimeSetUp.YBindingPending = true`.
  - New, next to them, the `Data/EventSchedules.lua:17-25,153-156` seam pattern:
    - `local game = { FirstTimeSetUp, MicroButtonCommand, BindingSet, InCombat, CommandOnKey, Bind, Save }`, wrapping `KrowiAF_SavedData.FirstTimeSetUp`, `KrowiAF_SavedData.Tabs[addon.Options.db.profile.MicroButtonTab].BindingName`, `GetCurrentBindingSet`, `InCombatLockdown`, `C_KeyBindings.GetBindingByKey`, `SetBinding` and `SaveBindings`.
    - `local bindings = game`.
    - `function gui:MoveYToMicroButtonTab()`:
      - it returns when the move is not pending, the active set is not `Enum.BindingSet.Account`, or the player is in combat;
      - when Y runs `TOGGLEACHIEVEMENT` and the micro button's command is another one, it calls `Bind("Y", command)` and `Save(Enum.BindingSet.Account)`;
      - then it clears `YBindingPending`.
    - `function gui:UseBindingsForTest(model)`, which sets `bindings = model or game`.
- `Krowi_AchievementFilter.lua`, `LoadPlayerLogin` (`:71-82`): `addon.Gui:MoveYToMicroButtonTab()` right after `addon.ChangeAchievementMicroButtonOnClick()`, which resolves an out-of-range `MicroButtonTab` first. No new event: `PLAYER_LOGIN` is already registered and listed in `Check-Repo.jobs`.
- `.luarc.json`: drop `"GetBindingByKey"` from `diagnostics.globals` (`:99`).
- `.claude/tools/headless/options-env.lua`, the game's binding load as the probe measured it:
  - `GetBindingByKey` joins `absentGlobals`, so it is nil as in the game;
  - `Enum.BindingSet = {Default = 0, Account = 1, Character = 2}`;
  - `C_KeyBindings.GetBindingByKey(key)` reads a key-to-command model, and `SetBinding` moves a key off its previous command;
  - during the file loads and the `ADDON_LOADED` steps: binding set 0, no bindings;
  - after the data steps: set 1 with Blizzard's default `TOGGLEACHIEVEMENT` on Y, then a step that calls `addon.Gui:MoveYToMicroButtonTab()` when it exists. What it left is captured as `ctx.NewInstall = {Y, Pending}`;
  - then the bindings model goes back to today's empty set 1, so the options suite's other scenarios see exactly what they saw before.
- `.claude/tools/headless/run-tests.lua`, `suites.options` (`:1589-1604`): `addon.Tests.NewInstall = ctx.NewInstall` before `Tests/Options.lua` runs.
- `Tests/Options.lua`:
  - `RunScenario` (`:126-142`) gets a SKIP: an `Observe` that returns `nil, reason`.
  - New scenarios:
    - `y-on-new-install`, headless only, SKIP in game: "needs a new install". It reads `addon.Tests.NewInstall`.
    - Seven `y-at-login-<case>` scenarios on a model through `UseBindingsForTest`, the same in game and headlessly. A shared observer runs one case and puts the game back with `UseBindingsForTest(nil)`, also on error. The cases: `new`, `bindings-not-loaded`, `character-set`, `combat`, `y-taken`, `existing-account`, `blizzard-tab`.
- `Tests/README.md`: the `options` row gains the Y scenarios.
- `_Packaging/Changelog.md`, `## 105.0` `### Fixed`: one line, e.g. "On a new install, Y now opens the addon's window, which reopens where you left off, instead of Blizzard's own Achievements tab".
- `docs/backlog.md`: a section "From the Y binding fix (2026-10-26, issue #197)" with:
  - Blizzard's toggle opening tab 1 (toasts, chat links, a Y left on Blizzard's binding);
  - existing accounts left as they are by decision, to revisit if reports continue.
- `docs/work/197-reopen-where-left-off/plan.md`: this file; `Status: done` at the end, with intent and spec.

## Order of work
1. Write `plan.md`, commit it (`docs(work): plan for 197`).
2. **Test first.** Build the headless model and the scenarios on today's code: `options-env.lua`, `run-tests.lua`, the `RunScenario` SKIP and the eight scenarios.
   - `Recorded` is today's behaviour: `y-on-new-install` "y=TOGGLEACHIEVEMENT pending=nil", and every `y-at-login-*` "no move at login", since the function does not exist yet.
   - `Target` is the spec's: "y=KrowiAF_OPEN_TAB_Achievements pending=nil" for the new install; per case "y=<command> pending=<state> saved=<set>".
   - Run the suite on both clients: everything PASS, the eight open, the existing options lines unchanged.
   - Commit `test: reproduce #197 in the options suite`.
3. **The fix.** Edit `Gui/Gui.lua`, `Krowi_AchievementFilter.lua` and `.luarc.json`, then rerun the suite. The eight lines must now show their targets. Set `Recorded` to `Target`, and commit `fix: Y moves to the addon's window on a new install (#197)`.
4. Changelog line, backlog section, `Tests/README.md` row.
5. Checks: `Check-Repo.ps1` (whole tree, with `-Luals`), `Find-DeprecatedApi.ps1` for live and classic, then `krowi:taint-reviewer` on the diff.
6. In game (stage 4), with c1 told before the deploy (Proof).
7. Status `done`, push, PR with `Closes #197`, `/code-review`.

## Risks
- **The options suite's existing lines move.** The bindings model changes during the load, and its key bindings show in the key-binding options. The model goes back to today's empty set 1 after `NewInstall` is captured, and step 2 checks that no other line of the suite changed.
- **A real key binding changed by a test.** The in-game scenarios run only on the model through `UseBindingsForTest`, which is restored in all cases. The real move runs only at login, on a pending account.
- **`SetBinding` at login is blocked in combat** (a `/reload` in combat): the function returns early and the move stays pending. Covered by the `combat` case.
- **`C_KeyBindings.GetBindingByKey` returns ""** for a free key, not nil. Only equality with `TOGGLEACHIEVEMENT` matters, so it does not.
- **Taint.** Login runs the addon's own handler; `SetBinding` and `SaveBindings` from addon code out of combat are what the options' binding buttons already do (`Options/Options.lua:21-41`). No Blizzard frame or function changes. `krowi:taint-reviewer` confirms.
- **The game is shared with four busy sessions**, and a deploy replaces their builds. Message c1 before each deploy, name what was replaced, and keep the game steps short.

## Proof
- Headless, expected: no FAIL, and the eight new lines are `met`.
  - `& "...\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" options`
  - the same for `help`, whose load is shared.
- `Check-Repo.ps1 -Luals`: 0 errors. `Find-DeprecatedApi.ps1`, also `-Branch classic`: no `GetBindingByKey`.
- **In game, Retail.** First `Deploy.ps1 -WhatIf`, then deploy.
  1. On Krowi's main character: `/kaftest options`, then `/reload`. `Read-GameTests.ps1` shows the seven `y-at-login-*` met, `y-on-new-install` SKIP, no FAIL. `Read-GameErrors.ps1` shows nothing new.
  2. A real new install. Krowi ticks Krowi_AchievementFilter in the addon list of Krowisetwo (WoW4, no saved data of the addon; it is disabled there today) and logs in. Then: Y opens the addon's window; select an achievement, close the window, press Y, and it reopens on it.
     - After a `/reload`: WoW4's `bindings-cache.wtf` has `bind Y KrowiAF_OPEN_TAB_Achievements`, `YBindingPending` is gone from its saved variables, and no "Error switching achievement tabs" appears in chat.
     - Krowi unticks the addon there again afterwards, if wanted.
  3. An existing account stays unchanged: WoW3's `bindings-cache.wtf` still has no `bind Y` line after a login there with the fix. Optional, read from disk.
- **In game, Mists:** after deploying to Classic, `/kaftest options` on Krowi's character, then `/reload` and `Read-GameTests.ps1 -Client Classic` (the seven met). No new-install check: the spare Mists accounts have no characters. The headless Classic run covers the load order there.
- **Write-back (stage 6), noted here:**
  - the kit's `Find-DeprecatedApi.ps1` cannot see a global whose alias Blizzard deleted before the clones existed (into the kit's backlog, as c1 also proposed);
  - a `luarc` rule could refuse a `diagnostics.globals` entry that no client defines.

## Departures from the plan
After `/code-review` and `krowi:taint-reviewer`:
- The call moved from `LoadPlayerLogin` to the end of the `PLAYER_LOGIN` branch, so an error in it cannot stop the Blizzard_AchievementUI and calendar loads.
- A binding the game refuses (`SetBinding` returns false) is neither saved nor marked done. That adds an eighth login case, `y-at-login-bind-refused`, and the headless `SetBinding` now returns true as the game does.
- A SKIP in the options suite no longer counts as open.
- The Risks above were wrong on taint and combat:
  - `UPDATE_BINDINGS` runs Blizzard's binding display tainted for the session of the move;
  - nothing documents `SetBinding` as blocked at login.

  `spec.md` (Areas of concern) has the corrected account.
- The in-game counts: eight `y-at-login-*` met, not seven.