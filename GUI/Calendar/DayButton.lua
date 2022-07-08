-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.CalendarButton = {};
local dayButton = addon.GUI.CalendarButton;

-- -- DayButton constants
dayButton.NormalizedTexWidth = 90 / 256 - 0.001; -- fudge factor to prevent texture seams
dayButton.NormalizedTexHeight = 90 / 256 - 0.001; -- fudge factor to prevent texture seams
-- local CALENDAR_DAYBUTTON_MAX_VISIBLE_EVENTS		= 4;
-- local CALENDAR_DAYBUTTON_MAX_VISIBLE_BIGEVENTS	= 2;
-- local CALENDAR_DAYBUTTON_MAX_TOOLTIP_EVENTS		= 30;
dayButton.SelectionAlpha= 1.0;
dayButton.HighlightAlpha = 0.5;

-- DayAchievementButton constants
local CALENDAR_ACHIEVEMENTBUTTON_OFFSET = 2;

local function CreateAchievementButton(dayButton, i, anchor, offsX, offsY)
    local button = CreateFrame("Frame", dayButton:GetName() .. "AchievementButton" .. i, dayButton);
	button:SetPoint(anchor, dayButton, anchor, offsX, offsY);
    button:SetSize(41, 41);

    local tex = button:CreateTexture(nil, "ARTWORK");
	tex:SetTexture(134400);
	tex:SetAllPoints();
	tex:Show();
	button.Texture = tex;

    button:EnableMouse(false);
    button:Hide();

    return button;
end

function dayButton:PostLoadButton(buttons, buttonIndex)
    local button = buttons[buttonIndex];
	button:SetID(buttonIndex);

	-- set anchors
	button:ClearAllPoints();
	if buttonIndex == 1 then
		button:SetPoint("TOPLEFT", KrowiAF_CalendarWeekday1Background, "BOTTOMLEFT", 0, 0);
	elseif mod(buttonIndex, 7) == 1 then
		button:SetPoint("TOPLEFT", buttons[buttonIndex - 7], "BOTTOMLEFT", 0, 0);
	else
		button:SetPoint("TOPLEFT", buttons[buttonIndex - 1], "TOPRIGHT", 0, 0);
	end

	-- set the normal texture to be the background
	local tex = button:GetNormalTexture();
	tex:SetDrawLayer("BACKGROUND");
	local texLeft = random(0,1) * dayButton.NormalizedTexWidth;
	local texRight = texLeft + dayButton.NormalizedTexWidth;
	local texTop = random(0,1) * dayButton.NormalizedTexHeight;
	local texBottom = texTop + dayButton.NormalizedTexHeight;
	tex:SetTexCoord(texLeft, texRight, texTop, texBottom);
	-- adjust the highlight texture layer
	tex = button:GetHighlightTexture();
	tex:SetAlpha(dayButton.HighlightAlpha);

    -- Create achievement buttons
    if button.AchievementButtons then
        return;
    end
    button.AchievementButtons = {};
    tinsert(button.AchievementButtons, CreateAchievementButton(button, 1, "BOTTOMRIGHT", -CALENDAR_ACHIEVEMENTBUTTON_OFFSET, CALENDAR_ACHIEVEMENTBUTTON_OFFSET));
    tinsert(button.AchievementButtons, CreateAchievementButton(button, 2, "BOTTOMLEFT", CALENDAR_ACHIEVEMENTBUTTON_OFFSET, CALENDAR_ACHIEVEMENTBUTTON_OFFSET));
    tinsert(button.AchievementButtons, CreateAchievementButton(button, 3, "TOPRIGHT", -CALENDAR_ACHIEVEMENTBUTTON_OFFSET, -CALENDAR_ACHIEVEMENTBUTTON_OFFSET));
    tinsert(button.AchievementButtons, CreateAchievementButton(button, 4, "TOPLEFT", CALENDAR_ACHIEVEMENTBUTTON_OFFSET, -CALENDAR_ACHIEVEMENTBUTTON_OFFSET));

	local moreFrame = CreateFrame("Frame", button:GetName() .. "More", button);
	moreFrame:SetAllPoints();
	local texH = moreFrame:CreateTexture(nil, "OVERLAY");
	texH:SetTexture("Interface\\AddOns\\Krowi_AchievementFilter\\Media\\MoreArrow");
	texH:SetTexCoord(0, 0.6875, 0, 0.6875);
	texH:SetSize(44, 44);
	texH:SetPoint("RIGHT");
	button.More = moreFrame;
