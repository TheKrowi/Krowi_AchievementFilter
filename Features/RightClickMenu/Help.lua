local _, addon = ...
local L = addon.L

-- The right-click menu's help page in the options window, whether the feature is on or off, and its Show me scene, which
-- the registry wires only while the feature is started (Features.lua AddHelp). The scene is shared with /kaftest pictures
-- through Options.Window.HelpScenes. The page names the entries other features add (Guide, Xu-Fu's Pet Guides) as a
-- player sees the menu with everything on.

local window = addon.Options.Window
local blocks, kit = window.HelpBlocks, window.ShowMeKit

local function Scene(ready)
    return kit.ShowAchievement(kit.PickAchievement(kit.EarnedByMe), function(row, achievement)
        addon.Gui.RightClickMenu.AchievementMenu:Open(row, achievement)
        kit.Ready(ready, {Row = row, Achievement = achievement})
    end)
end

addon.Features.AddHelp("RightClickMenu", {
    Id = "rightclick",
    Title = L["Right Click Menu"],
    Blocks = blocks.Blocks(
        blocks.Picture("MenuMain"),
        blocks.Term(L["Wowhead"], L["Help Right Click Wowhead"]),
        blocks.Term(L["Go to"], L["Help Right Click Go To"]),
        blocks.Term(L["Xu-Fu's Pet Guides"], L["Help Right Click Xu Fu"]),
        blocks.Term(L["Transmog Sets"], L["Help Right Click Transmog"]),
        blocks.RetailOnly(blocks.Term(L["Guide"], L["Help Right Click Guide"])),
        blocks.Term(L["More"], L["Help Right Click More"])
    ),
    Scene = Scene
})