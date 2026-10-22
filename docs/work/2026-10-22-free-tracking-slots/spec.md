# Spec: Free tracking slots held by completed achievements
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. When the player tracks an achievement in KAF while `MAX_TRACKED_ACHIEVEMENTS` (10) achievements are tracked, KAF first untracks every tracked achievement that is done (requirement 2), then tracks the clicked one when a slot is free.
2. A tracked achievement is done when this character earned it, or it is completed and is a guild or account-wide achievement, or the game no longer knows its id.
3. For each achievement untracked this way, KAF prints one chat line, `Krowi's Achievement Filter - Stopped tracking completed achievement: [link]`, with the achievement's id in place of the link when the game has none. The text is a new localized string, in every locale file.
4. When none of the tracked achievements is done, the player gets today's "You may only track 10 achievements at a time." and nothing is untracked or printed.
5. Below the cap, tracking behaves as today: nothing is untracked, nothing is printed.
6. Clicking an achievement that is itself completed (by the Earned By filter) is refused with "This achievement has already been completed." and frees nothing, also when 10 are tracked.
7. Untracking an achievement behaves as today.
8. A freed achievement shown in KAF (an achievement row or a popout) shows as untracked afterwards.
9. All of it works on Retail, Mists Classic and Titan Reforged.

## Design
Recommended rule for requirement 2 (option 1 below): untrack when `wasEarnedByMe`, or `completed` and (`isGuild` or the `ACHIEVEMENT_FLAGS_ACCOUNT` flag), or `GetAchievementInfo` returns nothing.

- **Why this rule.** Blizzard's tracker hides exactly what the character earned (`wasEarnedByMe`: Blizzard_AchievementObjectiveTracker.lua:106 on live, WatchFrame.lua:776 in the classic branch's Wrath folder), so those are the hidden slots. Blizzard's own Track button refuses only `wasEarnedByMe` or a completed guild achievement (Blizzard_AchievementUI.lua:1631, live): it deliberately lets an alt track a character achievement another character of the account completed, because the alt can still earn it. An account-wide achievement the account completed cannot progress any further, so it is dead weight even though the tracker still shows it. An id the game no longer knows can never show.
- **Where.** A small function lists the tracked ids (`C_ContentTracking.GetTrackedIDs(Enum.ContentTrackingType.Achievement)` on Retail, `GetTrackedAchievements()` on Classic), untracks the done ones through `RemoveTrackedAchievement`, the call `ToggleTracking` already makes, prints the lines and returns how many it freed. Its file and name are for the plan; it takes the game's API as a replaceable source, so the test suite can run it on a model, in game as headlessly (the pattern of `Data/EventScheduler.lua`).
- **`ToggleTracking`** (Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua:649): the completed refusal (lines 665-671) moves above the cap check (lines 659-663), so a refused click frees nothing (requirement 6). At the cap it calls the function, counts again and shows today's error only when the count is still at the cap.
- **When it runs.** `ToggleTracking` runs only from a click in the achievement window or a popout, and both load Blizzard_AchievementUI first (Gui/Gui.lua:201, Gui/AchievementPopout/AchievementPopout.lua:271), so KAF's Retail shims `RemoveTrackedAchievement` and `GetNumTrackedAchievements` (Gui/BlizzardOverrides.lua:119-130) exist by then.
- **Freed rows.** The achievement rows listen to `TRACKED_ACHIEVEMENT_LIST_CHANGED` (AchievementButtonMixin.lua:221-222) and redraw their Track check from it. Whether `C_ContentTracking.StopTracking` fires that event on Retail is checked in game; if not, the function refreshes the freed achievements' rows itself.

- **The chat line** follows the addon's other chat output (`print(addon.Metadata.Title, "-", ...)`, Gui/EventReminder/AlertSystem.lua:191): `Krowi's Achievement Filter - Stopped tracking completed achievement: [Loremaster of Outland]`.

## Options considered
Which achievements count as done:
1. **Earned by this character, completed account-wide or guild, or unknown (recommended).** Frees the hidden slots and the dead account-wide ones; keeps character achievements an alt can still earn.
2. **Only the hidden ones: earned by this character, or unknown.** The smallest change; it frees exactly what the player cannot see. A completed account-wide achievement keeps its slot, but it shows on the tracker, so the player can untrack it there.
3. **Everything the account completed, as the CurseForge addon does.** Also untracks a character achievement an alt tracked on purpose after the main earned it, which Blizzard allows and the alt can still earn.

KAF's Earned By filter (Account, Character, Character and Account) was considered as the rule and rejected: it decides what KAF shows as completed, not whether a tracked achievement can still progress, and with Account it would untrack the alt's character achievements of option 3.

The chat line:
- **A. Blizzard's own "Untrack" (`OBJECTIVES_STOP_TRACKING`, recommended).** `Krowi's Achievement Filter - Untrack: [link]`, already translated in every client language and present on Classic (WatchFrame.lua:100); no CurseForge round trip.
- **B. A new string**, for example `Stopped tracking completed achievement: [link]`. Reads clearer, but adds a string to every locale file, a translation per locale and an export to CurseForge.

