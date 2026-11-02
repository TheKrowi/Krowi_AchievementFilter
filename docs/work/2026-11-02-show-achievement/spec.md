# Spec: Show-Achievement.ps1 answers questions about one achievement
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. `.claude/tools/Show-Achievement.ps1 <ids> [-Client Retail|Classic] [-AsOf <date>] [-Build <version>] [-Db] [-History]` prints, for each id and each client (both when `-Client` is left out):
   1. the source file and line, the data line itself, and the patch key;
   2. the achievement's line exactly as `Achievements.<client>.txt` records it (patch, faction and the other faction's id, reward types, flags, every `Obtainable()` record with where its Version anchors land, previews, custom criteria, events);
   3. the state from the real `GetObtainableState`, with the clock at `-AsOf` (default now) and `GetBuildInfo()` at the newest patch the `.toc` declares for that client (`-Build` overrides it). Where the real code asks the in-game calendar for an event, it names the event instead of a state;
   4. the category paths, the zone placements, and the tooltip, transmog set, pet battle link, guide and event entries, in the snapshots' line forms;
   5. what the data load reported about the id (`LoadDiagnostics`), and "not registered" when the client does not register it.
2. The per-achievement lines come from the formatter `snapshot-data.lua` uses; the snapshots stay byte-identical.
3. `-Db` adds the name, the description and the builds the id exists on, through `.claude/skills/add-zone-data/_lookup_ids.ps1` (builds from the kit's `Get-WowBuilds.ps1`), starting wow.tools.local with `_start_server.ps1` when it is down. When the server cannot start, it says so and prints the rest.
4. `-History` lists the commits that changed the `Ach(<id>)` line.
5. A run without `-Db` takes under a second.
6. The script is listed in `.claude/tools/README.md`; the `verify-achievement-data` skill and the `data-verifier` agent point to it.

## Design
- **`.claude/tools/headless/data-format.lua` (new):** the rendering helpers and the per-achievement renderers moved verbatim out of `snapshot-data.lua` (`AchievementLine`, `TooltipLines`, `TransmogLines`, `PetBattleLines`, `GuideLines`, `EventLine`, `Record`). `snapshot-data.lua` builds its three files from them; a `-write` after the move leaves `git status` clean.
- **`.claude/tools/headless/show-achievement.lua` (new):** per client, `client-env.lua` loads and runs the pipeline as the snapshot does, recording in `AfterFile` which file and patch key each `KrowiAF.AchievementData` table came from (an `AutoFactionSplit` mirror points at its partner's line). Then `Data/TemporaryObtainable.lua` is loaded on top, as the `obtainable` suite does, and the clock and build are set in the sandbox: `GetServerTime()` and `time()` return `-AsOf`, `time{...}` converts a date as UTC, `KrowiAF_GetUtcOffsetSeconds()` is 0, and `GetBuildInfo()` returns the build. The season API (`C_MythicPlus.GetCurrentSeason`, `GetCVar("newMythicPlusSeason")`, `GetCurrentArenaSeason`, `GetPreviousArenaSeason`) and the calendar (`addon.EventData.GetNextEventOccurance`) are stubs that stop the real code with what it asked for, so the tool prints a state exactly when the real code would decide one without them. Zone names come from `raw/MapVerifier.csv`.
- **`.claude/tools/Show-Achievement.ps1` (new):** resolves the kit's Lua through `KitPath.ps1`, turns `-AsOf` into UTC seconds, runs the Lua once for all ids, and inserts the `-Db` lines (from `_lookup_ids.ps1`) and the `-History` lines (`git log -G`) into each id's block.

## Options considered
- **A. The roadmap's design, a PowerShell front over a headless Lua run (recommended, accepted).** It reuses the real load and the real state code, so it answers what the game would.
- **B. A PowerShell script that greps the data files.** It cannot resolve anchors, states or AutoFactionSplit mirrors, which were the expensive part of the 10 sessions.

## Areas of concern
- **Taint and secret values, clients' addon code, plugins and skins, saved variables, localization, libraries, player-facing text:** none; tooling under `.claude/`, which is never packaged or deployed.
- **Data snapshots:** the formatter moves; the baselines must stay byte-identical (checked with `git status` after `-write` and with the `data-snapshot` rule).
- **Clients:** headless Classic is the Mists family (`client-env.lua`), so its build is the `.toc`'s 5.x interface; the 3.x (Titan) line is not modelled.
- **Offline limits:** see Open points 1 and 2; the output says when the game's calendar or season API decides.

## Open points
Choices the roadmap does not settle, taken closest to it and flagged for Krowi:
1. **The clock.** The roadmap says `time()`; since 2026-10-28 the state code compares with `GetServerTime()` (`event-clock` rule), so both are set to `-AsOf`. The realm clock is read as UTC, and the weekly-reset snap of season and `Reset` anchors (`C_DateAndTime.GetSecondsUntilWeeklyReset`) is not modelled: within a day of a reset the game in a given region can differ by hours.
2. **Season sides without an anchor.** The game's current season decides them (`docs/obtainability.md`, Seasons), which is unknown offline. As for an event, the tool names the season instead of a state. Only PvE Season 18's start has an anchor today.
3. **`-History` uses `git log -G "Ach\(<id>\)" -- DataAddons`, not `-S`.** `-S` counts occurrences, so it misses a line changed in place: for 5313 it misses 5396c704 (Release 101.0), where `Before 5.0.5` became `Until 5.0.4`. `-G` matches added and removed lines; each commit also prints the matching lines per file. Limiting it to `DataAddons/` takes about 0.4 s instead of 4 s; the `Ach(` form exists only there.
4. **Per record, the tooltip's word** (was, is, will be) from the real `GetWasIsWillBe`, next to the state that only the last record decides.
5. **`-Client` left out means both clients; `-Build` then needs a single `-Client`,** because one version cannot be both clients' build.
6. **One line in the instruction file** (`.github/copilot-instructions.md`, Offline tooling) besides the README, the skill and the agent the roadmap names: a session reads the instruction file every time and the README only on demand, so without it the tool would not be found.

## Verification
- `snapshot-data.lua -write` leaves `git status` clean; `Check-Repo.ps1 -ChangedOnly` is green.
- For 5313, 8246 and 4627 on both clients, the printed ACH, TIP, ZONE, category and EVENT lines match `Achievements.<client>.txt`, `Zones.<client>.txt` and `CategoryTree.<client>.txt`, and the state matches `docs/obtainability.md`: 5313 Past on both (Until 5.0.4 on Retail at 12.1.5; Before 5.0.4=>5.5.0 on Classic at 5.5.4), 8246 Past on both (a cutoff at its own patch), 4627 names event 423.
- `-AsOf` and `-Build` move a state: 5313 on Classic with `-Build 5.4.8` is Current.
- `Measure-Command` on a run without `-Db` stays under a second.
- `-Db` with the server up prints the names and builds; with it unreachable, a warning and the offline output.
- **Maintainer's:** the in-game comparison of the three ids (the tooltip lines and the Time Limited category on Retail and Mists Classic).

## Decision
Krowi, 2026-11-02: implement step 7 as the roadmap designs it ("implement step 7, data work will be a recurring thing in the future"). The open points above were taken by the agent, closest to the roadmap, and are for Krowi to confirm in the PR.