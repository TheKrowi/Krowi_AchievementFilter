# Plan: Help pictures cut too tight
Spec: [spec.md](spec.md). Status: done

## Files that change
- `.claude/tools/Make-HelpPictures.ps1`:
  - a cached pixel buffer per screenshot (`LockBits` once);
  - per part and side, the reach over content to the first black line (up to 24 px), the 85% fallback 3 px out, and the trim over black lines on edge sides;
  - the picture's sides: left and right from every part, top from the first part, bottom from the last;
  - `-Margin` (default 50) of black on edge sides with the old curve over 40 px, the `-Fade` curve on cut sides;
  - the scale fitted to `-MaxSide` with the margins, and the natural size through the scale and the run's units per pixel;
  - the printed line names the margin sides, `-Verbose` each side's finding;
  - `-Preview` also with `-WhatIf`, and the previews carry the soft edge;
  - the header comment and the parameter help.
- `Tests/Pictures.lua`: `GameTooltipOver`, and `Capture` hands the rectangle to a new `Shoot` (the old screenshot code), which first waits while a visible `GameTooltip` covers the cut grown by 10 px: banner text, a poll every 0.25 s, a FAIL after `mouseWait` without recording. The header comment.
- `Tests/README.md`: the `pictures` row (the tooltip wait, the margin).
- `.claude/tools/README.md`: the `Make-HelpPictures.ps1` row (`-Margin`).
- `Media/Help/*.tga` and `Options/Window/Help/Pictures.lua`: made again from the recorded runs, Window from a new shot.
- This work folder.
- Added after Krowi's review (see the departure below): `.claude/tools/headless/read-pictures.lua` (the inner rectangle), `Options/Window/Help/Help.lua` (the `Summary` picture), `Media/Help/Summary.tga` in place of `SummaryBars.tga`, every picture from new runs.

