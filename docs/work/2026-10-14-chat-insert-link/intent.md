# Intent: Paste-to-chat calls a deprecated global
Author: Krowi (maintainer), captured by Claude. Source: idea (deprecated-API scan across Krowi's addons, 2026-10-14). Status: accepted

## Problem
Nothing is broken for players today. Pasting an achievement link into chat with the paste-to-chat modifier in the addon's window calls `ChatEdit_InsertLink`, which every client the addon supports now keeps only as a deprecated alias. When Blizzard deletes that alias, as 12.1.5 just did with the item globals, the modifier click errors and no link is pasted.

## Proposed outcome
Paste-to-chat keeps working after Blizzard removes the old chat globals, on every client.

## Affected users and systems
Players on Retail 12.1.5, Mists Classic 5.5.4 and Titan Reforged 3.80.2 who paste achievement links from the addon's achievement list with the paste-to-chat modifier (option Achievements > Modifiers > Paste To Chat).

## Constraints
No visible change. The same link is inserted into the same edit box, and the social-post and fallback branches after it stay as they are.

## Open questions
None.