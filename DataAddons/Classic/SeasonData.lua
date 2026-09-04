local _, addon = ...

-- Classic reuses Retail's season numbers for completely different real dates, so its anchors must
-- be registered here and never in DataAddons\Retail\SeasonData.lua, even for achievements that
-- live in a Shared data file.
-- Anchors hold the date Blizzard announced for the NA region. Do not convert them to another
-- region: each client snaps an anchor to its own weekly reset, which differs per region in both
-- weekday and time of day. Omit the end anchor until Blizzard announces it.
-- Only the current and upcoming seasons need a row. Older seasons already resolve correctly
-- through GetCurrentArenaSeason, which is only unreliable around a boundary.
