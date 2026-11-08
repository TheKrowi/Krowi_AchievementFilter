# Gates: 2026-11-08-test-run-history
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-08 | scope | How should the tool judge a run of several suites, when some suites pass nothing (worldmap on Retail; tooltip, schedules on Mists; plugins on both)? | Name them, fail only if all | "If a test failes, that test need validation and code fixing or test fixing. Handle each individually. One test fail is a full fail." | own |
| 2026-11-08 | design | How should a run of many suites keep all its results readable? | Keep as many as it runs | "See prev answer, do we need to discuss further?" (taken as the recommendation: the run keeps as many results as it asked for) | took |
| 2026-11-08 | plan | Plan: keep N runs, a read-only check per suite that passed nothing, plugins first with Zygor on, the gate's rule | Approve | "Approved the plan but what's the plan for? Didn't we already release 105?" | took |
| 2026-11-08 | merge | PR #404 | Merge it | "Merge it (Recommended)" | took |