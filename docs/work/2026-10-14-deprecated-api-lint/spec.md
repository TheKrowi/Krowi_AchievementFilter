# Spec: The repo lint catches deprecated Blizzard globals
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. A read (`luac -l` GETGLOBAL) of a listed global in an addon file outside `Libs/` and `.claude/` is an Error. It names the clients where the name is only deprecated or missing, and the replacement when Blizzard's alias names one.
2. The list is a committed data file, `.claude/tools/Check-Repo.deprecated-api`, so the rule needs nothing but the repo.
3. A script rebuilds the list from the local wow-ui-source clones of the clients the `.toc` lists. A run on unchanged clones leaves the file byte-identical, and a missing clone stops it with a message naming `Update-UiSource.ps1`.
4. The rule checks every addon file, also with `-ChangedOnly` (always on), because a deprecation breaks files nobody touched. A name in `Check-Repo.removed-api` is reported by that rule only.
5. Today's tree is clean, and the line #343 fixed would have been an error.

## Design
- **`.claude/tools/Update-DeprecatedApi.ps1` (new).** It is a port of the classification in Krowi_ClaudeKit's `Find-DeprecatedApi.ps1`.
  - It maps the `.toc` Interface line to clones: 12 to `live`, 5 to `classic`, 3 to `classic_titan`, 2 to `classic_anniversary`, 1 to `classic_era`.
  - It collects the aliases from the `Blizzard_Deprecated*` addons of every clone present, with the replacement each names.
  - For each listed client it keeps the names that client defines only in a deprecated file ("deprecated") or not at all ("removed"), skipping any name that is a real API on that client.
  - It writes one sorted line per name: `<name> <replacement or -> <client>=<state>,...`. A header records the clone builds and the regeneration command.
- **`.claude/tools/Check-Repo.ps1`.**
  - The rule `deprecated-api` goes in the header table and in `$alwaysOn`.
  - The list is read next to `Check-Repo.removed-api`, and the check runs in the same GETGLOBAL loop, after `removed-api`.
  - A deliberate exception, such as a guarded fallback for a client without the new API, goes in `Check-Repo.ignore` with a comment.
- **`.claude/tools/README.md`:** the rule row, the new script, and when to refresh the list (after `Update-UiSource.ps1` on a patch day).
- **Kit parity.** Krowi_ClaudeKit's `Find-DeprecatedApi.ps1` stays the cross-addon scanner; the parsing is ported, as the workspace rules ask, and the README names the upstream.

## Options considered
- **A. A committed list and a generator script (recommended).** The rule is offline and deterministic, and a list change is a reviewable diff. The cost is that the list is only as current as its last regeneration.
- **B. One file for removed and deprecated names,** a state column in `Check-Repo.removed-api`. It changes an existing hand-kept format and mixes it with a generated one.
- **C. The lint reads the wow-ui-source clones itself.** Always current, but contributors do not have the clones (the rule would silently do nothing for them), results would differ between machines, and it would add seconds to every Stop hook run.

## Areas of concern
- **Taint and secret values:** none; tooling only.
- **Retail and Classic:** the list covers every client the `.toc` lists; a name deprecated on one client only is still an error, because the code runs there too.
- **Plugins and skins, saved variables, localization, data snapshots:** none. `Libs/` is skipped.
- **Staleness:** the list does not refresh itself. The README ties its refresh to `Update-UiSource.ps1` on patch days.

## Verification
- **Reproduction:**
  - In the worktree, put the pre-#343 line back (`AchievementButtonMixin.lua:119` reading `ChatEdit_InsertLink`).
  - `Check-Repo.ps1 -ChangedOnly` should then fail with one `deprecated-api` Error at that line, naming `ChatFrameUtil.InsertLink` and the three clients.
  - Restore the line; the same run is clean.
- **The script:** a second run leaves the list byte-identical, and without the `classic_titan` clone it stops with the `Update-UiSource.ps1` message.
- **`Check-Repo.ps1` on the whole tree:** 0 errors.
- **No in-game check:** the addon does not change.

## Decision
Krowi, 2026-10-14: option A, a committed list rebuilt by a script from the wow-ui-source clones.