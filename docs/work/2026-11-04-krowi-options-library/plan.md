# Plan: Krowi_Options becomes a normal library (2.0), with its own translations, before KAF 105.0
Spec: [spec.md](spec.md). Status: accepted (Krowi approved it in plan mode, 2026-11-04)

## Context
Krowi_Options (the options window) lives inside KAF (`Krowi_Options/`), has no strings of its own (KAF passes 22 through `config.Strings`), and cannot be embedded twice: its 20 XML templates warn "already exists" from a second copy, and only `Krowi_Options.lua` is version-guarded. Krowi wants it handled like the other Krowi libraries before 105.0 (2026-11-04), with no hurry and everything tested. Spec decisions: `Krowi_Options_2`, version 2.0. The two markers-review glitches are fixed here. The two-copy test uses a standalone folder, once. Work folder: `docs/work/2026-11-04-krowi-options-library/` (intent and spec accepted, 827c8d74).

Two repos, two PRs:
- KAF worktree `.claude/worktrees/feature-2026-11-04-options-strings`, branch `feature/2026-11-04-options-strings`.
- `Krowi_Libraries\Krowi_Options`, new branch `feature/2026-11-04-normal-library`.

## Steps

### 1. KAF: bring the branch up to date, fix the two glitches test-first (in `Krowi_Options/`, before it moves)
1. `git rebase origin/main`. The branch holds one docs commit; main gained #394 (12f38fe1).
2. **Scenarios in `Tests/Options.lua`**, each with `Recorded` (current, buggy) and `Target`, plus its model in `run-tests.lua` where it runs headless (`Tests/README.md` conventions):
   - **hover help:** hover an option row (`row:OnEnter()`), change it (`row.Toggle:Click()`), then read the help pane. Recorded: no "Reset to Default" line until re-entered. Target: the line at once.
   - **undo arrow:** a mouse step that waits for Krowi. Scroll a changed row half out of view, hover it, leave through the clipped part. Recorded: the arrow stays. Target: it goes.
3. **In-game before-run on Retail** (deploy, `/kaftest options`, `/reload`, `Read-GameTests.ps1`) to confirm both reproduce. Commit `test: reproduce the markers glitches in the options suite`.
4. **Fixes**, then `Recorded` = `Target`; commit `fix: the undo arrow and the hover help follow the mouse and changes`:
   - `RowMixins.lua` `OnLeave`/`Refresh`: also require `window.PageScrollBox:IsMouseOver()`.
   - `WindowMixin.lua` `OnOptionChanged`: re-run `OnRowEnter` for `HoverOption`.

### 2. Library repo: take the code over, then make it a normal library
1. Copy the branch's `Krowi_Options/` files over the repo's 1.0 copy, and commit them.
2. **Guards and name:**
   - `Krowi_Options.lua`: `NewLibrary('Krowi_Options_2', 0, { SetCurrent = true, InitLocalization = true })`.
   - Every other Lua file: `local sub, lib = KROWI_LIBMAN:NewSubmodule('<File>', 0); if not sub then return end`. LibMan registers each as its own entry (`Krowi_Util/LibMan.lua:61-76`), and the parent is current through `SetCurrent`.
   - The 16 mixins become `lib.Mixins.<Name>` (for example `lib.Mixins.OptionRow`), and are applied with `Mixin(frame, ...)` by the builders.
3. **Templates to Lua**, one file per XML file so the two can be compared side by side:
   - `RowFrames.lua` replaces `Rows.xml` (14 builders), and `WindowFrame.lua` replaces `Window.xml` (5 list builders and the window).
   - Each builder makes what the template declared: regions with their layers, fonts, atlases and anchors; children through `CreateFrame` with Blizzard's templates (`MinimalSliderWithSteppersTemplate`, `DropdownWithSteppersTemplate` and its `WowStyle2DropdownTemplate` `Dropdown`, `UIPanelButtonNoTooltipTemplate`, `InputBoxTemplate`, `SearchBoxTemplate`, `WowScrollBoxList`, `MinimalScrollBar`, `NewFeatureLabelTemplate`); the same parentKeys.
   - Each builder then applies the mixin, sets the `method=` scripts, and runs `OnLoad`. KeyButton's `OnMouseDown` is set before OptionRow's `OnLoad` hooks it (`RowMixins.lua:157`).
   - The window: `CreateFrame("Frame", "Krowi_OptionsWindow", UIParent, "SettingsFrameTemplate")`, with the attributes from `Window.xml:107` (HIGH strata, toplevel, movable, resizable, clamped, hidden), then its 20 children and 7 regions.
   - `Rows.xml` and `Window.xml` are deleted.
