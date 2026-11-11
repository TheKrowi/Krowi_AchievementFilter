# Intent: Every feature's texts in every language
Author: Krowi (maintainer). Source: idea, 2026-11-11, after Pop Out's review (docs/work/2026-11-09-pop-out) found the shared feature phrases gendered, and the check of them showed Pop Out and Reward preview texts missing in six languages. Status: accepted

## Problem
1. The two phrases every feature shares, `Feature Switch Desc` (the Enable row's description) and `Feature Off Help` (the help page's line while a feature is off), agree with a masculine {feature} in frFR, esES, esMX, itIT and ptBR, and with a neuter one in deDE and ruRU's Off Help. Feature titles have every gender: French players read "Une fois désactivé, Fenêtre flottante est entièrement coupé", Spanish players "Vista previa de recompensas está desactivado. Actívalo ...". `Feature Controls Desc` was fixed for this in Pop Out's change by naming "the feature" before the title.
2. Pop Out and Reward preview show English texts in esES, esMX, itIT, koKR, ptBR and zhTW: 6 of Pop Out's 42 texts (its title, Close Popout, Remember Size, Snap Distance, Appearance, Faded Opacity) and 2 of Reward preview's 16 (Preview Reward, Choose one of {count} rewards) have no line in those files. Right-click menu, the third feature, misses 24 of its 42 texts in esES, esMX and itIT, and some in koKR and ptBR.
3. Nothing stops the next feature from shipping the same way: the localization rule asks for every new or renamed string in every locale file, but not for a feature's older strings, and no check counts them.

## Proposed outcome
A player in any of the 11 languages reads every text of every feature (setting names, descriptions, help, menu entries, window labels) in their own language, and grammatically right whatever the feature's title. A new rule, checked by the repo lint: every feature has all its texts in every language.

## Affected users and systems
Players of every non-English client, on Retail and Mists Classic: the Pop Out, Reward preview and Right-click menu option sections, help pages, menus and windows. The 10 translated `Localization/<lang>.lua` files, the CurseForge localization project, `.claude/rules/` and the repo lint `Check-Repo.ps1`. No code, no saved variables.

## Constraints
No translation is lost, in the repo or on CurseForge; keys do not change; a German "Pop Out", "Buttons" or "Wowhead" that is English on purpose stays. The sync runs only through `krowi:localization`. 106.0 is unreleased, so no player has seen the gendered phrases and the changelog needs no line for them.

## Open questions
- Does the work cover Right-click menu now, or only Pop Out and Reward preview as asked?
- How far does the rule reach: the features in this repo, all of this addon's texts (esES, esMX and itIT have 370 of enUS's 1203 lines), or every Krowi repo?
- Do the gendered phrases ride in the same pull request?