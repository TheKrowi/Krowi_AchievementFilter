# Spec: Help pictures cut too tight
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. Each side of a help picture where a frame's own edge shows, with the run's black backdrop beyond it, is cut at the frame's visible edge and gets 50 px of black that fades to transparent with the old tutorial pictures' curve (alpha 2 at the edge, 80 at 16 px, 187 at 24 px, 253 at 40 px), so the frame itself stays fully opaque.
2. Each side where a picture cuts through content keeps today's soft edge (`-Fade`, 18 px).
3. The Window and NewTabs cuts hold the whole tab art, also the selected tab, which hangs lowest.
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
- **The tool decides per side from the screenshot.** A side is an edge when the line 3 px outside the cut is black, that is, at most 0.5% of its pixels are brighter than black; otherwise, or at the screen's border, it is a cut. A picture taken in parts (Colors) has a left or right edge when every part has one, a top edge from its first part and a bottom edge from its last.
- **An edge side** is trimmed inward over black lines to the first line with content, then gets `-Margin` (50) px of black and the old curve over its outer 40 px. **A cut side** keeps the `-Fade` curve as now. The picture is scaled so that, with its margins, it fits `-MaxSide`. Its natural size is its final size in pixels, back through the scale, times the run's units per screenshot pixel. The tool prints which sides got the margin.
- **The run:** a cut-out may carry `Art = true`, the frame's rectangle together with its shown regions; the tab buttons of the `tabs` and `window` steps use it. Its black overhang is trimmed by the tool.
- **The tooltip:** before the screenshot, a step whose cut (grown by 10 px) is covered by a visible `GameTooltip` names this in its banner and waits up to 30 s for the player to move the mouse; then it FAILs without recording the picture, so the tool keeps an earlier run's.
- At the gate the option said the run would record which sides are a frame's edge. The screenshot gives the same answer for the same pictures, also for the runs already recorded, and it follows the backdrop that is really there: the map stays visible under the map button (`Floor`), and the colour rows have their neighbours above and below.

## Options considered
1. **Recommended, chosen:** the design above.
2. The run records per side whether `Edges` cut it (`Top`, `Bottom`, `MaxHeight`). Not chosen: a frame inside a frame (the summary bars, a colour row, the map button over the map) has its own edge on content, not on black, so each step would need flags of its own, and nothing could be checked before a new run.
3. A fixed margin on every side of every picture. Not chosen: black between content and the fade where a picture cuts through.
4. The Window picture only, or the one-off picture from the 18:26 screenshot. Turned down at the gate.

## Areas of concern
- **Taint and secret values:** the run reads `GetRegions`, `IsShown`, `IsVisible`, `GetLeft` and the like on the tab buttons and `GameTooltip`, and writes nothing to them. It never hides `GameTooltip`: from addon code its `OnHide` would run tainted (the tooltip root cause of #300). The run is out of combat; the tooltip check runs in a `pcall`.
- **Clients:** the pictures come from Retail and show on every client. A Mists run takes the same `Art` and tooltip steps; the Classic tab template has textures 59 high too.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** a skin can recolour the frames; the black beyond a frame decides, not the frame's colour.
- **Saved variables:** `KrowiAF_DebugTable.Pictures` keeps its shape.
- **Localization, libraries, data snapshots:** none.
- **Player-facing text:** none. 105.0 is not released and its changelog already says the pictures are new, so no changelog line.

## Verification
- No scenario: `pictures` is a game-only suite that makes the pictures; the headless `help` suite (each picture has its size and file) stays green, with `Check-Repo.ps1`. The reproduction is above.
- The tool on the runs already recorded, with `-Preview`: Window gets the margin on its left, top and right and keeps a cut at the bottom (the old cut misses the tab art); each picture's sides reviewed.
- In game on Retail: deploy, `/kaftest pictures` (about 70 s; the last step waits for the mouse on the map button), `/reload`, `Read-GameTests.ps1`: no FAIL, the Window cut reaches the tab art. Then `Make-HelpPictures.ps1`, the previews reviewed, a deploy, and Krowi's look in the pane and the enlarged view.
- A Mists `/kaftest pictures` run shows the run's change works there.
- `krowi:taint-reviewer` on the `Tests/Pictures.lua` change, `/code-review` before the PR.

## Decision
Krowi, 2026-10-26, at the design gate (intent accepted with it): **whole-frame pictures**, out of whole-frame pictures, the Window picture only, and the one-off picture from the 18:26 screenshot. 50 px of black from the old pictures' measurement. After the gate the side check moved from the run to the tool's reading of the screenshot (Design); the pictures it gives are the ones the option described.