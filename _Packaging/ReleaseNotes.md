### Added
- 12.0.7 "Revelations" patch data
    - Sporefall raid instance: Rotmire, Heroic: Rotmire, Mythic: Rotmire
    - Goal! housing decor achievement
    - Big Prey Hunter (Season 1) delve achievement
    - Ritual Sites 612: Practical Ritual Work, Pinnacle Ritual Work, Advanced Ritual Site Studies
    - The Curse of Ula'tek mapped to Zul'Aman
    - Omnium Folio void assault subcategory: The Sunstrider Omnium, Omnium Folio Studies
    - Val and Naigtal void assault subcategory with all associated achievements
    - Master of the Turbulent Timeways V added to Turbulent Timeways event
    - Flame Keeper / Flame Warden of Midnight added to Midsummer Fire Festival

### Changed
- Lorewalking subcategory moved from The War Within to Cross-Expansion and extended with Lorewalking: The Loa from Midnight
- Master of the Turbulent Timeways IV marked as no longer obtainable (event ended)

### Fixed (98.1)
- Further taint fix attempt: recurring `attempt to compare a secret number value` and `attempt to perform arithmetic on local 'textHeight'` errors that appeared after hovering over transmog achievements (dev note: the transmog coroutine's owner guard evaluated to false on a nil owner, letting `CopyPrevTooltipLines` write to `GameTooltip` from addon code after the user moved away; fix aborts when owner is nil or not a KAF frame)
- Reverted the `securecall(GameTooltip.Hide, GameTooltip)` workaround added in 97.3 now that the actual root cause is fixed