# Plan: The options window's markers say what they mean
Spec: [spec.md](spec.md). Status: done (accepted by Krowi, 2026-10-31, after the look in game)

The code was built before this plan: Krowi asked to see the looks in game, so the first prototype (a round dot, `/kaflook`) and then the chosen look were built and deployed during the design stage. This plan records what was built, for the plan gate, which this change needs as shared GUI code.

## Files that change
- `Krowi_Options/Rows.xml`: the option row's `Dot` button becomes a `ChangedBar` texture and a `Reset` button (`common-icon-undo`).
- `Krowi_Options/RowMixins.lua`: `Reset` sets the option back on a left-click and forwards the mouse to the row like the other controls; `Refresh`, `OnEnter` and `OnLeave` show the line and the arrow.
- `Krowi_Options/Krowi_Options.lua`: `lib.Markup = { Changed, Reload, Reset }`.
- `Krowi_Options/WindowMixin.lua`: the reload bar and the hover lines carry their marker; `Strings.Changed` replaced by the optional `Strings.ResetToDefault` (the game's `RESET_TO_DEFAULT`).
- `Options/Window/Window.lua`: `Changed` leaves the strings.
- `Options/Window/Help/Help.lua`: the Overview's marker lines.
- `Options/Window/Model.lua`: `CheckChangedDots` renamed `CheckChangedLines`.
- `Localization/*.lua` (11 locales): "Help Overview Dot" replaced by "Help Overview Changed", "Changed. Right-click the dot to set it back." removed.
- `Tests/Options.lua`, `Tests/README.md`, `docs/architecture.md`: the scenario renamed `changed-line`, the change steps read the line, a `toggle-reset` step.

## Order of work
1. Prototype for the pick: the round dot and the markers beside their texts behind `/kaflook` (debug mode); deployed to Retail and Mists. Done.
2. Krowi's pick (spec, Decision): the switch, the dot and its strings removed; the line, the hover arrow and the Overview lines built; the locales updated; the suite updated. Done.
3. Checks: `Check-Repo.ps1 -ChangedOnly -Luals`, the headless `options` and `help` suites. Done, green.
4. In game on Retail and Mists Classic: Krowi's look, then `/kaftest options` and a `/reload`, `Read-GameTests.ps1`, `Read-GameErrors.ps1`. Retail done 2026-10-31 23:26: 57 passed, 0 failed, `toggle-reset` passed, no Lua error. On `24646d9a` 2026-11-01, Mists 08:41 and Retail 08:43: 57 passed, 0 failed, 1 skipped (`y-on-new-install`, headless only) on each, no Lua error.
5. `krowi:taint-reviewer` (done: no finding; aside: Krowi_Options' minor stays 1 while no other copy exists) and `/code-review` on the diff (done 2026-11-01: 8 findings, none Important; 4 deferred to `docs/backlog.md`, the others not defects or decided in the spec); the strings to CurseForge through `krowi:localization` after the merge.

## Risks
- **The arrow flickers or cannot be clicked** when the mouse moves from the row onto it, because the row's `OnLeave` fires first: `OnLeave` hides the arrow only once `IsMouseOver` says the mouse left the row, and the arrow forwards its own enter and leave to the row. Checked by hand in game.
- **The arrow sits on the line or the name** at 12 px in a 16 px margin: 2 px from the name, the line at the row's edge; Krowi's look in game decides.
- **Agent-made translations** of the new Overview line, in ten locales: CurseForge translators can correct them after the export.

## Proof
- Headless: `run-tests.lua <repo> options` and `help`: 21 and 5 passed on Retail and Classic, `options/changed-line` met.
- In game, both clients: changing an option shows the gold line; hovering its row shows the undo arrow and the help pane's last line "↺ Reset to Default"; clicking the arrow sets the option back and the line goes; the reload bar reads "↻ Some changes take effect after a reload."; the Overview shows both marker lines.
- `/kaftest options`: the change steps report "changed line follows", `toggle-reset` passes, no Lua error from BugGrabber.