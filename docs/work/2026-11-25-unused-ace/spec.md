# Spec: Stop loading the Ace libraries nothing uses
Intent: [intent.md](intent.md). Status: draft

## Requirements
1. `Libs/Files.xml` no longer loads AceTimer, AceSerializer, AceEvent or AceDBOptions, and their folders are gone from `Libs/`.
2. No addon code asks LibStub for them, except silently (`LibStub(name, true)`). The existing `library-names` rule (`.claude/tools/Check-Repo.ps1:471-504`) checks this against the libraries `Libs/` registers, so it fails on a call left behind once the folders are gone. In game, another addon's copy could hide such a call, so the rule is the proof.
3. The test runner's `PLAYER_ENTERING_WORLD` handler (`Tests/Tests.lua:527`) runs as before, on a frame of its own.
4. No setting moves:
   - every `options` scenario keeps its `Recorded` and `Target` lines, including `options-fingerprint` (Retail `options=414 hash=723de62c`, Classic `options=310 hash=83fced41`) and `defaults-restore-acedb`;
   - `addon.Filters:Load()` stays first in `profiles.RegisterOptionsTable`, so `KrowiAF_Filters` is created at the same point of the boot;
   - the Profiles section shows the same rows and switches, copies and resets profiles as before.
5. No new Lua error on Retail or Mists after a `/reload`.

## Design
- **AceTimer, AceSerializer:** delete the two `Libs/Files.xml` lines (`AceTimer-3.0.xml`, `AceSerializer-3.0.xml`) and the folders. Nothing else names them. LibSerialize's mention of AceAddon is an optional embed, untouched.
- **AceEvent:**
  - delete `addon.Event` and its embed (`Krowi_AchievementFilter.lua:4-6`), the `Libs/Files.xml` line and the folder;
  - in `Tests/Tests.lua:527` the handler goes on a `CreateFrame("Frame")` with `RegisterEvent("PLAYER_ENTERING_WORLD")` and an `OnEvent` that passes `isLogin, isReload` as AceEvent did;
  - no library in `Libs/` reads `addon.Event` (checked).
- **AceDBOptions:**
  - `Options/Profiles.lua:11-13` and `:16-18` (the two `GetOptionsTable` tables and their `order` and `name`) go, plus the `Libs/Files.xml` line and the folder;
  - `addon.Filters:Load()` and the page's registration stay;
  - the window never drew these tables: the map's Profiles section is `Kind = "Profiles"` (`Options/Window/Map.lua:202-204`), drawn from AceDB's API;
  - `Model.lua`'s `Coverage` claims leaves under `Profiles.args.<Database>` only when that subtree exists (`:85-88`), so nothing becomes unmapped;
  - the fingerprint skips options without a node (`Model.lua:178`), which the profile rows are;
  - Krowi_Util's `options:Load` names AceDBOptions only when called without `true`; KAF calls `addon.Options:Load(true)` (`Krowi_AchievementFilter.lua:38`).
- **Headless:** `options-env.lua:86-87` drops `AceSerializer` from its skip list, since the folder is gone. The environment loads only KAF's own `Libs/`, so a leftover non-silent call errors there too.

## Options considered
1. **AceDBOptions:**
   - **(a) Recommended: in this work item.** Its tables are built at every login and never shown, so leaving it out of this item would only move a dead library to a later one. The edit is two blocks in one file, with `addon.Filters:Load()` left where it is.
   - (b) With the AceConfig work item later. This item then touches no options file at all.

## Areas of concern
- **Taint and secret values:** none. No frame, hook or Blizzard API changes. The test runner's frame is an addon frame.
- **Clients:** Retail (120105, 120107), Mists (50504) and Titan (38002) load the same `Libs/Files.xml`. Tested in game on Retail and Mists.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** an addon that used KAF's copy of one of these libraries without embedding its own would break. That would be its own bug. Step 3 of the plan scans the addons installed on Retail and Mists for it.
- **Saved variables and migrations:** none. No saved key, default or `## SavedVariables` entry changes; requirement 4 checks it.
- **Localization:** none.
- **Embedded libraries:** only vendored Ace folders go, none of them a submodule. Krowi_Util is not edited.
- **Data snapshots:** untouched.
- **Player-facing text:** one changelog line.
- **Change class:** `harness`. An existing line of the test tooling changes (`Tests/Tests.lua:527`, `options-env.lua:86-87`).

## Verification
- `Check-Repo.ps1` on the whole tree: no error, `library-names` included.
- Headless, both clients: the `options` suite with every line unchanged. Also the suites that boot the whole addon (`features`, `plugins`, `popups`, `special`, `schedules`, `guide`).
- In game, Retail then Mists:
  - `Deploy.ps1 -WhatIf` shows the four folders removed;
  - deploy, then `Run-GameTests.ps1 options`. This also proves the runner's `PLAYER_ENTERING_WORLD` handler, since the run starts from it after a `/reload`;
  - `Read-GameErrors.ps1`: no new row;
  - on the Profiles section, switch to a new profile and back, then delete it, with filters following (one tab's filter visibly kept).

## Decision
Pending: AceDBOptions here or later (Options considered 1).