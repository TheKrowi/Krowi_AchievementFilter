---@diagnostic disable: invisible
local _, addon = ...

KrowiAF_DataManagerFrameImportMixin = {}

local textFrame
local function Import(input)
	local LibSerialize = LibStub("LibSerialize")
    local LibDeflate = LibStub("LibDeflate")

    local decoded = LibDeflate:DecodeForPrint(input)
    if not decoded then
		return
	end
    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
		return
	end
    local success, data = LibSerialize:Deserialize(decompressed)
    if not success then
		return
	end

    KrowiAF_SavedData.CharacterList[data.Guid] = data.Character
    for _, achievement in next, data.Completed do
        local achievementInfo = addon.GetAchievementInfoTable(achievement.Id)
        local dateTable = date("*t", achievement.Date)
        achievementInfo.DateTime = {
            Year = dateTable.year - 2000,
            Month = dateTable.month,
            Day = dateTable.day
        }
        addon.Data.SavedData.AchievementData.SetEarnedBy(data.Guid, achievementInfo)
    end
    for _, achievement in next, data.NotCompleted do
        local achievementInfo = addon.GetAchievementInfoTable(achievement.Id)
        achievementInfo.WasEarnedByMe = false
        addon.Data.SavedData.AchievementData.SetNotEarnedBy(data.Guid, achievementInfo)
        for criteriaIndex, criteriaValue in next, achievement.Progress do
            addon.Data.SavedData.AchievementData.SetCriteriaProgress(data.Guid, achievementInfo, criteriaIndex, criteriaValue)
        end
    end
	textFrame:Hide()
	if KrowiAF_DataManagerFrame.CharacterList:IsShown() then
		KrowiAF_DataManagerFrame.CharacterList:Refresh()
	end
end

function KrowiAF_DataManagerFrameImportMixin:OnClick()
	textFrame = addon.Gui.DataManager:GetTextFrame(addon.L["Import"], addon.L["Import"], Import)
    textFrame.Input:SetText("")
	textFrame:Show()
end

KrowiAF_DataManagerFrameMixin = {}

-- The second tab, Retail only: the log of what the event schedules' watcher saw and learned (Data/EventObserver.lua;
-- docs/work/2026-10-21-fixed-event-schedules). Read-only and selectable, so it can be copied; shown in debug mode.
local function CreateTabs(self)
	self.Tabs = {}
	for id, text in ipairs({addon.L["Characters"], addon.L["Event Reminders"]}) do
		local tab = CreateFrame("Button", nil, self, "PanelTabButtonTemplate")
		-- The template's OnEnter and OnLeave hide GameTooltip whoever owns it, tainted on a tab of ours: the #300 path. The
		-- tooltip they would show is for a truncated label, which TabResize without a maximum never makes.
		tab:SetScript("OnEnter", nil)
		tab:SetScript("OnLeave", nil)
		tab:SetID(id)
		tab:SetText(text)
		tab:SetScript("OnClick", function(button)
			PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
			self:SelectTab(button:GetID())
		end)
		PanelTemplates_TabResize(tab, 0)
		self.Tabs[id] = tab
	end
	self.Tabs[1]:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 11, 2)
	PanelTemplates_SetNumTabs(self, #self.Tabs)

	local log = LibStub("AceGUI-3.0"):Create("MultiLineEditBox")
	log.frame:SetParent(self)
	log:DisableButton(true)
	log:SetLabel("")
	log.frame:SetPoint("TOPLEFT", self.Inset, "TOPLEFT", 0, 4)
	log.frame:SetPoint("BOTTOMRIGHT", self.Inset, "BOTTOMRIGHT", -3, -5)
	log:SetCallback("OnTextChanged", function(widget) -- typing undone: the log is read-only
		widget:SetText(self.LogText or "")
	end)
	log.frame:Hide()
	self.Log = log
	PanelTemplates_SetTab(self, 1)
end

function KrowiAF_DataManagerFrameMixin:OnLoad()
    addon.Gui:RegisterFrameForClosing(self)

	self.CloseButton:SetScript("OnClick", function(selfFunc)
		selfFunc:GetParent():Hide()
	end)

	if addon.Util.IsClassicWithAchievements then
		self.TitleText:SetText(addon.L["Data Manager"])
	else
    	self:SetTitle(addon.L["Data Manager"])
	end
	self.Import:SetText(addon.L["Import"])

	ButtonFrameTemplate_HidePortrait(self)

	if addon.Util.IsMainline then
		CreateTabs(self)
	end
end

-- 1 the characters, 2 the event schedules' log, read again each time it is shown
function KrowiAF_DataManagerFrameMixin:SelectTab(id)
	PanelTemplates_SetTab(self, id)
	local characters = id == 1
	self.CharacterList:SetShown(characters)
	self.Import:SetShown(characters)
	if characters then
		self.Log.frame:Hide()
		return
	end
	self.LogText = addon.Data.EventObserver.GetLog()
	self.Log:SetText(self.LogText)
	self.Log.frame:Show()
end

function KrowiAF_DataManagerFrameMixin:OnShow()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
	if self.Tabs then -- the log's tab is a debug view: without debug mode the frame shows only the characters
		local debug = addon.Diagnostics.DebugEnabled()
		for _, tab in ipairs(self.Tabs) do
			tab:SetShown(debug)
		end
		self:SelectTab(debug and PanelTemplates_GetSelectedTab(self) or 1)
	end
end

function KrowiAF_DataManagerFrameMixin:OnHide()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE)
end

function KrowiAF_DataManagerFrameMixin:ResetPosition()
    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {}
    KrowiAF_SavedData.RememberLastPosition["DataManager"] = {
        X = 150,
        Y = -80
    }
	addon.Gui:SetFrameToLastPosition(self, "DataManager")
end