# Plan: The repo lint catches deprecated Blizzard globals
Spec: [spec.md](spec.md). Status: done

Approved by Krowi on 2026-10-14, together with the plan for 2026-10-14-guide-row-npc-name. This item is built, merged and its worktree removed before that one's in-game run.

## Files that change
- `.claude/tools/Update-DeprecatedApi.ps1` (new):
  - It finds the main checkout and `..\wow-ui-source` as `Update-UiSource.ps1:43-49` does. A `-UiSource <path>` parameter overrides the clone folder (used by the test below).
  - It reads the `## Interface:` line of `Krowi_AchievementFilter.toc` and maps each version's major to a clone: 12 `live`, 5 `classic`, 3 `classic_titan`, 2 `classic_anniversary`, 1 `classic_era`. A missing clone throws "No wow-ui-source clone '<b>' in <dir>; run .claude\tools\Update-UiSource.ps1 -Branch <b>".
  - Ported from Krowi_ClaudeKit `tools/Find-DeprecatedApi.ps1:60-115`:
    - the alias collection from every clone's `Blizzard_Deprecated*` Lua (alias lines and functions outside table constructors, with the replacement);
    - each listed client's real globals (top-level FrameXML definitions outside the deprecated addons, and documented namespace-less functions);
    - the classification per client: deprecated, removed, or skipped when the name is real there.
  - It writes `Check-Repo.deprecated-api`: a `#` header with the clone builds and the regeneration command, then one line per name, sorted ordinally: `<name> <replacement or -> <client>=<state>[,...]`, with the clients in `.toc` order. The encoding and line endings match `Check-Repo.removed-api`.
- `.claude/tools/Check-Repo.deprecated-api` (new, generated).
- `.claude/tools/Check-Repo.ps1`:
  - the `deprecated-api` row in the header table, after `removed-api`;
  - the list read next to `Check-Repo.removed-api` (`:350-357`);
  - in the GETGLOBAL branch (`:397-402`): `elseif ($deprecatedApi.ContainsKey($name))`, an Error naming the clients, their state and the replacement, pointing at the list and the script;
  - `'deprecated-api'` added to `$alwaysOn` (`:841`).
- `.claude/tools/README.md`:
  - the tool table: the new script and the new data file;
  - the rules table: `deprecated-api`;
  - one line on refreshing the list after `Update-UiSource.ps1` on a patch day, and that the classification is ported from the kit's `Find-DeprecatedApi.ps1`.
- `docs/codebase-analysis.md` row 32: `✅ FIXED`.
- Krowi_ClaudeKit `WowAddons.md`: add "the deprecated-API classification (`Update-DeprecatedApi.ps1` here, `Find-DeprecatedApi.ps1` in the kit)" to the list of tools the two sides keep in step. Commit and push in the kit.

## Order of work
1. `plan.md`, commit.
2. The script and the generated list. Second run: byte-identical (hash compare). `-UiSource` on an empty scratch folder: the `Update-UiSource.ps1` message.
3. The rule.
4. **Reproduction:**
   - put the pre-#343 line back in `AchievementButtonMixin.lua:119` (`ChatEdit_InsertLink(achievementLink)`);
   - `Check-Repo.ps1 -ChangedOnly` should give exactly one `deprecated-api` Error there, naming `ChatFrameUtil.InsertLink` and `live`, `classic` and `classic_titan`;
   - restore the line and confirm the file is byte-identical to HEAD.
5. Full `Check-Repo.ps1`: 0 errors, with the run time noted.
6. README, codebase-analysis, `plan.md`; commit: `feat(tools): deprecated-api lint rule over a list built from the UI source`.
7. `/code-review` on the branch (no taint review: tooling only); fix or list the findings.
8. Work files to `done`, push, PR, merge (PowerShell). Pull the main checkout, then `Remove-Worktree.ps1 feature-2026-10-14-deprecated-api-lint -DeleteBranch`. Then the kit line.

## Risks
- **The port drifts from the kit tool:** the reproduction and the "No uses found" agreement with `Find-DeprecatedApi.ps1` on the same tree check it, and the workspace list names the pair.
- **False positives on Retail-only code** reading a name another listed client lacks: today's tree has none (the kit scan is clean on all three). A real case goes in `Check-Repo.ignore` with a comment.
- **A stale list:** refreshed by hand after `Update-UiSource.ps1`, as the README says.

## Proof
- The reproduction gives one Error at `:119`, and the restored file is clean.
- A full `Check-Repo.ps1` run has 0 errors.
- The second script run leaves the list unchanged.

## How it went (2026-10-14)
- Built before row 31 (2026-10-14-guide-row-npc-name) rather than after its headless build: this item needs no game, and row 31 then starts from the `dev` this one lands in, without a rebase.
- `Update-DeprecatedApi.ps1`: 401 names for live, classic and classic_titan, read from six clones, in about 3 s. A second run is byte-identical. An empty `-UiSource` folder stops it with "No wow-ui-source clone 'live' in ...; run .claude\tools\Update-UiSource.ps1 -Branch live", and the list stays untouched.
- Reproduction: with the pre-#343 line put back, `Check-Repo.ps1 -ChangedOnly` gave exactly one Error, `AchievementButtonMixin.lua:119: [deprecated-api] ... 'ChatEdit_InsertLink' (live=deprecated, classic=deprecated, classic_titan=deprecated) ... call ChatFrameUtil.InsertLink instead`. The restored file is byte-identical.
- A full `Check-Repo.ps1` run: 0 errors, 45 s with the language server. Krowi_ClaudeKit's `Find-DeprecatedApi.ps1` agrees on the same tree ("No uses found.").
- `/code-review` (medium) found the ported classification inaccurate in ways the kit tool shared. The list went from 401 to 327 names.
- Fixed here (second commit), and ported to the kit (`350571a`) where they apply:
  - Deprecation files include `Deprecated_*` addons and any file that checks the CVar; live's `Deprecated_PaperDoll` had made `GetInventorySlotInfo` look like a real global.
  - A per-game variant counts only for its own game; `GetSpecialization` was marked deprecated on Mists, where the global does not exist.
  - A function a client's own code calls is real there; Mists' undocumented `GetInspectSpecialization` and six others had been marked removed.
  - Aliases are matched on comment-stripped lines, and long comments are skipped.
  - The list is read only from the clones the `.toc` lists, so stale `ptr`, `classic_era` or `classic_anniversary` clones no longer change it.
  - A name a deleted deprecation file took with it stays listed as removed while no listed client has it, so a regeneration cannot quietly drop protection.
  - Names `Check-Repo.removed-api` lists are left out (75 were dead weight behind the `elseif`).
  - `-UiSource` takes a relative path.
  - 1.60+ maps to `forever`, not `classic_era`.
  - A whitespace slip in `Check-Repo.ps1` is reverted.
- Also from the review: `Check-Repo.ignore` takes an optional third field, the global's name, so a deliberate exception covers that read only and not every later finding in the file. With the pre-#343 line put back: no entry gives 1 finding, an entry naming `ChatEdit_InsertLink` gives 0, and one naming another global gives 1.
- Not changed, recorded as limits in the README:
  - The rule does not know which client loads a file. A Classic-only file reading a name only Retail deprecated needs a named ignore entry.
  - `Mainline/` and `Classic/` folders inside a clone are all read as that client's code.
  - A replacement written as an expression or in a comment shows as `-`.
- Declined:
  - A shared helper for the worktree-to-main-checkout lookup, now in four scripts.
  - A shared loader for the two list files.
  - Both are out of scope.