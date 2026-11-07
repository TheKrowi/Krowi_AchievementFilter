# Gates: 2026-11-07-release-gate-suites
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-07 | design | Release gate and the library's /kotest: the rule for when the library's tests run | /kotest required once per new client version, KAF's gate otherwise unchanged | "Test should run dedicated and not always everything. If code change does not affect a feature, no all test should run during dev pr merge. Before a release we do a full swoop of the addon. Libraries also get a test run if the client versiin is new" | own |
| 2026-11-07 | intent | Whether the intent states what Krowi wants (three rules: dedicated runs in development, a full swoop and the library's /kotest per new client version before a release) | accept | "Accept the intent (Recommended)" | took |
| 2026-11-07 | merge | PR #401 (with kit PR #18) | merge | "Merge, start p3" | took |
| 2026-11-07 | plan | Whether the plan is approved | approve | plan approved at ExitPlanMode with no changes | took |
| 2026-11-07 | design | Which suites the release gate requires green on the newest Retail and Mists build | every in-game suite | "Every in-game suite (Recommended)" | took |