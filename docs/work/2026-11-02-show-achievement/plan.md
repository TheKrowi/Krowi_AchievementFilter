# Plan: Show-Achievement.ps1 answers questions about one achievement
Spec: [spec.md](spec.md). Status: done

Routine (tooling under `.claude/`, no addon code), so the agent proceeds without a plan gate.

## Files that change
- `.claude/tools/headless/data-format.lua` (new): the rendering helpers and per-achievement renderers out of `snapshot-data.lua`.
- `.claude/tools/headless/snapshot-data.lua`: uses `data-format.lua`; output unchanged.
- `.claude/tools/headless/show-achievement.lua` (new): the per-id, per-client report.
- `.claude/tools/Show-Achievement.ps1` (new): parameters, `-AsOf` and `-Build`, `-Db`, `-History`.
- `.claude/tools/README.md`: the tool rows and a short section.
- `.claude/skills/verify-achievement-data/SKILL.md`, `.claude/agents/data-verifier.md`: point to the script.
- `.github/copilot-instructions.md`: one line in the Offline tooling block (spec, Open point 6).
- `docs/harness-roadmap.md`: step 7 to Done (with the PR), its open row and section removed.
- Not changed: `.claude/settings.json` (`permissions`); the allow rules go in the PR for Krowi to add through `/permissions`.

## Order of work
1. `intent.md`, `spec.md`, `plan.md`; commit.
2. Move the formatter into `data-format.lua`; `snapshot-data.lua -write` must leave `git status` clean.
3. `show-achievement.lua`, then `Show-Achievement.ps1`; syntax check, CRLF check on every new file (`.ps1` and `.md` included).
4. The checks under Proof; commit the tool.
5. README, skill, agent, roadmap; commit.
6. `/code-review` passes from `REVIEW.md` (no taint review: tooling only); fix or list findings.
7. Work files to `done`, push, PR against `main`. No merge.

## Risks
- **The snapshot drifts during the move:** the move is verbatim, and `-write` plus `git status` proves it.
- **The sandbox calls into code that is not loaded** (`addon.EventData`, the season API): the stubs stop the real code and name what it asked for instead of erroring.
- **A slow run:** two clients' loads at about 0.25 s each; measured, and `-Client` halves it.
- **Encoding:** a data line can hold UTF-8 (names in comments); the script reads the Lua output as UTF-8, as `Read-GameTests.ps1` does.

Where the build departed from this plan:
- `Show-Achievement.ps1` is a plain script, without `[CmdletBinding()]` or `[Parameter()]`: in an advanced script the roadmap's `-Db` collides with `-Debug`, whose alias is `db`.
- `-Ids` takes strings and splits them on commas, because `pwsh -File` (the `data-verifier` agent's form) hands `5313,8246` over as one argument.
- From the code review: the category path renderer moved into `data-format.lua` too, and `snapshot-categories.lua` takes its path segments from it (its baselines unchanged); `-History` also follows an `AutoFactionSplit` mirror to its partner's line.

## Proof
- `& ".claude\tools\Show-Achievement.ps1" 5313,8246,4627` against the snapshot lines (`Select-String` on the three snapshot files for each printed line).
- `-Client Classic -Build 5.4.8` for 5313 gives Current; `-AsOf 2025-02-10` for 4627 still names event 423.
- `Measure-Command` without `-Db`: under 1 s.
- `-Db` and `-History` for the three ids.
- `Check-Repo.ps1 -ChangedOnly`: green.