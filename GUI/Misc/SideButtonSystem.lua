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

function sideButtonSystem.Refresh()
    -- Empty placeholder function for optimal code execution
    -- This way we don;t have to check each refresh if the block is initialized saving us a check each time
end

function sideButtonSystem.Load()
    helperFrame = CreateFrame("Frame", nil, AchievementFrame);
    helperFrame.TimeSinceLastUpdate = 0;
    helperFrame:SetScript("OnUpdate", function(self, elapsed)
        self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
        if self.TimeSinceLastUpdate > 1 then
            print("Update sideButtons");
            self.TimeSinceLastUpdate = 0;
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