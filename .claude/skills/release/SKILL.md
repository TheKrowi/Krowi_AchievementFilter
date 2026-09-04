---
name: release
description: Release Krowi_AchievementFilter. Verifies branch, working tree, Changelog.md and TOC version are release-ready, then runs the Krowi Addon Manager "Full Package" (release notes, README, commit, tag, zip, upload to Wago, CurseForge and GitHub). Use when the user says release, ship, publish, cut a version, or full package.
---

Release Krowi_AchievementFilter by driving the existing Krowi Addon Manager. Do not re-implement any packaging step; the Python project already does all of it.

## What "Full Package" does

Operation 10 in the addon manager (`--operation package`) runs, in this order, from
`E:\World of Warcraft Addon Development\Krowi_AddonManager\Krowi_AddonManager_Python\main.py`:

1. Generate `_Packaging/ReleaseNotes.md` from `_Packaging/Changelog.md` (all entries whose major version matches the TOC version).
2. Regenerate `README.md` from `_Packaging/Description.md` plus badges built from the TOC `Interface` lines.
3. `git add .` then `git commit -m "Release <version>"` then `git push` on the **current branch**.
4. Create annotated tag `<version>` and `git push origin <version> --force`.
5. Zip the addon to `%LOCALAPPDATA%\Temp\Krowi_AchievementFilter Export\` (opens Explorer).
6. Upload to Wago, CurseForge, and GitHub Releases with `ReleaseNotes.md` as changelog.

Everything after step 3 is outward-facing and not reversible. Preflight exists to make sure step 3 commits exactly what is intended.

## Conventions in this repo

- Releases are tagged on `dev`. Every recent `Release X.Y` commit and tag lives on `dev`. `main` is far behind and is not part of the release flow today, even though copilot-instructions says dev merges to main at release.
- Version is `major.minor` (e.g. `100.2`), occasionally `major.minor.patch`. Tag name equals the TOC `## Version:` value.
- The changelog header must be `## <version> - <YYYY-MM-DD>`. Without the date the regex in the addon manager does not match and the release fails with "No changelog entries found".
- The commit made by the tool includes `.vscode/settings.json` and anything else modified. That is accepted practice here.

## Steps

### 1. Preflight

Run the check script from the repo root. It exits non-zero if anything blocks the release.

```powershell
& ".claude\skills\release\Check-ReleaseReady.ps1"
```

Pass `-Version 100.2` to also assert the intended version, or `-AllowUntracked` if the user has confirmed untracked files should be committed as part of the release.

It checks:
- Current branch is `dev` and not behind `origin/dev`.
- Working tree has no untracked files. `git add .` would sweep them into the release commit. `.claude/worktrees/` is a common culprit because it contains embedded git checkouts.
- Top `Changelog.md` entry has a version and a date, and the date equals the day the script runs. A stale date blocks the release; update it to today before packaging.
- TOC `## Version:` equals the changelog version.
- Tag does not already exist locally or on origin. The tool would force-overwrite it.
- The addon manager and its venv exist.

Fix what it reports. Typical fixes, in order of likelihood:
- Bump `## Version:` in `Krowi_AchievementFilter.toc` to the new version.
- Add ` - <today>` to the top changelog header.
- Remove, ignore, or deliberately stage stray untracked files.

Read the top changelog entry and sanity-check it against `git log <last tag>..HEAD --oneline`. If a merged PR or fix is missing from the changelog, add it before releasing. Follow the existing style: past-tense bullets under `### Added`, `### Changed`, `### Fixed`, with an optional `(dev note: ...)` for technical detail.

Also glance at `## Interface:` in the TOC. If a new game build went live since the last release, the interface numbers need updating first, because the badges and the upload game-version list come from them.

### 2. Optional dry run

Generates release notes, README, and zip without git or uploads. Useful when the changelog format changed or after a long gap between releases.

```powershell
& "E:\World of Warcraft Addon Development\Krowi_AddonManager\.venv\Scripts\python.exe" "E:\World of Warcraft Addon Development\Krowi_AddonManager\Krowi_AddonManager_Python\tests\test_operations.py" Krowi_AchievementFilter
```

Review the generated `_Packaging/ReleaseNotes.md`. It becomes the CurseForge, Wago and GitHub release text.

### 3. Confirm, then run the full package

Show the user the version, the top changelog entry, and the list of files that will be committed (`git status --short`). Ask for a go-ahead unless they already said to release without asking. Then run:

```powershell
Set-Location "E:\World of Warcraft Addon Development\Krowi_AddonManager\Krowi_AddonManager_Python"
& "E:\World of Warcraft Addon Development\Krowi_AddonManager\.venv\Scripts\python.exe" main.py --addon Krowi_AchievementFilter --operation package --stability stable
```

`--stability` defaults to **alpha**. Always pass `stable` for a normal release. Use `beta` only if the user asks for a beta build.

### 4. Verify

Read the tool output. Each upload prints a `✓` or `✗` line. A `✗` on one host does not stop the others, so check all three. Then confirm:

```powershell
git -C "E:\World of Warcraft Addon Development\Krowi_AchievementFilter" ls-remote --tags origin <version>
gh release view <version> --repo TheKrowi/Krowi_AchievementFilter
```

Report the version, the commit hash, and which hosts succeeded. If a host failed, the single-host operations (`--operation wago`, `curseforge`, `github`) re-upload without redoing git or the tag.

## Gotchas

- Do not run the package step twice for the same version. The tool deletes and force-pushes the tag, and the hosts reject or duplicate the file.
- The tool commits on whatever branch is checked out. Being on a feature branch means the release commit and tag land there.
- If the changelog has an entry for the new version but the TOC still has the old version, release notes are generated for the old version and the tag is created for the old version. Preflight catches this.
- The Python project reads hosting tokens from its own `resources.py`. Never copy those into this repo or into chat output.
