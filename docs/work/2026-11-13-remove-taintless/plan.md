# Plan: Remove the TaintLess library
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `Libs/Files.xml`: drop line 2 (`<Include file="TaintLess\TaintLess.xml" />`) and the blank line 3 after it, so the file opens with the `Krowi_Util` include.
- `Libs/TaintLess/TaintLess.xml`: deleted with `git rm` (the folder's only file; the folder goes with it).
- `.claude/tools/headless/options-env.lua:86`: drop `"^Libs/TaintLess/", ` from the skip list.
- `docs/architecture.md:122`: drop `TaintLess, ` from the vendored-library list.
- `_Packaging/Changelog.md`: under `## 106.0`, `### Changed`, one line: "The TaintLess library is no longer included".

## Order of work
1. This plan waits for Krowi (class `library`: the plan gate asks).
2. The four edits and the `git rm`, in one commit: `chore: remove the TaintLess library`.
3. Offline checks (Proof). A failure is fixed in the code, never by weakening a check.
4. Stop for the game: deploy the branch to Retail, run the suites, then Mists with the manual honor queue check. That needs the client, which this work's runs so far could not use.
5. Then the PR (`Get-ChangeClass.ps1` first; the "Decisions taken without asking" from `gates.md`), `/code-review`, and `krowi:taint-reviewer` on the diff.

## Risks
- **A blocked honor queue on Mists and Titan** after a KAF menu was opened (spec, Root cause; INFERRED). Guarded by the manual Mists check; the fallback is keeping TaintLess loaded on Classic only. Titan cannot be checked locally and follows Mists.
- **A load-order effect:** TaintLess loaded first; nothing after it reads its globals (grep, spec), so the order of the rest is unchanged. Guarded by the headless data load and suites, and by `Read-GameErrors.ps1` after the in-game runs.
- **The headless options loader** walks `Libs/Files.xml`; with the include gone the skip entry is moot. Guarded by the `options` suite.
- **Class:** `Get-ChangeClass.ps1` should say `library`; if it says `harness` (the removed skip-list line counted as changed test tooling), the harness gates are asked before the PR.

## Proof
- `& ".claude\tools\Check-Repo.ps1" -ChangedOnly`: no errors.
- `lua.exe ".claude\tools\headless\run-tests.lua" "$PWD" <suite>` for `options`, `menu`, `escape`, `tracking`: Retail and Classic each 0 failed, as before the change (options 28, menu 8, escape 34 and tracking 9 passed on Classic, 2026-11-13).
- `lua.exe ".claude\tools\headless\load-data.lua" "$PWD" Both`: `0 problem(s)`, Retail 8669 and Classic 2752 achievements registered, as before.
- `git grep -i taintless` lists only the 70.0 changelog line, the new changelog line, this work folder and the options-revamp mockup.
- In game (owed, spec Verification): Retail and Mists, `Run-GameTests.ps1 escape, menu, options, tracking` green and no new KAF row in `Read-GameErrors.ps1`; on Mists the manual check (KAF right-click menu, then the honor queue type drop-down and queue button) queues with no blocked-action message.