-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;
local helperFrame;

local function OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate > addon.Options.db.EventReminders.RefreshInterval then
        self.TimeSinceLastUpdate = 0;
        local activeEvents = addon.EventData:GetActiveEvents(true); -- This does the refresh of the event data and should be the only location
        local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
        if not addon.Options.db.EventReminders.ShowPopUps.OnEventStart or (not addon.Options.db.EventReminders.ShowPopUps.OnEventStartInInstances and isInInstance) then
            return;
        end

        for _, event in next, activeEvents do
            if not SavedData.ActiveEvents[event.Id] then
                alertSystem:AddAlert(event, addon.Options.db.EventReminders.FadeDelay);
            end
            SavedData.ActiveEvents[event.Id] = event.EventDetails and event.EventDetails.EndTime or (time() + 3600);
        end
        for i, endTime in next, SavedData.ActiveEvents do
            if endTime < time() then
                SavedData.ActiveEvents[i] = nil;
            end
        end
    end
end

local function ShowActiveEvents()
    local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
    if not addon.Options.db.EventReminders.ShowPopUps.OnLogin or (not addon.Options.db.EventReminders.ShowPopUps.OnLoginInInstances and isInInstance) then
        return;
    end

    local activeEvents = addon.EventData:GetActiveEvents();
    for _, event in next, activeEvents do
        SavedData.ActiveEvents[event.Id] = event.EventDetails and event.EventDetails.EndTime or (time() + 3600);
        alertSystem:AddAlert(event, addon.Options.db.EventReminders.FadeDelay);
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

function alertSystem:Load()
    helperFrame = CreateFrame("Frame");
    helperFrame.TimeSinceLastUpdate = 0;

    alertSystem = AlertFrame:AddQueuedAlertFrameSubSystem(
        "KrowiAF_AlertFrame_" .. (addon.Options.db.EventReminders.Compact and "Small" or "Normal") .. "_Template",
        SetUp,
        addon.Options.db.EventReminders.MaxAlerts,
        100);

    alertSystem.ShowActiveEvents = ShowActiveEvents;

    SavedData.ActiveEvents = SavedData.ActiveEvents or {};

	addon.GUI.AlertSystem = alertSystem; -- Overwrite with the actual frame since all functions are injected to it
end