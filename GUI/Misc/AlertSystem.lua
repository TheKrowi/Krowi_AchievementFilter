-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;
local helperFrame;

local function ShowActiveEvents()
    if not addon.Options.db.EventReminders.ShowPopUps then
        return;
    end

    local activeEvents = addon.EventData:GetActiveEvents(true);
    for _, activeEvent in next, activeEvents do
        alertSystem:AddAlert(activeEvent, addon.Options.db.EventReminders.FadeDelay);
    end
end

local function OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate > 1 then
        self.TimeSinceLastUpdate = 0;
        -- Check if new events are active, if so, prompt the user
    end
end

local function SetUp(frame, event, duration)
	frame.Event = event;
	frame.Name:SetText(event.EventDetails.Name);
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