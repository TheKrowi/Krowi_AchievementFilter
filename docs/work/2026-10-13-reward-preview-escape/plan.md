# Plan: Escape closes the reward preview before the achievement window
Spec: [spec.md](spec.md). Status: accepted

A one-line change in shared GUI code. Krowi's decision on 2026-10-13 covers the approach.

Results and departures:
- **Before-run:** Krowi saw the behaviour in game on Classic 5.5.4 on 2026-10-13, during the 2026-10-11-latent-bugs check. The escape scenarios, written next, model it on both clients.

## Files that change
**Commit 1, the scenarios (`test: reproduce 2026-10-13-reward-preview-escape in the escape suite`)**
- `Tests/Escape.lua`:
  - frame key `RewardPreview`, between `Calendar` and `Achievements`;
  - its getter, and `PinRewardPreview`: the first achievement with previewable rewards, pinned next to a stand-in row in a stand-in popout-shaped window inside `AchievementFrame`;
  - the two scenarios from the spec.
- `.claude/tools/headless/run-tests.lua` (`suites.escape`): a `KrowiAF_RewardPreview` model frame that hides with the achievement window.

**Commit 2, the fix (`fix: Escape closes the reward preview before the achievement window (2026-10-13-reward-preview-escape)`)**
- `Gui/RewardPreview/RewardPreviewMixin.lua`: `OnLoad` calls `addon.Gui:RegisterFrameForClosing(self)`.
- `Tests/Escape.lua`: `RewardPreview` joins `escape.RegisteredKeys`, and both scenarios' Recorded become their Target.
- `_Packaging/Changelog.md`: a Fixed line under 103.0.
- `Tests/README.md`: the escape row mentions the reward preview.

## Order of work
1. Commit 1. Headless: both scenarios PASS and are open, on both clients.
2. Commit 2. Headless: both PASS with their target met. Run the full `Check-Repo.ps1`.
3. Push, open the PR, `/code-review`.
4. In-game run (Krowi), then the merge gate.

## Risks
- **A press eaten.** If the preview stayed registered after hiding, Escape would hit nothing. `RegisterFrameForClosing` removes a frame on `OnHide`, and the "twice" scenario checks the second press reaches the window.
- **Hover.** An Escape while a preview only shows on hover now closes it first, as it does for the guide panel.

## Proof
- Headless: the escape suite on both clients, before and after the fix.
- In game: `/kaftest escape` on both clients matches headless, and a real pinned preview closes on the first Escape.