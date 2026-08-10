local _, addon = ...
addon.Gui.RewardPreview = {}
local rewardPreview = addon.Gui.RewardPreview

local hookedOwners = {}
local menuBuilder = addon.MenuBuilder:New({})

-- Walks up from the triggering button to the top-level window that owns it (main
-- Achievements frame or a specific Popout), so auto-close and anchoring stay per-button/per-window
local function GetOwnerWindow(button)
    local frame = button
    while frame do
        if frame == KrowiAF_AchievementsFrame then
            return frame
        end
        if frame.AchievementId and frame.Button then -- looks like a KrowiAF_AchievementPopout instance
            return frame
        end
        frame = frame.GetParent and frame:GetParent()
    end
    return nil
end

local function HookOwner(ownerWindow)
    if not ownerWindow or hookedOwners[ownerWindow] then
        return
    end
    hookedOwners[ownerWindow] = true
    ownerWindow:HookScript("OnHide", function()
        if KrowiAF_RewardPreview.OwnerWindow == ownerWindow then
            rewardPreview:Close()
        end
    end)
end

-- Shows the preview anchored to button, without pinning it (hover/tooltip-like).
-- entryList is only passed when browsing a collapsed "choice of many" reward group (e.g. Vicious Saddle) - it enables the prev/next nav buttons.
function rewardPreview:ShowUnpinned(button, achievementId, entry, entryList)
    local entries = entryList or addon.RewardPreviewData.GetPreviewableEntries(achievementId)
    if not entries then
        return
    end
    entry = entry or entries[1]

    local frame = KrowiAF_RewardPreview
    frame.OwnerButton = button
    frame.OwnerEntry = entry
    frame.OwnerAchievementId = achievementId
    frame.OwnerWindow = GetOwnerWindow(button)
    frame.EntryList = entryList
    HookOwner(frame.OwnerWindow)

    local achievementsOptions = addon.Options.db.profile.Achievements
    frame:SetSize(achievementsOptions.RewardPreviewDefaultWidth, achievementsOptions.RewardPreviewDefaultHeight)

    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
    frame:ShowEntry(entry)
    frame.Title:SetText(addon.RewardPreviewData.GetLabel(entry))
    local icon, iconAtlas = addon.RewardPreviewData.GetIcon(entry)
    if iconAtlas then
        frame.Icon:SetAtlas(iconAtlas)
        frame.Icon:Show()
    elseif icon then
        frame.Icon:SetTexture(icon)
        frame.Icon:Show()
    else
        frame.Icon:Hide()
    end
    local hasMultiple = entryList ~= nil and #entryList > 1
    frame.PrevButton:SetShown(hasMultiple)
    frame.NextButton:SetShown(hasMultiple)
    frame.Pinned = nil
    frame:Show()
end

-- Pins the preview (stays open, becomes movable). Clicking the same reward entry again unpins/closes it,
-- clicking a different entry on the same button switches to it instead of just closing.
function rewardPreview:TogglePin(button, achievementId, entry, entryList)
    local frame = KrowiAF_RewardPreview
    if not entry then
        local entries = entryList or addon.RewardPreviewData.GetPreviewableEntries(achievementId)
        entry = entries and entries[1]
    end
    if frame:IsShown() and frame.Pinned and frame.OwnerButton == button and frame.OwnerEntry == entry then
        self:Close()
        return
    end
    self:ShowUnpinned(button, achievementId, entry, entryList)
    frame.Pinned = true
end

-- Opens a small chooser menu listing every option in a collapsed "choice of many" reward group, anchored to the extra icon that was clicked
function rewardPreview:ShowChooser(icon, achievementId, entries)
    local button = icon:GetParent()
    menuBuilder:ShowPopup(function()
        local menu = menuBuilder:GetMenu()
        menuBuilder:CreateTitle(menu, addon.L["Preview Reward"])
        for _, entry in next, entries do
            menuBuilder:CreateButtonAndAdd(
                menu,
                addon.RewardPreviewData.GetLabel(entry),
                function()
                    self:TogglePin(button, achievementId, entry, entries)
                end
            )
        end
    end, icon)
end

-- Called from OnLeave; a no-op while pinned or while a different button owns the current preview
function rewardPreview:HideIfUnpinned(button)
    local frame = KrowiAF_RewardPreview
    if frame.Pinned or frame.OwnerButton ~= button then
        return
    end
    frame:Hide()
end

function rewardPreview:Close()
    KrowiAF_RewardPreview:Hide()
end
