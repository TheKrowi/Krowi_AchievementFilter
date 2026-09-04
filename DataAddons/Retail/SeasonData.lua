local _, addon = ...

-- Anchors hold the date Blizzard announced for the NA region. Do not convert them to another
-- region: each client snaps an anchor to its own weekly reset, which differs per region in both
-- weekday and time of day. Omit the end anchor until Blizzard announces it.
-- Only the current and upcoming seasons need a row. Older seasons already resolve correctly
-- through C_MythicPlus.GetCurrentSeason / GetCurrentArenaSeason, which are only unreliable
-- around a boundary.

KrowiAF.AddSeasonData("PvE Season", 18, {2026, 8, 18}) -- Midnight Season 2
