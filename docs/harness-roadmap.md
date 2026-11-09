# Harness roadmap

The harness is the toolchain this repo's Claude Code sessions use. Since 2026-10-16 the part every Krowi repo shares lives in Krowi_ClaudeKit (the hooks, Lua 5.1.5, `Deploy`, the game readers, the worktree tools, `Find-Symbol`, `Strip-Semicolons`, `Get-WowBuilds`, the release and work-item skills, the taint reviewer), and the rest under `.claude/`: the lint, the headless pipeline and snapshots, the scenario suites, the lookup scripts, `data-verifier` and the data skills. `.claude/tools/README.md` and the kit's `README.md` document what exists. This file holds what is planned, what is done and what was decided against. A step keeps its number once it has one, because `docs/sdlc-playbook.md` refers to steps by number.

## Done

| Step | What | Commit |
|---|---|---|
| | Vendored Lua 5.1.5, the repo lint as a Stop hook, the post-edit syntax hook, the headless data load, `Deploy.ps1`, `Read-GameErrors.ps1` | 315d2628, 4b85c68b (2026-09-04) |
| 1 | Scenario suites in `Tests/`, run headlessly by `run-tests.lua` and in game by `/kaftest` | 1cf44c5e (2026-09-19) |
| 2 | Category tree snapshot and the `category-snapshot` rule | c44e6e91 (2026-09-20) |
| | Local Blizzard UI source, screenshot reader, read-only allowlist, shorter instruction file | 16479928 (2026-10-09) |
| 2b | Achievement, zone and registry snapshots and the `data-snapshot` rule | dd81ef2d (2026-10-10) |
| 5 | PreToolUse guard `Guard-ToolUse.ps1` | dd81ef2d |
| | `Get-WowBuilds.ps1` and the `pinned-build` rule, parameters on the lookup scripts, `Find-Symbol.ps1` | dd81ef2d |
| | `Evaluate-ZoneCriteria.ps1` reports a missed zone as `[R2]` instead of hiding it as an undecided sub-map | 50fae1ee (2026-10-11) |
| | Parallel sessions: `New-Worktree.ps1` and `Remove-Worktree.ps1`, `worktree.baseRef` set to `head`, fsdeploy deploys the window's own folder, the Stop hook lints the session's own checkout | 2026-10-11 |
| | The shared tooling moves to Krowi_ClaudeKit; this repo enables its `krowi` plugin and keeps only its own (`docs/work/2026-10-16-single-tooling-home/`) | 2026-10-17 |
| 7 | `Show-Achievement.ps1`: one call per achievement question, per client, over `headless/show-achievement.lua`; the snapshot's per-achievement lines shared through `headless/data-format.lua` (`docs/work/2026-11-02-show-achievement/`); the in-game comparison passed on 2026-11-03 | PR #387 (2026-11-02) |
| 6 | The kit's post-edit hook `After-Edit.ps1` (was `Check-LuaSyntax.ps1`, which stays as a forwarder for sessions started before the rename): after a Write it sets the line endings, BOM and final newline from `.editorconfig`, then checks Lua syntax. Here `.editorconfig` sets everything, so a Write to a locale file or the `.toc` leaves CRLF there, which git stores unchanged; since kit PR #7 a repo without one gets the line endings git checks out and the final newline the file has in git. The `bom` and `line-endings` rules now also read the `.md` and `.ps1` files outside `Libs/` | kit PR #5 (2026-11-03) |
| 8 | `Get-RepoState.ps1` lives in the kit and serves every Krowi repo: git state, PRs and issues, the release and its readiness (`Check-ReleaseReady.ps1 -ReportOnly`), work folders, worktrees, how far each client's AddOns folder is behind; this repo's `.claude/repo-state.ps1` adds the lint with `-Lint`. About 4 to 6 s, most of it the release check (11 s with `-Lint`) | kit PR #6 (2026-11-03) |
| 14 | `Measure-Sessions.ps1` in the kit: the context use of a repo's sessions from their transcripts, per session and in total (start and peak context, cache reads by context band, weighted use, subagents by type and model, skills and commands); `-Last 15` is what steps 15 to 18 are judged on. It reproduces the 2026-11-02 baseline (How the evidence was gathered) in about 10 s | kit PR #8 (2026-11-03) |

