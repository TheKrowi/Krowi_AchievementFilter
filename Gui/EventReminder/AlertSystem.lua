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
end

function eventReminderAlertSystem:AddAlert(event, duration)
    if not self.SubSystem then
        return false;
    end

    return self.SubSystem:AddAlert(event, duration);
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
        local hasB = dateFormat:find("%B", 1, true) ~= nil;
        local hasb = dateFormat:find("%b", 1, true) ~= nil;
        local hasA = dateFormat:find("%A", 1, true) ~= nil;
        local hasa = dateFormat:find("%a", 1, true) ~= nil;
        if hasB or hasb or hasA or hasa then
            local dateTable = date("*t", event.EventDetails.EndTime);
            if hasB then
                dateFormat = dateFormat:gsub("%%B", addon.MonthNames[dateTable.month]);
            end
            if hasb then
                dateFormat = dateFormat:gsub("%%b", string.sub(addon.MonthNames[dateTable.month], 1, 3));
            end
            if hasA then
                dateFormat = dateFormat:gsub("%%A", addon.WeekdayNames[dateTable.wday]);
            end
            if hasa then
                dateFormat = dateFormat:gsub("%%a", string.sub(addon.WeekdayNames[dateTable.wday], 1, 3));
            end
        end
        return dateFormat;
    end
end

local function GetSecondsLeftFormattedText(secondsLeft)
    local days = floor(secondsLeft / 86400);
    local hours = floor(mod(secondsLeft, 86400) / 3600);
    local minutes = floor(mod(secondsLeft, 3600) / 60);
    local seconds = floor(mod(secondsLeft, 60));
    local timeLeft = days > 0 and format(DAYS_ABBR, days) or "";
    timeLeft = timeLeft .. (days > 0 and " " or "") .. (hours > 0 and format(HOURS_ABBR, hours) or "");
    timeLeft = timeLeft .. (hours > 0 and " " or "") .. (minutes > 0 and format(MINUTES_ABBR, minutes) or "");
    timeLeft = timeLeft .. (minutes > 0 and " " or "") .. (seconds > 0 and format(SECONDS_ABBR, seconds) or "");
    return timeLeft;
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
        timeLeft = GetSecondsLeftFormattedText(secondsLeft);
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

function eventReminderAlertSystem:GetUpcomingText(event)
    local runtime, timeLeft;

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 or addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        local secondsLeft = event.UpcomingEventDetails.StartTime - GetServerTime();
        timeLeft = GetSecondsLeftFormattedText(secondsLeft);
    end

    local dateFormat = LocalizeDateFormat(event);

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 1 then -- End Time
        runtime = tostring(date(dateFormat, event.UpcomingEventDetails.EndTime));
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 then -- Time Left
        runtime = timeLeft;
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.profile.EventReminders.Compact then -- None
        return runtime;
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 2 then -- End Time
        return runtime .. "\n" .. tostring(date(dateFormat, event.UpcomingEventDetails.EndTime));
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
            if not self:AddAlert(event, addon.Options.db.profile.EventReminders.PopUps.FadeDelay) then
                KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = nil;
            end
        end
    end
end

local printOnceActiveEvents;
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
        if not printOnceActiveEvents then
            print(addon.Metadata.Title, "-", addon.L["Active events"] .. ":");
            printOnceActiveEvents = true;
        end
        KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch;
        if KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] >= currentTime then
            print("    -", event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"], "(" .. self:GetRuntimeText(event, true) .. ")"); --,
        end
    end
end

function eventReminderAlertSystem:ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime, activeEvents)
    local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
    local canShowPopUps = popUpsOptions.Show and (not isInInstance or (popUpsOptions.ShowInInstances and isInInstance));
    local canShowChatMessages = chatMessagesOptions.Show and (not isInInstance or (chatMessagesOptions.ShowInInstances and isInInstance));
    local canShowPopUpsWithTimeDataOnly = popUpsOptions.ShowOnlyWhenTimeDataIsAvailable;
    local canShowChatMessagesWithTimeDataOnly = chatMessagesOptions.ShowOnlyWhenTimeDataIsAvailable;

    if not canShowPopUps and not canShowChatMessages then
        return;
    end

    activeEvents = activeEvents or addon.EventData.GetActiveEvents(true);
    for _, event in next, activeEvents do
        ShowActiveEventPopUp(self, event, canShowPopUps, canShowPopUpsWithTimeDataOnly, currentTime);
        ShowActiveEventChatMessage(self, event, canShowChatMessages, canShowChatMessagesWithTimeDataOnly, currentTime);
    end
    printOnceActiveEvents = nil;

    return true;
