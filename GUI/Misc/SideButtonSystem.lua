-- [[ Namespaces ]] --
local addonName, addon = ...;
local gui = addon.GUI;
gui.SideButtonSystem = {};
local sideButtonSystem = gui.SideButtonSystem;
local helperFrame;
local buttons = {};
local numButtons = 0;

local function GetSideButton(index)
    if buttons[index] then
		return buttons[index];
	end
	local button = gui.SideButton:New(index);
	buttons[index] = button;
	return button;
end

local function SetPoints()
    local relativeFrame = AchievementFrame;
    local relativePoint = "TOPRIGHT";
    for _, button in next, buttons do
        button:ClearAllPoints();
        button:SetPoint("TOPLEFT", relativeFrame, relativePoint, 0, 0);
        relativeFrame = button;
        relativePoint = "BOTTOMLEFT";
    end
end

local function AddEvent(event)
    numButtons = numButtons + 1;
    -- print(numButtons, event.Id, event.Name)
    local button = GetSideButton(numButtons);
    button:SetEvent(event);
end

local function ResetButtons()
    numButtons = 0;
    for _, button in next, buttons do
		button:Reset();
	end
end

local function Refresh()
    ResetButtons();
    local activeCalendarEvents = addon.EventData.GetActiveCalendarEvents();

    for _, activeEvent in next, activeCalendarEvents do
        AddEvent(activeEvent);
    end

    local activeWorldEvents = addon.EventData.GetActiveWorldEvents();

    for _, activeEvent in next, activeWorldEvents do
        AddEvent(activeEvent);
    end

    SetPoints();
end

-- local function CheckElapsed(button)
--     local event = button.Event;
--     if not event then -- Button is there but not visible
--         return;
--     end

--     local eventElapsed;
--     if event.EventDetails.EndTime then
--         return event.EventDetails.EndTime - time() < 0;
--     end
--     if event.MapID then -- Handle the world events different, elapsed if not visible on the map as a fallback
--         local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(event.MapID, event.Id);
--         return poiInfo == nil;
--     end
--     return eventElapsed;
-- end

-- local function CheckElapsedButtons()
--     for _, button in next, buttons do
--         if CheckElapsed(button) then
--             sideButtonSystem.Refresh();
--             return;
--         end
--     end
-- end

function sideButtonSystem.Refresh()
    -- Empty placeholder function for optimal code execution
    -- This way we don;t have to check each refresh if the block is initialized saving us a check each time
end

local refreshIfShown = false;
local function OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    -- print(self.TimeSinceLastUpdate)
    if self.TimeSinceLastUpdate > 5 then
        refreshIfShown = true;
        if AchievementFrame:IsShown() then
            sideButtonSystem.Refresh();
            refreshIfShown = false;
            self.TimeSinceLastUpdate = 0;
        else
            self:SetScript("OnUpdate", nil);
        end
    end
end

function sideButtonSystem.Load()
    helperFrame = CreateFrame("Frame");
    helperFrame.TimeSinceLastUpdate = 0;
    helperFrame:SetScript("OnUpdate", OnUpdate);
    hooksecurefunc(AchievementFrame, "Show", function(self)
        if refreshIfShown then
            sideButtonSystem.Refresh();
            refreshIfShown = false;
            self.TimeSinceLastUpdate = 0;
            helperFrame:SetScript("OnUpdate", OnUpdate);
        end
    end);
    sideButtonSystem.Refresh = Refresh;
    sideButtonSystem.Refresh();
end

function KAF_RefreshSideButtonSystem()
    sideButtonSystem.Refresh();
end

-- Need to add a system to refresh either every 5 minutes or every time an event elapses, how to check this elapse?
-- Calendar event check end time and current time?
-- World event?
-- Can we check remaining time reaching 0?