# Plan: KAF reads the options library through `lib.Internal or lib` and `GetStrings()`
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `Tests/Options.lua`: `overview-cards` reads `CardColumns` and `window-tabs` reads `Tabs` through `(lib.Internal or lib)`.
- `Tests/Pictures.lua`: the options window frame is read through `(lib.Internal or lib).Frame`.
- `Options/Window/Help/Help.lua`: the reload line reads `optionsLib.GetStrings().NeedsReload`.
- This work folder: `plan.md`, `gates.md`. No `Libs/` edit, no changelog line (players see nothing).

## Order of work
1. The four edits.
2. KAF headless `options` and `escape`, `Check-Repo.ps1 -ChangedOnly`.
3. In game with KAF's embedded library: deploy from this worktree, `Run-GameTests.ps1 options, escape` on Retail, `options` on Mists, BugGrabber clean.
4. In game with Krowi_Options#6's library (`Deploy-TestAddon.ps1 -Consumers` from its worktree): the same runs; then deploy KAF's own copy back.
5. `/code-review`, `Get-ChangeClass.ps1`, work files to done, push, PR, merge row, merge on Krowi's word.

## Risks
- `GetStrings()` is called at load. If its strings were not ready, the line would be empty; headless and in-game `help-reload-line` prove it. Fallback: read it lazily.
- A foreign library copy is left in KAF's AddOns folder after step 4 until KAF is deployed again.
- The game and its AddOns folder are shared: no client Krowi started is touched.

## Proof
Headless `options` and `escape` green, scenarios unchanged; Retail `options` and `escape` and Mists `options` pass with both libraries; BugGrabber clean; lint clean.