local _, addon = ...;
addon.Gui.EventReminderAlertSystem = {};
local eventReminderAlertSystem = addon.Gui.EventReminderAlertSystem;

local function SetUp(frame, event, duration)
    frame:SetEvent(event);
    frame.duration = duration;
end

function eventReminderAlertSystem:Load()
    if not addon.Options.db.profile.EventReminders.Enabled then
        return;
    end

    local template = "KrowiAF_EventReminderAlertFrame_" .. (addon.Options.db.profile.EventReminders.Compact and "Small" or "Normal") .. "_Template";
    self.SubSystem = AlertFrame:AddQueuedAlertFrameSubSystem(template, SetUp, addon.Options.db.profile.EventReminders.PopUps.MaxAlerts, 100);
    AlertFrame:ClearAllPoints();
    AlertFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", addon.Options.db.profile.EventReminders.PopUps.OffsetX, addon.Options.db.profile.EventReminders.PopUps.OffsetY);

    self:UpdateGrowDirection();

    KrowiAF_SavedData.ActiveEvents = KrowiAF_SavedData.ActiveEvents or {};
end

function eventReminderAlertSystem:AddAlert(event, duration)
    self.SubSystem:AddAlert(event, duration);
end

local gameLocale = GetLocale();
if gameLocale == "enGB" then
	gameLocale = "enUS";
end
local LocalizeDateFormat;
if gameLocale == "enUS" then
    function LocalizeDateFormat()
        return addon.Options.db.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime;
    end
else
    function LocalizeDateFormat(event)
        local dateFormat = addon.Options.db.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime;
        if string.match(dateFormat, "%%B") then
            local dateTable = date("*t", event.EventDetails.EndTime);
            dateFormat = dateFormat:gsub("%%B", addon.MonthNames[dateTable.month]);
        end
        if string.match(dateFormat, "%%b") then
            local dateTable = date("*t", event.EventDetails.EndTime);
            dateFormat = dateFormat:gsub("%%b", string.sub(addon.MonthNames[dateTable.month], 1, 3));
        end
        if string.match(dateFormat, "%%A") then
            local dateTable = date("*t", event.EventDetails.EndTime);
            dateFormat = dateFormat:gsub("%%A", addon.WeekdayNames[dateTable.wday]);
        end
        if string.match(dateFormat, "%%a") then
            local dateTable = date("*t", event.EventDetails.EndTime);
            dateFormat = dateFormat:gsub("%%a", string.sub(addon.WeekdayNames[dateTable.wday], 1, 3));
        end
        return dateFormat;
    end
end

function eventReminderAlertSystem:GetRuntimeText(event, chat)
    local runtime, timeLeft;

    if event.EventDetails == nil or event.EventDetails.EndTime == nil then
        if event.MapId then
            event.EventDetails = addon.EventData.GetWorldEventDetails(event);
            if event.EventDetails == nil or event.EventDetails.EndTime == nil then
                return addon.L["No time data available"], "";
            end
        else
            return addon.L["No time data available"], "";
        end
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 or addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 or chat then -- Time Left
        local secondsLeft = event.EventDetails.EndTime - GetServerTime();
        local days = floor(secondsLeft / 86400);
        local hours = floor(mod(secondsLeft, 86400) / 3600);
        local minutes = floor(mod(secondsLeft, 3600) / 60);
        local seconds = floor(mod(secondsLeft, 60));
        timeLeft = days > 0 and format(DAYS_ABBR, days) or "";
        timeLeft = timeLeft .. (days > 0 and " " or "") .. (hours > 0 and format(HOURS_ABBR, hours) or "");
        timeLeft = timeLeft .. (hours > 0 and " " or "") .. (minutes > 0 and format(MINUTES_ABBR, minutes) or "");
        timeLeft = timeLeft .. (minutes > 0 and " " or "") .. (seconds > 0 and format(SECONDS_ABBR, seconds) or "");
    end

    if chat then
        return timeLeft;
    end

    local dateFormat = LocalizeDateFormat(event);

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 1 then -- End Time
        runtime = tostring(date(dateFormat, event.EventDetails.EndTime));
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 then -- Time Left
        runtime = timeLeft;
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.profile.EventReminders.Compact then -- None
        return runtime;
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 2 then -- End Time
        return runtime .. "\n" .. tostring(date(dateFormat, event.EventDetails.EndTime));
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        return runtime .. "\n" .. timeLeft;
    end

    return runtime;
end

