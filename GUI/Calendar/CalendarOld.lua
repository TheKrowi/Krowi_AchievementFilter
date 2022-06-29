-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.Calendar = {};
local calendar = gui.Calendar;

local function CreateCalendarButton()
    local button = CreateFrame("Button", "KrowiAF_CalendarButton", AchievementFrameHeader);
    button:SetPoint("LEFT", AchievementFrameHeaderPointBorder, "RIGHT");
    button:SetSize(40, 40);

    local ntex = button:CreateTexture();
	ntex:SetTexture("Interface\\Calendar\\UI-Calendar-Button");
	ntex:SetTexCoord(0, 0.390625, 0, 0.78125);
	ntex:SetAllPoints();
	button:SetNormalTexture(ntex);

    local ptex = button:CreateTexture();
	ptex:SetTexture("Interface\\Calendar\\UI-Calendar-Button");
	ptex:SetTexCoord(0.5, 0.890625, 0, 0.78125);
	ptex:SetAllPoints();
	button:SetPushedTexture(ptex);

    local htex = button:CreateTexture();
	htex:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight");
    htex:SetBlendMode("ADD");
	htex:SetAllPoints();
	button:SetHighlightTexture(htex);

    local fs = button:CreateFontString(nil, nil, "GameFontBlack");
    fs:SetPoint("CENTER", 0, -2);
    button:SetFontString(fs);

    local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
	button:SetText(currentCalendarTime.monthDay);

    button:SetScript("OnClick", calendar.Show);
    gui.Calendar.Button = button;
end

function calendar.Load()
    CreateCalendarButton();
end

-- local function OnAchievementButtonEnter(self)
--     GameTooltip:SetOwner(self, "ANCHOR_NONE");
--     GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT");
--     local link = GetAchievementLink(self.Achievement.ID);
--     GameTooltip:SetHyperlink(link);
--     AchievementFrameAchievements_CheckGuildMembersTooltip(self);
--     GameTooltip:Show();
--     if GameTooltip:GetTop() > self:GetBottom() then
--         GameTooltip:ClearAllPoints();
--         GameTooltip:SetPoint("BOTTOMLEFT", self, "TOPLEFT");
--     end
-- end

-- local function OnAchievementButtonClick(self)
--     gui.AchievementsFrame:SelectAchievementFromID(self.Achievement.ID, nil, true);
-- end

-- local function CreateAchievementButton(dayButton, i, anchor, offsX, offsY)
--     local button = CreateFrame("Button", dayButton:GetName() .. "AchievementButton" .. i, dayButton);
-- 	button:SetPoint(anchor, dayButton, anchor, offsX, offsY);
--     button:SetSize(41, 41);

--     local ntex2 = button:CreateTexture()
-- 	ntex2:SetTexture(134400);
-- 	ntex2:SetAllPoints();
-- 	button:SetNormalTexture(ntex2);

--     button:SetScript("OnEnter", OnAchievementButtonEnter);
--     button:SetScript("OnClick", OnAchievementButtonClick);
--     button:Hide();

--     return button;
-- end

-- local offset = 2;
-- local function CreateAchievementButtons(dayButton)
--     if dayButton.AchievementButtons then
--         return;
--     end
--     dayButton.AchievementButtons = {};
--     tinsert(dayButton.AchievementButtons, CreateAchievementButton(dayButton, 1, "BOTTOMRIGHT", -offset, offset));
--     tinsert(dayButton.AchievementButtons, CreateAchievementButton(dayButton, 2, "BOTTOMLEFT", offset, offset));
--     tinsert(dayButton.AchievementButtons, CreateAchievementButton(dayButton, 3, "TOPRIGHT", -offset, -offset));
--     tinsert(dayButton.AchievementButtons, CreateAchievementButton(dayButton, 4, "TOPLEFT", offset, -offset));
-- end

-- local function GetDayButton(i)
--     return _G["CalendarDayButton" .. i];
-- end

-- local function PrepareViewForAchievements()
--     local i = 1;
--     local dayButton = GetDayButton(i);
--     local dayButtonName;
--     while dayButton do
--         dayButtonName = dayButton:GetName();

--         if dayButton.day then -- Can happen multiple times resulting in setting day2 to nil, this prevents it
--             dayButton:RegisterForClicks();
--             dayButton.day2 = dayButton.day;
--         end
--         dayButton.day = nil;

--         _G[dayButtonName .. "EventTexture"]:Hide();
--         _G[dayButtonName .. "EventBackgroundTexture"]:Hide();
--         _G[dayButtonName .. "OverlayFrame"]:Hide();
--         _G[dayButtonName .. "MoreEventsButton"]:Hide();

