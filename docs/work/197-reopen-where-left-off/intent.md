# Intent: The achievement window does not reopen where the player left it
Author: rowaasr13 (reporter), with a second report from Smuglerz on CurseForge (2026-10-14). Source: GitHub issue #197. Status: done

## Problem
After a fresh install, closing the achievement window and opening it again does not bring the player back to the tab, category and achievement they left. The player has to find the achievement they were working on again every time. The options already show the defaults that should keep the view (Reset view on open off, Toggle window once opened on). The first reporter found that unticking and re-ticking those options made the addon behave, without the settings visibly changing. The second reporter expects the behaviour of Blizzard's own window, which reopens where it was closed.

## Proposed outcome
On a fresh install, with the default options, opening the achievement window again (with Y, the micro button or the addon's tab bindings) shows the tab, category and selected achievement the player left. Toggling options is not needed to get there.

## Affected users and systems
- Every new player, on every client the TOC claims (Retail 12.1.5, Mists Classic 5.5.4, Titan 3.80.2), and players who switch characters or binding sets.
- The achievement window and its tabs; the first-run setup that puts the addon's Achievements tab first and moves Y to the addon's binding (`KrowiAF_SavedData.FirstTimeSetUp.AchievementTabsSwitched`, account-wide).
- Options: Reset view on open, Toggle window once opened, the micro button's tab and its "Bind to Y" button.
- The game's key bindings, account-wide or per character.
- Other ways into the window that go through Blizzard's toggle: achievement toasts, chat links, Blizzard's own Toggle Achievements binding. Skins that hook that toggle (GW2_UI).

## Constraints
- No taint: no new overrides of Blizzard functions, no binding changes in combat.
- A player who bound Y to something else on purpose keeps that binding.
- Players who already have the first-run flag saved keep their settings and their tab order.
- Retail and Classic share the code; neither may regress.

## Open questions
- What `GetBindingByKey("Y")` returns while the addon loads, compared with after login (the in-game check). If the key bindings are not loaded yet at that point, the move of Y can never work.
- Whether players whose first run already happened should get the move of Y retried, given that some of them bound Y back to Blizzard's toggle on purpose.
- Whether Blizzard's toggle (toasts, links, Blizzard's binding) should also reopen where the player left off.
- Why toggling the options fixed it for the first reporter.