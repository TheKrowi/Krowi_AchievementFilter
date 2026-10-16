# Scenario test suites

`Tests/` holds the in-game test runner (`Tests.lua`, the `/kaftest` command) and the scenario suites it shares with the headless runner `.claude/tools/headless/run-tests.lua`. `Tests/Files.xml` is the last entry in the `.toc`, so the suites ship with the addon and load after everything else, but the runner is only active in debug mode (Options > General > Debug). This README neither ships nor deploys: the release zip skips every `.md` file, and deploy copies only `.lua`, `.blp`, `.tga` and `.xml` files.

The rules that lean on these suites (a bug fix is built test first; every fixed bug leaves its scenario behind) are in `.github/copilot-instructions.md` under Work-Item Lifecycle, and the kit's `krowi:process-issue` skill, with `docs/sdlc-playbook.md`, has the steps.

## Recorded and Target

Each scenario carries `Recorded`, the behaviour of the current code verified in game, and `Target`, the desired behaviour. A scenario passes when the code still behaves as recorded, and the scenarios whose target is still open are counted separately, so a behaviour change is a reviewable diff of the scenario file and the open defects stay visible without failing anything. Scenarios can carry `RecordedClassic`/`TargetClassic` where the clients differ.

## Running headlessly

`run-tests.lua` runs a suite in the vendored Lua 5.1 with WoW frames and the relevant FrameXML functions modelled from Blizzard's source. The model implements the same primitives for both clients (`-client Retail|Classic`, both by default) and provides only globals the game really has, so a call to a Blizzard local fails there too. The runner's header names the addon files each suite exercises.

```powershell
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" escape           # every scenario line and a summary
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" escape -check    # only the failures
```

`-check` prints a `<file>:<line>:` finding per failing scenario; it is what the `unit-tests` rule of `Check-Repo.ps1` runs.

A model of a secret value keeps the type the real value has: a secret name is a string that only the model's `canaccessvalue` rejects, a secret table is a table that errors when indexed and that only `canaccesstable` rejects. A stand-in of another type (a table for a name) is stopped by the code's type check, so the scenario passes with the secret-value guard removed. After writing such a scenario, remove the guard once and see it fail (2026-10-14-guide-npc-names).

## Running in game

- `/kaftest <suite>` runs a suite against the real frames (debug mode on, not in combat). `/kaftest login <suite>`, typed once, re-runs it after every `/reload` until `/kaftest login off`.
- Results go to chat and to `KrowiAF_DebugTable.Tests.LastRun`, which the game writes to disk on the next `/reload` or logout. `.claude/tools/Read-GameTests.ps1` prints that run with every line that differs from the headless run marked.
- A scenario is skipped there, with the reason stored, when state outside the scenario (a target, a foreign popup, an open menu, a UI panel) could have consumed a press.
- An addon cannot call `ToggleGameMenu` without `ADDON_ACTION_FORBIDDEN` from Blizzard's protected handlers, so the in-game press runs Blizzard's Escape chain as far as an addon may: the 12.1 handler registry on Retail, the legacy chain on Classic. `Tests/Escape.lua` documents both and their sources, and the headless model implements the same primitives.
- The in-game press never shows the game menu itself (its OnShow builds Blizzard's menu buttons in addon execution) and is not made at all when outside state could consume it.
- A suite can register a readiness check (`addon.Tests.Ready[<suite>]`); a login run waits for it, a manual run reports why it cannot run.

## Suites

| Suite | File | What it covers |
|---|---|---|
| `escape` | `Escape.lua` | Escape-key handling of the addon's frames. |
| `special` | `SpecialCategories.lua` | Watch List, Excluded and Tracking membership and the rebuilds their layout options trigger, driven through the real option setters in game and through the reset-and-reload functions headlessly, on fake achievements. The player's own watched and excluded achievements are snapshotted and restored. |
| `navigation` | `Navigation.lua` | Which navigation buttons each tab of the achievement window shows: Blizzard's 12.1 Back and the addon's browsing-history arrows (issue #325). Tabs are selected through the addon's own toggle, and headlessly the real `LoadWithBlizzard_AchievementUI` runs against a model of Blizzard's tab switching. The window and its selected tab are restored. |
| `worldmap` | `WorldMap.lua` | Whether the world map button stays in front of the Classic map when it resizes or another addon sets its strata. The map is opened and resized through the player's paths, and headlessly the real Krowi_WorldMapButtons library and button load against a model of the Mists map. No scenarios on Retail, whose map never sets its own strata. The map's size, open state, strata and `miniWorldMap` CVar are restored, also after an error; the run taints the map until the next `/reload`, so reload before combat. It refuses to run while ElvUI, GW2_UI or Leatrix Maps is loaded. |
| `obtainable` | `Obtainable.lua` | The record an `Obtainable()` call stores, the obtainable state it gives and what the data load reports about it, on fake achievements and real data: headlessly on the real data load of `client-env.lua`, and the in-game run drops what the fakes reported. |
| `tooltip` | `Tooltip.lua` | Whether the achievement tooltip's transmog set progress section finishes on a client without the global `GetItemInfo`, which 12.1.5 removed. In game the real tooltip of 40469 is built after the suite's Ready check has the set items cached, with the global cleared for the run and restored after, which taints that key until the next `/reload`; headlessly the real section runs against a model of the transmog and item APIs. It also records that the Most progress section shows on such an achievement (seen as neither completed nor account-wide), as the maintainer decided for 2026-10-11-latent-bugs. Retail only. |
| `guide` | `Guide.lua` | Achievement guides and their waypoints (docs/work/2026-10-11-achievement-guides).<br>**Surfaces:** the tooltip and the right-click menu of 60962 and 11223, with the guide options set for the run and restored after. The menu's guide section runs into a recording menu builder, so no real menu opens.<br>**Logic:** the research state of a garrison talent, the steps each faction sees, and the waypoint actions per provider. All of it runs on tables written in the suite, so the result is the same on any character.<br>**Side panel and selected-achievement block:**<ul><li>the waypoint controls they draw, icons or text links;</li><li>hovering, then pinning, the panel;</li><li>chaining the panel next to another side panel open for the same row, using a stand-in frame.</li></ul>**NPC names** (docs/work/2026-10-14-guide-npc-names): whether an NPC step shows the client's name for the NPC or the data's English fallback (a cached NPC, an unknown one, a secret name, secret tooltip data), and which NPCs the login warm-up asks the client for. The two secret cases run headlessly only; the game skips them.<br>**Live check:** whether Acherus and Dalaran allow the map pin.<br>Headlessly, the guide files run against a model of the garrison, map, spell, POI and creature-name APIs on a Death Knight; until they exist, every scenario gets "none". Classic runs only the faction and waypoint scenarios. |
| `menu` | `Menu.lua` | Whether a right-click "go to" entry for an achievement the addon does not register ("(Missing)") is greyed out, next to one for a registered achievement (2026-10-11-latent-bugs). In game the entry is built into a real root menu, a Blizzard menu description on Retail and a Krowi_Menu_2 menu item on Classic, for the first id the game knows and the addon does not register; headlessly the real `AchievementMenu.lua` runs against a model of the menu builder's enabled rule. Nothing is shown and nothing needs restoring. |

## Adding a suite

A new suite is a `Tests/<Suite>.lua` registered in `Tests/Files.xml`, a `suites.<name>` in `run-tests.lua`, its name in the suite list of `.github/copilot-instructions.md` (Offline tooling) and a row in the table above.