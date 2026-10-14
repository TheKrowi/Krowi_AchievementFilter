# Spec: Guide NPC names in the player's language, from the game
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. A guide's NPC step shows the name the player's client has for that NPC, in the step's headline and in its waypoint title, on every surface: tooltip, right-click menu, side panel, expanded row, map pin and TomTom.
2. When the client has no usable name (not cached yet, an id the game does not know, a secret value, or no API on the client), the step shows the English name from the data, without an error.
3. Once the data has loaded at login, the addon asks the client for every guide NPC's name once, so the name is usually cached before the player first sees a guide.
4. `L["Archivist Zubashi"]` is gone from all 11 locale files. The guide data names an NPC with a plain English string, and the debug `/kafwhere` prints the step in that form.
5. Classic loads and runs without errors and without any change in what it shows.

## Design
- **`Gui/Guide/Guide.lua`:**
  - A local `GetCreatureName(npcId)` reads `C_TooltipInfo.GetHyperlink("unit:Creature-0-0-0-0-<npcId>-0000000000").lines[1].leftText`. It returns nil when the API is missing, when there is no line, when `canaccessvalue` rejects the text (checked before any comparison, as in `Data/EventData.lua:36`), or when the text is empty.
  - `guide.GetNpcName(step)` returns `GetCreatureName(step.NpcId) or step.Name`. `guide.GetLines` uses it for the Npc line's text and waypoint title, replacing `step.Name` (now `Gui/Guide/Guide.lua:228-229`).
  - `guide.RequestNpcNames(achievements)` walks the given achievements, calls `GetCreatureName` once for each distinct NPC id in their guides, and returns those ids sorted. An uncached name makes the client query the server, and the answer lands in its creature cache a moment later.
  - The file's header comment is updated: all names now come from the game, and only the tip comes from the data.
- **`Data/Data.lua`:** `PostLoadOnPlayerLogin` calls `addon.Gui.Guide.RequestNpcNames(self.Achievements)` once the guide data is attached to the achievements. It already calls into `addon.Gui` there (`AchievementPopout:Load`). One pass over about 8400 achievements, once per login.
- **Data and builder:**
  - `DataAddons/Retail/07_Legion/GuideData.lua` writes `:Npc(97485, "Archivist Zubashi", 648, 47.7, 53.8)` and drops its now unused `local _, addon = ...`.
  - The comments in `Api/GuideDataBuilder.lua` (the example on line 4, `:Npc` on line 18) say the name is the English fallback, as the enUS client shows it.
- **`Globals.lua:283`** (`/kafwhere`): prints `:Npc(<id>, "<name>", ...)`.
- **Localization:** the `L["Archivist Zubashi"] = true` line goes from all 11 files. Krowi removes the key from the CurseForge project.
- **Changelog:** one line for players under the next version.

## Options considered
- **A. The name from the game, with an English fallback and a warm-up at login (recommended).** The step reads the client's own name, which is what the player sees in the world, the same way the guide already takes spell, map and portal names from the game. Nothing to maintain, and each sibling guide just names its NPC in English. The cost is a first-ever sight: a player whose client never cached the NPC sees the English name if they open the guide within a moment of logging in.
- **A without the warm-up.** The same, but the client is asked only when a guide is shown. The first hover of a guide whose NPC was never cached shows English; the next shows the right name.
- **B. A name table next to Localization, generated from Wowhead.** A data file with every guide NPC's name per locale, written by a lookup script from Wowhead's tooltip endpoint (`nether.wowhead.com/tooltip/npc/<id>?locale=<n>`). This is right from the first show, but it copies game data that goes stale when Blizzard renames an NPC, and it would make this repo's tooling fetch from a website for the first time.
- **C. Translations in the locale files through CurseForge.** Rejected by Krowi on 2026-10-14: the name is game data, not a translation.
- **Reading a hidden `GameTooltip` after `SetHyperlink`.** This is the older way to get the same name, but it uses a tooltip frame. `C_TooltipInfo` returns the same data with no frame at all. Rejected.

## Areas of concern
- **Taint and secret values:**
  - `C_TooltipInfo.GetHyperlink` is a data call. No Blizzard frame is touched and nothing is written globally.
  - The API's only secret flag, `SecretArguments = "AllowedWhenUntainted"`, is about the arguments (`Blizzard_APIDocumentationGenerated/TooltipInfoDocumentation.lua:337-353`). Ours is a plain string we build.
  - The returned text is checked with `canaccessvalue` before it is compared or concatenated.
  - The `taint-reviewer` runs on the diff.
- **Retail and Classic:**
  - The Classic UI export has no `TooltipInfoDocumentation.lua`, so the API may be missing there; `GetCreatureName` checks for it.
  - Classic has no guide data, so the warm-up finds no NPCs.
  - `Gui/Guide/Guide.lua` loads on both clients (`Gui/FilesClassic.xml:17`).
- **Plugins and skins:** none. No frame changes.
- **Saved variables:** none.
- **Localization:**
  - One key leaves all 11 files, below each `Exported at` line. `Guide Talk To` keeps its `{npc}`.
  - While the key stays on CurseForge, the next export puts back an unused string: harmless, but noise.
- **Data snapshots and the headless pipeline:** the guide data is not in the snapshots (no match for the NPC in `.claude/tools/headless/snapshots/`). `load-data.lua` loads `GuideData.lua`, which no longer reads `addon.L`.
- **Server traffic:** one creature query per guide NPC the client has never cached, which today means one and, after the sibling guides, about a dozen. A cached name costs no query.

## Verification
- **The guide suite** (`Tests/Guide.lua` and its model in `.claude/tools/headless/run-tests.lua`) gets two new kinds, both Retail only. The model's `C_TooltipInfo` knows 97485 as "Archivist Zubashi" and nothing else.
  - **NpcName:** the line `GetLines` gives for a one-step guide whose data name is the marker "Fallback name". The result is "game" when the headline and the waypoint title carry another non-empty name, and "fallback" when they carry the marker.
    - `npc-name-from-game`, NPC 97485: Recorded "fallback", Target "game".
    - `npc-name-unknown`, NPC 999999, which does not exist (Wowhead 404 on 2026-10-14): Recorded "fallback", Target "fallback".
    - `npc-name-secret`: the model answers with a value its `canaccessvalue` rejects. Recorded "fallback", Target "fallback". This one runs headless only; the game cannot make a secret name on demand, so in game it is a SKIP with that reason.
  - **NpcRequest:** `npc-names-requested`, `RequestNpcNames` over the loaded data. Recorded "none" (no such function yet), Target "97485".
- **Every suite on both clients,** `load-data.lua Both`, and `Check-Repo.ps1 -ChangedOnly`.
- **In game on Retail:**
  - before the fix, `/kaftest guide` green as recorded;
  - after it, `/kaftest guide` with every target met, 60962's tooltip and right-click menu reading "Archivist Zubashi", and `Read-GameErrors.ps1` clean.
- **In game on Classic:** `/reload` with no errors.

## Decision
Krowi, 2026-10-14: option A, the name from the game with an English fallback and the warm-up at login. The enUS in-game check is enough; no check on a non-English client before release.