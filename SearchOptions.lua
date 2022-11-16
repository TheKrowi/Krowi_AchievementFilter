-- [[ Namespaces ]] --
local _, addon = ...;
addon.SearchOptions = {};
local searchOptions = addon.SearchOptions;

local defaults = {
    profile = {
        SearchIds = false,
        SearchNames = true,
        SearchDescriptions = true,
        SearchCriteria = false,
        SearchRewards = false
    }
};

function searchOptions:Load()
    local options = LibStub("AceDB-3.0"):New("Filters", defaults, true);
    self.db = options.profile;
end