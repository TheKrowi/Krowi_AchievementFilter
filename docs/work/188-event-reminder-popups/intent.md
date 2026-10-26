# Intent: Event reminder pop-ups keep their position, and placeholders can be hidden
Author: NoShotz (#188, 2024-01-17), Spekkio (#364, from CurseForge, 2025-10-13); further reports from Profion85 (2024-08-06) and Rhindle (2026-02-05) on CurseForge. Source: GitHub issues #188 and #364. Status: accepted

## Problem
**#188, the position resets.** A player sets Event Reminders > Pop ups > Location (X and Y offset) and the pop-ups move there, but after the next pop-up, or after a `/reload`, they are back in the middle of the screen. NoShotz's screenshots show Y offset 1045 (near the top) and a placeholder drawn there, then the next placeholder drawn about mid-screen. With only KAF enabled the position held; the culprit on their side was Dominos Roll. Three more players reported the same on CurseForge, without naming addons. Retail; the code is the same on Classic.

**#364, placeholders that do not stop.** Pressing Show placeholders queues one placeholder for every calendar event the addon knows (24 on Retail, 12 on Classic), each for 60 seconds, a few at a time. With few pop-ups at a time (NoShotz: 1) one press keeps placeholders coming for many minutes, and each press adds another full set. There is no way to stop them but right-clicking each one. Spekkio asks for a Hide placeholders button and says they kept showing even after a reload, until a relog. While queued, the placeholders also stop looking like placeholders: they show "Collecting data" or a real event's name.

## Proposed outcome
- An addon that places the game's alerts (a full UI replacement such as ElvUI, GW2_UI or EllesmereUI, or Dominos Roll) wins: KAF's pop-ups go with the game's alerts wherever that addon puts them, and KAF's location settings say so instead of pretending to work.
- Without such an addon, KAF's location settings move the pop-ups, and stay put, after every pop-up and after a reload. The player chooses whether they move every alert, as today, or only the event reminders.
- Show placeholders shows a short preview of the pop-ups at their position; a Hide placeholders button next to it removes them at once.
- Showing placeholders never changes the player's real events.

## Affected users and systems
- Every player with event reminders on (the default), on Retail and Classic (Mists, and Titan in China), and through the anchoring code every player, reminders on or off, for the game's own toasts.
- Players of ElvUI, GW2_UI, EllesmereUI and Dominos Roll, which move Blizzard's alert frame; KAF's ElvUI, GW2_UI and EllesmereUI plugins disable the pop-up location options and skin each pop-up.
- Options: Event Reminders > Pop ups > Location (grow direction, spacing, X and Y offset, Show placeholders) and Other (max number of alerts, fade delay), defaults in `Options/Defaults.lua`; the options window's Show me for the event reminder sections.
- Saved variables: `KrowiAF_SavedData.AlertSystem` (the grow direction the anchoring reads), the reminder bookkeeping in `KrowiAF_SavedData`.
- The `pictures` suite (`Tests/Pictures.lua`) and the `events` suite, which read the pop-ups' sub-system.

## Constraints
- No taint: KAF must not write into Blizzard's `AlertFrame` or its sub-systems (workspace rule: never add or replace fields on Blizzard frames), and must not fight another addon over the alerts' position.
- The plugins' skins and the options window's Show me must keep working.
- Retail and Classic share the code; neither may regress. Pop-ups must still wait while the game holds its alerts back (loading in, the What's New splash).
- Players keep their offsets, grow direction and spacing.

## Open questions
- Answered at the design gate (spec.md, Decision): what the location settings move, how KAF knows another addon places the alerts, what a placeholder shows, what Hide removes.
- Why Spekkio's placeholders came back after a reload. The #364 analysis found nothing placeholder-related in saved variables, and login and reload take the same path, so it is most likely the real On Reload reminders (on by default), which look the same; to confirm in game.

## Decision on scope
#188 and #364 touch the same pop-up code and are one work item with one PR closing both: Krowi, 2026-10-26, relayed by the coordinating session.