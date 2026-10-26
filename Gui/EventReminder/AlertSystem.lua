local _, addon = ...
addon.Gui.EventReminderAlertSystem = {}
local eventReminderAlertSystem = addon.Gui.EventReminderAlertSystem

-- Where the pop-ups live (issue #188, docs/work/188-event-reminder-popups). They are a queued alert system in an alert
-- container of the addon's own, the holder, so Blizzard's AlertFrame never holds or calls the addon's code. Position
-- applies to:
--   Every alert: AlertFrame goes to the offsets, a post-hook on its UpdateAnchors restacks the game's toasts by the grow
--     direction and spacing, and the holder hangs at the end of that stack, so the pop-ups continue it
--   Only event reminders: the holder alone goes to the offsets; the game's toasts stay where the game puts them
-- An addon that places the game's alerts (ElvUI, GW2_UI, EllesmereUI's mover, Dominos Roll's Alerts bar) wins: once
-- AlertFrame is anywhere else than where Blizzard or the addon put it, the addon stops placing and restacking, and new
-- pop-ups go to a queued system in AlertFrame, so that addon stacks them with its toasts.
local everyAlert = 1
local blizzardX, blizzardY = 0, 128 -- AlertFrame's anchor on UIParent (Mainline and Classic AlertFrames.xml)
local blizzardSpacing = 10 -- AlertFrameQueueMixin:AdjustAnchors (Mainline/AlertFrames.lua:243-248)
local placedX, placedY -- where the addon put AlertFrame under Every alert; nil while it is where Blizzard put it

local function PopUpOptions()
    return addon.Options.db.profile.EventReminders.PopUps
end

-- Growing up an alert's bottom hangs on the previous one's top, growing down its top on the previous one's bottom
local function GrowPoints()
    local options = PopUpOptions()
    if options.GrowDirection == 1 then
        return "BOTTOM", "TOP", options.Spacing
    end
    return "TOP", "BOTTOM", -options.Spacing
end

-- The plugins' skins hook this one (Plugins/ElvUI.lua, GW2_UI, EllesmereUI), so it reaches pop-ups in either system
function eventReminderAlertSystem.SetUpAlert(frame, event, duration)
    frame:SetEvent(event)
    frame.duration = duration
end

local function SetUp(frame, event, duration)
    eventReminderAlertSystem.SetUpAlert(frame, event, duration)
end

-- The holder's own stacking, on the addon's own system
local function AdjustAnchors(self, relativeAlert)
    local point, relativePoint, offset = GrowPoints()
    for alertFrame in self.alertFramePool:EnumerateActive() do
        alertFrame:ClearAllPoints()
        alertFrame:SetPoint(point, relativeAlert, relativePoint, 0, offset)
        relativeAlert = alertFrame
    end
    return relativeAlert
end

-- Blizzard's alert systems walked as AlertContainerMixin:UpdateAnchors walks them (Mainline/AlertFrames.lua:410-418);
-- returns the frame the next alert hangs on. Given a point, the queued systems' alerts are anchored again by it; the
-- loot rolls and talking head pass their frame on while shown. Reads Blizzard's tables, writes none.
local function WalkAlertFrame(point, relativePoint, offset)
    local relativeFrame = AlertFrame.baseAnchorFrame or AlertFrame
    for _, subSystem in ipairs(AlertFrame.alertFrameSubSystems) do
        local resultFrame = relativeFrame
        if subSystem.alertFramePool then
            for alertFrame in subSystem.alertFramePool:EnumerateActive() do
                if point then
                    alertFrame:ClearAllPoints()
                    alertFrame:SetPoint(point, resultFrame, relativePoint, 0, offset)
                end
                resultFrame = alertFrame
            end
        elseif subSystem.anchorFrame and subSystem.anchorFrame:IsShown() then
            resultFrame = subSystem.anchorFrame
        end
        if not resultFrame.IsInDefaultPosition or resultFrame:IsInDefaultPosition() then
            relativeFrame = resultFrame
        end
    end
    return relativeFrame
end

-- The game's alerts back as Blizzard has them: the toasts showing stacked Blizzard's way, so none keeps a point of the
-- addon's beside the one Blizzard's next pass sets, and, when it moves, AlertFrame back on its own spot
local function GiveBack(moveAlertFrame)
    WalkAlertFrame("BOTTOM", "TOP", blizzardSpacing)
    if moveAlertFrame then
        AlertFrame:ClearAllPoints()
        AlertFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", blizzardX, blizzardY)
    end
    placedX, placedY = nil, nil
end

local function IsAt(frame, x, y)
    if frame:GetNumPoints() ~= 1 then
        return false
    end
    local point, relativeTo, relativePoint, frameX, frameY = frame:GetPoint(1)
    return point == "BOTTOM" and relativeTo == UIParent and relativePoint == "BOTTOM"
        and floor(frameX + 0.5) == floor(x + 0.5) and floor(frameY + 0.5) == floor(y + 0.5)
end

-- Another addon places the game's alerts once AlertFrame is anywhere else than where Blizzard or the addon put it; the
-- addon then follows it for the rest of the session
function eventReminderAlertSystem:IsFollowing()
    if self.Following then
        return true
    end
    if not self.Holder or IsAt(AlertFrame, placedX or blizzardX, placedY or blizzardY) then
        return false
    end
    self.Following = true
    if placedX then
        GiveBack(false)
    end
    return true
end

-- The post-hook on AlertFrame:UpdateAnchors, once per alert: under Every alert the toasts restacked by the grow
-- direction and spacing (only when they differ from Blizzard's), then the holder at the end of the stack, its edge on
-- the last frame's, so the first pop-up sits where the next toast would. Allocates nothing.
local function Restack()
    local system = eventReminderAlertSystem
    if system.AppliesTo ~= everyAlert or system:IsFollowing() then
        return
    end
    local point, relativePoint, offset = GrowPoints()
    if point == "BOTTOM" and offset == blizzardSpacing then
        point = nil
    end
    local last = WalkAlertFrame(point, relativePoint, offset)
    local edge = PopUpOptions().GrowDirection == 1 and "TOP" or "BOTTOM"
    system.Holder:ClearAllPoints()
    system.Holder:SetPoint(edge, last, edge, 0, 0)
end

-- Places the pop-ups (and under Every alert the game's alerts) by the options: at load, from the location options'
-- setters and after a profile switch, reset or copy
function eventReminderAlertSystem:ApplyLocation()
    local holder = self.Holder
    if not holder or self:IsFollowing() then
        return
    end
    local options = PopUpOptions()
    self.AppliesTo = options.AppliesTo
    if options.AppliesTo == everyAlert then
        AlertFrame:ClearAllPoints()
        AlertFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", options.OffsetX, options.OffsetY)
        placedX, placedY = options.OffsetX, options.OffsetY
        if self:IsFollowing() then -- EllesmereUI's mover puts its own spot back inside SetPoint
            return
        end
        Restack()
    else
        if placedX then
            GiveBack(true)
        end
        holder:ClearAllPoints()
        holder:SetPoint("BOTTOM", UIParent, "BOTTOM", options.OffsetX, options.OffsetY)
    end
    holder:UpdateAnchors()
end

function eventReminderAlertSystem:Load()
    if not addon.Options.db.profile.EventReminders.Enabled then
        return
    end

    -- At ADDON_LOADED, before the login events AlertContainerMixin:OnLoad waits for (Mainline/AlertFrames.lua:259-283)
    local holder = CreateFrame("Frame", nil, UIParent)
    holder:SetSize(10, 10) -- AlertFrame's size, so pop-ups at the same offsets sit where they always did
    Mixin(holder, AlertContainerMixin)
    holder:OnLoad()
    if holder.OnEvent then -- Classic's container waits for its login events through OnEvent (Classic/AlertFrames.lua:256-275)
        holder:SetScript("OnEvent", holder.OnEvent)
    end
    self.Holder = holder
    self.Template = "KrowiAF_EventReminderAlertFrame_" .. (addon.Options.db.profile.EventReminders.Compact and "Small" or "Normal") .. "_Template"
    self.SubSystem = holder:AddQueuedAlertFrameSubSystem(self.Template, SetUp, PopUpOptions().MaxAlerts, 100)
    self.SubSystem.AdjustAnchors = AdjustAnchors

    -- The pop-ups wait while the game holds its own alerts back (the What's New splash, the Runeforge craft)
    hooksecurefunc(AlertFrame, "SetAlertsEnabled", function(_, enabled, reason)
        holder:SetAlertsEnabled(enabled, reason)
    end)
    hooksecurefunc(AlertFrame, "UpdateAnchors", Restack)
    self:ApplyLocation()
end

-- The system new pop-ups go to: the holder's, or while following another addon one in AlertFrame, made once
function eventReminderAlertSystem:GetActiveSubSystem()
    if not self:IsFollowing() then
        return self.SubSystem
    end
    if not self.FollowSubSystem then
        self.FollowSubSystem = AlertFrame:AddQueuedAlertFrameSubSystem(self.Template, SetUp, PopUpOptions().MaxAlerts, 100)
    end
    return self.FollowSubSystem
end

function eventReminderAlertSystem:AddAlert(event, duration)
    if not self.SubSystem then
        return false
    end

    return self:GetActiveSubSystem():AddAlert(event, duration)
end

-- The pop-ups showing, in both systems, for Show me and the pictures run
function eventReminderAlertSystem:EnumerateAlerts()
    local frames = {}
    for _, subSystem in next, {self.SubSystem, self.FollowSubSystem} do
        for frame in subSystem.alertFramePool:EnumerateActive() do
            frames[#frames + 1] = frame
        end
    end
    return ipairs(frames)
end

-- Every pop-up of the addon's, showing and waiting, real reminders included (Hide placeholders, issue #364); the game's
-- own toasts stay
function eventReminderAlertSystem:HideAlerts()
    local frames = {}
    for _, subSystem in next, {self.SubSystem, self.FollowSubSystem} do
        subSystem.queuedAlerts = nil
        for frame in subSystem.alertFramePool:EnumerateActive() do
            frames[#frames + 1] = frame
        end
    end
    for _, frame in ipairs(frames) do
        frame:Hide()
    end
end

-- Placeholder reminders on copies of the player's enabled events, so the real ones keep their details, and only as many
-- as fit at once, so none waits (issue #364). worldFirst: the event list's Show me starts with the world events, the
-- reminders' with the calendar ones. Returns how many it showed.
local placeholderTypes = {
    {Type = "Calendar", On = "CalendarEvents"},
    {Type = "Widget", On = "WidgetEvents"},
    {Type = "World", On = "WorldEvents"}
}

function eventReminderAlertSystem:ShowPlaceholders(worldFirst, duration)
    if not self.SubSystem then -- reminders were off at login, so there is no alert system to show them in
        print(addon.Metadata.Title, "-", addon.L["Help Events Off"])
        return 0
    end
    local options = addon.Options.db.profile.EventReminders
    local subSystem = self:GetActiveSubSystem()
    local free = subSystem.maxAlerts - subSystem:GetNumVisibleAlerts()
    local shown, endTime = 0, GetServerTime() + 2 * 60 * 60
    local first, last, step = 1, #placeholderTypes, 1
    if worldFirst then
        first, last, step = last, first, -1
    end
    for i = first, last, step do
        local eventType = placeholderTypes[i]
        local toggles = options[eventType.On]
        for _, event in next, addon.Data.Events[KrowiAF.Enum.EventType[eventType.Type]] or {} do
            if shown < free and toggles and toggles[event.Id] and event.Category then
                local name = event.Name or event.Category.Name or addon.L["Placeholder"]
                local placeholder = setmetatable({EventDetails = {Name = name, EndTime = endTime}}, {__index = event})
                if self:AddAlert(placeholder, duration) then
                    shown = shown + 1
                end
            end
        end
    end
    return shown
end

local gameLocale = GetLocale()
if gameLocale == "enGB" then
	gameLocale = "enUS"
end

-- The C library's date names the days and months in English, so other clients get the addon's own names; a field read
-- on every call, so the events suite (Tests/Events.lua) can run that path on an English client
eventReminderAlertSystem.LocalizeDateNames = gameLocale ~= "enUS"

-- The first three characters of a name, as %a and %b write them; string.sub counts bytes and would cut a two-byte letter
-- of a Cyrillic, Spanish or French name in half. A shorter name, such as koKR's months, stays whole
local firstThreeCharacters = "^" .. ("[%z\1-\127\194-\244][\128-\191]*"):rep(3)
local function Abbreviate(name)
    return name:match(firstThreeCharacters) or name
end

-- time: the moment the line shows, whose day and month the names are
local function LocalizeDateFormat(time)
    local dateFormat = addon.Options.db.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime
    if not eventReminderAlertSystem.LocalizeDateNames then
        return dateFormat
    end
    local hasB = dateFormat:find("%B", 1, true) ~= nil
    local hasb = dateFormat:find("%b", 1, true) ~= nil
    local hasA = dateFormat:find("%A", 1, true) ~= nil
    local hasa = dateFormat:find("%a", 1, true) ~= nil
    if hasB or hasb or hasA or hasa then
        local dateTable = date("*t", time)
        if hasB then
            dateFormat = dateFormat:gsub("%%B", addon.MonthNames[dateTable.month])
        end
        if hasb then
            dateFormat = dateFormat:gsub("%%b", Abbreviate(addon.MonthNames[dateTable.month]))
        end
        if hasA then
            dateFormat = dateFormat:gsub("%%A", addon.WeekdayNames[dateTable.wday])
        end
        if hasa then
            dateFormat = dateFormat:gsub("%%a", Abbreviate(addon.WeekdayNames[dateTable.wday]))
        end
    end
    return dateFormat
end

-- The date format and the names always describe the same moment
local function FormatDate(time)
    return tostring(date(LocalizeDateFormat(time), time))
end

local function GetSecondsLeftFormattedText(secondsLeft)
    local days = floor(secondsLeft / 86400)
    local hours = floor(mod(secondsLeft, 86400) / 3600)
    local minutes = floor(mod(secondsLeft, 3600) / 60)
    local seconds = floor(mod(secondsLeft, 60))
    local timeLeft = days > 0 and format(DAYS_ABBR, days) or ""
    timeLeft = timeLeft .. (days > 0 and " " or "") .. (hours > 0 and format(HOURS_ABBR, hours) or "")
    timeLeft = timeLeft .. (hours > 0 and " " or "") .. (minutes > 0 and format(MINUTES_ABBR, minutes) or "")
    timeLeft = timeLeft .. (minutes > 0 and " " or "") .. (seconds > 0 and format(SECONDS_ABBR, seconds) or "")
    return timeLeft
end

function eventReminderAlertSystem:GetRuntimeText(event, chat)
    local runtime, timeLeft

    if event.EventDetails == nil or event.EventDetails.EndTime == nil then
        if event.MapId then
            event.EventDetails = addon.EventData.GetWorldEventDetails(event)
            if event.EventDetails == nil or event.EventDetails.EndTime == nil then
                return addon.L["No time data available"], ""
            end
        else
            return addon.L["No time data available"], ""
        end
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 or addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 or chat then -- Time Left
        local secondsLeft = event.EventDetails.EndTime - GetServerTime()
        timeLeft = GetSecondsLeftFormattedText(secondsLeft)
    end

    if chat then
        return timeLeft
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 1 then -- End Time
        runtime = FormatDate(event.EventDetails.EndTime)
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 then -- Time Left
        runtime = timeLeft
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.profile.EventReminders.Compact then -- None
        return runtime
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 2 then -- End Time
        return runtime .. "\n" .. FormatDate(event.EventDetails.EndTime)
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        return runtime .. "\n" .. timeLeft
    end

    return runtime
end

function eventReminderAlertSystem:GetUpcomingText(event)
    local runtime, timeLeft

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 or addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        local secondsLeft = event.UpcomingEventDetails.StartTime - GetServerTime()
        timeLeft = GetSecondsLeftFormattedText(secondsLeft)
    end

    -- Line 1's End Time shows when an upcoming event starts: the frame puts "In" before it, and the time left counts to
    -- the start (issue #247). Line 2's, with no "In" before it, shows when it ends
    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 1 then -- End Time
        runtime = FormatDate(event.UpcomingEventDetails.StartTime)
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 then -- Time Left
        runtime = timeLeft
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.profile.EventReminders.Compact then -- None
        return runtime
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 2 then -- End Time
        return runtime .. "\n" .. FormatDate(event.UpcomingEventDetails.EndTime)
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        return runtime .. "\n" .. timeLeft
    end

    return runtime
end

local placeholderEpoch = 9999999999
local function ShowActiveEventPopUp(self, event, canShow, canShowWithTimeDataOnly, currentTime)
    if not canShow then
        return
    end
    if KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] then
        if KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] == placeholderEpoch then
            KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch
        end
        return
    end
    if not canShowWithTimeDataOnly or (canShowWithTimeDataOnly and event.EventDetails and event.EventDetails.EndTime) then
        KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch
        if KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] >= currentTime then
            if not self:AddAlert(event, addon.Options.db.profile.EventReminders.PopUps.FadeDelay) then
                KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = nil
            end
        end
    end
end

local printOnceActiveEvents
local function ShowActiveEventChatMessage(self, event, canShow, canShowWithTimeDataOnly, currentTime)
    if not canShow then
        return
    end
    if KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] then
        if KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] == placeholderEpoch then
            KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch
        end
        return
    end
    if not canShowWithTimeDataOnly or (canShowWithTimeDataOnly and event.EventDetails and event.EventDetails.EndTime) then
        if not printOnceActiveEvents then
            print(addon.Metadata.Title, "-", addon.L["Active events"] .. ":")
            printOnceActiveEvents = true
        end
        KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch
        if KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] >= currentTime then
            print("    -", event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"], "(" .. self:GetRuntimeText(event, true) .. ")") --,
        end
    end
end

function eventReminderAlertSystem:ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime, activeEvents)
    local isInInstance = (select(3, GetInstanceInfo())) ~= 0
    local canShowPopUps = popUpsOptions.Show and (not isInInstance or (popUpsOptions.ShowInInstances and isInInstance))
    local canShowChatMessages = chatMessagesOptions.Show and (not isInInstance or (chatMessagesOptions.ShowInInstances and isInInstance))
    local canShowPopUpsWithTimeDataOnly = popUpsOptions.ShowOnlyWhenTimeDataIsAvailable
    local canShowChatMessagesWithTimeDataOnly = chatMessagesOptions.ShowOnlyWhenTimeDataIsAvailable

    if not canShowPopUps and not canShowChatMessages then
        return
    end

    activeEvents = activeEvents or addon.EventData.GetActiveEvents(true)
    for _, event in next, activeEvents do
        ShowActiveEventPopUp(self, event, canShowPopUps, canShowPopUpsWithTimeDataOnly, currentTime)
        ShowActiveEventChatMessage(self, event, canShowChatMessages, canShowChatMessagesWithTimeDataOnly, currentTime)
    end
    printOnceActiveEvents = nil

    return true
end

local function ShowUpcomingCalendarEventPopUp(self, event, canShow, currentTime)
    if not canShow then
        return
    end
    if KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] then
        return
    end
    local occurrence = addon.EventData.GetNextEventOccurance(event.Id)
    if not (occurrence and occurrence.StartTime) then
        return
    end
    KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] = occurrence.StartTime
    if KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] < currentTime + (addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Days * 24 * 60 * 60) then
        if not self:AddAlert(event, addon.Options.db.profile.EventReminders.PopUps.FadeDelay) then
            KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] = nil
        end
    end
