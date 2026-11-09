# Intent: one lean instruction file
Author: Krowi, maintainer. Source: idea (harness roadmap step 16; the 2026-11-09 cost review). Status: done

## Problem
Every Claude call in this repo re-reads about 12k tokens of instructions: `.github/copilot-instructions.md` (41 KB, loaded whole through the `@` import in `CLAUDE.md`) and `CLAUDE.md` (6 KB). The file dates from before the move to Claude Code. Much of it repeats the workspace `CLAUDE.md` (the kit's `WowAddons.md`), the data skills, `docs/architecture.md` and `.claude/tools/README.md`, or says what the `.toc` and the code already show. It also grows by design: stage 6 of the playbook writes every work item's lesson back into it. A long file costs tokens on every call, the subagents' included, and a rule lost in it is followed less.

## Proposed outcome
One `CLAUDE.md` that holds only what Claude needs on every task and cannot read from the repo; what one area of the code needs loads only when that area is touched; the rest is in the documents a session opens on demand. No rule, decision or nuance of today's two files is lost: each one has a named new home.

## Affected users and systems
Claude sessions and subagents in this repo only. `CLAUDE.md`, `.github/copilot-instructions.md` (deleted), new `.claude/rules/`, `docs/architecture.md`, and the files that point to the old file (the repo lint's messages, the Stop hook, READMEs, docs). Nothing the game loads.

## Constraints
- Contributors and other assistants are ignored (Krowi, 2026-11-09): only Claude reads the instructions.
- Krowi's dated decisions keep their dates and wording where they move.
- The lint rules and hooks keep working; only their message text changes.
- Work folders keep their references to the old file as history.

## Open questions
- Do path rules load when a matching file is read, or only when edited, and do subagents get them? (Design checks the Claude Code docs.)
- Which rules are needed on every task, and which only in one area?