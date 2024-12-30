local _, addon = ...;
addon.Gui.Calendar = {};
local calendar = addon.Gui.Calendar;

local function CreateCalendarButton(frame)
    local button = CreateFrame("Button", "KrowiAF_AchievementFrameCalendarButton", AchievementFrame.Header);
    -- button:SetPoint("LEFT", AchievementFrame.Header.PointBorder, "RIGHT", 10, 30);
	button:SetPoint("LEFT", AchievementFrame.Header.PointBorder, "RIGHT", addon.Options.db.profile.Calendar.ButtonOffsetX, addon.Options.db.profile.Calendar.ButtonOffsetY);
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

    button:SetScript("OnClick", function()
		frame:Show();
	end);

	AchievementFrame:HookScript("OnShow", function()
        local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
		button:SetText(currentCalendarTime.monthDay);
    end);
end

function calendar:Load()
    local frame = CreateFrame("Frame", "KrowiAF_AchievementCalendarFrame", UIParent, "KrowiAF_AchievementCalendarFrame_Template");
	addon.Gui:SetFrameToLastPosition(frame, "Calendar");
	CreateCalendarButton(frame);
	addon.Gui.Calendar = nil;
end