4. **Rows in the three scroll boxes:** a native frame type pools all kinds together (`FrameFactory.lua:17-32`), so:
   - The view gets a plain host: `factory("Frame", init)`.
   - `init` takes content of the element's kind from a pool per kind (`CreateObjectPool`, built by the kind's builder), parents it to the host with `SetAllPoints`, stores it as `host.Row`, and calls `Row:Init(data, window)`.
   - `view:SetFrameFactoryResetter` hands `host.Row` back to its pool. The resetter exists on `live`, `classic` and `classic_titan`.
   - The kind tables (`WindowMixin.lua:117-129`, `223-225`, `235-236`) name builders instead of templates, and keep the extents.
   - The two page walkers (`:614` `EndKeyCapture`, `:738` `Refresh`) read `host.Row`.
5. **Localization:**
   - `Localization/Files.xml` and 11 locale files with Krowi_PopupDialog's head (`GetCurrentLibrary(true)`, `NewDefaultLocale`/`NewLocale`, the `AUTOGENTOKEN` line, no "Exported at" stamp). The 22 phrases, sorted ignoring case, with KAF's translations, plus Krowi_Util's 4 of "Requires a reload". The files are generated by a scratchpad Lua script that reads KAF's and Krowi_Util's files with the kit's Lua 5.1, then written with Write.
   - `lib.GetStrings()` builds `lib.Strings` once from `lib.L`, with the field names the window already uses and the placeholders turned into `%s`/`%d` with `K_ReplaceVars`.
   - The window uses `lib.GetStrings()`, and `StringsFor` returns it. `config.Strings` is no longer read; the broad search is always offered.
6. **Load order** (`Krowi_Options.xml`): `Krowi_Options.lua`, `Localization\Files.xml`, `Search.lua`, `RowMixins.lua`, `RowFrames.lua`, `WindowMixin.lua`, `WindowFrame.lua`.
7. **Repo files:**
   - TOC 2.0 with the same Notes.
   - `_Packaging/Changelog.md` 2.0: `Krowi_Options_2`, the window's own strings in 11 languages, safe when embedded twice, the two fixes.
   - `Description.md`: requirements Krowi_Util with its AceLocale, and the config fields.
   - `CLAUDE.md` rewritten in Krowi_Menu's shape: clients, loading, a versioning table per file, consumers, taint-sensitive areas, localization, code style, testing through KAF, release `--stability alpha`.

