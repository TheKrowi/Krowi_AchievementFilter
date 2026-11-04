local _, addon = ...
addon.Gui.EventReminderSideButtonSystem = {}
local eventReminderSideButtonSystem = addon.Gui.EventReminderSideButtonSystem

function eventReminderSideButtonSystem:GetAnchor()
    if addon.Options.db.profile.EventReminders.SideButtonsAnchor == 1 then
        return AchievementFrame
    elseif addon.Options.db.profile.EventReminders.SideButtonsAnchor == 2 then
        return WorldMapFrame
    end
end

local sideButtons = {}
local function GetNewSideButton(index)
    local template = "KrowiAF_EventReminderSideButton_" .. (addon.Options.db.profile.EventReminders.Compact and "Small" or "Normal") .. "_Template"
    local sideButton = CreateFrame("Button", "KrowiAF_AchievementFrameSideButton" .. index, nil, template)
    sideButton:Reset()
    return sideButton
end

local function GetSideButton(index)
    if sideButtons[index] then
		return sideButtons[index]
	end
	local sideButton = GetNewSideButton(index)
	sideButtons[index] = sideButton
	return sideButton
end

local function ResetButtons()
    for _, button in next, sideButtons do
		button:Reset()
	end
end

local function AddEvent(index, event)
    local button = GetSideButton(index)
    button:SetEvent(event)
    button:Show()
end

local function HideButtonsWithoutEvent()
    for _, button in next, sideButtons do
		if not button.Event then
            button:Hide()
        end
	end
end

local function HideButtons()
    for _, button in next, sideButtons do
        button:Hide()
    end
end

local function SetPoints(self)
    local relativeFrame = self:GetAnchor()
    local relativePoint = "TOPRIGHT"
    for _, button in next, sideButtons do
        if button:IsShown() then
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", relativeFrame, relativePoint, 0, 0)
            relativeFrame = button
            relativePoint = "BOTTOMLEFT"
        end
    end
end

function eventReminderSideButtonSystem:Refresh(activeEvents, upcomingCalendarEvents)
    local anchor = self:GetAnchor()
    if not anchor or not anchor:IsShown() then
        return
    end

    ResetButtons()
    activeEvents = activeEvents or addon.EventData.GetActiveEvents() -- Alert system does the refreshing
    for index, activeEvent in next, activeEvents do
        AddEvent(index, activeEvent)
    end
    if addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Enabled then
        upcomingCalendarEvents = upcomingCalendarEvents or addon.EventData.GetUpcomingCalendarEvents() -- Alert system does the refreshing
        for index, upcomgingCalendarEvent in next, upcomingCalendarEvents do
            AddEvent(#activeEvents + index, upcomgingCalendarEvent)
        end
    end
    HideButtonsWithoutEvent()
    SetPoints(self)
end

local function OnAlertSystemRefresh(_, activeEvents, upcomingCalendarEvents)
    eventReminderSideButtonSystem:Refresh(activeEvents, upcomingCalendarEvents)
end

-- Each anchor window is hooked once per session; its hooks act only while it is the anchor, so a window the buttons left
-- neither refreshes them nor stops their countdown
local hookedAnchors = {}
local function HookAnchor(self, anchor)
    if hookedAnchors[anchor] then
        return
    end
    hookedAnchors[anchor] = true
    hooksecurefunc(anchor, "Show", function()
        if anchor ~= self:GetAnchor() then
            return
        end
        addon.Gui.EventReminderAlertSystem:RegisterOnRefresh("SideButtonSystem", OnAlertSystemRefresh)
        self:Refresh()
    end)
    hooksecurefunc(anchor, "Hide", function()
        if anchor ~= self:GetAnchor() then
            return
        end
        addon.Gui.EventReminderAlertSystem:UnregisterOnRefresh("SideButtonSystem")
    end)
end

-- Hooks the anchor; Loaded is false while event reminders are off or the anchor window does not exist yet, so
-- LoadWithBlizzard_AchievementUI loads the buttons onto the achievement window once it does
local function Attach(self)
    local anchor = addon.Options.db.profile.EventReminders.Enabled and self:GetAnchor()
    self.Loaded = anchor and true or false
    if anchor then
        HookAnchor(self, anchor)
    end
    return anchor
end

function eventReminderSideButtonSystem:Load()
    return Attach(self) and true or false
end

-- After an anchor or profile change; it never calls Load, whose hooks the skin plugins add to on every call
function eventReminderSideButtonSystem:Reload()
    HideButtons() -- Before Reset moves them: a button shown without an event errors in its OnShow
    ResetButtons()
    addon.Gui.EventReminderAlertSystem:UnregisterOnRefresh("SideButtonSystem")
    local anchor = Attach(self)
    if anchor and anchor:IsShown() then
        addon.Gui.EventReminderAlertSystem:RegisterOnRefresh("SideButtonSystem", OnAlertSystemRefresh)
        self:Refresh()
    end
end