end

local printOnceUpcomingCalendarEvents
local function ShowUpcomingCalendarEventChatMessage(self, event, canShow, currentTime)
    if not canShow then
        return
    end
    if KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] then
        return
    end
    if not printOnceUpcomingCalendarEvents then
        print(addon.Metadata.Title, "-", addon.L["Upcoming Calendar Events"] .. ":")
        printOnceUpcomingCalendarEvents = true
    end
    local occurrence = addon.EventData.GetNextEventOccurance(event.Id)
    if not (occurrence and occurrence.StartTime) then
        return
    end
    KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] = occurrence.StartTime
    if KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] < currentTime + (addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Days * 24 * 60 * 60) then
        print("    -", occurrence.Name, "(In " .. GetSecondsLeftFormattedText(occurrence.StartTime - currentTime) .. ")")
    end
end

function eventReminderAlertSystem:ShowUpcomingCalendarEvents(popUpsOptions, chatMessagesOptions, currentTime, upcomingCalendarEvents)
    if not addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Enabled then
        return
    end

    local isInInstance = (select(3, GetInstanceInfo())) ~= 0
    local canShowPopUps = popUpsOptions.Show and (not isInInstance or (popUpsOptions.ShowInInstances and isInInstance))
    local canShowChatMessages = chatMessagesOptions.Show and (not isInInstance or (chatMessagesOptions.ShowInInstances and isInInstance))

    if not canShowPopUps and not canShowChatMessages then
        return
    end

    upcomingCalendarEvents = upcomingCalendarEvents or addon.EventData.GetUpcomingCalendarEvents()
    for _, event in next, upcomingCalendarEvents do
        ShowUpcomingCalendarEventPopUp(self, event, canShowPopUps, currentTime)
        ShowUpcomingCalendarEventChatMessage(self, event, canShowChatMessages, currentTime)
    end
    printOnceUpcomingCalendarEvents = nil

    return true
