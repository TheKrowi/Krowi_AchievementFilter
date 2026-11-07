# Intent: the release gate runs every in-game suite, and the library's tests when a client has a new version
Author: Krowi, maintainer. Source: idea, from Krowi's answers of 2026-11-07 while closing phase 2 of Krowi_Options 2.0 (`Krowi_Libraries\Krowi_Options\docs\work\2026-11-06-finish-2-0`). Status: done

## Problem
KAF's release gate (`.claude/release-gate.ps1`) asks for green in-game runs of two suites only, `escape` and `options` on Retail and `options` on Mists, on the newest build. The other fifteen in-game suites are never required before a release, and the library's own tests (`Krowi_OptionsTests`, `/kotest`, which cover the options window's frames that KAF's `options` suite no longer draws) are not required at all. A patch can break any of them. A `/kotest` run on every release would be wasted work, and a full run of every suite on every pull request too.

## Proposed outcome
Three rules, in Krowi's words:
- During development and in pull requests, run only the dedicated suites a change can affect; no full run when a change does not touch the feature.
- Before a release, a full swoop of the addon: the gate requires a green run of every in-game scenario suite on the newest Retail and Mists build.
- The library's tests: the gate also requires one green full `/kotest` run on the newest build of each client, with no condition on when the library last changed, so it blocks only the first release after a client gets a new version number and passes on every release after that.

## Affected users and systems
- Players: nothing changes.
- The maintainer and the release skill: the preflight asks for more runs before a release, and names the missing ones.
- `.claude/release-gate.ps1`, `.claude/tools/headless/read-runs.lua`, KAF's instructions (`.github/copilot-instructions.md`, `Tests/README.md`), `docs/backlog.md`.

## Constraints
- A suite that does not apply to a client SKIPs there and still counts (a run with no failures).
- `scheduler`, `sources` (game-only observations) and `pictures` (makes the help pictures) never count.
- Retail and Mists only; Era, Anniversary and Forever join when KAF's TOC lists them.
- The gate keeps its existing rule for KAF's suites: a run counts only when newer than the last commit that changed the suite's file.
- No change to a suite, to the addon or to the library.

## Open questions
None.