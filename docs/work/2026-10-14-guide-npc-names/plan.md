# Plan: Guide NPC names in the player's language, from the game
Spec: [spec.md](spec.md). Status: accepted

## Context
The 60962 guide names Archivist Zubashi through `addon.L["Archivist Zubashi"]`, which is English in all ten other locales. Krowi decided on 2026-10-14 (spec, option A) that NPC names are game data, not translations. The guide reads the name from the client (`C_TooltipInfo.GetHyperlink` on a unit link), falls back to the English name in the data, and asks the client for every guide NPC once at login so the name is cached before a guide shows. The work happens in the worktree `.claude/worktrees/feature-2026-10-14-guide-npc-names` on `feature/2026-10-14-guide-npc-names`; the intent and spec are committed (`17522e57`).

## Files that change
- `Tests/Guide.lua`: two new scenario kinds, both Retail only (added to `retailOnly`), and their runners.
  - `NpcName` runs `GetLines` on a one-step guide `{Type = "Npc", NpcId = <id>, Name = "Fallback name", MapId = 648, X = 47.7, Y = 53.8}`. The result is "game" when the line's waypoint title is another non-empty name and the headline contains it, "fallback" when the title is the marker, and "mixed" otherwise.
    - `npc-name-from-game`, NPC 97485: Recorded "fallback", Target "game".
    - `npc-name-unknown`, NPC 999999: Recorded "fallback", Target "fallback".
    - `npc-name-secret`, `Secret = true`: the runner asks `env.SecretNpcId()`, and the game env has none, so in game it is a SKIP with the reason "the game cannot make a secret name on demand". Recorded "fallback", Target "fallback".
  - `NpcRequest`: `npc-names-requested` returns the ids `guide.RequestNpcNames(env.Achievements())` gives, joined with ",", or "none" without the function. Recorded "none", Target "97485".
  - `gameEnv.Achievements()` returns `addon.Data.Achievements`.
  - The header comment lists the two kinds and `RequestNpcNames` among the module functions. The Retail-only observation line is reworded to cover them.
- `.claude/tools/headless/run-tests.lua`, `suites.guide`, Retail branch:
  - `env.C_TooltipInfo.GetHyperlink(link)` parses the creature id from `unit:Creature-0-0-0-0-<id>-...` and returns `{lines = {{leftText = name}}}` for 97485 "Archivist Zubashi", a secret marker for the secret id, and `{lines = {}}` otherwise.
  - `env.canaccessvalue(v)` returns `v ~= marker`, where the marker is a unique table.
  - `headless.SecretNpcId()` returns that id, and `headless.Achievements()` returns the model's `achievements`.
  - The header comment of the suite names the creature-name model.
- `Gui/Guide/Guide.lua`:
  - a local `GetCreatureName(npcId)` (API guard; `canaccessvalue` before any comparison; empty means nil);
  - a local `GetNpcName(step)`, which lines 228-229 use for the text and the waypoint title (built as a local, not `guide.GetNpcName` as the spec says: nothing outside the file needs it, and the scenarios read it through `GetLines`);
  - `guide.RequestNpcNames(achievements)`: `pairs` over the achievements, each distinct Npc step's id asked once, the ids returned sorted;
  - the header comment (lines 5-7) updated.