end

local refreshCallbacks = {}

local refreshTicker
local lastRefreshInterval

local refreshStartReasons = {
    Alerts = false,
    Callbacks = false
}

local function GetRefreshInterval()
    local interval = addon.Options.db.profile.EventReminders.RefreshInterval
    if not interval or interval < 1 then
        interval = 1
    end
    return interval
end

local function CancelRefreshTicker()
    if refreshTicker then
        refreshTicker:Cancel()
        refreshTicker = nil
        lastRefreshInterval = nil
    end
end

local Refresh
local function EnsureRefreshTicker(self)
    local interval = GetRefreshInterval()
    if refreshTicker and lastRefreshInterval == interval then
        return
    end

    CancelRefreshTicker()
    lastRefreshInterval = interval
    refreshTicker = C_Timer.NewTicker(interval, function()
        Refresh(self)
    end)
end

local function UpdateRefreshTickerState(self)
    if refreshStartReasons.Alerts or refreshStartReasons.Callbacks then
        EnsureRefreshTicker(self)
    else
        CancelRefreshTicker()
    end
end

function Refresh(self)
    -- If the user changed the interval in options, reschedule the ticker.
    EnsureRefreshTicker(self)

    local hasCallbacks = next(refreshCallbacks) ~= nil
    local refreshedActiveEvents
    local refreshedUpcomingCalendarEvents
    if hasCallbacks then
        refreshedActiveEvents = addon.EventData.GetActiveEvents(true)
        if addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Enabled then
            refreshedUpcomingCalendarEvents = addon.EventData.GetUpcomingCalendarEvents()
        end
    end

    local currentTime = time()
    self:ShowActiveEvents(addon.Options.db.profile.EventReminders.PopUps.OnEventStart, addon.Options.db.profile.EventReminders.ChatMessages.OnEventStart, currentTime, refreshedActiveEvents)
    self:ShowUpcomingCalendarEvents(addon.Options.db.profile.EventReminders.PopUps.OnEventStartUpcoming, addon.Options.db.profile.EventReminders.ChatMessages.OnEventStartUpcoming, currentTime, refreshedUpcomingCalendarEvents)

    for i, endTime in next, KrowiAF_SavedData.ActiveEventPopUpsShown do
        if endTime < currentTime then
            KrowiAF_SavedData.ActiveEventPopUpsShown[i] = nil
        end
    end
    for i, endTime in next, KrowiAF_SavedData.ActiveEventChatMessagesShown do
        if endTime < currentTime then
            KrowiAF_SavedData.ActiveEventChatMessagesShown[i] = nil
        end
    end

    for _, callback in next, refreshCallbacks do
        local ok, err = pcall(callback, currentTime, refreshedActiveEvents, refreshedUpcomingCalendarEvents)
        if not ok then
            geterrorhandler()(err)
        end
    end
