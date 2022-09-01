-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.Calendar = {};
local calendar = addon.GUI.Calendar;

function calendar:Load()
	self:CreateCalendarButton();

    self.Frame:Load();
    self.SideFrame:Load();
end

function calendar:CreateCalendarButton()
    local button = CreateFrame("Button", "KrowiAF_AchievementCalendarButton", AchievementFrameHeader);
    button:SetPoint("LEFT", AchievementFrameHeaderPointBorder, "RIGHT");
    button:SetSize(40, 40);

    local ntex = button:CreateTexture();
	ntex:SetTexture("Interface/Calendar/UI-Calendar-Button");
	ntex:SetTexCoord(0, 0.390625, 0, 0.78125);
	ntex:SetAllPoints();
	button:SetNormalTexture(ntex);

    local ptex = button:CreateTexture();
	ptex:SetTexture("Interface/Calendar/UI-Calendar-Button");
	ptex:SetTexCoord(0.5, 0.890625, 0, 0.78125);
	ptex:SetAllPoints();
	button:SetPushedTexture(ptex);

    local htex = button:CreateTexture();
	htex:SetTexture("Interface/Minimap/UI-Minimap-ZoomButton-Highlight");
    htex:SetBlendMode("ADD");
	htex:SetAllPoints();
	button:SetHighlightTexture(htex);

    local fs = button:CreateFontString(nil, nil, "GameFontBlack");
    fs:SetPoint("CENTER", 0, -2);
    button:SetFontString(fs);

    local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
	button:SetText(currentCalendarTime.monthDay);

    button:SetScript("OnClick", function()
		self.Frame:Show();
	end);
    self.Button = button;
end

function calendar:ResetFramePosition()
    SavedData.RememberLastPosition = SavedData.RememberLastPosition or {};
    SavedData.RememberLastPosition["Calendar"] = {
        X = 150,
        Y = -80
    };
    if not self.Frame.ClearAllPoints then
        return;
    end
	local pos = SavedData.RememberLastPosition["Calendar"];
	self.Frame:ClearAllPoints();
	self.Frame:SetPoint("TOPLEFT", pos.X, pos.Y);
end