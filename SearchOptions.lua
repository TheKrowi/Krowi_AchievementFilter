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

-- The search toggles follow the filter profile (docs/work/2026-11-25-settings-store), one live table per profile
addon.Settings.Declare("search", {Kind = "object", System = "filters", Default = defaults.profile})