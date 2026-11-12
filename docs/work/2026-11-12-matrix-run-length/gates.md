# Gates: 2026-11-12-matrix-run-length
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-12 | scope | Start the matrix speed-up after #419 | Yes, as its own harness work item | "Yes" | took |
| 2026-11-12 | intent | Accept the intent (a matrix step 2 min 10 s, 13 min a client; shorter runs that prove no less; a runner that follows the matrix to its end) | Accept as written | "Accept as written (Recommended)" | took |
| 2026-11-12 | scope | Which speed-ups: idle minute and runner fix; also no screenshots in the off steps; or all four | Idle minute + runner fix | "Idle minute + runner fix (Recommended)" | took |
| 2026-11-12 | design | Flag on the single-feature steps read by memory; the runner waits for the saved variables in this repo; the kit's reload wait a kit item of its own | Approve as written | "Approve as written (Recommended)" | took |
| 2026-11-12 | plan | The plan (Tests.lua flag, Memory.lua skip, the runner's wait for the saved variables, docs; headless, lint, Retail matrix, plain memory run, Mists matrix) | Approve | "Approve (Recommended)" | took |
| 2026-11-12 | design | /code-review (medium), ten findings on the runner's wait and the matrix step | Fix seven (missing folder, a file still being written, a late write in the matrix, a plain run's timeout reason, the time of the attempt that went through, a boolean instead of a flag, one local for the step); none for the fix belonging in the kit (Krowi's design answer), the fourth copy of the saved-variables picker (as the readers do it; a shared helper is a refactor of its own) and an older pending plan measuring every step (spec, risks) | - | auto |
| 2026-11-12 | merge | PR #420 | Merge | "Merge (Recommended)" | took |