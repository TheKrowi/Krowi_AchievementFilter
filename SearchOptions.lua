-- [[ Namespaces ]] --
local _, addon = ...
addon.SearchOptions = {}
local searchOptions = addon.SearchOptions

local defaults = {
    profile = {
        SearchIds = false,
        SearchNames = true,
        SearchDescriptions = true,
        SearchCriteria = false,
        SearchRewards = false
    }
}

-- For the saved-settings proof (.claude/tools/headless/settings-proof.lua, DefaultsHash): the database is made only once the search box
-- loads with Blizzard's achievement window, its defaults from the start
searchOptions.Defaults = defaults

function searchOptions:Load()
    self.db = LibStub("AceDB-3.0"):New("KrowiAF_SearchOptions", defaults, true)
end