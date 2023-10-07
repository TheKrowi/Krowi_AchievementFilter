-- [[ Namespaces ]] --
local addonName, addon = ...;
local gui = addon.GUI;
gui.SideButtonSystem = {};
local sideButtonSystem = gui.SideButtonSystem;
local helperFrame;
local buttons = {};
local numButtons = 0;

local function GetAnchor()
    return addon.Options.db.profile.EventReminders.SideButtonsAnchor == 1 and AchievementFrame or WorldMapFrame;
end

local function GetSideButton(index)
    if buttons[index] then
		return buttons[index];
	end
	local button = gui.SideButton:New(index);
	buttons[index] = button;
	return button;
end

local function SetPoints()
    local relativeFrame = GetAnchor();
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
    local activeEvents = addon.EventData.GetActiveEvents(); -- Alert system does the refreshing
    for _, activeEvent in next, activeEvents do
        AddEvent(activeEvent);
    end
    SetPoints();
end

function sideButtonSystem.Refresh()
    -- Empty placeholder function for optimal code execution
    -- This way we don't have to check each refresh if the block is initialized saving us a check each time
end

local refreshIfShown = false;
local function OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate > addon.Options.db.profile.EventReminders.RefreshInterval then
        refreshIfShown = true;
        if GetAnchor():IsShown() then
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
    hooksecurefunc(GetAnchor(), "Show", function(self)
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