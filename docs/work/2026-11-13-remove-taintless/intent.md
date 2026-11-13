# Intent: Remove the TaintLess library
Author: Krowi, maintainer. Source: idea. Status: accepted

## Problem
KAF ships the third-party library TaintLess (townlong-yak, version 24-02-20), loaded first from `Libs/Files.xml`. It was added in release 70.0 (2024-04-20) to cut down "Interface action failed because of an AddOn" and "AddOn has been blocked" messages. In Krowi's words: it "was added in an attempt to remove taint but felt like it never did something, remove it." It is code KAF carries, loads on every client and cannot maintain (all rights reserved, unmodified copies only), for no benefit anyone has seen.

## Proposed outcome
KAF no longer ships or loads TaintLess on any client. Players notice nothing, unless one of its two still-working drop-down hooks was quietly saving them from a blocked action on Mists (see Open questions).

## Affected users and systems
- Every client the `.toc` lists (`## Interface: 120105, 50504, 38002`: Retail, Mists, and Titan Reforged, which has no local install): TaintLess loads on all of them.
- Mists and Titan: KAF's menus go through Blizzard's old drop-down menu, which two of TaintLess's hooks guard.
- No saved variables, options, data or locales. No KAF code or embedded Krowi library calls TaintLess.
- Other addons: an addon that ships its own copy of TaintLess keeps installing its hooks; only KAF's copy goes.

## Constraints
- No new taint: KAF's menus on Mists must not start blocking Blizzard's own drop-downs (honor queue type, and the like).
- No change to the other vendored libraries or the submodules.

## Open questions
- Does removing the two drop-down hooks let a KAF menu on Mists taint Blizzard's honor queue drop-down so that queueing is blocked? Only an in-game check on Mists answers this.