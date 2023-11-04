local _, addon = ...;
addon.Gui.EventReminderSideButtonSystem = {};
local eventReminderSideButtonSystem = addon.Gui.EventReminderSideButtonSystem;

function eventReminderSideButtonSystem:GetAnchor()
    if addon.Options.db.profile.EventReminders.SideButtonsAnchor == 1 then
        return AchievementFrame;
    elseif addon.Options.db.profile.EventReminders.SideButtonsAnchor == 2 then
        return WorldMapFrame;
    end
end

local sideButtons = {};
local function GetNewSideButton(index)
    local template = "KrowiAF_EventReminderSideButton_" .. (addon.Options.db.profile.EventReminders.Compact and "Small" or "Normal") .. "_Template";
    local sideButton = CreateFrame("Button", "KrowiAF_AchievementFrameSideButton" .. index, nil, template);
    sideButton:Reset();
    return sideButton;
end

local function GetSideButton(index)
    if sideButtons[index] then
		return sideButtons[index];
	end
	local sideButton = GetNewSideButton(index);
	sideButtons[index] = sideButton;
	return sideButton;
end

local function ResetButtons()
    for _, button in next, sideButtons do
		button:Reset();
	end
end

local function AddEvent(index, event)
    local button = GetSideButton(index);
    button:SetEvent(event);
    button:Show();
end

local function HideButtonsWithoutEvent()
    for _, button in next, sideButtons do
		if not button.Event then
            button:Hide();
        end
	end
end

local function SetPoints(self)
    local relativeFrame = self:GetAnchor();
    local relativePoint = "TOPRIGHT";
    for _, button in next, sideButtons do
        if button:IsShown() then
            button:ClearAllPoints();
            button:SetPoint("TOPLEFT", relativeFrame, relativePoint, 0, 0);
            relativeFrame = button;
            relativePoint = "BOTTOMLEFT";
        end
    end
end

local timer = LibStub("AceTimer-3.0");
function eventReminderSideButtonSystem:Refresh()
    if not self:GetAnchor() or not self:GetAnchor():IsShown() then
        return;
    end
    timer:ScheduleTimer(self.Refresh, addon.Options.db.profile.EventReminders.RefreshInterval, self);

    ResetButtons();
    local activeEvents = addon.EventData.GetActiveEvents(); -- Alert system does the refreshing
    for index, activeEvent in next, activeEvents do
        AddEvent(index, activeEvent);
    end
    HideButtonsWithoutEvent();
    SetPoints(self);
end

function eventReminderSideButtonSystem:Load()
    if not self:GetAnchor() then
        return false; -- Anchoring failed because frame does not exist yet, try again later
    end
    hooksecurefunc(self:GetAnchor(), "Show", function()
        self:Refresh();
    end);
    return true;
end

function eventReminderSideButtonSystem:Reload()
    self:Load();
    ResetButtons();
end