end

local function ShowUpcomingCalendarEventPopUp(self, event, canShow, currentTime)
    if not canShow then
        return;
    end
    if KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] then
        return;
    end
    local occurrence = addon.EventData.GetNextEventOccurance(event.Id);
    if not (occurrence and occurrence.StartTime) then
        return;
    end
    KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] = occurrence.StartTime;
    if KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] < currentTime + (addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Days * 24 * 60 * 60) then
        if not self:AddAlert(event, addon.Options.db.profile.EventReminders.PopUps.FadeDelay) then
            KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] = nil;
        end
    end
end

local printOnceUpcomingCalendarEvents;
local function ShowUpcomingCalendarEventChatMessage(self, event, canShow, currentTime)
    if not canShow then
        return;
    end
    if KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] then
        return;
    end
    if not printOnceUpcomingCalendarEvents then
        print(addon.Metadata.Title, "-", addon.L["Upcoming Calendar Events"] .. ":");
        printOnceUpcomingCalendarEvents = true;
    end
    local occurrence = addon.EventData.GetNextEventOccurance(event.Id);
    if not (occurrence and occurrence.StartTime) then
        return;
    end
    KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] = occurrence.StartTime;
    if KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] < currentTime + (addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Days * 24 * 60 * 60) then
        print("    -", occurrence.Name, "(In " .. GetSecondsLeftFormattedText(occurrence.StartTime - currentTime) .. ")");
    end
end

function eventReminderAlertSystem:ShowUpcomingCalendarEvents(popUpsOptions, chatMessagesOptions, currentTime, upcomingCalendarEvents)
    if not addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Enabled then
        return;
    end

    local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
    local canShowPopUps = popUpsOptions.Show and (not isInInstance or (popUpsOptions.ShowInInstances and isInInstance));
    local canShowChatMessages = chatMessagesOptions.Show and (not isInInstance or (chatMessagesOptions.ShowInInstances and isInInstance));

    if not canShowPopUps and not canShowChatMessages then
        return;
    end

    upcomingCalendarEvents = upcomingCalendarEvents or addon.EventData.GetUpcomingCalendarEvents();
    for _, event in next, upcomingCalendarEvents do
        ShowUpcomingCalendarEventPopUp(self, event, canShowPopUps, currentTime);
        ShowUpcomingCalendarEventChatMessage(self, event, canShowChatMessages, currentTime);
    end
    printOnceUpcomingCalendarEvents = nil;

    return true;
end

local refreshCallbacks = {};

local refreshTicker;
local lastRefreshInterval;

local refreshStartReasons = {
    Alerts = false,
    Callbacks = false
};

local function GetRefreshInterval()
    local interval = addon.Options.db.profile.EventReminders.RefreshInterval;
    if not interval or interval < 1 then
        interval = 1;
    end
    return interval;
end

local function CancelRefreshTicker()
    if refreshTicker then
        refreshTicker:Cancel();
        refreshTicker = nil;
        lastRefreshInterval = nil;
    end
end

local Refresh;
local function EnsureRefreshTicker(self)
    local interval = GetRefreshInterval();
    if refreshTicker and lastRefreshInterval == interval then
        return;
    end

    CancelRefreshTicker();
    lastRefreshInterval = interval;
    refreshTicker = C_Timer.NewTicker(interval, function()
        Refresh(self);
    end);
end

local function UpdateRefreshTickerState(self)
    if refreshStartReasons.Alerts or refreshStartReasons.Callbacks then
        EnsureRefreshTicker(self);
    else
        CancelRefreshTicker();
    end
end