## Open, in priority order

Measured on 2026-10-10 from the Claude Code transcripts of this repo: 49 sessions plus their subagents, about 5,500 tool calls (see How the evidence was gathered).

| Step | Tool | What it saves | Size |
|---|---|---|---|
| 9 | `Apply-Edits.ps1` | 66 hand-written replace helpers | small |
| 10 | `Find-Symbol.ps1 -Outline` | 54 outline greps | small |
| 11 | A check for a map in two `Zone()` blocks | a zone rule nothing enforces, broken twice | small |
| 12 | Narrow the guard hook's inline-query check | a read-only grep whose pattern names the server is denied | small |
| 13 | Raid-size lists: a check, and a list-aware zone plan | 51 placements sat in the wrong list for a month, unflagged | small |

Steps 10 and 12 change files that now live in Krowi_ClaudeKit (`tools/Find-Symbol.ps1`, `hooks/Guard-ToolUse.ps1`). They are built there, in a kit worktree, and serve every Krowi repo; this repo only picks them up.

Steps 15 to 18 come from a second measurement, on 2026-11-02 (now the kit's `Measure-Sessions.ps1`, step 14), of what the sessions spend on context rather than on tool calls: the 39 sessions since the kit move on 2026-10-17 and their 95 subagents (see How the evidence was gathered). They are in priority order among themselves, and follow Anthropic's current guidance for Claude Code (the best-practices, memory, skills and cost pages of the Claude Code docs, and the engineering posts on context engineering and long-running harnesses).

| Step | What | What it saves | Size |
|---|---|---|---|
| 15 | Session boundaries and compact instructions | 58% of the main sessions' cache reads happen above 400k tokens of context | small |
| 16 | One lean instruction file: `CLAUDE.md` replaces `.github/copilot-instructions.md` | the 75k start context is re-read on every call (22% of cache reads); 11k of it is these two files | medium |
| 17 | Prune the auto memory | 8 KB loaded into every session, mostly finished work | small |
| 18 | Subagent start cost | subagents are a fifth of all use; a general-purpose one starts at 65k | small |

Parts of 15 and 18 change the kit. The kit also has its own share of the start context: the workspace `CLAUDE.md` (`WowAddons.md`, 22 KB) loads into every session under the workspace and gets step 16's treatment there, and `process-issue` gets step 15's session boundaries. The work plugins that come with the maintainer's Claude account load in these sessions too, and four of their servers time out after 30 s at every start; whether they can be switched off for this workspace is checked in `/plugin`, the maintainer's click, and any setting for them goes in the uncommitted `.claude/settings.local.json`, since the repo is public.

### Step 9: `Apply-Edits.ps1`

**Problem.** Changing the same text in several files with the Edit tool needs a Read of every file first. So sessions wrote their own PowerShell replace helpers inline (`function R`, `Repl`, `Rep`): 66 of them, several of which failed on PowerShell quoting and had to be rerun.

**Design.** It takes a JSON file of edits (`path`, `old`, `new`, optional `count`) and checks every match and count before writing anything. It writes each file with its own line endings and without a BOM, and prints one line per file. It refuses `Libs/` unless `-AllowLibs` is given. This step matters less once step 6 is in, because working around line endings was part of why those helpers existed.

**Done when.** Replaying a past multi-file change gives a byte-identical `git diff`, and a missing match leaves every file untouched.

### Step 10: `Find-Symbol.ps1 -Outline <file>`

**Problem.** 54 calls only listed the functions of one file (`grep -n "^function"`). That shows `function search:Foo`, but not which namespace `search` is.

**Design.** `-Outline <file>` prints each definition in the file with its line and its resolved name (`addon.Gui.Search.Foo`), reusing the alias resolution `find-symbol.lua` already has.

**Done when.** On three files it lists the same definitions as the grep, each with its resolved name.

### Step 11: one `Zone()` block per link group

**Problem.** Zone rule 8 in `.claude/skills/add-zone-data/SKILL.md` allows one `Zone()` block per link group in the whole tree. Until 2026-10-11 the skill said the lint treated a second block as an error, but no check exists: `raw/Evaluate-ZoneData.ps1` only checks link groups inside one entry. The data breaks the rule twice. Upper Blackrock Spire is in both `DataAddons/Shared/01_Vanilla/ZoneData.lua` and `DataAddons/Retail/06_WarlordsOfDaenor/ZoneData.lua`, and Visions is in both `08_BattleForAzeroth` and `11_TheWarWithin`.

**Design.** A new check in `Evaluate-ZoneData.ps1` (and so in the `zone-decisions` lint rule's offline run), reading the link groups from `raw/MapVerifier.csv`: a map, or any map of its link group, that heads a `Zone()` block in more than one place per client is an error. The two existing cases are fixed in the data first, or listed in `Check-Repo.ignore` with a comment until they are.

**Done when.** Adding a second block for a linked map fails the lint, and the skill says so again.

### Step 12: the guard hook denies a grep for the server address

**Problem.** `Guard-ToolUse.ps1` denies any Bash or PowerShell command whose text has the game-database address next to `Invoke-WebRequest` or `curl`, including a read-only `grep` that only searches for those words (hit on 2026-10-11 while checking the skills for leftover inline queries). The workaround is a character class in the pattern (`localhost:500[0]`).

**Design.** Deny only when the command actually calls the server: the address as an argument of `Invoke-WebRequest`, `Invoke-RestMethod`, `iwr`, `irm`, `curl` or `wget`, not inside the search pattern of `grep`, `rg`, `Select-String` or `git grep`.

**Done when.** `grep -n "localhost:5000" .claude/skills` runs, and an inline `Invoke-WebRequest` to the server is still denied.

### Step 13: raid-size lists

**Problem.** A Wrath raid's `Zone()` block has a general, a 10-player and a 25-player list, and the last two show only at their raid size. `_apply_zone_plan.ps1` inserts every line before the block's closing `})`, so the 2026-09-06 sweep put three 10-player Glory metas and three difficulty-neutral metas into 25-player lists: 51 placements, shown at the wrong raid size for a month, until fixed by hand in bd4fe838. No check looked at which list an id is in; the zone snapshot recorded the wrong lists as its baseline.

**Design.** Two parts. A check in `Evaluate-ZoneData.ps1`: an id whose title ends in "(10 player)" or "(25 player)" must sit in that list. Titles without a size (The Undying, Conqueror of Ulduar, The Light of Dawn) cannot be checked this way, so for those `_apply_zone_plan.ps1` learns a list column (`general`, `10`, `25`) and refuses a plan line for a raid block without one.

**Done when.** Moving 2137 back into a 25-player list fails the check, and a plan line for a raid block without a list column is refused.

### Step 15: session boundaries and compact instructions

**Problem.** A session runs until its work item is done, gates, reviews and clean-up included, so its context keeps growing: 58% of the main sessions' cache reads came from calls above 400k tokens, and only 6 of 39 sessions compacted at all. Every call re-reads the whole conversation. Anthropic's guidance is that answers get worse as context grows (context rot), that a compaction made late is made when the model is least able to judge what to keep, and that a build goes best from a written spec in a fresh session.

**Design.**
- `docs/sdlc-playbook.md` names where a session ends: after the plan gate, the build starts in a fresh session that reads the work folder (`intent.md`, `spec.md`, `plan.md`); and between unrelated tasks. At such a point Claude says so; `/rename` and `/clear` are the maintainer's clicks. The kit's `process-issue` skill gets the same boundaries.
- A `# Compact instructions` section in `CLAUDE.md` names what a compaction keeps: the work folder and its stage, the branch and worktree, the gate answers, the open review findings, and which build is deployed to which client.
- Not in this step: a smaller `autoCompactWindow` (the maintainer, 2026-11-02: not for now). It comes back if the numbers below do not move.

**Done when.** Over the next 15 sessions the share of cache reads above 400k drops from 58% to under 25% (`Measure-Sessions.ps1 -Last 15`), and no work item loses a decision across a boundary, checked against its work folder.

### Step 16: one lean instruction file

**Problem.** Every call re-reads the start context, a median of 75k tokens and 22% of the main sessions' cache reads, and it grew by about 9k in 16 days. This repo puts about 11k tokens of it there: `.github/copilot-instructions.md` (39 KB, 368 lines, loaded whole through the `@` import in `CLAUDE.md`; an import does not lower the cost) and `CLAUDE.md` (5 KB). Anthropic's guidance: under 200 lines per file, holding only what Claude cannot find by reading the repo; rules for one area in `.claude/rules/` with `paths:`; procedures in skills; and a line lost in a long file is followed less, on every task. Much of the file fails that test: the layout, load order and directory tables (the `.toc` and the `Files.xml` files say it), the module and OOP samples (the code shows them), the data formats (the data skills hold them), and what the workspace `CLAUDE.md` already says (Lua 5.1, the sed trap, worktrees, Conventional Commits, the changelog style, `AUTOGENTOKEN`). Only Claude reads the file (the maintainer, 2026-11-02), so the Copilot name and the copies for readers without the kit can go. The file also grows by design: stage 6 of the playbook writes each work item's lesson back into it.

**Design.**
1. `/doctor prompt-audit` first, the maintainer's click: stale paths, contradictions, wording written for older models.
2. `CLAUDE.md` becomes the one instruction file, at most about 150 lines and 15 KB: the commands that check work; the rules Claude cannot see in the code (taint, background jobs, saved variables, `Files.xml` registration, the boot phases, `IsModern` against `IsMainline`, the maintainer's gates); the gotchas; and pointers. The Claude Code wiring shrinks to what Claude acts on, since a hook explains itself when it fires. It holds step 15's compact instructions.
3. What one area needs moves to `.claude/rules/` with `paths:`: `DataAddons/**` and the data API (the V2 formats, the data pipeline, `Obtainable()` anchors), `Localization/**` (the locale rules), `Gui/**` and `Plugins/**` (the taint detail), the event data (the event-source policy), `Tests/**` (`Recorded` and `Target`).
4. The layout, load order and file map go to `docs/architecture.md`, which already holds the file map.
5. `.github/copilot-instructions.md` is deleted and every reference to it points to `CLAUDE.md`: `Check-Repo.ps1` (3 messages), `Check-RepoOnStop.ps1`, `Check-Repo.jobs`, `.claude/tools/README.md`, `CONTRIBUTING.md`, `REVIEW.md`, `Tests/README.md`, `docs/sdlc-playbook.md`, `docs/architecture.md`, `docs/codebase-analysis.md`, `docs/data-design-review.md`, `docs/how-to/add-event.md` and `docs/how-to/migrate-category-data.md`. The work folders keep theirs as history.
6. Stage 6 of `docs/sdlc-playbook.md`: a lesson goes to a path rule, a skill, a lint rule or a scenario; `CLAUDE.md` takes only what applies to every task.
7. An `instruction-size` lint rule warns when `CLAUDE.md` or a rule file passes its byte budget.

**Done when.** `CLAUDE.md` is under 15 KB, from 44 KB with its import; a fresh session's start context falls by about the same (`Measure-Sessions.ps1`); the lint is green; and in a GUI fix through `process-issue` and a data addition, the path rules load when their files are touched (`/context`, or an `InstructionsLoaded` hook while testing).

### Step 17: prune the auto memory

**Problem.** `MEMORY.md` in this repo's auto memory (`~/.claude/projects/<repo>/memory/`, outside the repo) loads into every session: 43 lines, 8 KB, each line a paragraph. Most entries record finished work (merged, worktree removed) whose facts are in git, the work folders and the changelog.

**Design.** Keep what is open or written down nowhere else, one short line per entry. Delete the memory files of finished work once their lesson is confirmed to be in a doc, a skill or the kit.

**Done when.** `MEMORY.md` is under 3 KB, and no deleted entry held a fact that is nowhere else.

### Step 18: subagent start cost

**Problem.** Subagents were a fifth of all use. Every subagent but Explore and Plan loads the whole `CLAUDE.md` hierarchy, so the 40 general-purpose agents started at a median of 65k tokens against Explore's 21k, and with a five-minute cache each one pays its start context as a cache write.

**Design.** Read the prompts of the 40 general-purpose spawns. If most were read-only searches, which Explore does at a third of the start context, one line in `CLAUDE.md` says so; otherwise nothing changes. `data-verifier` gets `model: sonnet`, and `omitClaudeMd: true` once its prompt is checked to name everything it needs. `krowi:taint-reviewer` (37 runs) stays on Opus; whether it can start without the hierarchy and read only the rules it needs is a kit change.

**Done when.** The general-purpose agents' count or start context falls over the next 15 sessions, or their prompts show they were not searches and the step closes with that finding.

## Parked

- **Step 3, a `temporary-toggle` lint rule** for `-- Temporarily` comments and commented-out `addon.X()` calls. Only two such lines are left in addon code, and one is deliberate (`addon.TooltipData.Load()` stays disabled), so the rule would have nothing to catch today.
- **Step 4, CI** (GitHub Actions running `Check-Repo.ps1` on pull requests to `main`). It would help review, not an agent's speed; the Stop hook already runs the lint every turn, and the instruction file says the repo has no CI. This is the maintainer's call.
- **Step 19, split the data skills** into a `SKILL.md` with the workflow and reference files it links. `add-achievement-data` (533 lines, 30 KB; Anthropic's guideline is under 500 lines) and `add-zone-data` (27 KB) stay in context once invoked and are attached again after a compaction. Neither was invoked in the 39 sessions measured on 2026-11-02, so the split waits for the next data session that uses them.

## Decided against

- **A table of patch release dates.** 54 of the 76 warcraft.wiki.gg fetches came from one research session (2026-09-26), and the need has not come back.
- **A code-search wrapper.** Most of the 757 shell greps are ordinary code reading. The symbol lookups among them are what `Find-Symbol.ps1` answers, and it has not been used in a session yet; count again after it has.
- **Driving the game client.** Automating input breaks Blizzard's terms. The error, test and screenshot readers already keep the in-game step to one `/reload`.

## How the evidence was gathered

Claude Code keeps each session as a JSONL transcript under `~/.claude/projects/<repo path>/`, with the subagents' transcripts in a subfolder per session. A throwaway PowerShell script read every tool call and its result (tool, input, error flag, output size) into a table. The calls were then grouped by tool, by command pattern and by session topic. Read the failure counts with care: about 11% of PowerShell calls "fail", but nearly all of those are checks exiting 1 on purpose. To see whether a step paid off, count the same pattern again after a few sessions with the tool.

The context measurement of 2026-11-02 read the same transcripts for token use instead: the `usage` of each assistant message, once per `message.id`, for the main sessions started since 2026-10-17 in this repo's folder and its worktrees' folders, and for their subagents. The weights are the price ratios Anthropic gives for Claude Code (cache reads 0.1 of the input price, cache writes up to 2, output about 5). On those weights the cache reads dominate, and they grow with the length of the conversation, which is why step 15 comes before step 16.

That measurement is now the kit's `Measure-Sessions.ps1` (step 14). The baseline steps 15 to 18 are judged against is its run with `-Since 2026-10-17 -Until '2026-11-02 22:25'`, the time the throwaway script ran: 39 main sessions, 6,292 calls, 95 subagents.

| Measure | Value |
|---|---|
| Start context | 67k tokens on 2026-10-17, 78k on 2026-11-02 (median 74k) |
| Peak context | median 320k; four sessions between 810k and 966k |
| Compactions | in 6 of 39 sessions |
| Main cache reads by context band | under 250k: 20%; 250k to 400k: 23%; 400k to 600k: 26%; above 600k: 32% |
| The start context re-read on every call | 22% of the main sessions' cache reads |
| Weighted use (input price = 1: cache read 0.1, cache write 2 for the one-hour cache and 1.25 for the five-minute one, output 5) | main sessions 318M, of which cache reads 67%; subagents 84M, 21% of all |
| Subagent start context (median) | general-purpose 64k (40 runs), `krowi:taint-reviewer` 39k (37), Explore 21k (13), `data-verifier` 36k (1) |

The throwaway script's figures were within 1k or a point of these: a start median of 75k and a general-purpose start of 65k (the script is gone, so why is not known), and subagents at 82M, 20% of all, because it weighed every subagent cache write as a five-minute one while some are one-hour.

Since kit PR #26 (2026-11-09) the tool prints dollars at each model's API list price (`tools/ModelPrices.psd1`) instead of weighted use, plus thinking, cold resumes and an all-repo view (`-All`). The weighted row above stays as the 2026-11-02 record; the steps are judged on the context lines, which did not change.