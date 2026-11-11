local _, addon = ...
local L = addon.L

-- Reward preview's help page in the options window, whether the feature is on or off, and its Show me scene, which the
-- registry wires only while the feature is started (Features.lua AddHelp). The scene is shared with /kaftest pictures
-- through Options.Window.HelpScenes.

local window = addon.Options.Window
local blocks, kit = window.HelpBlocks, window.ShowMeKit

local function HasMountPreview(id)
    local entries = addon.RewardPreviewData.GetPreviewableEntries(id)
    if not entries then
        return false
    end
    for _, entry in ipairs(entries) do
        if entry.RewardPreviewType == KrowiAF.Enum.RewardPreviewType.MountId then
            return true
        end
    end
    return false
end

local function Scene(ready)
    local achievement = kit.PickAchievement(function(id) return kit.NotEarned(id) and HasMountPreview(id) end) or kit.PickAchievement(HasMountPreview)
    return kit.ShowAchievement(achievement, function(row, selected)
        local frame = KrowiAF_RewardPreview -- the list reuses row frames, so the achievement is checked too
        if not (frame:IsShown() and frame.Pinned and frame.OwnerButton == row and frame.OwnerAchievementId == selected.Id) then
            addon.Gui.RewardPreview:TogglePin(row, selected.Id)
        end
        kit.Ready(ready, {Row = row, Achievement = selected, Preview = frame})
    end)
end

-- Follows Show Icon on Achievements, read each time the page draws: without the icon only the right-click menu opens it
local function Intro()
    local db = addon.Options.db
    local key = (db and not db.profile.Achievements.ShowRewardPreviewIcon) and "Help Rewards Intro No Icon" or "Help Rewards Intro"
    return L[key]:K_ReplaceVars({previewReward = L["Preview Reward"]})
end

addon.Features.AddHelp("RewardPreview", {
    Id = "rewards",
    Title = L["Reward Preview"],
    Blocks = blocks.Blocks(
        blocks.Picture("RewardPreview"),
        blocks.Text(Intro)
    ),
    Scene = Scene
})