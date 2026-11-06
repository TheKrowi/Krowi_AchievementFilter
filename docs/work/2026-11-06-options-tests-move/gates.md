# Gates: 2026-11-06-options-tests-move
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-06 | scope | Whether the library's internals are tested by the library (asked in Krowi_Options' work item 2026-11-06-finish-2-0) | the library tests its internals through a test addon | "Kaf should test what it can see. Krowi options should cover the internals. It's ok for options to have a small test addon to run tests kaf is covering today." | own |
| 2026-11-06 | intent | Does intent.md state what Krowi wants | accept | "Accept the intent (Recommended)" | took |
| 2026-11-06 | design | Which live steps stay in KAF after the cut: a public smoke (open, close, errors, restore), window-tabs reduced to KAF's own tab, window-second-tab gone | public smoke | "Public smoke: open, close, errors, restore (Recommended)" | took |
| 2026-11-06 | plan | The plan: delete the library's steps from Tests/Options.lua, keep KAF's own and a public smoke, run Retail and Mists, deploy main back afterwards | approve | approved in plan mode | took |
| 2026-11-06 | merge | Krowi_AchievementFilter #399, after Krowi_Options #5 | merge both, library first | "Merge both, library #5 first (Recommended)" | took |