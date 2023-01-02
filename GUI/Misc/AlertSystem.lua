-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;
local helperFrame;

local function ShowActiveEvents()
    local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
    if not addon.Options.db.EventReminders.ShowPopUps.OnLogin or (not addon.Options.db.EventReminders.ShowPopUps.OnLoginInInstances and isInInstance) then
        return;
    end

    local activeEvents = addon.EventData:GetActiveEvents();
    for _, activeEvent in next, activeEvents do
        alertSystem:AddAlert(activeEvent, addon.Options.db.EventReminders.FadeDelay);
    end
end

local prevActiveEvents;
local function OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate > addon.Options.db.EventReminders.RefreshInterval then
        self.TimeSinceLastUpdate = 0;
        local currActiveEvents = addon.EventData:GetActiveEvents(true); -- This does the refresh of the event data and should be the only location
        local isInInstance = (select(3, GetInstanceInfo())) ~= 0;
        if not addon.Options.db.EventReminders.ShowPopUps.OnEventStart or (not addon.Options.db.EventReminders.ShowPopUps.OnEventStartInInstances and isInInstance) then
            return;
        end

        prevActiveEvents = prevActiveEvents or currActiveEvents;
        local matchFound;
        for _, currActiveEvent in next, currActiveEvents do
            matchFound = false;
            for _, prevActiveEvent in next, prevActiveEvents do
                if currActiveEvent.Id == prevActiveEvent.Id then
                    matchFound = true;
                end
            end
            if not matchFound then
                addon.Diagnostics.Print("New event, show pop up", currActiveEvent.Id, currActiveEvent.EventDetails.Name);
                alertSystem:AddAlert(currActiveEvent, addon.Options.db.EventReminders.FadeDelay);
            end
        end
        prevActiveEvents = currActiveEvents;
    end
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
    helperFrame:SetScript("OnUpdate", OnUpdate);

    alertSystem = AlertFrame:AddQueuedAlertFrameSubSystem(
        "KrowiAF_AlertFrame_" .. (addon.Options.db.EventReminders.Compact and "Small" or "Normal") .. "_Template",
        SetUp,
        addon.Options.db.EventReminders.MaxAlerts,
        100);

    alertSystem.ShowActiveEvents = ShowActiveEvents;

	addon.GUI.AlertSystem = alertSystem; -- Overwrite with the actual frame since all functions are injected to it
end