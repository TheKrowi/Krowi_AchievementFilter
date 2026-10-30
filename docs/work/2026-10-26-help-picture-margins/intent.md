# Intent: Help pictures cut too tight
Author: Krowi (maintainer), from the Window picture in the options window's enlarged view, 2026-10-26. Source: idea. Status: done

## Problem
The Window help picture is cut to the achievement window's frame rectangle. The soft edge fades the window's own left and right borders, the close button is half gone, the bottom of the tabs is cut off, and a game tooltip for a unit ("Neighborhood Watch, Level 90") covers the bottom right corner and the Specials tab.

The old tutorial pictures were cut to a frame's visible edges, expanded with black and faded from black to transparent, so the whole frame showed. Most other help pictures that show a whole frame have the same tight cut: MenuMain, TipCategory, Reminders, GuidePanel (its close button is cut), PopOut, RewardPreview, SearchBox, CalendarDays and the sides of the tooltips.

## Proposed outcome
Every help picture shows the frames in it whole, on black that fades out around them, like the old tutorial pictures. Where a picture deliberately cuts through something (the top of a long tooltip, the top of the category list, the summary bars, the map under the map button), that cut keeps today's soft edge. No picture shows a tooltip of the game.

## Affected users and systems
- The options window's help pane and its enlarged view, on every client (one set of pictures, made on Retail). Version 105.0, not released yet, so no player has seen these pictures.
- `Media/Help/*.tga` and the generated `Options/Window/Help/Pictures.lua`.
- The game-only `pictures` suite (`Tests/Pictures.lua`, debug mode) and `.claude/tools/Make-HelpPictures.ps1`.
- No options, saved variables (only the debug table's runs), data files, locales or libraries.

## Constraints
- The pictures run only reads Blizzard's frames: no write, no hook, no CVar.
- Textures stay power-of-two RLE TGAs with the longest side at most 1024 px.
- The pane and the enlarged view keep working from each picture's natural size and texture coordinates.

## Open questions
- 25 or 50 px of black, as the old pictures had? Answered from the old pictures in the spec: 50.