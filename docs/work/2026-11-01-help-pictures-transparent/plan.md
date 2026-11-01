# Plan: Help pictures without a black box
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `Tests/Pictures.lua`: `Edges` also returns the frame's own top and bottom; `Rectangle` records `CutTop`/`CutBottom` on the shot when the frame that gives the union's top or bottom goes on more than 24 px (the tool's reach for a frame's edge) past the cut. That keeps TipEarnedBy's top an edge: its `Top` region cuts a few pixels under the tooltip's border, which the tool reaches.
- `.claude/tools/headless/read-pictures.lua`: two more columns per shot, cut top and cut bottom (1 or 0; 0 for a run without them).
- `.claude/tools/Make-HelpPictures.ps1`:
  - reads the two columns;
  - a recorded cut side is never an edge;
  - after the parts are drawn on black, `Clear-Backdrop` floods from the outer line of every edge side through R+G+B up to 12, then 2 px further through up to 40, and sets alpha 0 on what it reaches;
  - the fade runs on the same buffer as now;
  - the help block says the margin is transparent.
- `docs/work/2026-11-01-help-pictures-transparent/Convert-Pictures.ps1` (new, one-off, kept as the record):
  - reads each `Media/Help/*.tga` with its size from `Pictures.lua`, and finds its edge sides from the alpha 20 px in;
  - runs the same flood;
  - for FilterMenu, TipEarnedBy and TipPoints, the bottom is the run's cut: their bottom margin rows are left out of the flood and made transparent, and the frame's last 18 rows get the `-Fade` curve;
  - writes the TGA in the tool's format, and `-Preview` writes PNGs over the pane's grey and over magenta.
- `Media/Help/*.tga`: 18 files converted (SearchBox has no edge side and stays as it is).
- `Options/Window/Help/Pictures.lua`: unchanged.

## Order of work
1. The run and the reader (`Tests/Pictures.lua`, `read-pictures.lua`); syntax hook, `Check-Repo.ps1`.
2. The tool; then `-WhatIf -Preview` on the four recorded pictures (GuidePanel, MenuMain, NewTabs, RewardPreview) and compare with step 3's previews.
3. `Convert-Pictures.ps1 -Preview`, look at every picture, then write the TGAs.
4. Headless `help` suite and `Check-Repo.ps1`.
5. `krowi:taint-reviewer` on the run change.
6. Deploy to Retail and Mists, and Krowi looks at the help pane and the enlarged view.
7. PR, then `/code-review`.

## Risks
- **The flood runs into a frame** through a gap in a dark border. Guard: the magenta previews of every picture before the files are written; the 12/40 thresholds came from the trial, which showed holes with a single threshold of 40.
- **The TGA writer drifts from the tool's.** Guard: the conversion copies the tool's `Write-Tga`, and the in-game look shows each file loads.
- **A future run's `CutTop`/`CutBottom` is wrong** (a frame's edge within reach read as a cut). Guard: the 24 px rule mirrors the tool's `$reach`, and the comment ties them together; a remake prints which sides got a margin.
- **The other session's deploy** replaces this build in the game. Guard: `ListAgents` before the deploy, and the deploy's report names what it replaced.

## Proof
- `Convert-Pictures.ps1` prints per picture its edge sides and the share of pixels made transparent; the previews show no hole in a frame.
- `lua.exe .claude\tools\headless\run-tests.lua . help`: green. `Check-Repo.ps1`: 0 errors.
- `Make-HelpPictures.ps1 -WhatIf -Preview <dir> -Only GuidePanel,MenuMain,NewTabs,RewardPreview`: matches the converted files.
- In game, Retail and Mists: every help picture shows the pane's grey around the frame, no black box; the cut fades are as before; FilterMenu and the two tooltips fade out at the bottom.