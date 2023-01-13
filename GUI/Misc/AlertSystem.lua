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
        if not addon.Options.db.EventReminders.PopUps.Show.OnEventStart or (not addon.Options.db.EventReminders.PopUps.Show.OnEventStartInInstances and isInInstance) then
            return;
        end

        for _, event in next, activeEvents do
            if not SavedData.ActiveEvents[event.Id] then
                alertSystem:AddAlert(event, addon.Options.db.EventReminders.PopUps.FadeDelay);
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
    if not addon.Options.db.EventReminders.PopUps.Show.OnLogin or (not addon.Options.db.EventReminders.PopUps.Show.OnLoginInInstances and isInInstance) then
        return;
    end

    local activeEvents = addon.EventData:GetActiveEvents();
    for _, event in next, activeEvents do
        SavedData.ActiveEvents[event.Id] = event.EventDetails and event.EventDetails.EndTime or (time() + 3600);
        alertSystem:AddAlert(event, addon.Options.db.EventReminders.PopUps.FadeDelay);
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
		alertFrame:SetPoint(SavedData.AlertSystem.GrowDirection.Point, relativeAlert, SavedData.AlertSystem.GrowDirection.RelativePoint, 0, SavedData.AlertSystem.GrowDirection.Offset)
		relativeAlert = alertFrame
	end
	return relativeAlert
end

local function AdjustAnchors(self, relativeAlert)
	if self.alertFrame:IsShown() then
		self.alertFrame:ClearAllPoints()
		self.alertFrame:SetPoint(SavedData.AlertSystem.GrowDirection.Point, relativeAlert, SavedData.AlertSystem.GrowDirection.RelativePoint, 0, SavedData.AlertSystem.GrowDirection.Offset)
		return self.alertFrame
	end
	return relativeAlert
end

local function AdjustAnchorsNonAlert(self, relativeAlert)
	if self.anchorFrame:IsShown() then
		self.anchorFrame:ClearAllPoints()
		self.anchorFrame:SetPoint(SavedData.AlertSystem.GrowDirection.Point, relativeAlert, SavedData.AlertSystem.GrowDirection.RelativePoint, 0, SavedData.AlertSystem.GrowDirection.Offset)
		return self.anchorFrame
	end
	return relativeAlert
end

-- Credits to ElvUI
local function OverwriteAdjustAnchors(alertFrameSubSystem)
	if alertFrameSubSystem.alertFramePool then -- Queued alert system
		alertFrameSubSystem.AdjustAnchors = AdjustQueuedAnchors
	elseif not alertFrameSubSystem.anchorFrame then -- Simple alert system
		alertFrameSubSystem.AdjustAnchors = AdjustAnchors
	elseif alertFrameSubSystem.anchorFrame then -- Anchor frame system
		alertFrameSubSystem.AdjustAnchors = AdjustAnchorsNonAlert
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

    alertSystem.ShowActiveEvents = ShowActiveEvents;
    alertSystem.UpdateGrowDirection = UpdateGrowDirection;

    SavedData.ActiveEvents = SavedData.ActiveEvents or {};

	addon.GUI.AlertSystem = alertSystem; -- Overwrite with the actual frame since all functions are injected to it
end