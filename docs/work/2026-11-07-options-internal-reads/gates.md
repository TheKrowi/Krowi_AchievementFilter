# Gates: 2026-11-07-options-internal-reads
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-07 | intent | Whether the intent states what Krowi wants (KAF reads the library through lib.Internal or lib, and GetStrings().NeedsReload) | accept | "Accept the intent (Recommended)" | took |
| 2026-11-07 | merge | PR #400 | merge | "Merge" | took |
| 2026-11-07 | plan | Whether the plan (four edits, headless and in-game proof with both libraries) is approved | approve | plan approved at ExitPlanMode with no changes | took |
| 2026-11-06 | scope | Whether the library's internals move under lib.Internal in 2.0 and KAF's tests follow (asked in Krowi_Options' work item 2026-11-06-finish-2-0) | yes, in 2.0 | "Yes, in 2.0 (Recommended)" (after asking what it meant: "Plan was to move options test to options and kaf only test the public stuff right for its own addon?") | took |
| 2026-11-07 | design | How KAF reads the reload text, which is `L["Requires a reload"]` and L is not public (asked in Krowi_Options' work item) | KAF reads GetStrings().NeedsReload | "KAF reads GetStrings().NeedsReload (Recommended)" | took |