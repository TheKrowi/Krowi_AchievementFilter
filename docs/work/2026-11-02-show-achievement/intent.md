# Intent: Show-Achievement.ps1 answers questions about one achievement
Author: Krowi (maintainer). Source: idea, step 7 of `docs/harness-roadmap.md` (its full text: the roadmap at aba8378b). Status: done

## Problem
Questions about one achievement are the most common request in this repo's sessions: a wrong obtainable range (5313), whether something became a Feat of Strength, why an id moved to Shared (8246), the dates of a short window. Measured on 2026-10-10: 10 sessions, 232 tool calls and 533 KB of tool output, re-reading `Data/TemporaryObtainable.lua`, the build-version files and `Objects/Achievement.lua` 31 times. The facts are all in the repo, but spread over the data line and its patch key, how the `Obtainable()` anchors resolve on each client, the category and zone files, and the code that decides the state.

## Proposed outcome
One read-only command, `.claude/tools/Show-Achievement.ps1 <ids>`, prints for each id and client what the data says and what the addon makes of it: the source line and patch key, the snapshot line, the state a player sees today (or on a given date and build), the categories, zones and the other stores that name the id. `-Db` adds the game's name, description and builds, `-History` the commits that changed the data line. Krowi expects data work to recur, so this saves calls in every such session.

## Affected users and systems
- Claude Code sessions and the `data-verifier` agent; the `verify-achievement-data` skill points to it.
- `.claude/tools/` (new script, a new headless Lua file, `snapshot-data.lua` refactored to share its formatter) and its README.
- No addon code, no player-facing change, nothing deployed.

## Constraints
- Offline and self-contained: the kit's Lua 5.1.5 and PowerShell, no installs. `-Db` only through the designated lookup script, never an inline query; builds never typed.
- The snapshots under `.claude/tools/headless/snapshots/` stay byte-identical, and the snapshot and the tool share one formatter.
- Under a second without `-Db`.

## Open questions
None: the roadmap's step 7 sets the design. Krowi, 2026-11-02: "implement step 7, data work will be a recurring thing in the future".