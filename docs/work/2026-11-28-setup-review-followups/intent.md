# Intent: The setup review's deferred items
Author: Krowi (maintainer). Source: idea; the items [2026-11-27-setup-review](../2026-11-27-setup-review/spec.md) left out, which Krowi took up on 2026-11-28: "trim the taint section in claude or put it in a separate reference, split the skills, we keep user level settings and kit wowaddons.md on backlog. You organize, I get a single report once all these are done". Status: accepted

## Problem
1. `CLAUDE.md`'s Taint section loads in every session, Q&A, data and harness work included, though only GUI, hook and event code needs it. The 2026-11-27 spec kept it because the public repo's contributors have no kit, so this section is their only taint guidance.
2. `add-achievement-data`'s `SKILL.md` is 30 KB (535 lines) and loads whole whenever the skill runs or a session reads it, also the parts only some runs need (pet, mount and decor preview ids, the edge-case examples, finding a patch's new ids). `add-zone-data` is 28 KB in 193 lines, most of it rules every run applies.
3. The review's findings outside this repo (the user-level settings, the kit's 34 KB `WowAddons.md` and its hook matcher) are written down only in that session's transcript.

## Proposed outcome
The taint guidance loads when a session works on the code it applies to, and a contributor without the kit still finds all of it in the repo. A data run loads the steps it follows and reads the rest only when a step points to it, with no rule lost. The out-of-repo findings are on the backlog.

## Affected users and systems
Claude Code sessions and subagents in this repo; contributors who read `CLAUDE.md`. Players: none (nothing that ships changes).

## Constraints
- No rule is lost or weakened: every line of the old texts survives in the new files.
- The data skills are "never improvised", so each moved block keeps a pointer at the step that needs it.
- The scripts stay where they are: the allow rules name their paths.

## Open questions
Where the taint text goes; how much of each skill moves.