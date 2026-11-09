---
paths:
  - "_Packaging/**"
  - ".claude/release-gate.ps1"
  - "Options/Window/Changelog.lua"
---
# What the release gate needs

`krowi:release` runs `.claude/release-gate.ps1` in its preflight. The gate needs:
- `Options/Window/Changelog.lua` to list the changelog's top entry (`.claude/tools/Build-ChangelogLua.ps1` writes it);
- a green in-game run of every suite except the three probes (`scheduler`, `sources`, `pictures`) on the newest build of each client the TOC's `## Interface:` claims (Retail and Mists Classic), newer than the last change to the suite's file; green means it failed nothing and passed something (Krowi, 2026-11-08);
- once per client version, a green full `/kotest all` run of Krowi_Options' test addon;
- a green whole `/kaftest matrix` run on the newest Retail and Mists build since `Features/` last changed: every suite but the probes with every feature on, every feature off and each feature alone (`docs/work/2026-11-08-feature-split-poc`).

Run them all in one go per client with `.claude/tools/Run-GameTests.ps1` and the 18 suites: the run keeps and reads every result, and runs `plugins` first. On Retail `plugins` needs Zygor Guides Viewer on for the character the kit logs in with (Krowi on Frostmane). The matrix is `.claude/tools/Run-GameTests.ps1 -Matrix`: each step asks for a `/reload` (`C_UI.Reload` is protected outside a key press), which the tool types. Before a client start, follow the workspace rule (`WowAddons.md`, Closing the loop with the game): input within the last 5 minutes means asking Krowi first.

When a run differs from the headless model, update the model in `.claude/tools/headless/run-tests.lua` before releasing.