local _, addon = ...

-- Blizzard's category buttons on its Achievements and Guild tabs show their progress through
-- AchievementFrameCategory_StatusBarTooltip on GameTooltip. With this addon loaded, Blizzard's tab code runs tainted, so
-- that tooltip does too, and its status bar leaves GameTooltip.statusBarPool tainted. GameTooltip_OnHide reads the pool
-- before it clears a widget set, so every later map POI or vignette tooltip clears tainted and can error on a secret
-- value (issue #300, docs/work/300-category-tooltip-taint). On Retail those buttons get the addon's own progress-bar
-- tooltip instead, the one its own category buttons use, and GameTooltip is never touched.
addon.Gui.BlizzardCategoryTooltip = {}
local blizzardCategoryTooltip = addon.Gui.BlizzardCategoryTooltip

-- Blizzard's OnLeave only hides GameTooltip, so each button this tooltip shows for also hides it on leave, at the same
-- moment. HookScript writes nothing on the button; the buttons are pooled, so each is hooked once.
local hookedButtons = {}

local function HideOnLeave(button)
    local tooltip = addon.ProgressBarLib.GameTooltipWithProgressBar.Tooltip
    if tooltip:IsOwned(button) then
        tooltip:Hide()
    end
end

function blizzardCategoryTooltip.Show(button) -- the button's showTooltipFunc; Blizzard's list sets these fields on it
    addon.ProgressBarLib.GameTooltipWithProgressBar:Show(button, "ANCHOR_RIGHT", button.name, 0, button.numAchievements, button.numCompleted, 0, 0, 0, addon.Util.Colors.GreenRGB, nil, nil, nil, button.numCompletedText)
    if not hookedButtons[button] then
        button:HookScript("OnLeave", HideOnLeave)
        hookedButtons[button] = true
    end
end

function addon.OverwriteFunctions()
    AchievementFrame_ToggleAchievementFrame = function(toggleStatFrame, toggleGuildView)
        AchievementFrameComparison:Hide()
        AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick

        if not toggleStatFrame then
            if AchievementFrame:IsShown() and AchievementFrame.selectedTab == 1 then
                AchievementFrame:Hide()
            else
                AchievementFrame_SetTabs()
                AchievementFrame:Show()
                if toggleGuildView then
                    AchievementFrameTab_OnClick(2)
                else
                    AchievementFrameTab_OnClick(1)
                end
            end
            return
        end
        if AchievementFrame:IsShown() and AchievementFrame.selectedTab == (addon.Util.IsWrathClassic and 2 or 3) then
            AchievementFrame:Hide()
        else
            AchievementFrame:Show()
            AchievementFrame_SetTabs()
            AchievementFrameTab_OnClick(addon.Util.IsWrathClassic and 2 or 3)
        end
    end

    AchievementFrame_DisplayComparison = function(unit)
        if not addon.Util.IsMainline then
            AchievementFrame.wasShown = nil
        end

        AchievementFrameTab_OnClick = AchievementFrameComparisonTab_OnClick
        AchievementFrameTab_OnClick(1)
        if addon.Util.IsMainline then
            -- Clear addon's custom tab anchoring to avoid circular dependency with Blizzard's comparison tab setup
            for i = 1, 3 do
                local tab = _G["AchievementFrameTab" .. i]
                if tab then
                    tab:ClearAllPoints()
                end
            end
            AchievementFrame_SetComparisonTabs()
        end
        AchievementFrame:Show()
        if addon.Util.IsMainline then
            AchievementFrame_ShowSubFrame(AchievementFrameComparison, AchievementFrameComparison.AchievementContainer)
        end
        AchievementFrameComparison_SetUnit(unit)
        AchievementFrameComparison_ForceUpdate()
    end

    AchievementFrame_SetTabs = function()
        addon.Gui:ShowHideTabs()
    end

    local origAchievementFrame_SelectAchievement = AchievementFrame_SelectAchievement
    AchievementFrame_SelectAchievement = function(id)
        if addon.Data.Achievements[id] and addon.Data.Achievements[id].Category then
            KrowiAF_SelectAchievementFromID(id)
            return
        end
        origAchievementFrame_SelectAchievement(id)
    end

    -- Shift-clicking an achievement in Blizzard's own summary or achievement list into a whisper or community
    -- channel reports telemetry through C_AchievementTelemetry.LinkAchievementInWhisper / LinkAchievementInClub,
    -- which are protected. Blizzard's achievement frame runs tainted as soon as this addon reshapes it (the
    -- summary buttons' ids and the list's element data are written under our replaced toggle and tab functions),
    -- so that call raises ADDON_ACTION_FORBIDDEN (WoWUIBugs #780 is the same error through a chat filter). The
    -- link itself is not protected, so insert it ourselves and skip the telemetry; everything else falls through
    -- to Blizzard's handler. The helper is a file local in Blizzard_AchievementUI.lua, so its callers are wrapped.
    -- Retail only: Mists exports C_AchievementTelemetry too, but its Cata-era handlers never call it and its summary
    -- handler only selects the achievement, so wrapping there would add behaviour Blizzard does not have.
    if addon.Util.IsMainline and C_AchievementTelemetry and ChatFrameUtil and ChatFrameUtil.InsertLink then
        local function InsertAchievementLink(id)
            if not id or not IsModifiedClick("CHATLINK") then
                return false
            end
            local achievementLink = GetAchievementLink(id)
            if not achievementLink then
                return false
            end
            return ChatFrameUtil.InsertLink(achievementLink) and true or false
        end

        local origAchievementFrameSummaryAchievement_OnClick = AchievementFrameSummaryAchievement_OnClick
        AchievementFrameSummaryAchievement_OnClick = function(self, ...)
            if InsertAchievementLink(self.id) then
                return
            end
            origAchievementFrameSummaryAchievement_OnClick(self, ...)
        end

        if AchievementTemplateMixin and AchievementTemplateMixin.ProcessClick then
            local origProcessClick = AchievementTemplateMixin.ProcessClick
            AchievementTemplateMixin.ProcessClick = function(self, ...)
                local elementData = IsModifiedClick("CHATLINK") and self:GetElementData()
                if elementData and InsertAchievementLink(elementData.id) then
                    return
                end
                origProcessClick(self, ...)
            end
        end
    end

    -- Blizzard's category list reads it into each button when it fills, which is after this runs (see the top of this file)
    if addon.Util.IsMainline then
        AchievementFrameCategory_StatusBarTooltip = blizzardCategoryTooltip.Show
    end
end

function addon.LoadBlizzardApiChanges()
    -- Bunch of API changes in 10.1.5
    if not IsTrackedAchievement then
        IsTrackedAchievement = function(achievementId)
            return C_ContentTracking.IsTracking(Enum.ContentTrackingType.Achievement, achievementId)
        end
    end

    if not RemoveTrackedAchievement then
        RemoveTrackedAchievement = function(achievementId)
            -- securecall only keeps the tracker refresh from tainting our own continuation; it cannot make the refresh itself run secure (Issue #300)
            securecall(C_ContentTracking.StopTracking, Enum.ContentTrackingType.Achievement, achievementId, Enum.ContentTrackingStopType.Manual)
        end
    end

    if not GetNumTrackedAchievements then
        GetNumTrackedAchievements = function()
            return #C_ContentTracking.GetTrackedIDs(Enum.ContentTrackingType.Achievement)
        end
    end

    if not MAX_TRACKED_ACHIEVEMENTS then
        MAX_TRACKED_ACHIEVEMENTS = Constants.ContentTrackingConsts.MaxTrackedAchievements
    end

    if not AddTrackedAchievement then
        AddTrackedAchievement = function(achievementId)
            -- securecall only keeps the tracker refresh from tainting our own continuation; it cannot make the refresh itself run secure (Issue #300)
            return securecall(C_ContentTracking.StartTracking, Enum.ContentTrackingType.Achievement, achievementId)
        end
    end

    if not WatchFrame_Update then
        WatchFrame_Update = function()
        end
    end

    if not SetFocusedAchievement then
        SetFocusedAchievement = function()
        end
    end
end

function addon.HookFunctions()
    if addon.Util.IsClassicWithAchievements then
        hooksecurefunc("PanelTemplates_SetTab", AchievementFrame_SetTabs)
    end

    if addon.Util.IsMainline then
        hooksecurefunc("AchievementFrame_SetComparisonTabs", function()
            addon.Gui:ShowHideTabs()
        end)
        hooksecurefunc("AchievementFrame_SetRestrictedMode", function(frame, subFrame)
            addon.Gui:ShowHideTabs()
            -- AchievementFrame_SetRestrictedMode always shows AchievementFrame.SearchBox; re-hide it if our own search box is active
            if KrowiAF_SearchBoxFrame and KrowiAF_SearchBoxFrame:IsShown() then
                AchievementFrame.SearchBox:Hide()
            end
        end)
    end

    AchievementFrameFilterDropdown:HookScript("OnShow", function()
        if addon.Util.IsClassicWithAchievements then
            if AchievementFrame.Header.RightDDLInset then
                AchievementFrame.Header.RightDDLInset:Show()
            end
        else
            if AchievementFrame.Header.LeftDDLInset then
                AchievementFrame.Header.LeftDDLInset:Show()
            end
        end
    end)
    AchievementFrameFilterDropdown:HookScript("OnHide", function()
        if addon.Util.IsClassicWithAchievements then
            if AchievementFrame.Header.RightDDLInset and not KrowiAF_SearchBoxFrame:IsShown() then
                AchievementFrame.Header.RightDDLInset:Hide()
            end
        else
            if AchievementFrame.Header.LeftDDLInset and not KrowiAF_AchievementFrameFilterButton:IsShown() then
                AchievementFrame.Header.LeftDDLInset:Hide()
            end
        end
    end)
end