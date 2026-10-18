# Spec: Escape closes the reward preview before the achievement window
Intent: [intent.md](intent.md). Status: done

## Requirements
1. With the reward preview shown over the achievement window, one Escape closes the preview and leaves the window open.
2. A second Escape closes the window. No press is eaten, so a third opens the game menu as before.
3. The preview still closes when its window closes by any other way.

## Root cause
- The addon's frames register for Escape through `addon.Gui:RegisterFrameForClosing` (`Gui/FramesForClosing.lua:31-43`). Escape then closes the most recently shown registered frame.
- The guide panel registers when it is created (`Gui/Guide/Panel.lua:89`). `KrowiAF_RewardPreview` never did: `KrowiAF_RewardPreviewMixin:OnLoad` (`Gui/RewardPreview/RewardPreviewMixin.lua:154`) has no such call, and no other code registers it.
- So the topmost registered frame is the achievement window. Escape closes it, and the preview's owner-window hook (`Gui/RewardPreview/RewardPreview.lua:9-13`) closes the preview along with it.

## Design
`gui.RegisterSidePanel` (`Gui/SidePanels.lua`) registers each side panel for Escape, once.
- Both panels call it before their first `Show`: the reward preview in `ShowUnpinned`, the guide panel when it is built. So the `OnShow` hook sees that `Show`.
- The guide panel's own call (`Gui/Guide/Panel.lua:89`) goes.
- Escape handling becomes part of the side-panel contract, next to the anchoring and the hide chain, so a later side panel cannot miss it. The first version registered only the preview, in its `OnLoad`; the code review proposed this.
- The owner-window hook stays.

**Known limitation, unchanged by this work.** Blizzard's bulk closes call `CloseAllWindows`: on death, on loss of control, at a loading screen. Each call closes only the addon's topmost registered frame (`Gui/FramesForClosing.lua`). With a preview open, that is now the preview rather than the window. Every registered frame has behaved this way since 101.0, so it is in `docs/backlog.md`.

## Options considered
- **Register the preview for Escape (chosen).** It behaves like the guide panel and every other addon frame.
- **Leave it.** Escape keeps closing the window and the preview together, unlike the guide panel. Krowi chose against it.

## Areas of concern
- **Taint and secret values:** none new. The preview is the addon's own frame; registering hooks its `OnShow` and `OnHide` with the addon's handlers, as for the other frames. There is no `UISpecialFrames` write beyond the existing `KrowiAF_SpecialFrame` proxy.
- **Retail and Classic:** the same code and the same manifest order on both.
- **Plugins and skins:** none. No plugin references `KrowiAF_RewardPreview` (searched `Plugins/`).
- **Saved variables and migrations, localization, data snapshots:** none.

## Verification
- **Escape suite:**
  - `reward-preview-over-achievements`: Recorded `[]` (both closed), Target `[Achievements]` (requirement 1).
  - `reward-preview-over-achievements-twice`: Recorded `[GameMenu]`, Target `[]`.
  - `reward-preview-over-achievements-thrice`: Recorded and Target `[GameMenu]`, so no press is eaten (requirement 2).
  - `reward-preview-closed-with-window`: the window's close button first. Recorded and Target `[GameMenu]`: the preview went with the window, and the next press reaches the game menu (requirement 3).

  In game, the preview is pinned next to a stand-in row inside the achievement window. Headlessly, a model frame closes with the window.
- **In game, both clients:** `/kaftest escape`, `/reload`, `Read-GameTests.ps1`. Then pin a real reward preview and press Escape twice.

## Decision
Krowi, 2026-10-13: "make the reward preview do the same" (as the guide panel).