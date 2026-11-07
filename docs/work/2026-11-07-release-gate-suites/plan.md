# Plan: the release gate runs every in-game suite and the library's /kotest per new client version
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `.claude/release-gate.ps1`: the 17 suites for Retail and Mists, a map for the suite files whose name is not the title-cased suite (`special` is `SpecialCategories.lua`, `popups` `PopUps.lua`, `worldmap` `WorldMap.lua`), and a block per family that reads the test addon's saved variables and passes on a green `all` run on the newest build or later, with no date condition. Header comment rewritten.
- `.claude/tools/headless/read-runs.lua`: an optional second argument, the saved table's name.
- `.github/copilot-instructions.md`, `Tests/README.md`: the three rules, short.
- `docs/backlog.md`: the entry "Krowi_Options' tests on a new game build" closed.

## Order of work
1. `read-runs.lua`, then `release-gate.ps1`.
2. The gate dot-sourced with stand-ins against the real saved variables (Fail for a suite without a run, Pass for a green one), and once against a copy with a failed run.
3. `Check-Repo.ps1 -ChangedOnly`, the docs.
4. In game: headless first for every suite, then the full swoop on Retail and on Mists, then the library's `/kotest all` on each (test addon deployed together with the library copy, KAF's own copy put back after).
5. The gate again, every line Pass. `/code-review`, `Get-ChangeClass.ps1`, PR, merge row.

## Risks
- A suite may fail on a client for reasons unrelated to this change (`worldmap` refuses with ElvUI, GW2_UI or Leatrix Maps; `plugins` needs `/kaftest login plugins` and a `/reload`, and SKIPs without Zygor): a failure is a finding for its own work item, never dropped from the list.
- `memory` takes about a minute idle; `popups` clears the reminders showing. Out of combat, one kit-started client at a time.
- The test addon's library copy mixes with KAF's at equal minors: deploy them together for `/kotest all`.

## Proof
Gate lines Pass after the swoop and `/kotest all` on 12.1.5 and 5.5.4 and Fail with the suite and client named before; headless suites unchanged; lint clean; BugGrabber clean.