### 3. KAF: embed it
1. `git submodule add https://github.com/TheKrowi/Krowi_Options Libs/Krowi_Options`. During the work it points at the library branch (fetched from the local checkout, as in Krowi_Menu's `CLAUDE.md`); before the PR merges, at tag 2.0.
2. Wiring:
   - `Libs/Files.xml`: `<Include file="Krowi_Options\Krowi_Options.xml" />` after `Krowi_Menu`.
   - The TOC drops line 30 (`Krowi_Options\Files.xml`).
   - `git rm -r Krowi_Options`.
3. Code:
   - `Options/Window/Window.lua:108`: `Krowi_Options_2`, without `Strings` (134-157).
   - `Help.lua:64`: `Krowi_Options_2`.
4. Locale files (11):
   - They drop the phrases nothing in KAF reads any more, checked by grep at build time. 18 or 19: `Overview` may still be read at `Window.lua:113`.
   - `Search` and `None` stay. `Util.L["Requires a reload"]` stays in Krowi_Util.
5. Tests:
   - `_1` becomes `_2` at the 15 call sites (`Tests/Options.lua`, `Tests/Pictures.lua:1257`).
   - The three `ForEachFrame` walkers (`Tests/Options.lua:657,747,815`) read `host.Row`.
   - `:1234` reads `Overview` from the library if KAF no longer has it.
   - New scenarios: every one of the 22 strings comes from the library and is not empty; after load, no global `Krowi_Options*` exists besides `Krowi_OptionsWindow` (headless, `options-env`).
6. Lint and config:
   - `Check-Repo.ps1`: `library-names` stops listing `Krowi_Options/` (482-483). `options-templates` (530-559) scans `Libs/Krowi_Options/*`, so it keeps guarding the library against Blizzard's tainting Settings templates.
   - `Check-Repo.globals` drops 36-39, and `Check-Repo.jobs` drops line 26 (`Libs/` is not scanned).
   - `.luarc.json` drops `RESET_TO_DEFAULT`, which only the library reads.
   - `.claude/tools/README.md` rows 60-61.
7. Docs:
   - `copilot-instructions.md` 68 and 106 (the load order item and the directories row: a `Libs/` submodule, edited in `Krowi_Libraries`).
   - `docs/architecture.md` 53-63, `Tests/README.md:52`.
   - `docs/backlog.md`: 152-153 removed (fixed); the other `Krowi_Options/` paths point at the library repo.

### 4. CurseForge
1. From the library branch: `Sync-Localization.ps1` report, then `-Export` on Krowi's go, so 1783244 gets the 22 phrases and every translation. Re-read until it says "CurseForge now has every enUS phrase" and "CurseForge has them all".
2. After the KAF PR merges, from KAF `main`: the report lists the dropped phrases as "On CurseForge only", and `-Export -Delete '<keys>'` runs on Krowi's approval, with the translation counts named.

### 5. Tests and review
- **Headless:** `run-tests.lua` with `options`, `escape`, `help`, `popups`; `Check-Repo.ps1` whole tree; `Find-DeprecatedApi.ps1` on the library; Lua 5.1 syntax (hook).
- **In game** (deploy the KAF worktree with the library branch in `Libs/`):
  - Retail: `/kaftest options` and `/kaftest escape`.
  - Mists: `/kaftest options`.
  - Krowi looks at the window on both: rows, dropdowns, sliders, key buttons, cards, search, help pane, lightbox, resize.
- **Two copies, Retail, once:**
  - Deploy the library as `AddOns\Krowi_Options` next to KAF. It loads after KAF and finds KAF's `KROWI_LIBMAN`.
  - Its files print a temporary line after their guard.
  - (a) With equal minors: no line, no warning in BugGrabber.
  - (b) With every minor +1: a line per file, no warning, and the window works.
  - Then the folder is removed. The prints never get committed.
- **Review:** `krowi:taint-reviewer` on the library diff; `/code-review` on both PRs.

### 6. PRs, release, write-back
1. The library PR goes first; on Krowi's go, merge, then `krowi:release` 2.0 alpha (the dry-run zip shown first).
2. The KAF PR pins `Libs/Krowi_Options` to the tag 2.0; on Krowi's go, merge, then step 4.2.
3. Write-back:
   - The kit's `WowAddons.md` workspace table lists Krowi_Options among the libraries.
   - The library repo's `CLAUDE.md` gets known debt from the spike that stays open: Escape handled by the consumer, the empty help pane, Defaults on sections without settings.
   - Memory.

## Risks
- **Look regressions from the XML-to-Lua move:** caught by the suites' geometry checks and Krowi's look in game; builders follow the inventory field by field.
- **The `Select.Dropdown` child declared inside `DropdownWithSteppersTemplate`:** check `wow-ui-source` for an own `Dropdown` key before building it.
- **Titan has no local client:** checked against `wow-ui-source\classic_titan` only.
- **105.0 waits for both PRs and the 2.0 release.**

## Verification (end to end)
Headless suites green. In-game runs green on Retail and Mists with no BugGrabber rows. The two-copy runs as above. Both CurseForge reports in step. KAF's release preflight finds `Libs/Krowi_Options` at its newest tag.