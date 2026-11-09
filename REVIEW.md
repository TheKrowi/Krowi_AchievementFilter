# Review policy

Every review pass on a change to this repository reads this file: Claude Code's `/code-review` and Code Review, the `krowi:taint-reviewer` subagent, and the maintainer. The rules a change is held to live in `.github/copilot-instructions.md`. This file says what a review looks for, how findings are ranked and what is left out. The lifecycle a PR belongs to is `docs/sdlc-playbook.md`.

## Passes

Run each pass separately and rank the findings by severity.

1. **Intent.** The change does what the work folder's `spec.md` and `plan.md` say (`docs/work/<id>-<slug>/`) and nothing beyond them; the root cause is fixed rather than its symptom; a departure from the plan is recorded in `plan.md`.
2. **Correctness.** Nil paths, load order (`Files.xml` and the `.toc`), boot phase (anything touching Blizzard's achievement frame runs in phase 2; `addon.Data.Achievements` is empty until `PostBuildCache`), both clients (`addon.Util.IsMainline`, the Classic layouts without `AchievementFrame.HeaderDetails`), option defaults and option setters that change the same frames at runtime.
3. **Taint and secret values.** Delegate to the `krowi:taint-reviewer` subagent for any change to GUI code, hooks on Blizzard frames or functions, event handlers, writes to globals, or reads of lockdown-protected APIs. The changelog's dev notes and the `## Root cause` sections of `docs/work/*/spec.md` are the case law.
4. **Data.** Achievement ids exist on the client that registers them (`data-verifier`), each id is registered once, the category snapshot is unchanged or its diff is part of the change, and zone decisions still agree with the ZoneData files.
5. **Plugins and skins.** ElvUI, GW2_UI, EllesmereUI and the other integrations under `Plugins/` address the addon's frames by global name and anchor; a renamed, reparented or re-anchored frame is checked against them.
6. **Proof.** A bug fix comes with a scenario that reproduced it (`Recorded` before the fix differs from `Target`, and equals it after), the lint is clean, the changelog has a line written for players (a dev note is the maintainer's own aside, never a technical root cause; that lives in `spec.md`), and the in-game checks listed in the PR were run on the clients it touches.
7. **Texts.** Every name, description, help text and changelog line the change adds or rewords, and nothing it leaves alone. Krowi's own words are the reference: enUS before the tutorial was removed, with his option descriptions and the tutorial pages (`git show 86777e68^:Localization/enUS.lua`).
   - Setting names are Title Case as Blizzard's Settings window writes them, short words lower case ("Show Pings in Chat", "Max Number of Icons").
   - A description starts with a verb and says what changes ("Show / hide …", "Enable / disable …", "The width of …"), without the tells of AI-written text: two clauses joined by a colon, "either way", the code's view of a feature ("no longer starts").
   - Every new or renamed string is translated in all locale files in the same change and goes to CurseForge with its translations (`krowi:localization`).
   - A Blizzard global string reused as a text means the same in every language, not only in English: the game's "Mount" is the verb in French.
   - During the feature split (106), a setting of the same kind as one in a feature already split takes its name; a section not split yet keeps its old texts until its own split.

## Important versus minor

A finding is **Important** when it would cause a Lua error, taint, `ADDON_ACTION_FORBIDDEN`, wrong or missing data for players, lost saved variables, a break on one of the two clients, a broken plugin or skin, behaviour that differs from the spec, or a text or translation that fails the Texts pass. Everything else is minor, and minor findings are reported only when a thorough review was asked for.

## Leave out

- Anything `Check-Repo.ps1` reports (syntax, globals, `.luarc.json`, BOM, line endings, semicolons, `Files.xml`, the data pipeline, the scenario suites): run it instead of reviewing for it.
- `Libs/` (vendored; fixes go upstream), locale lines beyond the ones the change adds, the files under `.claude/tools/headless/snapshots/` (reviewed through the `category-snapshot` diff), and `raw/` reports.
- The style of existing code the change does not touch.

## Gate

Findings never approve or block a PR by themselves: the maintainer approves the merge, and either merges it or tells the agent to. A finding the author accepts but defers goes into `docs/codebase-analysis.md`. A finding that comes back across PRs is a correction for `.github/copilot-instructions.md`.
