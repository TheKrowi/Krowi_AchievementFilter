# Intent: The world map button disappears on Classic after resizing the map
Author: Krowi (maintainer), captured by Claude. Source: error report (in game, Mists of Pandaria Classic, 2026-10-02). Status: accepted

## Problem
On Classic, the addon's achievement button at the top right of the world map disappears as soon as the player switches the map between its small and its full-screen size with the maximize/minimize button. Switching back does not bring it back; only a `/reload` does. Until then the player has no way to open the achievements of the map's zone from the map. RareScanner puts a button in the same corner through the same library (Krowi_WorldMapButtons), and its button survives the size change, so the library is not the cause; the way this addon uses it is.

## Proposed outcome
The button stays visible at the top right of the world map in both map sizes, however often the player switches between them, and it keeps its current place next to other addons' buttons. Its tooltip and click work as before.

## Affected users and systems
- Classic (Mists of Pandaria Classic, 5.5.4, the live Classic client); the Cataclysm map code it shares applies to Cata Classic as well. Wrath Classic and Retail are named in the constraints only.
- The world map button (`Gui/WorldMapButton/`), shown when the option "Show world map icon" (`ShowWorldmapIcon`) is on.
- Players who run other addons that add a button through Krowi_WorldMapButtons (RareScanner), and players who use ElvUI's smaller world map, which the ElvUI plugin already handles on Wrath Classic.
- No saved variables, options, localization or data files.

## Constraints
- Retail keeps its button exactly as it is.
- The library is not edited; the fix lives in this repository.
- Other addons' buttons from the same library keep working and keep their order.
- No new taint: the world map is a Blizzard frame, so any hook on it is reviewed for taint.

## Open questions
- Is it enough to place the button the way RareScanner does, or does the button need to be restored after every size change?
- Does the ElvUI smaller-world-map fix, today limited to Wrath Classic, need to apply on Mists Classic too?