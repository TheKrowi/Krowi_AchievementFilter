# Spec: move what session memory alone holds into the repo's docs
Intent: [intent.md](intent.md). Status: done

## Requirements
1. The hotfix-cache method for an achievement in no build (`DBCache.bin`, entry layout, Achievement's table hash) is in `.claude/skills/verify-achievement-data/API.md`.
2. The lookup pitfalls of the zone sweep (no `awk` on the DBC export, `return ,$x`, `(?s).*`, hashtable key types) are in `.claude/skills/add-zone-data/SKILL.md`.
3. The steps to remake one help picture and the maintainer's fixed scenes are in `Tests/README.md`.
4. The open items (agent-made 12.1.5 translations, placeholder words in translations, the unused "Alert System Overwrite Desc", Krowi_Reminders' old alert pattern) are in `docs/backlog.md`.
5. `docs/harness-roadmap.md` says that `Measure-Sessions.ps1` prints dollars since kit PR #26.

## Design
Text only, each in the document of the task that needs it. Lessons already in code (Krowi_Options re-anchors `NewFeatureLabelTemplate`) or in the kit move nowhere here.

## Areas of concern
Taint, clients, Blizzard API, other addons, saved variables, localization, libraries, data snapshots, player-facing text: none, no file the game loads changes.

## Verification
`Check-Repo.ps1 -ChangedOnly` clean; each requirement's text read against the memory entry it came from.

## Decision
Krowi, 2026-11-09: "apply the prune", on the proposal that named these moves.