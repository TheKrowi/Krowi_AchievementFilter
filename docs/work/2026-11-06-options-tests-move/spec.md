# Spec: KAF's options suite keeps what KAF can see
Intent: [intent.md](intent.md). Status: done

## Requirements
1. **Steps that stay** (KAF's own): `settings-entry`, `options-registered`, `every-option-mapped-once`, `set-through-window-equals-aceconfig`, `options-fingerprint`, `defaults-restore-acedb`, `derived-default-matches-text`, `changed-line`, `plugins-present`, `retail-only-hidden-on-classic`, `no-empty-headings`, `y-on-new-install`, the eight `y-at-login-*`, `help-reload-line`, `position-rows`, `objectives-rows`, `popout-rows`, `overview-cards` (KAF's overview content), and the KAF halves of `window-tabs` and `library-strings` (KAF's config passes no `Strings`: `config=no`). `window-tabs` is rewritten to say only that KAF's tab is registered as "Achievement Filter", whatever other tabs other addons add: today it asserts the whole tab list, so it fails while the library's test addon (or any other consumer) is installed (observed in game on Retail and Mists, 2026-11-06: `tabs=Achievement Filter,Options Test`; `window-second-tab` fails the same way, and goes).
2. **Steps that go** (the library's own, each with an equal in the test addon that passed in game on Retail and Mists, side by side with KAF's run): scenarios `window-second-tab`, `window-width`, the library part of `library-strings`, `library-globals`, `row-geometry`, `search-reset-position`, `search-names`, `search-headings`, `search-parent`, `search-parent-heading`, `search-all-none`, `search-order`, `card-geometry`; live steps `library-globals-window`, `tabs`, `sizes`, `section-overview` and every `section-<id>`, `section-tabs`, `section-keys`, `overview-cards` (live) and `overview-cards-end`, `toggle*`, `range*`, `input*`, `slider-help`, `greyed-help*`, `search*`, `toggle-reset-clipped`, `pane`.
3. **A KAF smoke through the library's public surface only** (a tab's `Open`, `Toggle`, `IsShown`, `GetFrame`, `GetSaved`, `lib.WindowName`): `open` (KAF's tab opens the window, shown), `close` (the window hidden again), `lua-errors` (BugGrabber, as today), and `restore` (KAF's saved `Window` block put back, read and written through `GetSaved()`, not `lib.Shared`).
4. `smokeSteps` is KAF's own smoke: `open`, `close`, `lua-errors`; `behaviour` goes (it named library steps only). `/kaftest options smoke` stays what the two-copy gate runs (with `escape`) until the kit's entry also runs the test addon's smoke.
5. KAF's headless `options` run (`run-tests.lua options`) stays green and loads the real library; `escape` is unchanged. `Check-Repo.ps1` reports 0 errors. `Tests/README.md`'s options section says what the suite is now and where the library's tests live.
6. In game, `/kaftest options` and `/kaftest escape` are green on Retail and Mists with the shorter suite, and BugGrabber is clean.

## Design
`Tests/Options.lua` is edited by deletion: the listed steps, their helpers that nothing else uses, and the library-facing parts of the `Remember`/`Restore` snapshot (`lib.Shared`, `lib.Tabs[i]:GetSaved()` loops). The public smoke replaces the open/close/restore trio on the public surface. The deleted steps are not moved by this change (the test addon already holds their ports, in Krowi_Options' pull request), so the diff here is deletion plus the small public smoke.

## Options considered
1. **Delete the library's steps, keep a public smoke** (recommended; Krowi's decision, 2026-11-06).
2. Keep everything in KAF and add the library's own tests beside it: duplicate coverage, and KAF's tests would still break on every internal move. Not taken.
3. Delete the library's steps and keep no live step at all: the two-copy gate would lose its KAF-side check and a KAF-only break of the window (a config KAF passes that the library rejects) would show only at login. Not taken.

## Areas of concern
- **Taint and secret values:** none; tests only. **Clients:** Retail and Mists (KAF's TOC). **Blizzard API:** none. **Other addons, plugins, skins:** none. **Saved variables:** the suite's `Remember`/`Restore` of KAF's saved window block keeps its job through `GetSaved()`. **Localization:** none. **Embedded libraries:** none edited. **Data snapshots:** none. **Player-facing text:** none; not shipped.
- **Coverage lost by mistake:** the guard is the side-by-side run (KAF `options` green, test addon green, same day, same clients) and a step-by-step list of equals in the pull request.
- **The two-copy gate:** its smoke names `options smoke`; the kit's entry changes in its own pull request.

## Verification
KAF headless `options` and `escape`; `Check-Repo.ps1`; `Run-GameTests.ps1 options, escape` on Retail and `options` on Mists (the repo's release gate asks for these, newer than the suite's last change); the test addon's full run on both (done: Retail 60/0, Mists 60/0, 2026-11-06).

## Decision
Krowi, 2026-11-06: option 1, the public smoke (`open`, `close`, `lua-errors`, `restore`); `window-tabs` reduced to KAF's own tab, `window-second-tab` removed. The scope (the library tests its internals) was decided in Krowi_Options' work item the same day.