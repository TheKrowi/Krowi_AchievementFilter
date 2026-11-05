# Plan: Krowi_Options becomes a normal library (2.0), with its own translations, before KAF 105.0
Spec: [spec.md](spec.md). Status: done (Krowi approved it in plan mode, 2026-11-04)

Krowi_Options (the options window) lived inside KAF (`Krowi_Options/`), had no strings of its own (KAF passed 22 through `config.Strings`), and could not be embedded twice: its 20 XML templates warned "already exists" from a second copy, and only `Krowi_Options.lua` was version-guarded. Krowi wants it handled like the other Krowi libraries before 105.0, with no hurry and everything tested. Two repos, two PRs:
- KAF worktree `.claude/worktrees/feature-2026-11-04-options-strings`, branch `feature/2026-11-04-options-strings`.
- `Krowi_Libraries\Krowi_Options`, branch `feature/2026-11-04-normal-library`.

## Files that change

**The library repo** (`Krowi_Libraries\Krowi_Options`):
- `Krowi_Options.lua`: `KROWI_LIBMAN:NewLibrary('Krowi_Options_2', 0, { SetCurrent = true, InitLocalization = true })`, `lib.Mixins`, `lib.Build`, `lib.GetStrings()` (the 22 texts from `lib.L`, placeholders turned into `%s`/`%d`), the config without `Strings`.
- `RowFrames.lua` (new, replaces `Rows.xml`): the 14 row builders, plus the helpers `Text`, `Color`, `Finish` (mixin, scripts by method name, `OnLoad` last) and `Row`.
- `WindowFrame.lua` (new, replaces `Window.xml`): the 5 list builders and `build.Window()` on `SettingsFrameTemplate`, hidden before its children are made.
- `RowMixins.lua`, `WindowMixin.lua`, `Search.lua`: a `NewSubmodule` guard each, mixins on `lib.Mixins`, the scroll lists on host frames with a row per kind hung as `host.Row`, the two glitch fixes (`UnderMouse`, `RefreshHover`).
- `Localization/`: `Files.xml`, `Shared.lua` and 11 locale files with the 22 phrases and every translation KAF and Krowi_Util had.
- `Krowi_Options.xml` (load order), the TOC (2.0), `_Packaging/Changelog.md` and `Description.md`, `CLAUDE.md` (rewritten as a normal library's).
- `Rows.xml` and `Window.xml` deleted.

**KAF:**
- `Libs/Krowi_Options` (new submodule) and its `Libs/Files.xml` line; `.gitmodules`; the TOC's `Krowi_Options\Files.xml` line and the `Krowi_Options/` folder go.
- `Options/Window/Window.lua` and `Help/Help.lua`: `Krowi_Options_2`, no `Strings`; the Overview's name from the library.
- `Options/Window/Map.lua`, `Source.lua`, `Model.lua`: the heading-level `Retail` flag (requirement 10).
- `Localization/*.lua` (11): the 19 phrases only the window used.
- `Tests/Options.lua`, `Tests/Tests.lua`, `.claude/tools/headless/read-tests.lua`, `Tests/README.md`: the scenarios, targeted runs, `_2`.
- `.claude/tools/Check-Repo.ps1`, `Check-Repo.globals`, `Check-Repo.jobs`, `.claude/tools/README.md`: `library-names` and `options-templates` on `Libs/Krowi_Options`.
- Docs: `.github/copilot-instructions.md`, `docs/architecture.md`, `docs/backlog.md`.

**Elsewhere:** `Krowi_AddonManager_Python/resources.py` lists `Krowi_Options` in `LIBRARY_NAMES`; the kit's `WowAddons.md` lists it among the libraries (write-back).

## Order of work
1. **KAF, the glitches test-first, still in `Krowi_Options/`:** rebase on `origin/main`; the two scenarios with `Recorded` (buggy) and `Target`; the in-game before-run on Retail; the fixes; `Recorded` = `Target`.
2. **The library repo:** copy the branch's `Krowi_Options/` over the 1.0 copy; guards and the new name; templates to Lua, one Lua file per XML file; the rows on host frames; localization; load order; repo files.
3. **KAF embeds it:** the submodule (on the library branch during the work), wiring, code, locale files, tests, lint and docs.
4. **CurseForge:** from the library branch, the sync's report, then `-Export` on Krowi's go; after the KAF merge, from KAF `main`, `-Export -Delete` of the 19 phrases on Krowi's approval, with the translation counts named.
5. **Tests and review:** headless, in game on Retail and Mists, the two-copy test on Retail, `krowi:taint-reviewer` on the library diff, `/code-review` on both PRs.
6. **PRs, release, write-back:** the library PR first, merged on Krowi's go, then `krowi:release` 2.0 alpha with the dry-run zip shown first; the KAF PR pins `Libs/Krowi_Options` to the tag 2.0, merged on Krowi's go; then the write-back (the kit's `WowAddons.md`, the library's known debt from the spike, memory).

### Where the build departed from the plan
- **Targeted runs** (Krowi asked, the suite had grown long): `/kaftest options <name, start of a name or number>` runs those steps with the ones they need, every scenario, the restore and the BugGrabber check. Such a run is kept but not counted by the release gate (`Tests.lua` stores it apart from `Runs`; `read-tests.lua` says so).
- **The dropdown with steppers is assembled by hand:** `DropdownWithSteppersTemplate`'s `OnLoad` needs its `Dropdown` child before the Lua build can add it, and `WowStyle2IconButtonMixin`'s `OnLoad` needs `normalAtlas`. `build.Select` makes the children, then applies `DropdownWithSteppersMixin` and runs its `OnLoad` (the risk listed below, found real).
- **The content rows come from a free list per kind**, not `CreateObjectPool`: the frame factory's resetter hands a host's row back to its kind's list.
- **Every copy adds its phrases:** the locale files call `NewDefaultLocale(true)` / `NewLocale(<lang>, true)`, so a newer copy's code finds its own phrases next to an older copy's.
- **19 phrases left KAF, not 18:** KAF's Overview reads its name from the library's `GetStrings().Overview`.
- **`.luarc.json` keeps `RESET_TO_DEFAULT`:** the tests still read it.
- **Requirement 10, found on Mists during the work:** Reminder events showed empty headings there; `Map.lua` marks seven headings `Retail`, `Source.lua` leaves such a heading out on the other clients, and the `no-empty-headings` scenario guards every section on both clients (Krowi's decision in the spec).
- **The clipped-row step** takes the longest section that has a plain check box: on Mists the longest, the plugins, has none.
- **The two-copy test recorded its findings itself:** the standalone copy carried a probe that wrote which files took over, the live minors and the strings into a saved variable, beside the chat line per file.
- **The review fixes came from a second session** (`fix/2026-11-05-options-review-fixes` in the library repo), merged into the library branch before its PR (ac799ee).
- **KAF points at the library's `main`, not the tag 2.0** (Krowi, 2026-11-05: the merge and KAF first, then 2.0 on the hosts). The library PR merged as 48d0803, and `Libs/Krowi_Options` points there. Its code is the build the 2026-11-05 runs tested: from 4369f10 to 48d0803 only the review fixes' work files changed. 2.0 is released after, and KAF's next preflight moves the pointer to the tag. Until then, a KAF release stops at the preflight, since the library is pinned past its newest release (1.0).

## Risks
- **Look regressions from the XML-to-Lua move:** caught by the suites' geometry checks and Krowi's look in game; the builders follow the templates field by field.
- **The dropdown's `Dropdown` child inside `DropdownWithSteppersTemplate`:** found real; see the departures.
- **Titan has no local client:** checked against `wow-ui-source\classic_titan` only.
- **105.0 waits for both PRs and the 2.0 release.**

## Proof
- **Headless, both clients:** `options` 38, `escape` 34, `help` 5, `popups` 22, all passing; the option fingerprints unchanged (Retail 408, Mists 304). `Check-Repo.ps1`: 0 errors.
- **Retail, 2026-11-04:** `/kaftest options` 86 passed, 1 skip (headless only); `/kaftest escape` 34 of 34; BugGrabber clean; Krowi's look at the window.
- **Mists, 2026-11-04:** `/kaftest options` 85 passed, 2 skips (the headless-only one, and the clipped-row step, fixed since); `/kaftest options toggle-reset-clipped` 41 passed, with `no-empty-headings` and the clipped-row step passing; BugGrabber clean; Reminder events ends after Holidays (Krowi's screenshot).
- **Two copies, Retail, 2026-11-04**, a standalone `AddOns\Krowi_Options` next to KAF, removed after:
  - (a) equal minors: no file took over, every minor 0, 22 strings; `/kaftest options open` 40 passed; no XML warning, BugGrabber clean.
  - (b) every minor + 1: all six files took over, every minor 1, 22 strings; `/kaftest options section` 63 passed, every section drawn by the newer copy; no XML warning, BugGrabber clean.
- **Review:** `krowi:taint-reviewer` on the library diff found nothing; the 10 `/code-review` findings were fixed in the library's `de2cb58`. The rest went to the library's review-fix branch (`fix/2026-11-05-options-review-fixes`, `4369f10`).
- **In game, 2026-11-05.** The build was this branch at `4238364a` with `Libs/Krowi_Options` at the review fixes' `4369f10`. The runs were requested, one client at a time:
  - **Retail 12.1.5:** `options` 95 passed, 2 skips (the headless-only one, and the clipped-row step waiting for a mouse); `escape` 34 of 34; BugGrabber clean.
  - **Mists 5.5.4:** `options` 95 passed, with the same 2 skips; BugGrabber clean.
  - **On both, also passing:** `greyed-help`, `greyed-help-collapsed`, `window-second-tab`, `library-globals` and `lua-errors`.
- **CurseForge, 2026-11-05, on Krowi's go:** the export from the library branch sent 22 phrases and 206 translations to project 1783244. The report then said CurseForge has them all.
- **Still to come:**
  - after the KAF merge, from `main`: `-Export -Delete` of the 19 phrases on KAF's project 413582, on Krowi's approval with the translation counts named;
  - the library's 2.0 alpha release, then KAF's preflight finding `Libs/Krowi_Options` at the tag;
  - full `options` and `escape` runs from `main` for the release gate.