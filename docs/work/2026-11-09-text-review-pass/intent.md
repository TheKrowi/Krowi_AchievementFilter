# Intent: A review pass for texts and translations
Author: Krowi (maintainer). Source: idea, 2026-11-09 ("this should be a step in the review process, translations and which texts and names to use"). Status: accepted

## Problem
PR #405's Reward preview texts passed every review and still read as AI-written, used sentence case where Blizzard's Settings and Krowi's older names use Title Case, and needed a second round to fix. No review pass looks at player-facing text: `REVIEW.md`'s six passes cover intent, correctness, taint, data, plugins and proof. Each of the 14 features still to split brings its own names, descriptions and help texts.

## Proposed outcome
Every review reads the names, descriptions, help texts and changelog lines a change adds or rewords against a fixed list, and a text that fails it is reported like any other Important finding, before Krowi sees it.

## Affected users and systems
Review only: `REVIEW.md` (read by `/code-review`, Code Review, `krowi:taint-reviewer` and Krowi), and one line in the kit's shared rules (`WowAddons.md`, Working with Krowi) so the other Krowi addons name and word their settings the same way. No addon code.

## Constraints
Sections not split yet keep their old texts until their own split (Krowi). The rule must not invite rewording texts a change does not touch.

## Open questions
None: where the step lives and what it checks were settled on 2026-11-09.