function eventReminderAlertSystem:UpdateGrowDirection()
    -- Make sure the saved data is correct
    KrowiAF_SavedData.AlertSystem = KrowiAF_SavedData.AlertSystem or {};
    KrowiAF_SavedData.AlertSystem.GrowDirection = KrowiAF_SavedData.AlertSystem.GrowDirection or {};
    KrowiAF_SavedData.AlertSystem.GrowDirection.Point = addon.Options.db.profile.EventReminders.PopUps.GrowDirection == 1 and "BOTTOM" or "TOP";
    KrowiAF_SavedData.AlertSystem.GrowDirection.RelativePoint = addon.Options.db.profile.EventReminders.PopUps.GrowDirection == 1 and "TOP" or "BOTTOM";
    KrowiAF_SavedData.AlertSystem.GrowDirection.Offset = addon.Options.db.profile.EventReminders.PopUps.GrowDirection == 1 and addon.Options.db.profile.EventReminders.PopUps.Spacing or -addon.Options.db.profile.EventReminders.PopUps.Spacing;
end

local placeholderEpoch = 9999999999;
local function ShowActiveEventPopUp(self, event, canShow, canShowWithTimeDataOnly, currentTime)
    if not canShow then
        return;
    end
    if KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] then
        if KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] == placeholderEpoch then
            KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch;
        end
        return;
    end
    if not canShowWithTimeDataOnly or (canShowWithTimeDataOnly and event.EventDetails and event.EventDetails.EndTime) then
        KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch;
        if KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] >= currentTime then
            self:AddAlert(event, addon.Options.db.profile.EventReminders.PopUps.FadeDelay);
        end
    end
end

local printOnce;
local function ShowActiveEventChatMessage(self, event, canShow, canShowWithTimeDataOnly, currentTime)
    if not canShow then
        return;
    end
    if KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] then
        if KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] == placeholderEpoch then
            KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch;
        end
        return;
    end
    if not canShowWithTimeDataOnly or (canShowWithTimeDataOnly and event.EventDetails and event.EventDetails.EndTime) then
        if not printOnce then
            print(addon.Metadata.Title, "-", addon.L["Active events"] .. ":");
            printOnce = true;
        end
        KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch;
        if KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] >= currentTime then
            print("    -", event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"], "(" .. self:GetRuntimeText(event, true) .. ")"); --,
        end
    end
end

function eventReminderAlertSystem:ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime)
    local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
    local canShowPopUps = popUpsOptions.Show and (not isInInstance or (popUpsOptions.ShowInInstances and isInInstance));
    local canShowChatMessages = chatMessagesOptions.Show and (not isInInstance or (chatMessagesOptions.ShowInInstances and isInInstance));
    local canShowPopUpsWithTimeDataOnly = popUpsOptions.ShowOnlyWhenTimeDataIsAvailable;
    local canShowChatMessagesWithTimeDataOnly = chatMessagesOptions.ShowOnlyWhenTimeDataIsAvailable;

    if not canShowPopUps and not canShowChatMessages then
        return;
    end

    local activeEvents = addon.EventData.GetActiveEvents(true);
    for _, event in next, activeEvents do
        ShowActiveEventPopUp(self, event, canShowPopUps, canShowPopUpsWithTimeDataOnly, currentTime);
        ShowActiveEventChatMessage(self, event, canShowChatMessages, canShowChatMessagesWithTimeDataOnly, currentTime);
    end
    printOnce = nil;

    return true;
end

local timer = LibStub("AceTimer-3.0");
local function Refresh(self)
    timer:ScheduleTimer(Refresh, addon.Options.db.profile.EventReminders.RefreshInterval, self);

    local popUpsOptions = addon.Options.db.profile.EventReminders.PopUps.OnEventStart;
    local chatMessagesOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnEventStart;

    local currentTime = time();
    if not self:ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime) then
        return;
    end

    for i, endTime in next, KrowiAF_SavedData.ActiveEventPopUpsShown do
        if endTime < currentTime then
            KrowiAF_SavedData.ActiveEventPopUpsShown[i] = nil;
        end
    end
    for i, endTime in next, KrowiAF_SavedData.ActiveEventChatMessagesShown do
        if endTime < currentTime then
            KrowiAF_SavedData.ActiveEventChatMessagesShown[i] = nil;
        end
    end
end

function eventReminderAlertSystem:ShowActiveEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions)
    if not addon.Options.db.profile.EventReminders.Enabled then
        return;
    end

    KrowiAF_SavedData.ActiveEventPopUpsShown = {};
    KrowiAF_SavedData.ActiveEventChatMessagesShown = {};

    if not self:ShowActiveEvents(popUpsOptions, chatMessagesOptions, time()) then
        return;
    end

    timer:ScheduleTimer(Refresh, addon.Options.db.profile.EventReminders.RefreshInterval, self);
end