# Plan: Escape closes the reward preview before the achievement window
Spec: [spec.md](spec.md). Status: done

A one-line change in shared GUI code. Krowi's decision on 2026-10-13 covers the approach.

Results and departures:
- **Before-run:** Krowi saw the behaviour in game on Classic 5.5.4 on 2026-10-13, during the 2026-10-11-latent-bugs check. The escape scenarios, written next, model it on both clients.
- **`/code-review` (low) on #340: 9 findings.**
  - **Taken:**
    - the registration moved from the preview's `OnLoad` into `gui.RegisterSidePanel`, and the guide panel's own call went;
    - two scenarios added, `-thrice` and `reward-preview-closed-with-window`. The latter expects `[GameMenu]`: the press after the close button finds nothing left;
    - the test's stand-in window is hidden in `Reset`, its row takes no mouse input, it needs `AchievementFrame`, and the found achievement is cached through `HasPreviewableEntries`;
    - the spec's plugin line is corrected: no plugin skins the preview.
  - **To the backlog:**
    - Blizzard's bulk closes (death, loss of control, loading screens) close only the topmost addon frame. That is old behaviour for every registered frame.
    - Re-pinning a side panel that is already shown does not move it to the top of the Escape order.
  - **In game, 2026-10-13**, after a redeploy, because a VS Code save at 17:22 had put `dev` back over the first deploy:
    - **Retail 12.1.0:** `/kaftest escape` 27 passed, with 0 differences from headless.
    - **Classic 5.5.4:** 26 passed and 1 skipped (`calendar-side`: no day with achievements in the viewed month on that character).
    - All four reward-preview scenarios met their target on both clients, and there are no addon errors.
  - **Not changed:** headless cannot see whether the real code registers the preview, because the suite mirrors registrations by design (`escape.RegisteredKeys`). The in-game run checks the real code.

## Files that change
**Commit 1, the scenarios (`test: reproduce 2026-10-13-reward-preview-escape in the escape suite`)**
- `Tests/Escape.lua`:
  - frame key `RewardPreview`, between `Calendar` and `Achievements`;
  - its getter, and `PinRewardPreview`: the first achievement with previewable rewards, pinned next to a stand-in row in a stand-in popout-shaped window inside `AchievementFrame`;
  - the two scenarios from the spec.
- `.claude/tools/headless/run-tests.lua` (`suites.escape`): a `KrowiAF_RewardPreview` model frame that hides with the achievement window.

**Commit 2, the fix (`fix: Escape closes the reward preview before the achievement window (2026-10-13-reward-preview-escape)`)**
- `Gui/SidePanels.lua`: `RegisterSidePanel` calls `gui:RegisterFrameForClosing(frame)` once per panel, and `Gui/Guide/Panel.lua` drops its own call. The first version put the call in `RewardPreviewMixin:OnLoad`; the review moved it here.
- `Tests/Escape.lua`: `RewardPreview` joins `escape.RegisteredKeys`, and both scenarios' Recorded become their Target.
- `_Packaging/Changelog.md`: a Fixed line under 103.0.
- `Tests/README.md` stays as it is: its escape row already reads "the addon's frames".

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