# Gates: 2026-11-08-gate-version-runs
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-08 | scope | Krowi_AchievementFilter's gate counts only runs of the version being released (like Krowi_ExtendedVendorUI's), carried into a hotfix off 105.0 (asked in the kit's hotfix-mode work item) | yes, like KEVU | "Yes, like KEVU (Recommended)" | took |
| 2026-11-08 | plan | The kit's hotfix-mode plan, step 9 (this change) | approve | plan approved at ExitPlanMode with no changes | took |
| 2026-11-08 | design | The reader filters by version instead of the gate, so the commit avoids the lines changed after 105.0 and a hotfix can carry it | reader filters | not asked: the kit's approved plan left the place open; the other place cannot be carried | auto |