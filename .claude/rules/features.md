---
paths:
  - "Features/**"
  - "Features.lua"
  - "Slots.lua"
---
# Features that switch off

Since 106 (`docs/work/2026-11-08-feature-split-poc`) a feature lives in `Features/<Name>/` and registers with the registry (`Features.lua`) while its files load; loading them makes nothing (no frame, hook, script, event, timer or slash command). The registry starts it at `ADDON_LOADED` only while its switch is on in the profile, and a switch takes effect after a reload.

A feature reaches the core through the slots (`Slots.lua`: achievement data fields, row icons, achievement menu entries) and the registry's options and help parts; the core never names a feature and a feature never names another (`feature-boundary` lint rule; Tests exempt).

Every feature PR proves: the `features` suite headless, the boundary rule, a `/kaftest matrix` run on Retail and Mists (`.claude/tools/Run-GameTests.ps1 -Matrix`), and the memory after login with the feature off and on.

The registry, the slots and the first feature in detail: `docs/architecture.md`, Features.