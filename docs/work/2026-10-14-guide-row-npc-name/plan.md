# Plan: The expanded row's guide shows the NPC's name once the game has it
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi on 2026-10-14, together with the plan for the other follow-up of the day (2026-10-14-deprecated-api-lint). That item was built and merged first (#344), and this branch was rebased onto `dev` before any code change. That avoids the adjacent-row conflict in `docs/codebase-analysis.md` the plan expected, and puts this item under the new `deprecated-api` rule from the start.

## Files that change
- `Tests/Guide.lua`:
  - New kind `RowName` and its runner:
    - a one-step guide on a fake achievement (`Id = 1`, Npc 424245, data name the marker), displayed with `content.DisplayUnderObjectives` on the stand-in objectives, options `ExpandedRow = true` and the map-pin provider;
    - then `env.TeachNpcName(424245, "Learned Name")` and a second display, not forced;
    - the result is "game", "fallback" or "mixed", from `objectives.GuideBlock.GuideHeadlines[1]:GetText()`;
    - without `env.TeachNpcName` (in game) it is a SKIP with the reason "the game cannot add a name to its creature cache on demand".
  - `RunNpcName` gains `Kept = true`: NPC 424246, `GetLines`, then `env.HideNpcName(424246)` and `GetLines` again; in game the same SKIP.
  - Scenarios:
    - `row-npc-name-arrives`: Recorded "fallback", Target "game";
    - `npc-name-kept`: Recorded "fallback", Target "game".
  - `RowName` joins `retailOnly`. The header gets the new kind and `GetNpcNames` in the list of module functions.
- `.claude/tools/headless/run-tests.lua`, guide model:
  - `creatureNames` gains `[424246] = "Kept Name"`;
  - `headless.TeachNpcName(id, name)` sets a name;
  - `headless.HideNpcName(id)` sets the existing secret-name marker;
  - the header comment lists them.
- `Gui/Guide/Guide.lua`:
  - a file-local `npcNames` table;
  - `GetNpcName` returns `npcNames[id]`, else `GetCreatureName(id)`, storing a usable answer, else `step.Name`;
  - `RequestNpcNames` still always calls `GetCreatureName`, so the client is asked and the query log sees it, and stores a usable answer;
  - new `guide.GetNpcNames(achievement)`: the `GetNpcName` of each Npc step, joined with `","`;
  - the header comment mentions the stored names.
- `Gui/Guide/Content.lua`: `DisplayUnderObjectives` adds `guide.GetNpcNames(achievement)` to the cache key (lines 228-229), and its comment (207-210) names the NPC's name among what triggers a render.
- `Tests/README.md`, guide row: one sentence on the two scenarios.
- `docs/codebase-analysis.md` row 31: `✅ FIXED`, with the date and the work folder.
- No changelog line: 104.0 is unreleased, and its "Achievement guides now name the people to talk to in your game's language" already promises this. The lint's changelog reminder is expected.

## Order of work
1. `plan.md` in the work folder, CRLF, commit.
2. **Scenarios first:** `Tests/Guide.lua` and the model. The headless guide suite should pass with the two new scenarios open (got=fallback); then run every suite on both clients. Commit: `test: record the expanded row's NPC name in the guide suite`.
3. **No in-game before-run:** both new scenarios are headless only, so a before-run would replay the 40 scenarios already green in game on 2026-10-14. The after-run covers the change. Krowi can overrule this when approving.
4. **The fix:** `Guide.lua`, `Content.lua`; set `Recorded` to `Target` for both; then every suite on both clients, `Check-Repo.ps1 -ChangedOnly`, and a mutation run (key without the names, then without the kept table: each new scenario fails). Commit: `fix(gui): the expanded row's guide picks up the NPC's name once the game has it`.
5. Docs: `Tests/README.md`, codebase-analysis row 31, `plan.md` where the work departed. Commit.
6. `taint-reviewer` on the branch diff.
7. After row 32 is merged: rebase onto `dev` and resolve the codebase-analysis line. Then `Deploy.ps1 -WhatIf` and deploy to Retail, and Krowi runs `/reload`, `/kaftest guide`, `/reload`. Read the run with `Read-GameTests.ps1` and `Read-GameErrors.ps1`. With the expanded-row option on, 60962's row reads "Talk to Archivist Zubashi".
8. Work files to `done`, push, PR, `/code-review`, merge (PowerShell), pull the main checkout, `Remove-Worktree.ps1 fix-2026-10-14-guide-row-npc-name -DeleteBranch`.

## Risks
- **A key built every list update:** a table read per Npc step once the name is stored. Until then it is one `C_TooltipInfo` read per Npc step for the selected row, and only for a guide with an Npc step.
- **A stored name never refreshes within the session.** Blizzard renames NPCs only with patches, which need a client restart anyway.
- **A secret value must never be stored:** only names that pass the existing guards in `GetCreatureName` reach the table.

## Proof
- Headless guide on Retail: `row-npc-name-arrives` and `npc-name-kept` PASS with got=game, and every earlier scenario is unchanged; the mutation runs fail them.
- In game on Retail: guide green, with the four headless-only scenarios as SKIPs, and no new errors.

## How it went (2026-10-14)
- Built after 2026-10-14-deprecated-api-lint was merged (#344), on a rebase made before any code change (see the top).
- Scenarios first (`74027d2b`): `npc-name-kept` and `row-npc-name-arrives` recorded "fallback" against the old code, both open against "game"; every other suite was unchanged on both clients.
- The fix (`b08e57c9`): both scenarios meet their targets. Each of two mutation runs removed one half of the fix and failed exactly its scenario: the key without the names failed `row-npc-name-arrives`, and `GetNpcName` without the kept table failed `npc-name-kept`.
- Departure: the suite header does not list `GetNpcNames` among the module functions, because the scenarios reach it through `DisplayUnderObjectives` and never call it directly.
- In-game run (Retail, 2026-10-14 20:45, character in a raid): `npc-name-from-game` failed with got=fallback; there were no Lua errors, and the four headless-only scenarios were SKIPs. A probe of `C_TooltipInfo.GetHyperlink` for 97485 printed `table true 4 string false false`: the line's text was a secret value. Raid restrictions hand addons NPC names as secrets, so the guard returned nil and the guide fell back to English as designed. This is the first real-game proof of the secret path. The scenario now SKIPs in game when the name is secret where the player is (`gameEnv.NpcNameIsSecret`), as the escape suite skips under outside state. Its readable-name check has to run outside such restrictions.