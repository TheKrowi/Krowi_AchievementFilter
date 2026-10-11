# Harness roadmap

The harness is the self-contained toolchain under `.claude/`: the lint, the hooks, the headless pipeline and snapshots, the scenario suites, the game readers, the lookup scripts, the subagents and the skills. `.claude/tools/README.md` documents what exists. This file holds what is planned, what is done and what was decided against. A step keeps its number once it has one, because `docs/sdlc-playbook.md` refers to steps by number.

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

## Open, in priority order

Measured on 2026-10-10 from the Claude Code transcripts of this repo: 49 sessions plus their subagents, about 5,500 tool calls (see How the evidence was gathered).

| Step | Tool | What it saves | Size |
|---|---|---|---|
| 6 | Line endings fixed after Write | 132 hand fixes in 24 sessions | small |
| 7 | `Show-Achievement.ps1` | the most common question: 10 sessions, 232 calls | medium |
| 8 | `Get-RepoState.ps1` | 2 to 21 calls at the start of 10 sessions | small |
| 9 | `Apply-Edits.ps1` | 66 hand-written replace helpers | small |
| 10 | `Find-Symbol.ps1 -Outline` | 54 outline greps | small |
| 11 | A check for a map in two `Zone()` blocks | a zone rule nothing enforces, broken twice | small |
| 12 | Narrow the guard hook's inline-query check | a read-only grep whose pattern names the server is denied | small |
| 13 | Raid-size lists: a check, and a list-aware zone plan | 51 placements sat in the wrong list for a month, unflagged | small |

### Step 6: fix line endings after Write

**Problem.** The Write tool writes LF line endings and the repo is CRLF (`.editorconfig`). The Edit tool keeps a file's endings, so only Write is affected (both checked on 2026-10-10). Sessions then fix the file by hand, or route edits through PowerShell to avoid the problem: 132 such commands in 24 of 49 sessions. 23 of the 72 files written into the repo were followed by a hand fix within a few calls.

**Design.** A PostToolUse step after Edit and Write, in the same PowerShell process as the Lua syntax check, so it costs no extra start (about 0.3 s each). `Check-LuaSyntax.ps1` becomes `After-Edit.ps1`, which normalises first and checks syntax second. Normalising means lone LF to CRLF, no BOM and no final newline; the file is rewritten only when one of those changed. It touches only text files inside the repo, never `Libs/`, and skips what `Check-Repo.ignore` exempts from `line-endings` (the locale files and the `.toc`, which CurseForge and the addon manager write with LF).

The `bom` and `line-endings` lint rules read only `.lua`, `.xml` and `.toc` files, so LF in a `.md` or `.ps1` goes unnoticed (on 2026-10-11 `.claude/skills/add-zone-data/_zonedata_parser.ps1` was found all LF). Extend both rules to the Markdown and PowerShell files outside `Libs/` in the same step; pre-existing findings stay warnings, as for the other rules.

**Done when.** A file created with Write lands as CRLF without a BOM or final newline. An Edit right after it works without a re-read (checked by hand on 2026-10-10 with an outside rewrite). The `line-endings` rule stays clean, and the instruction file and `CLAUDE.md` name the hook.

### Step 7: `Show-Achievement.ps1`

**Problem.** Questions about one achievement are the most common request: a wrong obtainable range (5313), whether something became a Feat of Strength (Skyreach), why an id moved to Shared (8246), dates for a short window (Goal!). Those 10 sessions took 232 calls and 533 KB of tool output. They read `TemporaryObtainable.lua`, the build-version files and `Objects/Achievement.lua` 31 times and made 19 web lookups; the 5313 session alone took 100 calls. The facts are all in the repo, but spread over the data line, its patch key, the anchor resolution per client, the category and zone files and the code that decides the state.

**Design.** `.claude/tools/Show-Achievement.ps1 <ids> [-Client Retail|Classic] [-AsOf <date>] [-Build <version>] [-Db] [-History]` over a new `headless/show-achievement.lua` built on `client-env.lua`. For each id and client it prints:

- the source file and line with the data line itself, and the patch key;
- the faction and the other faction's id, the reward types and the flags;
- each `Obtainable()` record as written, where its anchors land on that client, and the state the player sees. The state comes from the real `GetObtainableState`, with `time()` set to `-AsOf` (default today) and `GetBuildInfo()` to the newest patch the `.toc` declares for that client (`-Build` overrides it). A record bound to an event depends on the in-game calendar, so for those it names the event instead of a state;
- the category paths, zone placements, and the tooltip, transmog set, pet battle link and event entries.

`-Db` adds the name, the description and whether the id exists on each build, through `add-zone-data/_lookup_ids.ps1`. `-History` lists the commits that changed the `Ach(<id>)` line (`git log -S`). The per-achievement line comes from the formatter `snapshot-data.lua` already uses, so the two cannot drift apart.

**Done when.** For 5313, 8246 and 4627 on both clients, the output agrees with the snapshots and with what the game shows. A run without `-Db` takes under a second. The script is allowlisted and listed in `.claude/tools/README.md`, and the `verify-achievement-data` skill and the `data-verifier` agent point to it.

### Step 8: `Get-RepoState.ps1`

**Problem.** 10 sessions opened with "what's the state of the repo" or "what's next". Each one rebuilt the picture from `git status`, `git log`, ahead/behind counts, `gh pr list`, `gh issue list`, the work folders, the tags, the top of the changelog and a lint run: 2 to 21 calls and up to 83 KB of output before the first answer.

**Design.** One read-only script that prints:

- the branch, and the commits ahead of or behind `origin/dev`;
- uncommitted files, grouped as code, data, harness and docs;
- open PRs and the newest open issues;
- the last release tag and the changelog section not yet released;
- work folders whose status is not done;
- worktrees, and local branches already merged into `dev`;
- how far each client's AddOns folder is behind the repo (`Deploy.ps1 -WhatIf`).

`-Lint` adds the summary line of `Check-Repo.ps1 -ChangedOnly`.

**Done when.** One call answers the state question, in under 5 s without `-Lint`, and the script is allowlisted.

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

## Parked

- **Step 3, a `temporary-toggle` lint rule** for `-- Temporarily` comments and commented-out `addon.X()` calls. Only two such lines are left in addon code, and one is deliberate (`addon.TooltipData.Load()` stays disabled), so the rule would have nothing to catch today.
- **Step 4, CI** (GitHub Actions running `Check-Repo.ps1` on pull requests to `dev`). It would help review, not an agent's speed; the Stop hook already runs the lint every turn, and the instruction file says the repo has no CI. This is the maintainer's call.

## Decided against

- **A table of patch release dates.** 54 of the 76 warcraft.wiki.gg fetches came from one research session (2026-09-26), and the need has not come back.
- **A code-search wrapper.** Most of the 757 shell greps are ordinary code reading. The symbol lookups among them are what `Find-Symbol.ps1` answers, and it has not been used in a session yet; count again after it has.
- **Driving the game client.** Automating input breaks Blizzard's terms. The error, test and screenshot readers already keep the in-game step to one `/reload`.

## How the evidence was gathered

Claude Code keeps each session as a JSONL transcript under `~/.claude/projects/<repo path>/`, with the subagents' transcripts in a subfolder per session. A throwaway PowerShell script read every tool call and its result (tool, input, error flag, output size) into a table. The calls were then grouped by tool, by command pattern and by session topic. Read the failure counts with care: about 11% of PowerShell calls "fail", but nearly all of those are checks exiting 1 on purpose. To see whether a step paid off, count the same pattern again after a few sessions with the tool.