Rejected earlier (exploration, 2026-10-22): a scan at login or every loading screen, as the CurseForge addon does. It would call the tracking API from KAF's code without any click, for every player with a stale slot (see taint below), and would act on achievements the player never touches in KAF.

## Areas of concern
- **Taint and secret values.** `C_ContentTracking.StopTracking` fires `CONTENT_TRACKING_UPDATE` synchronously (ContentTrackingDocumentation.lua, `SynchronousEvent = true`), so the objective tracker's handler runs inside KAF's call. Its `MarkDirty` sets `dirty` and schedules the redraw with `RunNextFrame` (`C_Timer.After`) from that tainted execution (Blizzard_SharedXML/MixinUtil.lua:346-352). This is the path behind 99.4's "secret number value in the Objective Tracker's cooldown display" (_Packaging/Changelog.md:150); the `securecall` around it does not launder taint. KAF's Track checkbox already takes this path on every click (Gui/BlizzardOverrides.lua:119-141); the change adds calls only inside such a click, never on its own. Unknown: whether one such call leaves the tracker's `dirty` field insecure for the rest of the session; the suite records it in game (Verification). Secret values: `GetAchievementInfo`, `GetTrackedIDs` and `GetTrackedAchievements` take plain ids and return no secrets; the tracking functions are `SecretArguments = "AllowedWhenUntainted"`, which concerns secret arguments only. `krowi:taint-reviewer` runs on the diff.
- **Clients.** Retail through `C_ContentTracking` and KAF's shims; Mists Classic and Titan Reforged through the native `GetTrackedAchievements`/`RemoveTrackedAchievement`. `ACHIEVEMENT_FLAGS_ACCOUNT` is defined on every branch (Blizzard_FrameXMLBase Constants.lua in live, classic and classic_titan). Titan Reforged has no local install, so it is covered headlessly only.
- **Blizzard API changes.** None pending; `Find-DeprecatedApi.ps1` runs on the diff.
- **Other addons, plugins and skins.** None address the Track checkbox. With Untrack Completed Achieves installed as well, it frees slots at loading screens first and KAF then finds nothing to free; no conflict.
- **Saved variables and migrations.** None.
- **Localization.** One new string, `Stopped tracking completed achievement`, in `enUS.lua` and every other locale file below the `Exported at` line, translated per locale, and exported to CurseForge through `krowi:localization`.
- **Embedded libraries.** None.
- **Data snapshots.** None, no data touched.
- **Background jobs.** None: the code runs only in a click and registers no event.
- **Player-facing text.** The chat line, and a changelog line under the next version's `### Added`.

## Verification
- A new suite `tracking` (`Tests/Tracking.lua`, `/kaftest tracking`, and `suites.tracking` in `run-tests.lua`) runs the real `ToggleTracking` and the new function on a model of the tracking API with a fixture of tracked achievements. Each scenario records what is untracked, what is printed, and whether the clicked achievement ends up tracked or which error shows:

  | Scenario | Recorded (today) | Target |
  |---|---|---|
  | 10 tracked, 2 earned by this character, click a new one | too many; nothing untracked | the 2 untracked and printed; the new one tracked |
  | 10 tracked, 1 account-wide completed by another character | too many | it is untracked and printed; the new one tracked |
  | 10 tracked, 1 character achievement completed by another character | too many | too many; nothing untracked |
  | 10 tracked, 1 id the game does not know | too many | it is untracked and printed with its id; the new one tracked |
  | 10 tracked, none done | too many | too many |
  | 9 tracked, 1 earned | the new one tracked; nothing untracked | the same |
  | 10 tracked with 1 earned, click a completed one | too many | already completed; nothing untracked |

  The same scenarios on Classic through the Classic API model.
- Game-only observations in the same suite: which of the player's real tracked achievements the rule would free, without freeing them; and, after tracking and untracking one not-yet-earned achievement through `ToggleTracking` (the player's tracking restored after), whether `TRACKED_ACHIEVEMENT_LIST_CHANGED` fired and whether `ObjectiveTrackerFrame`'s `dirty` field is still secure (`issecurevariable`).
- The in-game before-run on Retail is green before the change; after it `Recorded` equals `Target`, and the after-run on Retail and Mists Classic is green, with `Read-GameErrors.ps1` clean.
- `Check-Repo.ps1`, `Find-DeprecatedApi.ps1`, `krowi:taint-reviewer` and `/code-review` on the diff.

## Decision
Chosen by the maintainer on 2026-10-22: free slots only when the player tracks at the cap (option A of the exploration, not a login scan); untrack what this character earned, completed account-wide or guild achievements, and ids the game no longer knows (option 1); the chat line is a new KAF string (option B), `Stopped tracking completed achievement`.