end

function KrowiAF_AchievementCalendarDayButton_OnLoad(self)
	self:RegisterForClicks("LeftButtonUp");

	self.Clear = dayButton.Clear;
end

function KrowiAF_AchievementCalendarDayButton_OnEnter(self)
	if not self.day then
		-- not yet updated
		return;
	end

	-- Keep this for now, can show the earned achievements on hover and when clicking locking the window

	-- local monthOffset = self.monthOffset;
	-- local day = self.day;
	-- local numEvents = C_Calendar.GetNumDayEvents(monthOffset, day);
	-- if numEvents <= 0 then
	-- 	return;
	-- end

	-- local events = {};
	-- -- gather up the events we are going to show
	-- for i = 1, numEvents do
	-- 	local event = C_Calendar.GetDayEvent(monthOffset, day, i);
	-- 	if (event) then
	-- 		tinsert(events, event);
	-- 	end
	-- end
	-- -- sort by time, and ongoing events sort to the bottom
	-- table.sort(events, function(a, b)
	-- 	if ((a.sequenceType == "ONGOING") ~= (b.sequenceType == "ONGOING")) then
	-- 		return a.sequenceType ~= "ONGOING";
	-- 	elseif (a.sequenceType == "ONGOING" and a.sequenceIndex ~= b.sequenceIndex) then
	-- 		return a.sequenceIndex > b.sequenceIndex;
	-- 	end

	-- 	if (a.startTime.hour ~= b.startTime.hour) then
	-- 		return a.startTime.hour < b.startTime.hour;
	-- 	end

	-- 	return a.startTime.minute < b.startTime.minute;
	-- end)

	-- -- add events
	-- local eventTime, eventColor;
	-- local numShownEvents = 0;
	-- local numOngoingEvents = 0;
	-- for i, event in ipairs(events) do
	-- 	local title = event.title;
	-- 	if ( numShownEvents == 0 ) then
	-- 		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	-- 		GameTooltip:ClearLines();

	-- 		-- add date if we hit our first viewable event
	-- 		local fullDate = format(FULLDATE, _CalendarFrame_GetFullDateFromDay(self));
	-- 		GameTooltip:AddLine(fullDate, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	-- 		GameTooltip:AddLine(" ");
	-- 	elseif (numOngoingEvents == 0) then
	-- 		-- ongoing events don't have an extra space between them
	-- 		GameTooltip:AddLine(" ");
	-- 	end

	-- 	if (event.sequenceType == "ONGOING") then
	-- 		if (numOngoingEvents == 0) then
	-- 			-- Precede first ongoing event with Ongoing: label
	-- 			GameTooltip:AddLine(CALENDAR_TOOLTIP_ONGOING, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	-- 		end
	-- 		numOngoingEvents = numOngoingEvents + 1;
	-- 		-- display as date range
	-- 		eventTime = format(CALENDAR_TOOLTIP_DATE_RANGE, FormatShortDate(event.startTime.monthDay, event.startTime.month), FormatShortDate(event.endTime.monthDay, event.endTime.month));
	-- 	elseif (event.sequenceType == "END") then
	-- 		eventTime = GameTime_GetFormattedTime(event.endTime.hour, event.endTime.minute, true);
	-- 	else
	-- 		eventTime = GameTime_GetFormattedTime(event.startTime.hour, event.startTime.minute, true);
	-- 	end
	-- 	eventColor = _CalendarFrame_GetEventColor(event.calendarType, event.modStatus, event.inviteStatus, true);
	-- 	if ( event.calendarType == "RAID_LOCKOUT" ) then
	-- 		title = GetDungeonNameWithDifficulty(title, event.difficultyName);
	-- 	end
	-- 	GameTooltip:AddDoubleLine(
	-- 		format(CALENDAR_CALENDARTYPE_TOOLTIP_NAMEFORMAT[event.calendarType][event.sequenceType], title),
	-- 		eventTime,
	-- 		eventColor.r, eventColor.g, eventColor.b,
	-- 		HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b,
	-- 		1
	-- 	);
	-- 	if ( _CalendarFrame_IsPlayerCreatedEvent(event.calendarType) ) then
	-- 		local text;
	-- 		if ( UnitIsUnit("player", event.invitedBy) ) then
	-- 			if ( event.calendarType == "GUILD_ANNOUNCEMENT" ) then
	-- 				text = CALENDAR_ANNOUNCEMENT_CREATEDBY_YOURSELF;
	-- 			elseif ( event.calendarType == "GUILD_EVENT" ) then
	-- 				text = CALENDAR_GUILDEVENT_INVITEDBY_YOURSELF;
	-- 			elseif ( event.calendarType == "COMMUNITY_EVENT") then
	-- 				text = CALENDAR_COMMUNITYEVENT_INVITEDBY_YOURSELF;
	-- 			else
	-- 				text = CALENDAR_EVENT_INVITEDBY_YOURSELF;
	-- 			end
	-- 		else
	-- 			if ( _CalendarFrame_IsSignUpEvent(event.calendarType, event.inviteType) ) then
	-- 				local inviteStatusInfo = CalendarUtil.GetCalendarInviteStatusInfo(event.inviteStatus);
	-- 				if ( event.inviteStatus == Enum.CalendarStatus.NotSignedup or
	-- 						event.inviteStatus == Enum.CalendarStatus.Signedup ) then
	-- 					text = inviteStatusInfo.name;
	-- 				else
	-- 					text = format(CALENDAR_SIGNEDUP_FOR_GUILDEVENT_WITH_STATUS, inviteStatusInfo.name);
	-- 				end
	-- 			else
	-- 				if ( event.calendarType == "GUILD_ANNOUNCEMENT" ) then
	-- 					text = format(CALENDAR_ANNOUNCEMENT_CREATEDBY_PLAYER, _CalendarFrame_SafeGetName(event.invitedBy));
	-- 				else
	-- 					text = format(CALENDAR_EVENT_INVITEDBY_PLAYER, _CalendarFrame_SafeGetName(event.invitedBy));
	-- 				end
	-- 			end
	-- 		end
	-- 		GameTooltip:AddLine(text, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
	-- 	end

	-- 	numShownEvents = numShownEvents + 1;
	-- end
	-- if ( numShownEvents > 0 ) then
	-- 	GameTooltip:Show();
	-- end
end

function KrowiAF_AchievementCalendarDayButton_OnLeave(self)
	GameTooltip:Hide();
	if self ~= addon.GUI.Calendar.Frame.selectedDayButton then -- and (not CalendarContextMenu:IsShown() or self ~= CalendarContextMenu.dayButton)
		self:UnlockHighlight();
	end
end

local function CalendarDayButton_Click(button)
    local calendarFrame = addon.GUI.Calendar.Frame;
	local day, monthOffset = button.day, button.monthOffset;
	local monthInfo = C_Calendar.GetMonthInfo(monthOffset);
	local month = monthInfo.month;
	local year = monthInfo.year;
	if day ~= calendarFrame.selectedDay or month ~= calendarFrame.selectedMonth or year ~= calendarFrame.selectedYear then
		calendarFrame.selectedDay = day;
		calendarFrame.selectedMonth = month;
		calendarFrame.selectedYear = year;
		calendarFrame:SetSelectedDay(button);
	end
end

function KrowiAF_AchievementCalendarDayButton_OnClick(self, button)
	if button == "LeftButton" then
		local dayChanged = self ~= addon.GUI.Calendar.Frame.selectedDayButton;

		CalendarDayButton_Click(self);
		if dayChanged then
			if addon.GUI.Calendar.SideFrame:IsShown() then
				addon.GUI.Calendar.SideFrame:Hide();
			end
		end
	end
    if self.Achievements then
        addon.GUI.Calendar.SideFrame:Show();
    end

	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end

function dayButton:Clear()
	self.Achievements = nil;
	self.Points = 0;

	local buttons = self.AchievementButtons;
	for _, button in next, buttons do
        button.Achievement = nil; -- might remove this, keep for now
        button:Hide();
    end
	self.More:Hide();
end