local _, addon = ...
local feature = addon.RewardPreview

-- The preview icons on an achievement row, a provider of the core's row icon slot (Slots.lua, RowIcons) added by the
-- feature's Start. Each icon keeps its reward in icon.Data, which the row clears with the icon
-- (Gui/WindowFrames/AchievementButton/AchievementButtonExtraIconFactory.lua).

local function OnEnter(icon)
    if not addon.Options.db.profile.Achievements.RewardPreviewMouseoverShow then
        return
    end
    local frame = KrowiAF_RewardPreview
    local button = icon:GetParent()
    if frame:IsShown() and frame.Pinned then
        if frame.OwnerButton ~= button then
            return -- something else is pinned; ignore hover elsewhere
        end
        if frame.OwnerEntry == icon.Data.Entry then
            return -- already showing this pinned reward
        end
    end
    addon.Gui.RewardPreview:ShowUnpinned(button, icon.AchievementId, icon.Data.Entry)
end

local function OnLeave(icon)
    if not addon.Options.db.profile.Achievements.RewardPreviewMouseoverShow then
        return
    end
    addon.Gui.RewardPreview:HideIfUnpinned(icon:GetParent())
end

local function OnClick(icon)
    -- Sibling entries are only threaded through on click so Prev/Next appear once pinned, not while merely hovering
    local entries = addon.RewardPreviewData.GetPreviewableEntries(icon.AchievementId)
    local entryList = entries and #entries > 1 and entries or nil
    addon.Gui.RewardPreview:TogglePin(icon:GetParent(), icon.AchievementId, icon.Data.Entry, entryList)
end

local function GroupOnClick(icon)
    addon.Gui.RewardPreview:ShowChooser(icon, icon.AchievementId, icon.Data.Group)
end

-- One extra icon per previewable reward, so achievements with multiple rewards can all be previewed.
-- Achievements with more than a handful of options (e.g. a "choose any of ~50 mounts" item reward) collapse into a single chooser icon instead.
-- Last of all the row's icons (the slot's highest Order), because it adds a varying number of them.
function feature.SetRowIcons(row, achievement, getIcon)
    if not addon.Options.db.profile.Achievements.ShowRewardPreviewIcon then
        return
    end
    local groups = addon.RewardPreviewData.GetIconGroups(achievement.Id)
    if not groups then
        return
    end

    for _, group in next, groups do
        local extraIcon = getIcon(row)
        if not extraIcon then
            return
        end

        if group.IsGroup then
            extraIcon.Texture:SetAtlas("crosshair_inspect_32")
            if not addon.Util.IsModern then
                extraIcon.Texture:SetAtlas("common-search-magnifyingglass")
            end
            extraIcon.Lines = {
                addon.L["Preview Reward"],
                addon.L["Choose one of {count} rewards"]:K_ReplaceVars(tostring(#group.Entries))
            }
            extraIcon.AchievementId = achievement.Id
            extraIcon.Data = {Group = group.Entries}
            extraIcon.OnClickCallback = GroupOnClick
        else
            local entry = group.Entries[1]
            extraIcon.Texture:SetAtlas("crosshair_inspect_32")
            if not addon.Util.IsModern then
                extraIcon.Texture:SetAtlas("common-search-magnifyingglass")
            end
            extraIcon.Lines = {
                addon.L["Preview Reward"],
                addon.RewardPreviewData.GetLabel(entry)
            }
            extraIcon.AchievementId = achievement.Id
            extraIcon.Data = {Entry = entry}
            extraIcon.OnEnterCallback = OnEnter
            extraIcon.OnLeaveCallback = OnLeave
            extraIcon.OnClickCallback = OnClick
        end
    end
end