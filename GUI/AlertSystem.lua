-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AlertSystem = {};
local alertSystem = gui.AlertSystem;

alertSystem.__index = alertSystem; -- Used to inject all the namespace functions to the frame
function alertSystem:Load()
    local system = AlertFrame:AddQueuedAlertFrameSubSystem(
        addon.Options.db.EventReminders.Compact and "KrowiAF_EventAlertFrame_Small_Template" or "KrowiAF_EventAlertFrame_Template",
        self.SetUp,
        addon.Options.db.EventReminders.MaxAlerts,
        100);
    addon.Util.InjectMetatable(system, alertSystem); -- Inject all the namespace functions to the frame

	addon.GUI.AlertSystem = system; -- Overwrite with the actual frame since all functions are injected to it
end

local function UpdateEventRuntime(self)
    local line1, line2, timeLeft;

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 3 or addon.Options.db.EventReminders.TimeDisplay.Line2 == 4 then -- Time Left
        local secondsLeft = self.Event.EventDetails.EndTime - time();
        local days = floor(secondsLeft / 86400);
        local hours = floor(mod(secondsLeft, 86400) / 3600);
        local minutes = floor(mod(secondsLeft, 3600) / 60);
        local seconds = floor(mod(secondsLeft, 60));
        timeLeft = days > 0 and days .. " Days" or "";
        timeLeft = timeLeft .. (days > 0 and " " or "") .. (hours > 0 and hours .. " Hr" or "");
        timeLeft = timeLeft .. (hours > 0 and " " or "") .. (minutes > 0 and minutes .. " Min" or "");
        timeLeft = timeLeft .. (minutes > 0 and " " or "") .. (seconds > 0 and seconds .. " Sec" or "");
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 1 then -- Start Time
        line1 = tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.StartTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line1 == 2 then -- End Time
        line1 = tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line1 == 3 then -- Time Left
        line1 = timeLeft;
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.EventReminders.Compact then -- None
        line2 = "";
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 2 then -- Start Time
        line2 = "\n" .. tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.StartTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 3 then -- End Time
        line2 = "\n" .. tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 4 then -- Time Left
        line2 = "\n" .. timeLeft;
    end

    self.Unlocked:SetText(line1 .. line2);
end

function KrowiAF_EventAlertFrame_OnLoad(self)
    self.UpdateEventRuntime = UpdateEventRuntime;
end

function KrowiAF_EventAlertFrame_OnClick(self, button, down)
    if AlertFrame_OnClick(self, button, down) then
		return; -- Handle right-click and close the alert
	end

    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    local category = KrowiAF_SelectCategory(self.Event.Category);
    if category.NumOfAch == 0 then
        addon.GUI.AchievementsFrame.Text:Show();
        addon.GUI.AchievementsFrame.Text:SetText(addon.Util.ReplaceVars
        {
            addon.L["Shown temporarily"],
            eventName = self.Event.EventDetails.Name;
        });
    end
end

function KrowiAF_EventAlertFrame_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate > 1 then
        self:UpdateEventRuntime();
        self.TimeSinceLastUpdate = 0;
    end
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

    local activeEvents = getActiveEvents();

    for _, activeEvent in next, activeEvents do
        addon.GUI.AlertSystem:AddAlert(activeEvent, addon.Options.db.EventReminders.FadeDelay);
    end
end

function alertSystem.ShowActiveCalendarEvents()
    ShowActiveEvents(addon.EventData.GetActiveCalendarEvents);
end

function alertSystem.ShowActiveWidgetEvents()
    ShowActiveEvents(addon.EventData.GetActiveWidgetEvents);
end

function alertSystem.ShowActiveWorldEvents()
    ShowActiveEvents(addon.EventData.GetActiveWorldEvents);
end