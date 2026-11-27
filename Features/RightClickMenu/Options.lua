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
        ShowButtonOnAchievement = addon.Settings.Row("rightClickMenu.showButtonOnAchievement", {
            order = 2, type = "toggle", width = AdjustedWidth(1.5),
            name = L["Show Menu Button"],
            desc = L["Show Menu Button Desc"]:KAF_AddDefaultValueText("rightClickMenu.showButtonOnAchievement"):K_AddReloadRequired(),
        }),
        Wowhead = {order = 3, type = "header", name = L["Wowhead link"]},
        AddLocale = addon.Settings.Row("rightClickMenu.wowheadLink.addLocale", {
            order = 4, type = "toggle", width = AdjustedWidth(1.5),
            name = L["Use Game Language"],
            desc = L["Use Game Language Desc"]:KAF_AddDefaultValueText("rightClickMenu.wowheadLink.addLocale"),
        }),
        AddRelatedTab = addon.Settings.Row("rightClickMenu.wowheadLink.addRelatedTab", {
            order = 5, type = "select", width = AdjustedWidth(1.5),
            name = L["Open on Tab"],
            desc = L["Open on Tab Desc"]:KAF_AddDefaultValueText("rightClickMenu.wowheadLink.addRelatedTab", wowheadRelatedTabs),
            values = wowheadRelatedTabs,
        })
    }
end

addon.Features.AddOptions("RightClickMenu", {
    Defaults = {
        ["rightClickMenu.showButtonOnAchievement"] = false,
        ["rightClickMenu.wowheadLink.addLocale"] = true,
        ["rightClickMenu.wowheadLink.addRelatedTab"] = 1,
    },
    Rows = Rows,
    -- Between Tooltips and Pop Out in the Achievement window group (Options/Window/Map.lua)
    Section = {Id = "rightclick", Name = L["Right-click menu"], Card = L["Card Right Click"], NavGroup = "window", Order = 90}
})