-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;
local helperFrame;

local function GetRuntimeText(event, chat)
    local runtime, timeLeft;

    if event.EventDetails == nil or event.EventDetails.EndTime == nil then
        if event.MapId then
            event.EventDetails = addon.EventData.GetEventDetails(event);
            if event.EventDetails == nil or event.EventDetails.EndTime == nil then
                return addon.L["No time data available"], "";
            end
        else
            return addon.L["No time data available"], "";
        end
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 2 or addon.Options.db.EventReminders.TimeDisplay.Line2 == 3 or chat then -- Time Left
        local secondsLeft = event.EventDetails.EndTime - time();
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

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 1 then -- End Time
        runtime = tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line1 == 2 then -- Time Left
        runtime = timeLeft;
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.EventReminders.Compact then -- None
        return runtime;
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 2 then -- End Time
        return runtime .. "\n" .. tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        return runtime .. "\n" .. timeLeft;
    end

    return runtime;
end

local printOnce;
local function OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate <= addon.Options.db.EventReminders.RefreshInterval then
        return;
    end

    self.TimeSinceLastUpdate = 0;
    local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
    local showPopUps = addon.Options.db.EventReminders.PopUps.Show.OnEventStart and (not isInInstance or (addon.Options.db.EventReminders.PopUps.Show.OnEventStartInInstances and isInInstance));
    local showChatMessages = addon.Options.db.EventReminders.ChatMessages.Show.OnEventStart and (not isInInstance or (addon.Options.db.EventReminders.ChatMessages.Show.OnEventStartInInstances and isInInstance));

    if not showPopUps and not showChatMessages then
        return;
    end

    local activeEvents = addon.EventData:GetActiveEvents(true);
    for _, event in next, activeEvents do
        if not SavedData.ActiveEvents[event.Id] then
            if showPopUps then
                alertSystem:AddAlert(event, addon.Options.db.EventReminders.PopUps.FadeDelay);
            end
            if showChatMessages then
                if not printOnce then
                    print(addon.MetaData.Title, "-", addon.L["Active events"] .. ":");
                    printOnce = true;
                end
                print("    -", event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"], "(" .. GetRuntimeText(event, true) .. ")");
            end
        end
        SavedData.ActiveEvents[event.Id] = event.EventDetails and event.EventDetails.EndTime or (time() + 3600);
    end
    for i, endTime in next, SavedData.ActiveEvents do
        if endTime < time() then
            SavedData.ActiveEvents[i] = nil;
        end
    end
    printOnce = nil;
end

local function ShowActiveEventsOnLogin()
    local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
    local showPopUps = addon.Options.db.EventReminders.PopUps.Show.OnLogin and (not isInInstance or (addon.Options.db.EventReminders.PopUps.Show.OnLoginInInstances and isInInstance));
    local showChatMessages = addon.Options.db.EventReminders.ChatMessages.Show.OnLogin and (not isInInstance or (addon.Options.db.EventReminders.ChatMessages.Show.OnLoginInInstances and isInInstance));

    if not showPopUps and not showChatMessages then
        return;
    end

    local activeEvents = addon.EventData:GetActiveEvents(true);
    for _, event in next, activeEvents do
        SavedData.ActiveEvents[event.Id] = event.EventDetails and event.EventDetails.EndTime or (time() + 3600);
        if showPopUps then
            alertSystem:AddAlert(event, addon.Options.db.EventReminders.PopUps.FadeDelay);
        end
        if showChatMessages then
            if not printOnce then
                print(addon.MetaData.Title, "-", addon.L["Active events"] .. ":");
                printOnce = true;
            end
            print("    -", event.EventDetails and event.EventDetails.Name or addon.L["Collecting data"], "(" .. GetRuntimeText(event, true) .. ")");
        end
    end
    printOnce = nil;

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
		alertFrame:SetPoint(SavedData.AlertSystem.GrowDirection.Point, relativeAlert, SavedData.AlertSystem.GrowDirection.RelativePoint, 0, SavedData.AlertSystem.GrowDirection.Offset)
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
    SavedData.AlertSystem = SavedData.AlertSystem or {};
    SavedData.AlertSystem.GrowDirection = SavedData.AlertSystem.GrowDirection or {};
    SavedData.AlertSystem.GrowDirection.Point = addon.Options.db.EventReminders.PopUps.GrowDirection == 1 and "BOTTOM" or "TOP";
    SavedData.AlertSystem.GrowDirection.RelativePoint = addon.Options.db.EventReminders.PopUps.GrowDirection == 1 and "TOP" or "BOTTOM";
    SavedData.AlertSystem.GrowDirection.Offset = addon.Options.db.EventReminders.PopUps.GrowDirection == 1 and addon.Options.db.EventReminders.PopUps.Spacing or -addon.Options.db.EventReminders.PopUps.Spacing;
end

function alertSystem:Load()
    helperFrame = CreateFrame("Frame");
    helperFrame.TimeSinceLastUpdate = 0;

    alertSystem = AlertFrame:AddQueuedAlertFrameSubSystem(
        "KrowiAF_AlertFrame_" .. (addon.Options.db.EventReminders.Compact and "Small" or "Normal") .. "_Template",
        SetUp,
        addon.Options.db.EventReminders.PopUps.MaxAlerts,
        100);
    AlertFrame:ClearAllPoints();
    AlertFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", addon.Options.db.EventReminders.PopUps.OffsetX, addon.Options.db.EventReminders.PopUps.OffsetY);

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

    alertSystem.ShowActiveEventsOnLogin = ShowActiveEventsOnLogin;
    alertSystem.UpdateGrowDirection = UpdateGrowDirection;
    alertSystem.GetRuntimeText = GetRuntimeText;

    SavedData.ActiveEvents = SavedData.ActiveEvents or {};

	addon.GUI.AlertSystem = alertSystem; -- Overwrite with the actual frame since all functions are injected to it
end