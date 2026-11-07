# Spec: the release gate requires every in-game suite and, once per new client version, the library's tests
Intent: [intent.md](intent.md). Status: done

## Requirements
1. For Retail (families' newest claimed build, today 12.1.5) and Mists Classic (5.5.4), `.claude/release-gate.ps1` requires a green run (0 failed, newer than the last commit that changed the suite's file) of each of: `escape`, `special`, `navigation`, `worldmap`, `obtainable`, `tooltip`, `guide`, `menu`, `memory`, `events`, `schedules`, `tracking`, `options`, `help`, `earned`, `plugins`, `popups`. Each missing one is a Fail line naming the suite, the client and the command to run.
2. The gate requires, per family, one green full run (`Runs.all`, 0 failed) of the library's test addon, read from `KrowiOptionsTests_Debug` in the test addon's saved variables on that family's clients, on the newest build or later. No condition on when it ran.
3. `.claude/tools/headless/read-runs.lua` takes an optional second argument, the name of the saved table (default `KrowiAF_DebugTable`), so one reader serves both addons.
4. The gate's header comment, KAF's instructions and `Tests/README.md` state the three rules; `docs/backlog.md`'s entry "Krowi_Options' tests on a new game build" is closed.
5. No change to any suite or to addon code.

## Design
`$families` lists the 17 suites for both families. A second block per family reads `Krowi_OptionsTests.lua` the same way as the addon's saved variables (same clients, same `read-runs.lua`, second argument) and passes on a green `all` at the newest build or later. A suite that does not apply on Mists SKIPs and its run is recorded, so one list serves both families.

## Options considered
1. **Every in-game suite plus `/kotest` once per client version** (recommended, Krowi 2026-11-07).
2. **`escape` and `options` plus `/kotest`:** rejected by Krowi: the release should be a full swoop.
3. **`/kotest` on every release, newer than the library's last change:** rejected by Krowi: the library's tests need to run when a client gets a new version, not on every release.

## Areas of concern
- **Taint and secret values:** none; the change is a release script. **Clients:** Retail and Mists, the TOC's families. **Blizzard API changes:** none. **Other addons, plugins, skins:** `worldmap` refuses with ElvUI, GW2_UI or Leatrix Maps loaded and `plugins` SKIPs without Zygor; those runs happen on a clean setup. **Saved variables:** none changed; the gate reads the test addon's file. **Localization, embedded libraries, player-facing text:** none.
- **First release after this lands:** the gate fails until the full swoop and `/kotest` ran on 12.1.5 and 5.5.4; that is the intent. A run needs the test addon installed on the client that runs it.
- **A suite no longer applying to a client:** it SKIPs, never fails; if one errors on Mists that is a real finding, fixed in its own work item.

## Verification
The gate dot-sourced with stand-ins for the preflight's `Pass`, `Fail` and `Get-ClientFolder` against the real saved variables: it reports Fail for missing suites and Pass for green ones; then a full in-game swoop on Retail and Mists (every suite, headless first) and a `/kotest` all run on each, after which the gate's lines are all Pass. `Check-Repo.ps1`.

## Decision
2026-11-07: Option 1, every in-game suite plus the library's `/kotest` once per client version. Krowi's answers and the accepted intent are rows in gates.md.