- `Data/Data.lua`, `PostLoadOnPlayerLogin`: call `addon.Gui.Guide.RequestNpcNames(self.Achievements)` last, after `addon.BuildCacheAsync` is started, with a comment on why. The taint review moved it there from right after `AchievementPopout:Load()`: an error in the warm-up must not stop the cache build, `SpecialCategories.LoadData` or `IsLoaded`.
- `Gui/Guide/Guide.lua`, `GetCreatureName`, after the taint review: every table on the way to the name (`data`, `data.lines`, the line) is checked with `type` and `canaccesstable` before it is indexed, since 12.x can return secret tables and the tooltip data's shape is not documented. The name is checked with `type` first, then `canaccessvalue`, then compared. A fifth NpcName scenario, `npc-name-secret-table`, recorded "error" against the first version of the code (headless, 2026-10-14) and "fallback" after; the game skips it like `npc-name-secret`.
- Not changed: the expanded row's render cache key (`Gui/Guide/Content.lua:228-229`) does not include the NPC's name, so a row first drawn with the English fallback keeps it until the key changes. With the warm-up that needs a first draw within a moment of logging in, with the NPC never cached; selecting another achievement and back redraws it.
- `DataAddons/Retail/07_Legion/GuideData.lua`: `:Npc(97485, "Archivist Zubashi", 648, 47.7, 53.8)`; the unused `local _, addon = ...` goes.
- `Api/GuideDataBuilder.lua`: the comment on line 4 and the `:Npc` comment on line 18 say the name is the English fallback, as the enUS client shows it, and that the game supplies the player's own.
- `Globals.lua:283` (`/kafwhere`): `(':Npc(%d, "%s", %s)')`.
- `Localization/*.lua`, all 11 files: the `L["Archivist Zubashi"] = true` line goes.
- `Tests/README.md`, the `guide` row: one sentence on the NPC-name scenarios and the creature-name model.
- `_Packaging/Changelog.md`: a new `## 104.0` header (no date until release) with `### Changed`: "Achievement guides now name the people to talk to in your game's language".
- `docs/backlog.md`: the "Archivist Zubashi's name in other locales" item goes. The main checkout has an uncommitted change to this file (Krowi's new Benchmark entry); that is a different hunk, so the merge is clean, but `git pull` in the main checkout refuses until Krowi commits or sets it aside.
- `docs/work/2026-10-14-guide-npc-names/plan.md`: this plan.

## Order of work
1. Write `plan.md` in the work folder from this plan, convert it to CRLF, and commit it: `docs(work): plan for 2026-10-14-guide-npc-names`.
2. **Scenarios first:** `Tests/Guide.lua` and the headless model. Then run `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" guide`: every scenario PASSes, the four new ones as recorded, and the from-game and requested ones are open against their targets. Then run every suite on both clients.
3. **In-game before-run (Retail):**
   - `Deploy.ps1 -WhatIf`, then deploy from the worktree (no other session in this repo; the peers are other repos);
   - Krowi: `/reload`, `/kaftest guide`, a second `/reload`;
   - read the run with `Read-GameTests.ps1`: green, with `npc-name-secret` a SKIP and no unexplained difference from headless.
   - Commit the scenarios: `test: record guide NPC names in the guide suite`.
4. **The fix:** `Gui/Guide/Guide.lua`, `Data/Data.lua`, `GuideData.lua`, `GuideDataBuilder.lua`, `Globals.lua`, the 11 locale files. Set `Recorded` to `Target` for the two scenarios that change, and rerun every suite on both clients, `load-data.lua Both` and `Check-Repo.ps1 -ChangedOnly`.
5. Changelog, `Tests/README.md`, backlog, and `plan.md` updated wherever the work departed from it. Commit: `feat(gui): guide NPC names come from the game in the player's language`.
6. The `taint-reviewer` on the branch diff, then fix what it finds.
7. **In-game after-run:**
   - Retail: deploy, `/reload`, `/kaftest guide`, a second `/reload`, then `Read-GameTests.ps1` and `Read-GameErrors.ps1`. Krowi hovers 60962 and opens its right-click menu.
   - Classic: deploy, `/reload`, then `Read-GameErrors.ps1 -Client Classic`.
8. Set the work files to `done`, push, and open the PR against `dev`. Run the `REVIEW.md` passes (`/code-review`, `taint-reviewer`). Then stop at the merge gate.

## Risks
- **A secret name during an encounter:** the `canaccessvalue` guard comes before any use, and the secret scenario holds it headlessly.
- **`C_TooltipInfo` missing on Classic:** guarded. The Classic `/reload` in step 7 checks it.
- **An uncached name at the very first show:** the English fallback, and the warm-up makes it rare. The from-game scenario in game relies on 97485 being cached, which it is (the probe, then the warm-up).
- **The in-game deploy wipes the main checkout's deploy:** fsdeploy redeploys the whole main checkout on any save there. Krowi does not save in the main checkout's window until the in-game runs are done.
- **The removed key stays on CurseForge:** the next export brings back an unused string. Krowi removes it there.

## Proof
- Headless `guide` on Retail: `npc-name-from-game` PASS, target met (got=game); `npc-name-unknown` and `npc-name-secret` PASS (got=fallback); `npc-names-requested` PASS, target met (got=97485). Every other suite is unchanged on both clients.
- `load-data.lua Both` is clean, and `Check-Repo.ps1 -ChangedOnly` reports 0 errors.
- In game on Retail:
  - `Read-GameTests.ps1` shows guide green, every target met, and `npc-name-secret` and `npc-name-secret-table` SKIPs with their reason;
  - the 60962 tooltip and the menu's waypoint entry read "Archivist Zubashi";
  - `Read-GameErrors.ps1` reports no new errors.
- In game on Classic: `Read-GameErrors.ps1 -Client Classic` reports no new errors.