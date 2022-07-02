-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;

local ShowActiveCalendarEvents, ShowActiveWorldEvents;
function alertSystem:Load()
    addon.GUI.AlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem(
        addon.Options.db.EventReminders.Compact and "KrowiAF_Small_AlertFrameTemplate" or "KrowiAF_AlertFrameTemplate",
        self.SetUp,
        addon.Options.db.EventReminders.MaxAlerts,
        100);
    addon.GUI.AlertSystem.ShowActiveCalendarEvents = ShowActiveCalendarEvents;
    addon.GUI.AlertSystem.ShowActiveWorldEvents = ShowActiveWorldEvents;
    addon.GUI.AlertSystem.ShowActiveWidgetEvents = ShowActiveWidgetEvents;
end

function ShowActiveCalendarEvents()
    diagnostics.Trace("ShowActiveCalendarEvents");

    if not addon.Options.db.EventReminders.ShowPopUps then
        return;
    end

    local activeEvents = addon.EventData.GetActiveCalendarEvents();

    for _, activeEvent in next, activeEvents do
        addon.GUI.AlertSystem:AddAlert(activeEvent, addon.Options.db.EventReminders.FadeDelay);
    end
end

function ShowActiveWorldEvents()
    diagnostics.Trace("ShowActiveWorldEvents");

    if not addon.Options.db.EventReminders.ShowPopUps then
        return;
    end

    local activeEvents = addon.EventData.GetActiveWorldEvents();

    for _, activeEvent in next, activeEvents do
        addon.GUI.AlertSystem:AddAlert(activeEvent, addon.Options.db.EventReminders.FadeDelay);
    end
end

function ShowActiveWidgetEvents()
    diagnostics.Trace("ShowActiveWidgetEvents");

    if not addon.Options.db.EventReminders.ShowPopUps then
        return;
    end

    local activeEvents = addon.EventData.GetActiveWidgetEvents();

    for _, activeEvent in next, activeEvents do
        addon.GUI.AlertSystem:AddAlert(activeEvent, addon.Options.db.EventReminders.FadeDelay);
    end
end

-- function KrowiAFShowAlert(id)
--     if Kiosk.IsEnabled() then
--         return;
--     end

--     -- if not AchievementFrame then
--     --     AchievementFrame_LoadUI();
--     -- end

--     if id == nil then
--         id = 141;
--     end

--     addon.GUI.AlertSystem:AddAlert(addon.Data.Events[id], addon.Options.db.EventReminders.FadeDelay);
-- end

function alertSystem.SetUp(frame, event, duration)
	frame.Event = event;

	frame.Name:SetText(event.EventDetails.Name);

    gui.UpdateEventRuntime(frame);

	frame.Icon.Texture:SetTexture(event.Icon);

    frame.duration = duration;

    frame.TimeSinceLastUpdate = 0;
    frame:SetScript("OnUpdate", function(self, elapsed)
        self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;

        if self.TimeSinceLastUpdate > 1 then
            gui.UpdateEventRuntime(frame);
            self.TimeSinceLastUpdate = 0;
        end
    end);
end

function KrowiAF_AlertFrame_OnClick(self, button, down)
    if AlertFrame_OnClick(self, button, down) then
		return; -- Handle right-click and close the alert
	end

    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    -- diagnostics.Debug(self.Event.Category);
    KrowiAF_SelectCategory(self.Event.Category);
end