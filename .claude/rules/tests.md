---
paths:
  - "Tests/**"
  - ".claude/tools/headless/**"
---
# Scenario suites and the headless model

- The suites in `Tests/` run headlessly through `.claude/tools/headless/run-tests.lua` and in game through `/kaftest <suite>` (debug mode on, out of combat). Each suite, the in-game runner, the matrix and adding a suite: `Tests/README.md`.
- A scenario carries `Recorded`, the behaviour of the current code verified in game, and `Target`, the desired behaviour. It passes while the code behaves as recorded, so a behaviour change is a reviewable diff and the open targets stay visible without failing anything.
- A bug fix is built test first: a scenario records the buggy behaviour as `Recorded` and the spec's behaviour as `Target`; then only the code is fixed, and `Recorded` is set to `Target`. Every fixed bug leaves its scenario behind. A data bug is reproduced by the headless data pipeline or a `data-verifier` finding instead.
- When an in-game run differs from the headless model, update the model in `.claude/tools/headless/run-tests.lua` before releasing.
- The headless data pipeline (`load-data.lua`) stubs the WoW globals: extend the stubs in `runClient` when a new WoW global is used at load time.
- `scheduler` and `sources` are game-only probes and `pictures` makes the help pictures; the release gate leaves those three out.