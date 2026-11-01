# Spec: Help pictures without a black box
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. Wherever a help picture shows the run's black backdrop, it is transparent: the margin beside a frame's own edge, and the black inside the cut that joins it (around a frame's corners, between the tabs, above the window beside the category list, beside the map).
2. The soft fade where a picture cuts through content stays as it is.
3. The frames stay opaque, their dark parts too: a tooltip's or menu's background, the window's dark wood, the tabs' art.
4. A picture's size and place in the pane and in the enlarged view stay as they are: `Options/Window/Help/Pictures.lua` does not change.
5. A side where the run cut a frame short (a `MaxHeight`, or a `Top`/`Bottom` region) is a cut with its fade, never a frame's edge: FilterMenu, TipEarnedBy and TipPoints fade out at the bottom instead of ending in a straight line.
6. `Make-HelpPictures.ps1` makes the next remake of any picture the same way.

## Root cause
- **The black:** `Make-HelpPictures.ps1:371-373` clears each picture to black under its parts, and an edge side's `-Margin` (`:348-349`) is that black, faded by alpha only over its outer 40 px (`:385-401`). On the old pane the black passed for a shadow; the pane in the game's Options look (#379) is dark grey, about RGB 28, 30, 29 in Krowi's screenshot, so the black shows as a box.
- **The three bottoms:** the run cuts the filter menu and the points tooltip short with `MaxHeight` (`Tests/Pictures.lua:388`, `:469`), and the Earned By part with a `Bottom` region (`:430`). The tool decides each side from the screenshot (`Get-Side`, `:222-229`): a menu's or tooltip's background over the black backdrop is black itself (measured in the files: the menu's 0, the tooltip's 40 of 765), so the line below the cut read as backdrop, the side became an edge, and `Get-Trimmed` (`:232-239`) moved the cut up over the dark rows to the last line of text. The pictures end in a straight line with 50 px of black under it; once the black is transparent, a key would also run into the menu's background through that open side.
- **Reproduction:** Krowi's screenshot of the Categories help (2026-11-01), and `Media/Help/*.tga` at `18cce31e`.

## Design
- **The backdrop goes, in the tool:** after the parts are drawn on black and before the fade, a flood fill starts on the outer line of every edge side's margin and passes through pixels whose R+G+B is at most 12 (the backdrop's black; the margin itself is 0), then 2 px further through pixels up to 40 (the jpg's ringing and the dark outline the scaling leaves around a frame). Every pixel it reaches gets alpha 0. A dark area that a frame's border closes is never reached; the frame's dark art beside the backdrop keeps everything brighter than 12 beyond those 2 px. In a trial on the 19 files, the first try (one threshold of 40) ate holes into the tabs' art and the window's bottom wood; the two thresholds keep them.
- **The fades stay:** a cut side keeps its `-Fade` curve (alpha, as now). An edge side's margin is transparent, so the frame's own border shows against the pane; the margin stays as empty room (requirement 4).
- **The run says where it cut:** `Edges` reports a top cut by a `Top` region and a bottom cut by a `Bottom` region or `MaxHeight`; `Rectangle` records `Cut = {Top = true, Bottom = true}` for the sides of the union that such a frame gives; `read-pictures.lua` prints them; the tool makes those sides a cut whatever the screenshot shows. A run without `Cut` reads as before.
- **The existing 19 pictures** are converted from their files, since the run data of 15 is gone: `Convert-Pictures.ps1` in this work folder (the way the options revamp kept `mockup/Crop-Pictures.ps1`) reads each TGA, finds its edge sides from the alpha 20 px in (a margin's 40 px curve is at 135 there, an 18 px fade already at 255), applies the same flood fill and writes the TGA back in the tool's format. For FilterMenu, TipEarnedBy and TipPoints the bottom is the run's cut: their bottom margin becomes transparent outside the flood, and the last 18 rows of the frame get the cut's fade. SearchBox has no edge side and does not change.

## Options considered
1. **Recommended:** the design above. No game run; the pictures keep their size and place; the next remake gives the same result.
2. Convert the 19 files only and leave the tool: smallest diff, but the next remake of any picture brings the black back, and the three cut bottoms stay a straight line.
3. As 1, and drop the empty room beside each frame's edge (the margin cropped through `Pictures.lua`'s texture coordinates): the frames line up with the text's left edge, and the wide pictures the pane scales down show their frames 5 to 12% larger. The tool would need edge sides without a fade, since a fade without a margin would eat the frame's border.
4. A second screenshot of every step on a white backdrop, to compute the true alpha from the two (also of a translucent tooltip's background). Not recommended: a new run of every picture, and the steps' animated parts (glows, the model in the reward preview) differ between the two shots.

## Areas of concern
- **Taint and secret values:** the run change only reads the regions' edges it reads today and adds two booleans to the recorded rectangle; no new frame, hook or API.
- **Clients:** the pictures are Retail's and show on every client the TOC lists (Retail and Mists; Krowi's call of 2026-10-30). Mists' options window is in the same look.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** none; the pictures are textures in the addon's own window. The enlarged view's scrim (`Krowi_Options/Window.xml:200-202`, black at 0.75) now shows through the margins.
- **Saved variables:** `KrowiAF_DebugTable.Pictures` gains `Cut` per shot; an older run without it reads as before. No migration.
- **Localization, embedded libraries, data snapshots:** none.
- **Player-facing text:** none. 105.0 is not released and its changelog already says the pictures are new, so no changelog line.

## Verification
- No scenario: `pictures` is a game-only suite, and the headless `help` suite (each picture has its size and file) stays green, with `Check-Repo.ps1`.
- Every converted picture looked at as a PNG over the pane's grey and over magenta (what became transparent), the three cut bottoms and the tabs zoomed in.
- The tool on the saved variables' four recorded pictures (GuidePanel, MenuMain, NewTabs, RewardPreview) with `-Preview`: the same result as the conversion.
- In game on Retail and Mists: deploy, and Krowi's look at the help pane and the enlarged view.
- `krowi:taint-reviewer` on the `Tests/Pictures.lua` change, `/code-review` before the PR.

## Decision
Krowi, 2026-11-01, at the design gate (intent accepted with it): **option 1**, convert all 19 pictures and fix the tool, out of option 1 and option 2. The empty room beside each frame's edge stays (keep the room, out of keep and drop), so `Pictures.lua` does not change.