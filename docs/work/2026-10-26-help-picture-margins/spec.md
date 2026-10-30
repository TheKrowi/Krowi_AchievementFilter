# Spec: Help pictures cut too tight
Intent: [intent.md](intent.md). Status: done

## Requirements
1. Each side of a help picture where a frame's own edge shows, with the run's black backdrop beyond it, is cut at the frame's visible edge and gets 50 px of black that fades to transparent with the old tutorial pictures' curve (alpha 2 at the edge, 80 at 16 px, 187 at 24 px, 253 at 40 px), so the frame itself stays fully opaque.
2. Each side where a picture cuts through content keeps today's soft edge (`-Fade`, 18 px).
3. The Window and NewTabs pictures hold the whole tab art, also the selected tab, which hangs lowest.
4. No picture shows the game's tooltip (`GameTooltip`): a step waits while it covers the cut, and fails without recording the picture after 30 s.
5. A picture's natural size in `Pictures.lua` includes its margin, so the enlarged view shows the frame at its own size with the black around it.
6. With its margin a picture's longest side stays at most 1024 px; the textures stay power-of-two RLE TGAs.

## Root cause
- **The tabs:** `Edges` takes a frame's own rectangle (`Tests/Pictures.lua:48-68`). Blizzard's `AchievementFrameTabButtonTemplate` is a 115x32 button whose textures are 59 high and anchored at its top (`wow-ui-source\live\Interface\AddOns\Blizzard_AchievementUI\Mainline\Blizzard_AchievementUI.xml:246-258`), so the tab art hangs below the cut. Run of 2026-10-25 18:26: Window cut at 115,58-1217,1075 px, tab art down to 1094 px.
- **The edges:** `Make-HelpPictures.ps1:268-282` fades every picture over its outer 18 px with no margin, on a cut that is the frame's rectangle, so the frame's own border lies in the fade. Window: left border at 117 px (cut at 115), close button to 1215 px (cut at 1217).
- **The tooltip:** the newest run's Window screenshot (`WoWScrnShot_102526_212851`) has the game's tooltip for the unit under the mouse. `Cleanup` closes only the addon's own tooltips (`Tests/Pictures.lua:638-650`), and the game shows a unit tooltip again while the mouse rests on the unit. The tool takes each picture from the newest run that has it.
- **The old pictures** (`86777e68^:Media/*.tga`, measured along each side's middle): where a frame edge shows, content starts 49 to 53 px in (EventReminder, TabButton, FullSearch, Calendar, RightClickMenu, EarnedBy, TooltipAchievements); a few have 20 to 27 px (Summary, Categories, QuickSearch, CompactAchievements). The alpha curve is the same on every picture.
- **Reproduction:** Krowi's screenshot of the Window picture in the enlarged view (2026-10-26), and `Media/Help/Window.tga` at `c28007d9`.

## Design
- **The tool decides per side from the screenshot.** A line is black when at most 0.5% of its pixels are brighter than the backdrop (R+G+B above 40). From the cut outward, a side passes lines with content for up to 24 px: a border drawn just outside the frame's rectangle (the menu's, 1 px), the calendar's close button and bottom border (4 and 6 px), the tab art (19 px). At the first black line the side is an edge, and the cut takes in the lines it passed. Without a black line within 24 px the side is still an edge when at most 15% of the line 3 px out is bright: the guide panel and the reward preview lie over the window's border, which crosses their top and bottom lines. Otherwise, or at the screen's border, the side is a cut. A picture taken in parts (Colors) has a left or right edge when every part has one, a top edge from its first part and a bottom edge from its last.
- An embedded frame that ends at the window's own border passes over it to the black beyond: the category list takes the window's left border, the compact list its right border and the tabs. That is how the old Categories, CompactAchievements and Summary pictures were cut (20 to 27 px of margin).
- **An edge side** is trimmed inward over black lines to the first line with content, then gets `-Margin` (50) px of black and the old curve over its outer 40 px. **A cut side** keeps the `-Fade` curve as now. The picture is scaled so that, with its margins, it fits `-MaxSide`. Its natural size is its final size in pixels, back through the scale, times the run's units per screenshot pixel. The tool prints which sides got the margin.
- **The tooltip:** before the screenshot, a step whose cut (grown by 10 px) is covered by a visible `GameTooltip` names this in its banner and waits up to 30 s for the player to move the mouse; then it FAILs without recording the picture, so the tool keeps an earlier run's.
- **More room where Krowi asked for it** (the review of 2026-10-29, plan.md): a step can grow its cut by UI units per side, so a side through the window fades out over the window rather than over the frame. The run records the frames' own rectangle beside the grown cut, and the tool tests each side along that rectangle's length, so the window taken in beside a frame does not make the frame's other sides a cut.
- At the gate the option said the run would record which sides are a frame's edge. The screenshot gives the same answer for the same pictures, also for the runs already recorded, and it follows the backdrop that is really there: the map stays visible under the map button (`Floor`), and the colour rows have their neighbours above and below. A first build also took the tab art from the tab buttons' regions in the run (`Art = true`); the tool's reach over the art made that unneeded, so the run changes only for the tooltip, and of the recorded pictures only Window (the tooltip) needs a new shot.

