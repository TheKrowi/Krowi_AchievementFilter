local _, addon = ...;

local function ProfileSection(label, fn, ...)
    local start = debugprofilestop();
    local results = {fn(...)};
    local elapsed = debugprofilestop() - start;
    if addon.Diagnostics and addon.Diagnostics.Trace then
        addon.Diagnostics.Trace(string.format("[Profile] %s: %.1f ms", label, elapsed));
    end
    return unpack(results);
end

KrowiAF_AchievementFrameTabMixin = {};

function KrowiAF_AchievementFrameTabMixin:OnClick()
    addon.Gui.AchievementFrameTabButtonFactory:Call_OnClick(self:GetID());
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
end

function KrowiAF_AchievementFrameTabMixin:ShowSubFrames()
    ProfileSection("Tab:ShowSubFrames", function()
        AchievementFrame_ShowSubFrame(); -- Hide all frames

        AchievementFrame_ShowSubFrame(unpack(self.FramesToShow));
        if self.SelectedCategory and self.SelectedCategory.IsSummary then
			KrowiAF_SummaryFrame:Show();
			KrowiAF_AchievementsFrame:Hide();
		else
			KrowiAF_SummaryFrame:Hide();
			KrowiAF_AchievementsFrame:Show();
                KrowiAF_AchievementsFrame:Update();
            if self.SelectedAchievement then
                KrowiAF_AchievementsFrame.ScrollBox:ScrollToElementData(self.SelectedAchievement, ScrollBoxConstants.AlignCenter, nil, ScrollBoxConstants.NoScrollInterpolation);
                -- print("tab select", self.SelectedAchievement and self.SelectedAchievement.Id)
                KrowiAF_AchievementsFrame.SelectionBehavior:SelectElementData(self.SelectedAchievement);
                KrowiAF_AchievementsFrame:ScrollToNearest(self.SelectedAchievement);
            end
		end
        AchievementFrameWaterMark:SetTexture(self.WaterMark);
    end);
end

function KrowiAF_AchievementFrameTabMixin:Select()
    if addon.Gui.SelectedTab ~= self then
        self:OnClick();
    end
end

function KrowiAF_AchievementFrameTabMixin:GetCategories()
    -- Can't return self.Categories because it's possible these are not loaded yet
    return addon.Tabs[self.Index].Categories;
end