end

local function StartRefresh(self, reason)
    if reason then
        refreshStartReasons[reason] = true
    end

    UpdateRefreshTickerState(self)
end

function eventReminderAlertSystem:StartRefreshTicker()
    if not addon.Options.db.profile.EventReminders.Enabled then
        return
    end
    StartRefresh(self, "Callbacks")
end

function eventReminderAlertSystem:RegisterOnRefresh(key, callback)
    if not key or not callback then
        return
    end
    refreshCallbacks[key] = callback
    -- Ensure the ticker is running if something depends on it.
    self:StartRefreshTicker()
end

function eventReminderAlertSystem:UnregisterOnRefresh(key)
    if not key then
        return
    end
    refreshCallbacks[key] = nil

    if next(refreshCallbacks) == nil then
        refreshStartReasons.Callbacks = false
        UpdateRefreshTickerState(self)
    end
end

function eventReminderAlertSystem:ShowActiveEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions)
    if not addon.Options.db.profile.EventReminders.Enabled then
        return
    end

    KrowiAF_SavedData.ActiveEventPopUpsShown = {}
    KrowiAF_SavedData.ActiveEventChatMessagesShown = {}

    local currentTime = time()

    if popUpsOptions and not popUpsOptions.Show then
        local activeEvents = addon.EventData.GetActiveEvents(true)
        for _, event in next, activeEvents do
            KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch
        end
    end
    if chatMessagesOptions and not chatMessagesOptions.Show then
        local activeEvents = addon.EventData.GetActiveEvents(true)
        for _, event in next, activeEvents do
            KrowiAF_SavedData.ActiveEventChatMessagesShown[event.Id] = event.EventDetails and event.EventDetails.EndTime or placeholderEpoch
        end
    end

    if not self:ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime) then
        return
    end

    StartRefresh(self, "Alerts")
