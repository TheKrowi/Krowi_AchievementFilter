# Plan: Help pictures without a black box
Spec: [spec.md](spec.md). Status: done

## Files that change
- `Tests/Pictures.lua`: the backdrop's texture is kept as `backdropColor`; after each picture's black shot it turns pink, a second shot 3 s later records `PinkTime`, and it turns black again before the next step (and at the start of a run).
- `.claude/tools/headless/read-pictures.lua`: a pink-time column per shot, empty for an older run.
- `.claude/tools/Make-HelpPictures.ps1`:
  - pairs each part's black and pink shots; a picture without its pink shot is not made;
  - `Test-Clear` (was `Test-Black`) reads the transparency from the pair for the side check and the trim;
  - `Set-Matte` builds each scaled part from its two shots into a transparent canvas;
  - the fade and the TGA as before; a warning for jpg shots;
  - the help block describes the two shots.
- `Media/Help/*.tga` and `Options/Window/Help/Pictures.lua`: remade from Krowi's run.

## Order of work
1. The first build (a key on the black, the files converted) was turned down in game and reverted (`33aedfcc`).
2. The run, the reader and the tool; the tool on a faked pair as a dry run.
3. Deploy the run to Retail; Krowi's `/kaftest pictures` (other addons off, `/console screenshotFormat png` first), then `/reload`.
4. `Read-GameTests.ps1`, then `Make-HelpPictures.ps1 -Preview`; look at every picture, then write the files. Departure: the run of 2026-11-01 10:06 (MapButton redone at 10:08, the full map hid the pink) moved the side check's reach to 32 px and its overlap rule to 80%, and showed the pop-out faded; its step now sets it to full opacity, so PopOut is redone with `/kaftest pictures popout`. Krowi's look at the pictures added fixed scenes for the run (42328 in the tooltips and the compact list, Mists of Pandaria in the category list, last month in the calendar, put back at the end) and the `Alone` mask for the summary; those pictures are redone with `/kaftest pictures <name>`.
5. Headless `help` suite and `Check-Repo.ps1`; `krowi:taint-reviewer` on the run change.
6. Deploy to Retail and Mists; Krowi looks at the help pane and the enlarged view.
7. PR, then `/code-review`.

## Risks
- **Something on screen moves between the two shots** (the model, a timer, a glow): the green and red/blue checks take such a pixel from the black shot; the previews show what is left.
- **jpg colour blur** leaves a fringe at the frames' edges: png shots, and the tool's warning.
- **The game's tooltip comes over a picture between the shots:** the pink shot is skipped and named; that picture is redone with `/kaftest pictures <name>`.
- **The other session's deploy** replaces this build in the game: `ListAgents` before the deploy, and the deploy's report names what it replaced.

## Proof
- The run's observations list no skipped pink shot; `Read-GameTests.ps1` shows no FAIL.
- `Make-HelpPictures.ps1` makes all 19 pictures without a warning; the previews over the pane's grey and over magenta show no pink, no hole in a frame, the dark borders and the tooltips' backgrounds as in game.
- `lua.exe .claude\tools\headless\run-tests.lua . help`: green. `Check-Repo.ps1`: 0 errors.
- In game, Retail and Mists: every help picture shows the pane's grey around the frame, no black box; the cut fades as before.