---@diagnostic disable: invisible
local _, addon = ...

KrowiAF_DataManagerFrameImportMixin = {}

local textFrame
local function Import(input)
	if not addon.Gui.DataManager.ImportCharacter(input) then
		return
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

-- The tabs after the first, Retail only: what the features put in the core's slot (Slots.lua, DataManagerTabs), such as
-- the log of what the event schedules' watcher saw and learned (docs/work/2026-10-21-fixed-event-schedules). Read-only
-- and selectable, so it can be copied; shown in debug mode. Without an entry there are no tabs, only the characters.
local function CreateTabs(self)
	local entries = addon.Slots.DataManagerTabs.Entries
	if #entries == 0 then
		return
	end
	self.Tabs = {}
	local names = {addon.L["Characters"]}
	for _, entry in ipairs(entries) do
		names[#names + 1] = entry.Name
	end
	for id, text in ipairs(names) do
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

	self.Log = addon.Gui.DataManager.NewTextBox(self, self.Inset, function(log) -- typing undone: the log is read-only
		log:SetText(self.LogText or "")
	end)
	self.Log:Hide()
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

-- 1 the characters, then each slot entry's text, read again each time it is shown
function KrowiAF_DataManagerFrameMixin:SelectTab(id)
	PanelTemplates_SetTab(self, id)
	local characters = id == 1
	self.CharacterList:SetShown(characters)
	self.Import:SetShown(characters)
	if characters then
		self.Log:Hide()
		return
	end
	self.LogText = addon.Slots.DataManagerTabs.Entries[id - 1].GetText()
	self.Log:SetText(self.LogText)
	self.Log:Show()
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