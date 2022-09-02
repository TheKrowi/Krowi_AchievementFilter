-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.Calendar.SideFrame = {};
local sideFrame = addon.GUI.Calendar.SideFrame;

function sideFrame:Load()
    local parent = addon.GUI.Calendar.Frame;
	local frame = CreateFrame("Frame", "KrowiAF_CalendarSideFrame", parent, "KrowiAF_CalendarSideFrame_Template");
    frame:SetPoint("TOPLEFT", parent, "TOPRIGHT", 0, -24);
    frame:SetPoint("BOTTOM", parent, "BOTTOM", 0, 0); --320

    frame.ScrollFrameBorder:Build("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -31, 10, -14, 20, true);
    local buttons = frame.ScrollFrameBorder.ScrollFrame.buttons;
    for _, button in next, buttons do
        button:HookScript("OnClick", function(self, button, down, ignoreModifiers)
            if button == "LeftButton" then
                local calendarFrame = addon.GUI.Calendar.Frame;
                calendarFrame.LockMonth = addon.Options.db.Calendar.LockAchievementMonth;
                calendarFrame:Hide();
            end
        end);
    end

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
    self.ScrollFrameBorder:Update(addon.GUI.Calendar.Frame.HighlightedAchievements);
    self.Header:Setup(FormatShortDate(day, month, year) .. " (" .. #frame.HighlightedAchievements .. " " .. addon.L["Achievements"] .. " - " .. frame.HighlightedPoints .. " " .. addon.L["Points"] .. ")");
end