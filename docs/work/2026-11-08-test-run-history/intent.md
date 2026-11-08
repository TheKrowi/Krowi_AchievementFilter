# Intent: a test run of many suites keeps every result it ran
Author: Krowi, maintainer. Source: idea, from the 105.0 release run (2026-11-08). Status: accepted

## Problem
Before a release every in-game suite runs in one go: `Run-GameTests.ps1` types `/kaftest run` with all 17 suites, on Retail and on Mists. Every suite ran and passed on 2026-11-08, yet the tool said "only 10 of 17 entries left a run" and failed, three tries per client. The first seven suites' results were there for the release gate, but the tool could not read them, so its verdict was wrong and a reader of its output had to check by hand.

## Proposed outcome
Krowi, 2026-11-08: "Read all 17 tests if you know you will run 17." A run of N suites keeps all N results where the reader looks, so `Run-GameTests.ps1` shows and judges every one of them, whatever N is.

## Affected users and systems
Only the maintainer's test tooling: `/kaftest` (Tests/Tests.lua, active in debug mode only), `.claude/tools/Run-GameTests.ps1` and `Read-GameTests.ps1`. The saved variable `KrowiAF_DebugTable.Tests` (debug data, never read by the addon itself). Retail and Mists Classic, the clients the suites run on. Players: none.

## Constraints
- Runs Krowi makes in a row (one per skin addon, a reload between each) stay readable as now: no fewer runs kept than today.
- The release gate (`.claude/release-gate.ps1`) reads `Tests.Runs`, which is not touched.
- The two-copy gate of the libraries reads `Run-GameTests.ps1`'s exit code as the suites' verdict.

## Open questions
None.