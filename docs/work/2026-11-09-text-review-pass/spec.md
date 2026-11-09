# Spec: A review pass for texts and translations
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. `REVIEW.md` has a seventh pass, Texts, applied to every name, description, help text and changelog line a change adds or rewords, and to nothing else.
2. The pass checks:
   1. setting names in Title Case as Blizzard's Settings window writes them, short words lower case;
   2. a description starts with a verb and says what changes, in Krowi's words, read against his older option texts and the old tutorial, without the tells of AI-written text (two clauses joined by a colon, "either way", the code's view such as "no longer starts");
   3. every new or renamed string translated in all locale files in the same change and sent to CurseForge with its translations;
   4. a Blizzard global string reused as a text means the same in every language, not only in English (the game's "Mount" is the verb in French; Krowi's side note);
   5. during the feature split, a setting of the same kind as one in a feature already split takes that name; a section not split yet keeps its old texts.
3. A text that fails the pass is an Important finding, so a normal review reports it.
4. The kit's `WowAddons.md` (Working with Krowi) carries checks 1, 2 and 4 for every Krowi addon.

## Design
The reference texts are reachable without a session's memory: `git show 86777e68^:Localization/enUS.lua` is enUS before the tutorial was removed (Krowi's option descriptions and the tutorial pages). Blizzard's case comes from `Blizzard_SettingsDefinitions_Frame` and the enUS global strings: 94 of 127 setting names in Title Case, 2 in sentence case. Check 3 restates the kit's rule (`WowAddons.md`, Git: Localization; `krowi:localization`, step 2) as something a reviewer checks. Check 5 is specific to this repo and the 106 split, so it stays out of the kit.

## Options considered
1. **`REVIEW.md` pass plus a kit line (chosen):** the review that every pass reads, and the other addons follow the same names and voice.
2. `REVIEW.md` only: the other addons would not know the case and voice rules.
3. A step in the kit's `krowi:process-issue`: every repo's review, but the 106 rule does not belong there and `REVIEW.md` is what `/code-review` reads.

## Areas of concern
- Taint, clients, Blizzard API, other addons, saved variables, libraries, data snapshots: none (review policy only).
- Localization: check 3 holds a change to the rule it already has; no locale file changes.
- Player-facing text: the subject of the pass; it applies only to text a change adds or rewords.

## Verification
- `Check-Repo.ps1` clean.
- `Get-ChangeClass.ps1`: harness.
- The pass, applied by hand to #405's texts, finds what #407 fixes; applied to #407's, finds nothing.

## Decision
Krowi, 2026-11-09: "REVIEW.md + kit line (Recommended)" and the checks "As listed (Recommended)"; the Blizzard global string check from Krowi's side note the same day.