## Order of work
1. The tool, run on the recorded runs with `-WhatIf -Preview` into the scratchpad: every picture's sides checked against its screenshot (`-Verbose`).
2. `Tests/Pictures.lua`, then `Check-Repo.ps1 -ChangedOnly` and the `help` suite headless.
3. `krowi:taint-reviewer` on the `Tests/Pictures.lua` diff.
4. The pictures written from the recorded runs; the branch brought up to `main` (#188 changed the Reminders step of `Tests/Pictures.lua`).
5. Deploy to Retail (Krowi's go of 2026-10-28 over the #188 build): Krowi looks at the pictures in the pane and the enlarged view, then `/kaftest pictures window` with the mouse off any unit, and `/reload`. `Read-GameTests.ps1`: no FAIL.
6. `Make-HelpPictures.ps1` makes Window from the new shot; the preview checked; a deploy.
7. A Mists `/kaftest pictures` run, if Krowi takes it.
8. Docs, the work files set to done, the commit, the PR, `/code-review`.

## Risks
- **A dark frame trimmed into:** a tooltip or menu background is dark. The trim stops at the first line with more than 0.5% bright pixels, and step 1 shows each trim.
- **A neighbour taken for content:** a frame within 24 px of the cut stops the reach, and the side falls back to the 85% test 3 px out; the previews show each side.
- **A cut through dark content read as an edge:** a menu or tooltip cut at its height limit can end in black between two lines, and then ends there with a margin. It reads as a whole frame, which is what the picture is for.
- **Bigger textures:** 100 px of margin can cross a power of two. The pictures go from 11.1 to 12.5 MB, under the old tutorial's 12.9 MB.
- **The wait on Classic and in other UIs:** `GameTooltip` exists on every client; the check is in a `pcall` and only reads.

## Proof
- `Make-HelpPictures.ps1` prints each picture with its margin sides; the previews show whole frames on black that fades out, and soft cuts where a picture cuts through.
- `Read-GameTests.ps1 -Client Retail`: the window step PASS, and the lua-errors step PASS.
- `& ".claude\tools\Check-Repo.ps1"`: 0 errors; the `help` suite headless with no missing picture.
- Krowi in game: the Window picture shows the whole window (left border, close button, every tab) on black that fades out, with no tooltip; the other pictures show their frames whole.

## Departure from the plan: the Colors picture
- **Found in step 5:** in the pane the Sunday's Finest row stuck out about 30 px to the right of the other colour rows. Its category had few achievements, so its list had no scroll bar, and the list widens when its scroll bar hides (`ScrollUtil.AddManagedScrollBarVisibilityBehavior`, `Gui/WindowFrames/AchievementsFrame/AchievementsFrameMixin.lua:26-37`).
- **The change (bc2c3a1d):** `FindLook` in `Tests/Pictures.lua` takes each colour from the category with the most achievements, and a colour step FAILs while its list has no scroll bar. Colors was made again from a new `/kaftest pictures colors` run, so Window and Colors are the pictures with a new shot.

## Departure from the plan: Krowi's review of every picture
- **The review (2026-10-29, on the deployed pictures):**
  - perfect: Window, FilterMenu, the tooltips, PopOut, CalendarDays, Reminders;
  - more room asked for: tabs on top; categories on top and right; achievements on top and left; the colour rows on top and bottom; search on all sides; the right-click menu on the right; the reward preview on the left and bottom; guides on the left; the map button on top and left;
  - the summary picture should show the recent achievements and the progress overview, not only the bars;
  - some pictures had hard edges from older runs, the map button a black bar at its bottom.
- **More room:** a step's `More` grows its cut by UI units per side (tabs Top 40; categories Top 30, Right 20; compact list Top 30, Left 30; first colour row Top 30, last Bottom 30; search 20 on each side; guide Left 30; map button Top 30, Left 30), so a cut side fades out over the window instead of over the frame. The amounts were tried on the 2026-10-29 20:33 screenshots with a scratch copy of the run first.
- **The other sides along the frames' own length:** with the guide's Left 30 the line above and below the panel ran over 90 px of window, 21% of it, and the panel's top and bottom faded; the tabs' Top 40 put the window's bottom border beside Specials, and that side faded. The run now records the frames' own rectangle (`Inner`, read by `read-pictures.lua`), and the tool tests each side along it. On the 22:04 run only NewTabs changes (its right side becomes an edge); runs without `Inner` read as before.
- **The summary:** the step cuts the whole `KrowiAF_SummaryFrame` as `Summary`; `SummaryBars` is gone.
- **The right-click menu** opens at the cursor, which lay at the screen's border (top left in the 20:33 run, the right border before). After the scene's menu is open, Retail moves it to a frame at the screen's centre (a menu's proxy is a frame addon code may pass to `SetPoint`, `Blizzard_Menu/Menu.lua:74-78`); Mists opens the same menu again there through the addon's own `MenuBuilder`. The 22:04 picture came from a first build that closed and reopened the menu on Retail too; the taint review found that every open and close has Blizzard's menu manager switch scrolling off and on for the list under the cursor and redraw it (`Menu.lua:2449-2481`, `ScrollBox.lua:378-387`), tainted when that list is Blizzard's, so the move replaced it.
- **The reward preview** ran off the screen's bottom next to its row. At the screen's centre (22:04 run) it lay half on the event reminder buttons, and on a 2560 px screen (2026-10-30) over the window; it now goes 40 units right of the window.
- **The event reminder buttons** beside the window showed through the guide panel and touched the reward preview. The guide step hid them, but the alert system's refresh shows every button with an event again each second while the window is open (`Gui/EventReminder/SideButtonSystem.lua`), so whether they were in the picture depended on timing. Both steps now set them transparent, and the next step's clean-up gives their alpha back.
- **The hard edges and the black bar** were in pictures still made from older runs (on the old map button screenshot the 15% test read the bottom as an edge); in the 20:33 run the map button's bottom is a soft cut. Krowi made every picture again with the other addons off, which also gives the game's own font.

## In-game after-run (steps 5 to 7), on 35d90a72
- **Retail 12.1.5:**
  - `/kaftest pictures window` on 2026-10-29 20:18: PASS, no tooltip in the shot.
  - `/kaftest pictures colors` on 2026-10-29 20:18: the 5 colour rows PASS, each cut 741 px wide at the same x.
  - 0 addon errors in either run.
  - `Make-HelpPictures.ps1 -Only Window,Colors`: Window 1024x954 px with a margin on all four sides; Colors 839x288 px with a margin left and right, cut through the rows above and below.
- **Mists:** step 7 not run.

## In-game after-run of the review, Retail 12.1.5, other addons off
- `/kaftest pictures` on 2026-10-29 22:04 (3440x1440): 24 PASS, 0 addon errors; 17 pictures from it.
- On 2026-10-30 (2560x1440, the same height and UI scale, so the same pixels per unit): `rewardpreview` 08:03, `guidepanel` 08:04 and `newtabs` 08:08, each PASS with 0 addon errors; after the taint review's change, `menumain` 08:22 PASS with 0 addon errors, the menu moved to the screen's centre and the picture the same as the 22:04 one.
- `Make-HelpPictures.ps1`: 19 pictures. RewardPreview, PopOut, MenuMain, the tooltips, Reminders, CalendarDays, FilterMenu and Window have a margin on all four sides; GuidePanel on top, right and bottom; NewTabs left, right and bottom; the others where a frame ends in the black.
- Krowi on 2026-10-30, after looking at every section of the help pane: "all pictures look good now on retail".
- **Mists:** step 7 not run, by Krowi's call on 2026-10-30: "mists can use retail pictures, it's fine".