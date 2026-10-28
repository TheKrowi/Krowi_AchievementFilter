# Plan: Help pictures cut too tight
Spec: [spec.md](spec.md). Status: accepted

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