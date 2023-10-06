local _, addon = ...;

KrowiAF_AchievementCalendarSideFrameMixin = {};

local function OnAchievementsFrameViewAcquiredFrame(sideFrame, frame)
    local calendarFrame = sideFrame:GetParent();
    frame:HookScript("OnClick", function(_, button)
        if button ~= "LeftButton" then
            return;
        end
        calendarFrame.LockMonth = addon.Options.db.profile.Calendar.LockAchievementMonth;
        calendarFrame:Hide();
    end);
end

function KrowiAF_AchievementCalendarSideFrameMixin:OnLoad()
    self.AchievementsFrame.ScrollBox.wheelPanScalar = addon.Options.db.profile.Calendar.MouseWheelPanScalar;
	self.AchievementsFrame.ScrollBar.wheelPanScalar = addon.Options.db.profile.Calendar.MouseWheelPanScalar;
    self.AchievementsFrame:AlwaysHideBorder();
    ScrollUtil.AddAcquiredFrameCallback(self.AchievementsFrame.ScrollView, OnAchievementsFrameViewAcquiredFrame, self);
end

function KrowiAF_AchievementCalendarSideFrameMixin:OnShow()
    self:Update();
end

function KrowiAF_AchievementCalendarSideFrameMixin:OnHide()
	PlaySound(SOUNDKIT.IG_MAINMENU_QUIT);
end

function KrowiAF_AchievementCalendarSideFrameMixin:Update()
    local parent = self:GetParent();
    local day, month, year = parent.HighlightedDay, parent.HighlightedMonth, parent.HighlightedYear;
    self.AchievementsFrame:Update(parent.HighlightedAchievements);
    self.Header:Setup(FormatShortDate(day, month, year) .. " (" .. #parent.HighlightedAchievements .. " " .. addon.L["Achievements"] .. " - " .. parent.HighlightedPoints .. " " .. addon.L["Points"] .. ")");
end

KrowiAF_AchievementCalendarSideFrameCloseButtonMixin = {};

function KrowiAF_AchievementCalendarSideFrameCloseButtonMixin:OnClick()
    self:GetParent():Hide();
end

function KrowiAF_AchievementCalendarSideFrameCloseButtonMixin:OnKeyDown(key)
    if key == GetBindingKey("TOGGLEGAMEMENU") then
        local parent = self:GetParent();
		if parent:IsShown() then
            parent:Hide();
			self:SetPropagateKeyboardInput(false);
			return;
		end
	end
	self:SetPropagateKeyboardInput(true);
end