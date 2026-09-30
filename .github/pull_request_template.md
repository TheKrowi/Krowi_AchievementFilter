## What
<!-- Short summary of the change. One sentence is enough. -->

## Why
<!-- Why is this needed? Link the issue (Closes #NNN; it does not auto-close, dev is not the default branch) and the work folder docs/work/<issue>-<slug>/ (intent.md, spec.md, plan.md). -->

## Game Client Affected
<!-- Mark all that apply -->
- [ ] Retail (mainline)
- [ ] Classic (Wrath / Cata / Mists)

## How to Verify In-Game
<!-- Steps for manual verification after a /reload, or the /kaftest suite to run -->
1. 

## Review
<!-- The REVIEW.md passes run on this PR, their findings and what was fixed or deferred -->

## Checklist
- [ ] Work folder `docs/work/<issue>-<slug>/` with intent, spec and plan, all `Status: done` (or n/a: documentation only, routine data under a data skill, release)
- [ ] Bug fix: a scenario in `Tests/` reproduced the bug (`Recorded` differed from `Target`) and now passes with `Recorded` = `Target`
- [ ] New Lua files are registered in the appropriate `Files.xml` manifest
- [ ] New SavedVariables are declared in `Krowi_AchievementFilter.toc`
- [ ] New localization strings are added to `Localization/enUS.lua` directly **below** the `-- [[ Exported at ... ]] --` line under the `AUTOGENTOKEN` marker
- [ ] `_Packaging/Changelog.md` is updated
- [ ] `Check-Repo.ps1` is clean and the `REVIEW.md` passes are done
- [ ] Tested in Retail (if applicable)
- [ ] Tested in Classic (if applicable)
