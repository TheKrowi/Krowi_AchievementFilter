local _, addon = ...
local L = addon.L

-- Pop Out's help page in the options window, whether the feature is on or off, and its Show me scene, which the registry
-- wires only while the feature is started (Features.lua AddHelp). The scene is shared with /kaftest pictures through
-- Options.Window.HelpScenes.

local window = addon.Options.Window
local blocks, kit = window.HelpBlocks, window.ShowMeKit

-- The achievement the player tracks, else the one selected in the window, else one not earned yet
local function Scene(ready)
    kit.LoadAchievementUI()
    local achievement
    for _, id in ipairs(addon.Gui.TrackingSlots.GetTrackedIds()) do
        achievement = achievement or addon.Data.Achievements[id]
    end
    achievement = achievement or KrowiAF_AchievementsFrame.SelectionBehavior:GetFirstSelectedElementData() or kit.PickAchievement(kit.NotEarned)
    if not achievement then
        return false
    end
    local popout = addon.Gui.AchievementPopout:Open(achievement)
    kit.Ready(ready, {Popout = popout, Achievement = achievement})
end

-- Names the modifier the player set, read each time the page draws; None (1) opens no Pop Out by clicking
local function Intro()
    local db = addon.Options.db
    local modifier = db and db.profile.Achievements.Modifiers.PopOut or 3
    if modifier == 1 then
        return L["Help Popout Intro No Modifier"]:K_ReplaceVars({clickModifier = L["Click Modifier"]})
    end
    return L["Help Popout Intro {modifier}"]:K_ReplaceVars({modifier = addon.Modifiers[modifier] or addon.Modifiers[3]})
end

addon.Features.AddHelp("PopOut", {
    Id = "popout",
    Title = L["Pop Out"],
    Blocks = blocks.Blocks(
        blocks.Picture("PopOut"),
        blocks.Text(Intro),
        blocks.Term(L["Close On Earn"], L["Help Popout Close On Earn"])
    ),
    Scene = Scene
})