--         local j = 1;
--         while _G[dayButtonName .. "EventButton" .. j] do
--             _G[dayButtonName .. "EventButton" .. j]:Hide();
--             j = j + 1;
--         end

--         CreateAchievementButtons(dayButton); -- This does not hide them and is only run once
--         for _, achievementButton in next, dayButton.AchievementButtons do
--             achievementButton.Achievement = nil;
--             achievementButton:Hide();
--         end
--         i = i + 1;
--         dayButton = GetDayButton(i);
--     end
--     CalendarFilterFrame:Hide();
--     return i - 1;
-- end

-- local function GetSecondsSince(dayButton)
--     local currentMonth = C_Calendar.GetMonthInfo();
--     local secondsSince = {year = currentMonth.year, month = currentMonth.month + dayButton.monthOffset, day = dayButton.day2};
--     if secondsSince.month == 0 then
--         secondsSince.year = secondsSince.year - 1;
--         secondsSince.month = 12;
--     end
--     return time{year = secondsSince.year, month = secondsSince.month, day = secondsSince.day};
-- end

-- local function GetEarnedAchievementsInRange(lastDayButtonIndex)
--     local firstDate = GetSecondsSince(GetDayButton(1));
--     local lastDate = GetSecondsSince(GetDayButton(lastDayButtonIndex));

--     local achievementIds = {};
--     for achievementId, date in next, SavedData.Characters[UnitGUID("player")].CompletedAchievements do
--         if date >= firstDate and date <= lastDate then
--             tinsert(achievementIds, achievementId);
--         end
--     end
--     return achievementIds;
-- end

-- local function AddAchievementToButton(dayButton, achievementId, icon)
--     for _, achievementButton in next, dayButton.AchievementButtons do
--         if achievementButton.Achievement == nil then
--             achievementButton.Achievement = addon.Data.Achievements[achievementId];
--             local tex = achievementButton:GetNormalTexture();
--             tex:SetTexture(icon);
--             achievementButton:Show();
--             return;
--         end
--     end
-- end

-- local function AddAchievementsToDays(achievementIds)
--     local firstDate = GetSecondsSince(GetDayButton(1));
--     for _, achievementId in next, achievementIds do
--         local icon = select(10, addon.GetAchievementInfo(achievementId));
--         local date = SavedData.Characters[UnitGUID("player")].CompletedAchievements[achievementId];
--         local dayButtonIndex = floor((date - firstDate) / 86400 + 1); -- 86400 seconds in a day, floor to take changes in DST which would result in x.xx
--         AddAchievementToButton(GetDayButton(dayButtonIndex), achievementId, icon);
--     end
-- end

-- local function HideAllAchievementButtons()
--     local i = 1;
--     local dayButton = GetDayButton(i);
--     while dayButton do
--         dayButton:RegisterForClicks("LeftButtonUp", "RightButtonUp");
--         dayButton.day = dayButton.day2;
--         dayButton.day2 = nil;

--         for _, achievementButton in next, dayButton.AchievementButtons do
--             achievementButton.Achievement = nil;
--             achievementButton:Hide();
--         end
--         i = i + 1;
--         dayButton = GetDayButton(i);
--     end
-- end

-- local function PrepareViewForNormal()
--     HideAllAchievementButtons();
--     CalendarFilterFrame:Show();
--     CalendarFrame_Update();
-- end

-- -- local isAchievementCalendar;
-- function calendar.Show()
--     -- if not IsAddOnLoaded("Blizzard_Calendar") then
--     --     LoadAddOn("Blizzard_Calendar");
--     -- end
--     -- isAchievementCalendar = true;
--     -- hooksecurefunc("CalendarFrame_Update", function()
--     --     if not isAchievementCalendar then
--     --         return;
--     --     end
--     --     local lastDayButtonIndex = PrepareViewForAchievements();
--     --     AddAchievementsToDays(GetEarnedAchievementsInRange(lastDayButtonIndex));
--     -- end);
--     -- CalendarFrame_Update(); -- Do it once in order to set everything correct if CalendarFrame_Update isn't triggered when showing the calendar (month didn't change)
--     -- hooksecurefunc(CalendarFrame, "Hide", function()
--     --     if not isAchievementCalendar then
--     --         return;
--     --     end
--     --     isAchievementCalendar = nil;
--     --     PrepareViewForNormal();
--     -- end);
--     Calendar_Show();
-- end