local _, addon = ...
local L = addon.L

-- The right-click menu's settings and its section of the options window, whether the feature is on or off; the registry
-- puts the switch on top (Features.lua). The saved keys stay under RightClickMenu, where they were before the feature
-- moved (docs/work/2026-11-09-right-click-menu). The window draws only a group's leaves, so the two old groups are
-- headers here, drawn as sub-headings (Options/Window/Source.lua, Leaves).

local AdjustedWidth = addon.InjectOptions.AdjustedWidth

local wowheadRelatedTabs = {
    L["None"],
    L["Criteria of"],
    L["Guides"],
    L["News"],
    L["Comments"],
    L["Screenshots"]
}

local function Rows()
    return {
        Button = {order = 1, type = "header", name = L["Button"]},
        ShowButtonOnAchievement = {
            order = 2, type = "toggle", width = AdjustedWidth(1.5),
            name = L["Show Right Click Menu"]:K_ReplaceVars(L["Right Click Menu"]),
            desc = L["Show Right Click Menu Desc"]:K_ReplaceVars(L["Right Click Menu"]):KAF_AddDefaultValueText("RightClickMenu.ShowButtonOnAchievement"):K_AddReloadRequired(),
            get = function() return addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement end,
            set = function(_, value) addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement = value end
        },
        Wowhead = {order = 3, type = "header", name = L["Wowhead link"]},
        AddLocale = {
            order = 4, type = "toggle", width = AdjustedWidth(1.5),
            name = L["Add Locale"],
            desc = L["Add Locale Desc"]:K_ReplaceVars(L["Wowhead Link"]):KAF_AddDefaultValueText("RightClickMenu.WowheadLink.AddLocale"),
            get = function() return addon.Options.db.profile.RightClickMenu.WowheadLink.AddLocale end,
            set = function(_, value) addon.Options.db.profile.RightClickMenu.WowheadLink.AddLocale = value end
        },
        AddRelatedTab = {
            order = 5, type = "select", width = AdjustedWidth(1.5),
            name = L["Related Tab"],
            desc = L["Related Tab Desc"]:K_ReplaceVars(L["Wowhead Link"]):KAF_AddDefaultValueText("RightClickMenu.WowheadLink.AddRelatedTab", wowheadRelatedTabs),
            values = wowheadRelatedTabs,
            get = function() return addon.Options.db.profile.RightClickMenu.WowheadLink.AddRelatedTab end,
            set = function(_, value) addon.Options.db.profile.RightClickMenu.WowheadLink.AddRelatedTab = value end
        }
    }
end

addon.Features.AddOptions("RightClickMenu", {
    Defaults = {
        RightClickMenu = {
            ShowButtonOnAchievement = false,
            WowheadLink = {
                AddLocale = true,
                AddRelatedTab = 1
            }
        }
    },
    Rows = Rows,
    -- Between Tooltips and Pop Out in the Achievement window group (Options/Window/Map.lua)
    Section = {Id = "rightclick", Name = L["Right-click menu"], Card = L["Card Right Click"], NavGroup = "window", Order = 90}
})