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
    self.db = LibStub("AceDB-3.0"):New("KrowiAF_SearchOptions", defaults, true);
end