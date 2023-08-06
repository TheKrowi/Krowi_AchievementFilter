-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;
local helperFrame;

local placeholderEpoch = 9999999999;

local function GetRuntimeText(event, chat)
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
        timeLeft = days > 0 and days .. " Days" or "";
        timeLeft = timeLeft .. (days > 0 and " " or "") .. (hours > 0 and hours .. " Hr" or "");
        timeLeft = timeLeft .. (hours > 0 and " " or "") .. (minutes > 0 and minutes .. " Min" or "");
        timeLeft = timeLeft .. (minutes > 0 and " " or "") .. (seconds > 0 and seconds .. " Sec" or "");
    end

    if chat then
        return timeLeft;
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 1 then -- End Time
        runtime = tostring(date(addon.Options.db.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime, event.EventDetails.EndTime));
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line1 == 2 then -- Time Left
        runtime = timeLeft;
    end

    if addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.profile.EventReminders.Compact then -- None
        return runtime;
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 2 then -- End Time
        return runtime .. "\n" .. tostring(date(addon.Options.db.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime, event.EventDetails.EndTime));
    elseif addon.Options.db.profile.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        return runtime .. "\n" .. timeLeft;
    end

    return runtime;
end

local function ShowActiveEventPopUp(event, canShow, canShowWithTimeDataOnly, currentTime)
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
            alertSystem:AddAlert(event, addon.Options.db.profile.EventReminders.PopUps.FadeDelay);
            -- print(KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id], event.EventDetails, event.EventDetails and event.EventDetails.EndTime);
        end
    end
end

local printOnce;
local function ShowActiveEventChatMessage(event, canShow, canShowWithTimeDataOnly, currentTime)
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
            print("    -", event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"], "(" .. GetRuntimeText(event, true) .. ")"); --,
            -- KrowiAF_SavedData.ActiveEventPopUpsShown[event.Id], event.EventDetails, event.EventDetails and event.EventDetails.EndTime);
        end
    end
end

local function ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime)
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
        ShowActiveEventPopUp(event, canShowPopUps, canShowPopUpsWithTimeDataOnly, currentTime);
        ShowActiveEventChatMessage(event, canShowChatMessages, canShowChatMessagesWithTimeDataOnly, currentTime);
    end
    printOnce = nil;

    return true;
end

local function OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate <= addon.Options.db.profile.EventReminders.RefreshInterval then
        return;
    end

    self.TimeSinceLastUpdate = 0;
    local popUpsOptions = addon.Options.db.profile.EventReminders.PopUps.OnEventStart;
    local chatMessagesOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnEventStart;

    local currentTime = time();
    if not ShowActiveEvents(popUpsOptions, chatMessagesOptions, currentTime) then
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

local function ShowActiveEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions)
    KrowiAF_SavedData.ActiveEventPopUpsShown = {};
    KrowiAF_SavedData.ActiveEventChatMessagesShown = {};

    if not ShowActiveEvents(popUpsOptions, chatMessagesOptions, time()) then
        return;
    end

    helperFrame:SetScript("OnUpdate", OnUpdate); -- Set OnUpdate here to prevent OnUpdate and ShowActiveEvents to run at the same time
end

local function SetUp(frame, event, duration)
	frame.Event = event;
	frame.Name:SetText(event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"]);
    frame:UpdateEventRuntime();
	frame.Icon.Texture:SetTexture(event.Icon);
    frame.duration = duration;
    frame.TimeSinceLastUpdate = 0;
end

local function AdjustQueuedAnchors(self, relativeAlert)
	for alertFrame in self.alertFramePool:EnumerateActive() do
		alertFrame:ClearAllPoints()
		alertFrame:SetPoint(KrowiAF_SavedData.AlertSystem.GrowDirection.Point, relativeAlert, KrowiAF_SavedData.AlertSystem.GrowDirection.RelativePoint, 0, KrowiAF_SavedData.AlertSystem.GrowDirection.Offset)
		relativeAlert = alertFrame
	end
	return relativeAlert
end

-- Credits to ElvUI
local function OverwriteAdjustAnchors(alertFrameSubSystem)
	if alertFrameSubSystem.alertFramePool then -- Queued alert system
		alertFrameSubSystem.AdjustAnchors = AdjustQueuedAnchors;
	end
end

local function UpdateGrowDirection()
    -- Make sure the saved data is correct
    KrowiAF_SavedData.AlertSystem = KrowiAF_SavedData.AlertSystem or {};
    KrowiAF_SavedData.AlertSystem.GrowDirection = KrowiAF_SavedData.AlertSystem.GrowDirection or {};
    KrowiAF_SavedData.AlertSystem.GrowDirection.Point = addon.Options.db.profile.EventReminders.PopUps.GrowDirection == 1 and "BOTTOM" or "TOP";
    KrowiAF_SavedData.AlertSystem.GrowDirection.RelativePoint = addon.Options.db.profile.EventReminders.PopUps.GrowDirection == 1 and "TOP" or "BOTTOM";
    KrowiAF_SavedData.AlertSystem.GrowDirection.Offset = addon.Options.db.profile.EventReminders.PopUps.GrowDirection == 1 and addon.Options.db.profile.EventReminders.PopUps.Spacing or -addon.Options.db.profile.EventReminders.PopUps.Spacing;
end

function alertSystem:Load()
    helperFrame = CreateFrame("Frame");
    helperFrame.TimeSinceLastUpdate = 0;

    alertSystem = AlertFrame:AddQueuedAlertFrameSubSystem(
        "KrowiAF_AlertFrame_" .. (addon.Options.db.profile.EventReminders.Compact and "Small" or "Normal") .. "_Template",
        SetUp,
        addon.Options.db.profile.EventReminders.PopUps.MaxAlerts,
        100);
    AlertFrame:ClearAllPoints();
    AlertFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", addon.Options.db.profile.EventReminders.PopUps.OffsetX, addon.Options.db.profile.EventReminders.PopUps.OffsetY);

    UpdateGrowDirection();

    -- Credits to ElvUI for this for loop
    -- Overwrites AdjustAnchors functions to allow alerts to grow down if needed.
	for _, alertFrameSubSystem in ipairs(AlertFrame.alertFrameSubSystems) do
		OverwriteAdjustAnchors(alertFrameSubSystem)
	end

    -- Credits to ElvUI for this hook
	-- This should catch any alert systems that are created by other addons.
	hooksecurefunc(AlertFrame, 'AddAlertFrameSubSystem', function(_, alertFrameSubSystem)
		OverwriteAdjustAnchors(alertFrameSubSystem)
	end)

    alertSystem.ShowActiveEventsOnPlayerEnteringWorld = ShowActiveEventsOnPlayerEnteringWorld;
    alertSystem.UpdateGrowDirection = UpdateGrowDirection;
    alertSystem.GetRuntimeText = GetRuntimeText;

    KrowiAF_SavedData.ActiveEvents = KrowiAF_SavedData.ActiveEvents or {};

	addon.GUI.AlertSystem = alertSystem; -- Overwrite with the actual frame since all functions are injected to it
end