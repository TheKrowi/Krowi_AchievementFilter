# Gates: 2026-11-07-settings-panel-taint
Class: fix/gui

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-07 | intent | Krowi_Options taint review, finding 1 (KAF's Open options closes Blizzard's Settings window and saves the bindings from KAF's code): fix in KAF 105.0 (asked in the library's work item) | fix it in KAF 105.0 | "Fix it in KAF 105.0 (Recommended)" | took |
| 2026-11-07 | scope | Krowi_Options taint review, finding 3 (KAF's Show me map button stays above Blizzard's Options window): fix in the same KAF item (asked in the library's work item) | fix it in KAF 105.0 | "Fix it in KAF 105.0 (Recommended)" | took |
| 2026-11-07 | design | Fix 2: how the map button notices Blizzard's Options window or the game menu | vanish when they open | "Vanish when they open (Recommended)" | took |
| 2026-11-07 | design | Proof: a lint rule, a headless scenario and real keys by Claude, or also an automatic in-game step (the kit's marker learning Escape) | check, offline test, real keys by Claude | "Also an automatic in-game step" | other |
| 2026-11-07 | design | How the automatic step opens Blizzard's windows: the kit's existing real click on the game menu's micro button and its Options button instead of a new Escape key (no kit change); fix 1 stays on the lint rule | real clicks, no kit change | not asked: chosen while writing the decision | auto |