# Spec: Stop loading the Ace libraries nothing uses
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. `Libs/Files.xml` no longer loads AceTimer, AceSerializer or AceEvent, and their folders are gone from `Libs/`.
2. No addon code asks LibStub for them, except silently (`LibStub(name, true)`).
   - The existing `library-names` rule (`.claude/tools/Check-Repo.ps1:471-504`) checks names against the libraries `Libs/` registers, so it fails on a call left behind once the folders are gone.
   - In game, another addon's copy could hide such a call, so the rule is the proof.
3. The test runner's `PLAYER_ENTERING_WORLD` handler (`Tests/Tests.lua:527`) runs as before, on a frame of its own.
4. No setting moves: no file under `Options/`, `Features/` or `Data/` changes, and every `options` scenario keeps its `Recorded` and `Target` lines, including `options-fingerprint` (Retail `options=414 hash=723de62c`, Classic `options=310 hash=83fced41`) and `defaults-restore-acedb`.
5. No new Lua error on Retail or Mists after a `/reload`.

## Design
- **AceTimer, AceSerializer:** delete their two `Libs/Files.xml` lines and their folders. Nothing else names them; LibSerialize's mention of AceAddon is an optional embed and stays untouched.
- **AceEvent:**
  - delete `addon.Event` and its embed (`Krowi_AchievementFilter.lua:4-6`), the `Libs/Files.xml` line and the folder;
  - in `Tests/Tests.lua:527`, the handler moves onto a `CreateFrame("Frame")` with `RegisterEvent("PLAYER_ENTERING_WORLD")`, whose `OnEvent` passes `isLogin, isReload` as AceEvent did;
  - no library in `Libs/` reads `addon.Event` (checked).
- **Headless:** `options-env.lua:86-87` drops `AceSerializer` from its skip list, since the folder is gone. The environment loads only KAF's own `Libs/`, so a non-silent call left behind errors there too.

## Options considered
1. **AceDBOptions:**
   - (a) In this work item: its tables are built at every login and never shown.
   - **(b) Chosen: with the AceConfig work item later.** This item then touches no options file.

## Areas of concern
- **Taint and secret values:** none. No frame, hook or Blizzard API changes. The test runner's frame is an addon frame.
- **Clients:** Retail (120105, 120107), Mists (50504) and Titan (38002) load the same `Libs/Files.xml`. Tested in game on Retail and Mists.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** an addon that used KAF's copy of one of these libraries without embedding its own would break. That would be its own bug. The plan scans the addons installed on Retail and Mists for it.
- **Saved variables and migrations:** none (requirement 4).
- **Localization:** none.
- **Embedded libraries:** only vendored Ace folders go, none of them a submodule. Krowi_Util is not edited.
- **Data snapshots:** untouched.
- **Player-facing text:** one changelog line.
- **Change class:** `harness`, because existing lines of the test tooling change (`Tests/Tests.lua:527`, `options-env.lua:86-87`).

## Verification
- `Check-Repo.ps1` on the whole tree: no error, `library-names` included.
- Headless, on both clients: the `options` suite with every line unchanged, and the suites that boot the whole addon (`features`, `plugins`, `popups`, `special`, `schedules`, `guide`).
- In game, Retail then Mists:
  - `Deploy.ps1 -WhatIf` shows the three folders removed;
  - deploy, then `Run-GameTests.ps1 options`. The run starts from the runner's `PLAYER_ENTERING_WORLD` handler after a `/reload`, so it proves requirement 3;
  - `Read-GameErrors.ps1`: no new row.

## Decision
2026-11-25, Krowi: intent accepted; AceDBOptions waits for the AceConfig work item (option 1b); plan approved.