end

function eventReminderAlertSystem:ShowUpcomingCalendarEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions)
    if not addon.Options.db.profile.EventReminders.Enabled or not addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Enabled then
        return
    end

    KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown = {}
    KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown = {}

    local currentTime = time()

    if popUpsOptions and not popUpsOptions.Show then
        local upcomingCalendarEvents = addon.EventData.GetUpcomingCalendarEvents()
        for _, event in next, upcomingCalendarEvents do
            local occurrence = addon.EventData.GetNextEventOccurance(event.Id)
            if occurrence and occurrence.StartTime then
                KrowiAF_SavedData.UpcomingCalendarEventPopUpsShown[event.Id] = occurrence.StartTime
            end
        end
    end
    if chatMessagesOptions and not chatMessagesOptions.Show then
        local upcomingCalendarEvents = addon.EventData.GetUpcomingCalendarEvents()
        for _, event in next, upcomingCalendarEvents do
            local occurrence = addon.EventData.GetNextEventOccurance(event.Id)
            if occurrence and occurrence.StartTime then
                KrowiAF_SavedData.UpcomingCalendarEventChatMessagesShown[event.Id] = occurrence.StartTime
            end
        end
    end

    if not self:ShowUpcomingCalendarEvents(popUpsOptions, chatMessagesOptions, currentTime) then
        return
    end

    StartRefresh(self, "Alerts")
end