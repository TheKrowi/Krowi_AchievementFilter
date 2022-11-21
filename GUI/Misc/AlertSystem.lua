-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;

alertSystem.__index = alertSystem; -- Used to inject all the namespace functions to the frame
function alertSystem:Load()
    local system = AlertFrame:AddQueuedAlertFrameSubSystem(
        "KrowiAF_AlertFrame_" .. (addon.Options.db.EventReminders.Compact and "Small" or "Normal") .. "_Template",
        self.SetUp,
        addon.Options.db.EventReminders.MaxAlerts,
        100);
    addon.Util.InjectMetatable(system, alertSystem); -- Inject all the namespace functions to the frame

	addon.GUI.AlertSystem = system; -- Overwrite with the actual frame since all functions are injected to it
end

function alertSystem.SetUp(frame, event, duration)
	frame.Event = event;
	frame.Name:SetText(event.EventDetails.Name);
    frame:UpdateEventRuntime();
	frame.Icon.Texture:SetTexture(event.Icon);
    frame.duration = duration;
    frame.TimeSinceLastUpdate = 0;
end

local function ShowActiveEvents(getActiveEvents)
    if not addon.Options.db.EventReminders.ShowPopUps then
        return;
    end

    local activeEvents = getActiveEvents(true);

    for _, activeEvent in next, activeEvents do
        addon.GUI.AlertSystem:AddAlert(activeEvent, addon.Options.db.EventReminders.FadeDelay);
    end
end

function alertSystem.ShowActiveCalendarEvents()
    ShowActiveEvents(addon.EventData.GetActiveCalendarEvents);
end

function alertSystem.ShowActiveWorldEvents()
    ShowActiveEvents(addon.EventData.GetActiveWorldEvents);
end