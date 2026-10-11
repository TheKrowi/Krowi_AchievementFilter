# Intent: Three latent bugs found while exploring achievement guides
Author: Krowi (maintainer), captured by Claude. Source: found during the exploration of `docs/work/2026-10-11-achievement-guides` (its spec and plan list them under "Found on the way"). Status: accepted

## Problem
Three small defects that no player has reported. Each was introduced by a rework that left one call site behind.

- **A. Pet guide links and the options tutorial menu break.** In the right-click menu of a pet battle achievement, the "Xu-Fu's Pet Guides" entry and its criteria entries should open a popup with the link to copy. Instead the click raises a Lua error and nothing opens. The "Tutorial" button in the General options has the same problem. It errors for every player who has no other Krowi addon installed. For a player who has one (Krowi_Brokers_Template ships the old library), it opens the menu through that other addon's older menu code. Both have been broken since Release 92.0 (January 2026).
- **B. "(Missing)" entries are not greyed out.** The right-click menu links to related achievements: chain, required for, other faction and first category. When the addon does not know the linked achievement, the entry gets "(Missing)" and is meant to be greyed out. It is clickable, and the click does nothing. This has been the case since the menu rework of December 2025.
- **C. "Most progress" shows on transmog set achievements.** The achievement tooltip was meant to hide its "Most progress" section on achievements with transmog set data. For those achievements the transmog set progress section replaces the plain objectives, and collected appearances are shared by the whole account. Since October 2024 the section shows again, because the check reads a field that no longer exists.

## Proposed outcome
- A: clicking a pet guide link opens the copy-link popup, and the Tutorial button opens the tutorial menu, on every install.
- B: "(Missing)" entries are greyed out and cannot be clicked.
- C: the tooltip of a transmog set achievement behaves the way the maintainer decides (see Open questions; decided in the spec: it keeps showing "Most progress").

## Affected users and systems
- A: the right-click menu of every achievement with pet battle link data (Retail Mists of Pandaria to Midnight, Mists Classic), and the General options on both clients.
- B: the right-click menu on both clients.
- C: the achievement tooltip on Retail. Only Retail has transmog set data.
- No saved variables, options, data files or localization change.

## Constraints
- `Libs/` is not edited. The fixes go in the addon's own call sites.
- Other Krowi addons that still ship the old libraries keep working. The addon does not register the old library names itself.
- Menu entries that are not "(Missing)" keep their behaviour.

## Open questions
- C: restore the intended exclusion, or remove the dead check and keep showing the section on transmog set achievements?
- A: the regression guard. A fixed bug leaves a scenario behind, but a library name is a mechanical fact, so a lint rule may guard it better than a scenario.
- Is this one work item or three?