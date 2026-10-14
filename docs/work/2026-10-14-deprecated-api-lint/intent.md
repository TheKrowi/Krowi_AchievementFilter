# Intent: The repo lint catches deprecated Blizzard globals
Author: Krowi (maintainer). Source: `docs/codebase-analysis.md` row 32, deferred from the code review of 2026-10-14-chat-insert-link; Krowi asked for it on 2026-10-14. Status: done

## Problem
Blizzard keeps old global names alive for a while as aliases in its `Blizzard_Deprecated*` addons. Those load only while the `loadDeprecationFallbacks` CVar is on, and a later patch deletes them; 12.1.5 deleted ten. A read of such a name works on the maintainer's client and errors for players who turned the CVar off, and for everyone once the file is gone.
- `Check-Repo.ps1` has a `removed-api` rule, but it covers only globals the Retail client has already lost, from a hand-kept list.
- `ChatEdit_InsertLink` therefore sat in `AchievementButtonMixin.lua` until a manual scan with Krowi_ClaudeKit's `Find-DeprecatedApi.ps1` found it (#343).
- That tool lives in the private kit, so contributors and the Stop hook never run it.

## Proposed outcome
The lint fails on any addon file that reads a Blizzard global which, on a client the `.toc` lists, exists only as a deprecated alias or not at all, and names the replacement. It runs offline like every other rule, also for contributors without the kit or the Blizzard UI source.

## Affected users and systems
- Contributors and agents: `Check-Repo.ps1`, the Stop hook, `.claude/tools/README.md`.
- No change for players and no addon code change: today's tree has no such read (the kit scan reports none for live, classic and classic_titan after #343).

## Constraints
- Self-contained: no dependency on Krowi_ClaudeKit at lint time, no installs, and the vendored Lua only.
- `Libs/` is skipped, as for `removed-api`: fixes to a library go upstream.
- Fast enough for the Stop hook.

## Open questions
None.