-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.Calendar.SideFrame = {};
local sideFrame = addon.GUI.Calendar.SideFrame;

local function OnAchievementsFrameViewAcquiredFrame(self, frame, elementData, new)
    -- print(frame, elementData.Id, new)
    -- for i,v in pairs(frame) do
    --     -- if type(v) == "function" then
    --         print(i,v)
    --     -- end
    -- end
    -- for i,v in pairs(elementData) do
    --     -- if type(v) == "function" then
    --         print(i,v)
    --     -- end
    -- end
    -- for i,v in pairs(new) do
    --     -- if type(v) == "function" then
    --         print(i,v)
    --     -- end
    -- end
    frame:HookScript("OnClick", function(self, button, down, ignoreModifiers)
        if button == "LeftButton" then
            local calendarFrame = addon.GUI.Calendar.Frame;
            calendarFrame.LockMonth = addon.Options.db.Calendar.LockAchievementMonth;
            calendarFrame:Hide();
        end
    end);
end

function sideFrame:Load()
    local parent = addon.GUI.Calendar.Frame;
	local frame = CreateFrame("Frame", "KrowiAF_CalendarSideFrame", parent, "KrowiAF_CalendarSideFrame_Template");
    frame:SetPoint("TOPLEFT", parent, "TOPRIGHT", 0, -24);
    frame:SetPoint("BOTTOM", parent, "BOTTOM", 0, 0); --320

    frame.AchievementsFrame:AlwaysHideBorder();

    frame.AchievementsFrame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, OnAchievementsFrameViewAcquiredFrame, self);

	addon.GUI.Calendar.SideFrame = frame; -- Overwrite with the actual frame since all functions are injected to it
end

function KrowiAF_CalendarSideFrameCloseButton_OnClick(self)
    if addon.GUI.Calendar.Frame.SelectedDayButton then
        KrowiAF_CalendarDayButton_OnClick(addon.GUI.Calendar.Frame.SelectedDayButton);
    end
    self:GetParent():Hide();
	PlaySound(SOUNDKIT.IG_MAINMENU_QUIT);
end

function KrowiAF_CalendarSideFrameCloseButton_OnKeyDown(self, key)
    if key == GetBindingKey("TOGGLEGAMEMENU") then
		if self:GetParent():IsShown() then
			-- self:Click();
            self:GetParent():Hide();
			self:SetPropagateKeyboardInput(false);
			return;
		end
	end
	self:SetPropagateKeyboardInput(true);
end

function KrowiAF_CalendarSideFrame_OnShow(self)
    local frame = addon.GUI.Calendar.Frame;
    local day, month, year = frame.HighlightedDay, frame.HighlightedMonth, frame.HighlightedYear;
    self.AchievementsFrame:Update(addon.GUI.Calendar.Frame.HighlightedAchievements);
    self.Header:Setup(FormatShortDate(day, month, year) .. " (" .. #frame.HighlightedAchievements .. " " .. addon.L["Achievements"] .. " - " .. frame.HighlightedPoints .. " " .. addon.L["Points"] .. ")");
end