## Options considered
1. **Recommended, chosen:** the design above.
2. The run records per side whether `Edges` cut it (`Top`, `Bottom`, `MaxHeight`). Not chosen: a frame inside a frame (the summary bars, a colour row, the map button over the map) has its own edge on content, not on black, so each step would need flags of its own, and nothing could be checked before a new run.
3. A fixed margin on every side of every picture. Not chosen: black between content and the fade where a picture cuts through.
4. The Window picture only, or the one-off picture from the 18:26 screenshot. Turned down at the gate.

## Areas of concern
- **Taint and secret values:** the run reads `IsVisible`, `GetLeft` and the like on `GameTooltip`, and writes nothing to it. It never hides `GameTooltip`: from addon code its `OnHide` would run tainted (the tooltip root cause of #300). The run is out of combat; the tooltip check runs in a `pcall`. After the review the run also moves the addon's own reward preview, sets the addon's own event reminder buttons transparent, and moves the right-click menu the scene opened (Retail; Mists opens it again through the addon's own menu builder). Two exposures it shares with the scenes and the addon's own window toggle, found by the taint review of 2026-10-30: opening or closing a menu on Retail has Blizzard's menu manager redraw the list under the cursor, tainted when that list is Blizzard's (the scenes' menus and the clean-up's close; the move adds no open or close), and `AchievementFrame:Hide()` in the calendar and reminders steps and at the end runs the window's close handler from addon code, as `Gui/Gui.lua`'s toggle does.
- **Clients:** the pictures come from Retail and show on every client. A Mists run takes the same tooltip wait.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** a skin can recolour the frames; the black beyond a frame decides, not the frame's colour.
- **Saved variables:** `KrowiAF_DebugTable.Pictures` keeps its shape; each shot gains `Inner`, and a run without it reads as before.
- **Localization, libraries, data snapshots:** none.
- **Player-facing text:** none. 105.0 is not released and its changelog already says the pictures are new, so no changelog line.

## Verification
- No scenario: `pictures` is a game-only suite that makes the pictures; the headless `help` suite (each picture has its size and file) stays green, with `Check-Repo.ps1`. The reproduction is above.
- The tool on the runs already recorded, with `-Preview` and `-Verbose` (each side's finding): every picture's sides reviewed against its screenshot.
- In game on Retail: deploy, Krowi's look at the pictures in the pane and the enlarged view, then `/kaftest pictures window` with the mouse off any unit, `/reload`, `Read-GameTests.ps1`: no FAIL. Then `Make-HelpPictures.ps1` makes Window from the new shot, and a deploy.
- A Mists `/kaftest pictures` run shows the run's change works there.
- `krowi:taint-reviewer` on the `Tests/Pictures.lua` change, `/code-review` before the PR.

## Decision
Krowi, 2026-10-26, at the design gate (intent accepted with it): **whole-frame pictures**, out of whole-frame pictures, the Window picture only, and the one-off picture from the 18:26 screenshot. 50 px of black from the old pictures' measurement. After the gate the side check moved from the run to the tool's reading of the screenshot (Design); the pictures it gives are the ones the option described.

Krowi, 2026-10-29: a review of every picture asked for more room on nine of them and the whole summary in place of its bars (plan.md, the departure). Krowi, 2026-10-30: "all pictures look good now on retail".