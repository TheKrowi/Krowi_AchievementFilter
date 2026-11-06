# Intent: KAF's options suite tests what KAF can see; the library tests its own internals
Author: Krowi, maintainer. Source: idea, from Krowi_Options' work item `Krowi_Libraries\Krowi_Options\docs\work\2026-11-06-finish-2-0` (phase 1), where Krowi decided: "Kaf should test what it can see. Krowi options should cover the internals." Status: done

## Problem
`Tests/Options.lua` (2077 lines, `/kaftest options`) carries about 45 steps that test the Krowi_Options library, not KAF: search, row and card geometry, the window's frames, hover help, confirm, toggles, tabs, sizes, strings, globals, pane, close. They read about 40 of the library's internals (`lib.Shared`, `lib.Tabs`, `frame.HoverOption`, `frame.Elements`, `row.Toggle`, ...) and use KAF's own labels as sample data. The library's coming structure change (Krowi_Options phase 2) moves or renames those internals, and each move would break a KAF test in a repo that does not own the code. The library has had no tests of its own.

## Proposed outcome
KAF's `options` suite keeps what is KAF's: its options and their mapping into the window, defaults, the Y binding at login, its window config and help content, the plugin groups, and a small smoke through the library's public surface only. Every step it drops has an equal in the library's own test addon (`Krowi_OptionsTests`, `/kotest`), which hosts the library without KAF on every client. Nothing KAF tests today goes untested.

## Affected users and systems
- Krowi_AchievementFilter: `Tests/Options.lua`, `Tests/README.md`, and, where it names removed steps, `.claude/tools/headless/run-tests.lua`, `Check-Repo`'s scenario and test lint rules. No addon code under `Gui/`, `Options/`, `Data/` changes.
- Krowi_Options: the test addon and headless suites (its phase 1 pull request) are the receiving side.
- Krowi_ClaudeKit: `skills/release/TwoCopy.psd1` names KAF's `options smoke` + `escape` as the two-copy gate's smoke; it must name what still exists (its own pull request).
- Players: nothing; the tests are not shipped.

## Constraints
- Equal coverage first: a step is deleted only after its equal passed in the test addon on Retail and Mists, side by side with KAF's run (2026-11-06: KAF `options` and the test addon, both green on Retail and Mists).
- KAF's headless `options` run keeps loading the real library from `Libs/`; `escape` keeps its stand-in.
- The two-copy gate keeps a KAF-side smoke (KAF is its consumer).
- KAF's lint (`Check-Repo.ps1`) stays at 0 errors; `Tests/README.md` describes what the suite now is.
- No `Libs/` edit; the library's pointer is not moved here.

## Open questions
- Which steps stay (spec).