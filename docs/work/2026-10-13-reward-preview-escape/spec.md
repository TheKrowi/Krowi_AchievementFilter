# Spec: Escape closes the reward preview before the achievement window
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. With the reward preview shown over the achievement window, one Escape closes the preview and leaves the window open.
2. A second Escape closes the window. No press is eaten, so a third opens the game menu as before.
3. The preview still closes when its window closes by any other way.

## Root cause
- The addon's frames register for Escape through `addon.Gui:RegisterFrameForClosing` (`Gui/FramesForClosing.lua:31-43`). Escape then closes the most recently shown registered frame.
- The guide panel registers when it is created (`Gui/Guide/Panel.lua:89`). `KrowiAF_RewardPreview` never did: `KrowiAF_RewardPreviewMixin:OnLoad` (`Gui/RewardPreview/RewardPreviewMixin.lua:154`) has no such call, and no other code registers it.
- So the topmost registered frame is the achievement window. Escape closes it, and the preview's owner-window hook (`Gui/RewardPreview/RewardPreview.lua:9-13`) closes the preview along with it.

## Design
`KrowiAF_RewardPreviewMixin:OnLoad` calls `addon.Gui:RegisterFrameForClosing(self)`, as the guide panel does. `Gui/FramesForClosing.lua` loads before `RewardPreview.xml` in both manifests, so the function exists when `OnLoad` runs. The owner-window hook stays.

## Options considered
- **Register the preview for Escape (chosen).** It behaves like the guide panel and every other addon frame.
- **Leave it.** Escape keeps closing the window and the preview together, unlike the guide panel. Krowi chose against it.

## Areas of concern
- **Taint and secret values:** none new. The preview is the addon's own frame; registering hooks its `OnShow` and `OnHide` with the addon's handlers, as for the other frames. There is no `UISpecialFrames` write beyond the existing `KrowiAF_SpecialFrame` proxy.
- **Retail and Classic:** the same code and the same manifest order on both.
- **Plugins and skins:** ElvUI and GW2_UI skin the preview but do not touch its Escape handling.
- **Saved variables and migrations, localization, data snapshots:** none.

## Verification
- **Escape suite:**
  - `reward-preview-over-achievements`: Recorded `[]` (both closed), Target `[Achievements]`.
  - `reward-preview-over-achievements-twice`: Recorded `[GameMenu]`, Target `[]`.

  In game, the preview is pinned next to a stand-in row inside the achievement window. Headlessly, a model frame closes with the window.
- **In game, both clients:** `/kaftest escape`, `/reload`, `Read-GameTests.ps1`. Then pin a real reward preview and press Escape twice.

## Decision
Krowi, 2026-10-13: "make the reward preview do the same" (as the guide panel).