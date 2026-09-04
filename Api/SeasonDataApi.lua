local _, addon = ...

local function IsOnOrBefore(a, b) -- {year, month, day}
    for i = 1, 3 do
        if a[i] ~= b[i] then
            return a[i] < b[i]
        end
    end
    return true
end

-- The game's own season APIs are unreliable around a boundary: C_MythicPlus.GetCurrentSeason and
-- GetCurrentArenaSeason report a season up to two weeks before it opens and keep reporting it up
-- to two weeks after it closed. Anchors registered here override them per side.
-- An anchor is a region agnostic {year, month, day} marker holding the date Blizzard announced for
-- the NA region. Each client snaps it to its own weekly reset, which differs per region in both
-- weekday and time of day.
-- Retail and Classic reuse the same season numbers for different real dates, so these are
-- registered from separate per client data files.
function KrowiAF.AddSeasonData(seasonFunction, seasonNumber, startAnchor, endAnchor)
    if startAnchor and endAnchor and IsOnOrBefore(endAnchor, startAnchor) then
        addon.Diagnostics.Debug("Season data for " .. seasonFunction .. " " .. seasonNumber .. " ends on or before it starts")
    end

    addon.Data.Seasons = addon.Data.Seasons or {}
    addon.Data.Seasons[seasonFunction] = addon.Data.Seasons[seasonFunction] or {}
    addon.Data.Seasons[seasonFunction][seasonNumber] = {
        Start = startAnchor,
        End = endAnchor
    }
end
