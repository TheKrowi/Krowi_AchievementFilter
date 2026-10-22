# Intent: Free tracking slots held by completed achievements
Author: Krowi (maintainer), captured by Claude. Source: idea, after the CurseForge addon Untrack Completed Achieves (https://www.curseforge.com/wow/addons/untrack-completed-achieves). Status: accepted

## Problem
The game lets a character track 10 achievements. An achievement that stays tracked after the character earned it still takes one of those slots, but the tracker hides it: Blizzard's objective tracker on Retail and its watch frame on Classic both skip what the character earned. It happens after a crash before the game saved, or when an achievement is tracked on one character and completed on another. The player then clicks Track in KAF and gets "You may only track 10 achievements at a time." with fewer than 10 on the tracker, and nothing in the game shows which achievements hold the hidden slots. Today the only way out is to find each one in the achievement window and untrack it there.

The CurseForge addon Untrack Completed Achieves (Retail only, about 29K downloads, updated 2026-10-14) exists only for this, and a Blizzard forum thread (https://us.forums.blizzard.com/en/wow/t/tracking-achievements/1940790) reports seven such achievements on one character.

## Proposed outcome
When the player tracks an achievement in KAF and all 10 slots are taken, KAF first stops tracking the achievements that are already done, says in chat which ones, and then tracks the one the player clicked. When nothing can be freed, the player gets the same message as today.

## Affected users and systems
- Every client the TOC lists: Retail (12.1.5), Mists Classic (5.5.4) and Titan Reforged (3.80.2). Each caps tracking at 10 and hides earned achievements from its tracker.
- Every way to track in KAF: the Track checkbox on an achievement row, the Toggle Tracking modifier click (Options > General > Key Binding > Modifiers), and both on a popped-out achievement. All of them go through `ToggleTracking`.
- Blizzard's objective tracker (Retail) and watch frame (Classic), which redraw when tracking changes.
- No options, saved variables or data files.

## Constraints
- No new taint path. KAF already calls the tracking API from its own code when the player clicks Track; the change adds calls only inside that click. That is why the CurseForge addon's approach, a scan at every loading screen, was rejected.
- Never untrack an achievement this character can still make progress on.
- Classic keeps using its own tracking API.

## Open questions
- Which tracked achievements count as done: only the hidden ones (earned by this character), also account-wide ones the account completed, or everything the account completed, as the CurseForge addon does?
- What the chat line says, and whether it needs a new localized string.