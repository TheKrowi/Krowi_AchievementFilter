# Gates: 2026-11-13-remove-taintless
Class: library

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-13 | intent | Why remove TaintLess | - | "was added in an attempt to remove taint but felt like it never did something, remove it." | own |
| 2026-11-13 | design | Remove all of TaintLess? (four of six hooks guard Blizzard code that no longer exists; two drop-down hooks still guard Classic's old drop-down, which KAF's menus use on Mists; inferred risk: a blocked honor queue on Mists after opening a KAF menu; fallback: keep it loaded on Classic only) | Remove | "remove" | took |
| 2026-11-13 | design | Class of the change | library (`Libs/` paths; the skip-list line is headless tooling, which counts for nothing) | - | auto |
| 2026-11-13 | design | The 70.0 changelog entry and the options-revamp mockup's skip list name TaintLess | Leave both: released history and a closed work folder's record | - | auto |
| 2026-11-13 | design | No new scenario for a removal | The existing suites are the regression check; no offline check can show a taint that does not happen | - | auto |
| 2026-11-13 | design | The unused `UIDropDownMenuTemplate` frame in `Gui/WorldMapButton/WorldMapButton.xml:55` | Out of scope, left as is | - | auto |
| 2026-11-13 | plan | The plan (the `Libs/Files.xml` line, `Libs/TaintLess`, the skip-list entry, the architecture mention, a changelog line; offline checks, then the in-game suites on Retail and Mists and the manual honor queue check) | Approve | "approve" | took |