function Refresh(self)
    -- If the user changed the interval in options, reschedule the ticker.
    EnsureRefreshTicker(self);

    local hasCallbacks = next(refreshCallbacks) ~= nil;
    local refreshedActiveEvents;
    local refreshedUpcomingCalendarEvents;
    if hasCallbacks then
        refreshedActiveEvents = addon.EventData.GetActiveEvents(true);
        if addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Enabled then
            refreshedUpcomingCalendarEvents = addon.EventData.GetUpcomingCalendarEvents();
        end
    end

    local currentTime = time();
    self:ShowActiveEvents(addon.Options.db.profile.EventReminders.PopUps.OnEventStart, addon.Options.db.profile.EventReminders.ChatMessages.OnEventStart, currentTime, refreshedActiveEvents);
    self:ShowUpcomingCalendarEvents(addon.Options.db.profile.EventReminders.PopUps.OnEventStartUpcoming, addon.Options.db.profile.EventReminders.ChatMessages.OnEventStartUpcoming, currentTime, refreshedUpcomingCalendarEvents);

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

    for _, callback in next, refreshCallbacks do
        local ok, err = pcall(callback, currentTime, refreshedActiveEvents, refreshedUpcomingCalendarEvents);
        if not ok then
            geterrorhandler()(err);
        end
    end
end

local function StartRefresh(self, reason)
    if reason then
        refreshStartReasons[reason] = true;
    end

    UpdateRefreshTickerState(self);
end

function eventReminderAlertSystem:StartRefreshTicker()
    if not addon.Options.db.profile.EventReminders.Enabled then
        return;
    end
    StartRefresh(self, "Callbacks");
end

function eventReminderAlertSystem:RegisterOnRefresh(key, callback)
    if not key or not callback then
        return;
    end
    refreshCallbacks[key] = callback;
    -- Ensure the ticker is running if something depends on it.
    self:StartRefreshTicker();
end

function eventReminderAlertSystem:UnregisterOnRefresh(key)
    if not key then
        return;
    end
    refreshCallbacks[key] = nil;

    if next(refreshCallbacks) == nil then
        refreshStartReasons.Callbacks = false;
        UpdateRefreshTickerState(self);
    end
end

function eventReminderAlertSystem:ShowActiveEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions)
    if not addon.Options.db.profile.EventReminders.Enabled then
        return;
    end

    KrowiAF_SavedData.ActiveEventPopUpsShown = {};
    KrowiAF_SavedData.ActiveEventChatMessagesShown = {};

    local currentTime = time();

    if popUpsOptions and not popUpsOptions.Show then
        local activeEvents = addon.EventData.GetActiveEvents(true);
        for _, event in next, activeEvents do
            KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch;
        end
    end
    if chatMessagesOptions and not chatMessagesOptions.Show then
        local activeEvents = addon.EventData.GetActiveEvents(true);
        for _, event in next, activeEvents do
            KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch;
        end
    end

    if not self:ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime) then
        return;
    end

    StartRefresh(self, "Alerts");
end

function eventReminderAlertSystem:ShowUpcomingCalendarEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions)
    if not addon.Options.db.profile.EventReminders.Enabled or not addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Enabled then
        return;
    end

    KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown = {};
    KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown = {};

    local currentTime = time();

    if popUpsOptions and not popUpsOptions.Show then
        local upcomingCalendarEvents = addon.EventData.GetUpcomingCalendarEvents();
        for _, event in next, upcomingCalendarEvents do
            local occurrence = addon.EventData.GetNextEventOccurance(event.Id);
            if occurrence and occurrence.StartTime then
                KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] = occurrence.StartTime;
            end
        end
    end
    if chatMessagesOptions and not chatMessagesOptions.Show then
        local upcomingCalendarEvents = addon.EventData.GetUpcomingCalendarEvents();
        for _, event in next, upcomingCalendarEvents do
            local occurrence = addon.EventData.GetNextEventOccurance(event.Id);
            if occurrence and occurrence.StartTime then
                KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] = occurrence.StartTime;
            end
        end
    end

    if not self:ShowUpcomingCalendarEvents(popUpsOptions, chatMessagesOptions, currentTime) then
        return;
    end

    StartRefresh(self, "Alerts");
end