# Gates: 2026-11-09-boundary-lint-calls
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-09 | design | How to stop the check counting a feature's calls as things it owns: count only what is created (`function X(` or `X =`), or list each wrongly owned name as an exception (asked three times: as regex options, then as code examples, then in plain words after "i still don;t get it, what's the goal?") | count only what is created | "Count only what is created (Recommended)" | took |
| 2026-11-09 | plan | The plan (patterns in Check-Repo.ps1 only, scratch checks never committed, whole-tree lint, PR, the menu branch rebases after the merge) | approve | "Approve (Recommended)" | took |