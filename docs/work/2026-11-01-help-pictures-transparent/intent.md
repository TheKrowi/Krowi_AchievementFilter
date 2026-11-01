# Intent: Help pictures without a black box
Author: Krowi, maintainer. Source: idea (Krowi, 2026-11-01, with a screenshot of the Categories help). Status: accepted

## Problem
Since the options window took the look of the game's own Options window (#379), its help pane is dark grey. Every help picture made in #376 sits in a box of black: the margin the tool adds beside a frame's own edge, faded only at its outer edge, and the run's black backdrop inside the cut (above the window beside the category list, between the tabs, beside the map). On the grey pane the black reads as a frame around the picture.

## Proposed outcome
The black around the frames is transparent, so the pane's grey shows up to the frame's own border. The soft fades where a picture cuts through content stay.

## Affected users and systems
Every player who opens the options window's help pane or its enlarged view, on Retail and Mists (Mists shows Retail's pictures). The 19 files in `Media/Help/`, and `.claude/tools/Make-HelpPictures.ps1`, which makes them. No option, saved variable or string.

## Constraints
- The frames themselves stay as they are, their dark parts too (a tooltip's or menu's background, the window's dark wood, the tabs' art).
- The pictures keep their size and place in the pane unless Krowi chooses otherwise.
- The run data behind 15 of the 19 pictures is gone (the saved variables keep the last 5 runs), so a remake of those needs a new `/kaftest pictures` run.

## Open questions
- Can the existing pictures be converted without a new run?
- Does the empty room beside a frame's edge stay, now that it is no longer black?