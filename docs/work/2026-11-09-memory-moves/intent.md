# Intent: move what session memory alone holds into the repo's docs
Author: Krowi, maintainer. Source: idea (2026-11-09 cost review, step 17: prune the memory index). Status: done

## Problem
Claude's session memory for this repo grew to 48 files and a 12 KB index loaded into every session. Most of it is finished work the work folders already record, but a few entries hold the only copy of a lesson or an open item.

## Proposed outcome
Those few lessons and items live in the repo document a session reads when it needs them, so the memory entries can go.

## Affected users and systems
Contributors and sessions only: two data skills' reference files, `Tests/README.md`, `docs/backlog.md`, `docs/harness-roadmap.md`. Nothing the game loads.

## Constraints
No rule changes: the moved text records what was already done or decided.

## Open questions
None.