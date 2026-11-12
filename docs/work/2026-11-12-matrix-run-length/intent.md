# Intent: a shorter /kaftest matrix run
Author: Krowi (maintainer). Source: idea; the Event reminders move's in-game runs (docs/work/2026-11-12-event-reminders), "why do they take so long, can we make them more efficient?", then "Yes" to starting this item (2026-11-12). Status: done

## Problem
The release gate wants a green `/kaftest matrix` on the newest Retail and Mists build after every change under `Features/`, and every feature PR runs it on both clients. It runs every suite but the probes (18) once with every feature on, once with every feature off and once per feature alone: six steps today, one more with each feature 106 splits off. On Retail 12.1.5 on 2026-11-12 a step took about 2 min 10 s, 13 min for the matrix, plus about 2 min to start the client and log in, while the PC is not Krowi's.

Where a step's time went (Retail, Event reminders alone):
- memory: 56 s, nearly all of it the idle minute, an observation of what the addon allocates in 60 s with nothing touched, which fails nothing;
- options: 32 s, a second's settle and a second after each step's screenshot;
- special 14 s, tracking 6 s, popups 4 s, the rest a few seconds;
- the `/reload` between steps and the login delay: about 13 s.

The runner, `Run-GameTests.ps1 -Matrix`, also lost track once: it read the saved plan once after a `/reload`, found none though the game had saved it, and stopped after step 1 with the client in the middle of step 2.

## Proposed outcome
A matrix run takes less of Krowi's PC without proving less: what fails today still fails, and the release gate reads the run as before. The runner follows a matrix to its end.

## Affected users and systems
No player: `Tests/` and `.claude/tools/` only, never in the release zip. Krowi and every session that runs the matrix or the release gate, on Retail and Mists. The suites `memory`, `options`, `popups`, `tracking`; the matrix in `Tests/Tests.lua`; `Run-GameTests.ps1`; `.claude/rules/release.md` and `Tests/README.md` if what a step runs changes.

## Constraints
- Every check that can fail today runs in every step it runs in today, unless Krowi decides otherwise.
- The release gate's rule (`.claude/rules/release.md`: every suite but the probes, all on, all off, each alone) and its reading of the matrix record stay valid.
- A plain `/kaftest run` and a suite on its own keep their screenshots and the idle minute.

## Open questions
- Which of the four backlog items (docs/backlog.md, "The matrix run's length") are in scope.