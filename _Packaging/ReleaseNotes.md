### Added
- 12.0.5 achievements (~90)
    - Decor Duel event achievements (10)
    - Ritual Sites achievements including Broken Throne and Daggerspine Point sub-categories and their Challenges (55)
    - Void Assaults achievements for Eversong and Zul'Aman (18)
    - Additional Abyss Anglers achievements (16)

### Changed
- The War Within and Midnight achievement data internally migrated to a new fluent V2 builder format (dev note: this is an invisible change for users; the new format uses method chaining instead of nested tables — e.g. `Ach(12345):Mount():PvE(13)` — which greatly improves readability and reduces data entry errors)

### Fixed
- Season-gated achievements using the legacy "Season" end function keyword were evaluating obtainability state against the wrong field (start instead of end), producing incorrect results
- Removed a debug flag in TemporaryObtainable that could have accidentally shipped with hardcoded season and version overrides, causing all time-gated achievements to show incorrect obtainability states
- Several unobtainable achievements were incorrectly showing as obtainable when "Past Obtainable" was unchecked:
    - Boldly, You Sought the Power of Ragnaros (9550) — WoW 10th Anniversary Molten Core LFR, never returned
    - Dragonflight Season 2 Master (18027) — now gated to PvE Season 10 / PvP Season 35
    - Defender of the Timeways (18705) — now gated to before version 10.2.0
    - Dragonflight Season 3 Master (19396) — now gated to PvE Season 11 / PvP Season 36
    - Dragonflight Season 4 Master (20481) — now gated to PvE Season 12 / PvP Season 37