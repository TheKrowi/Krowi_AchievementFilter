local _, addon = ...
addon.Gui.DataManager = {}
local dataManager = addon.Gui.DataManager

function dataManager:Load()
	local frame = CreateFrame("Frame", "KrowiAF_DataManagerFrame", UIParent, "KrowiAF_DataManagerFrame_Template")
	addon.Gui:SetFrameToLastPosition(frame, "DataManager")
end

function dataManager:GetTextFrame(...)
	local frame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
	frame:Init(...)
	return frame
end

-- [[ The text boxes ]] --
-- The Data Manager's multi-line boxes (the text window's and the log tab's), with the SetText and GetText their callers
-- use. TEMPORARY (docs/work/2026-11-25-leave-acegui, look gate): today's AceGUI box and the two candidates are built side
-- by side and one shows at a time, switched by the text window's Look button; Krowi picks in the client, then the switch
-- and the looks not taken go before the pull request.
local lookOrder = { "ace", "plain", "border" }
dataManager.BoxLookNames = { ace = "AceGUI (today)", plain = "Game's box", border = "Game's box, bordered" }
dataManager.BoxLook = "ace"
local textBoxes = {}

local textBox = {}
textBox.__index = textBox

function textBox:SetText(text)
	self.Current:SetText(text)
end

function textBox:GetText()
	return self.Current:GetText()
end

function textBox:GetEditBox()
	local current = self.Current
	return current.GetEditBox and current:GetEditBox() or current.editBox
end

function textBox:SetShown(shown)
	self.Shown = shown
	for look, container in next, self.Containers do
		container:SetShown(shown and look == self.Look)
	end
end

function textBox:Show()
	self:SetShown(true)
end

function textBox:Hide()
	self:SetShown(false)
end

function textBox:Apply(look)
	local text = self.Current and self.Current:GetText() or ""
	self.Look = look
	self.Current = self.Boxes[look]
	self.Current:SetText(text)
	self:SetShown(self.Shown)
end

-- AceGUI's own look (AceGUIWidget-MultiLineEditBox.lua): black, a grey tooltip border
local borderBackdrop = {
	bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
	insets = { left = 4, right = 3, top = 4, bottom = 3 }
}

-- The game's scrolling text box with its minimal scroll bar, linked as Blizzard links them (MailFrame.lua's MailEditBox)
local function GameBox(holder, parent, bordered)
	local container = CreateFrame("Frame", nil, parent, bordered and "BackdropTemplate" or nil)
	if bordered then
		container:SetBackdrop(borderBackdrop)
		container:SetBackdropColor(0, 0, 0)
		container:SetBackdropBorderColor(0.4, 0.4, 0.4)
	end
	local pad = bordered and 8 or 4
	local box = CreateFrame("Frame", nil, container, "ScrollingEditBoxTemplate")
	box:SetPoint("TOPLEFT", pad, -pad)
	box:SetPoint("BOTTOMRIGHT", -(pad + 14), pad)
	local scrollBar = CreateFrame("EventFrame", nil, container, "MinimalScrollBar")
	scrollBar:SetPoint("TOPLEFT", box, "TOPRIGHT", 6, 0)
	scrollBar:SetPoint("BOTTOMLEFT", box, "BOTTOMRIGHT", 6, 0)
	ScrollUtil.RegisterScrollBoxWithScrollBar(box.ScrollBox, scrollBar)
	if holder.OnUserChange then
		box:RegisterCallback("OnTextChanged", function(_, _, userChanged)
			if userChanged then
				holder.OnUserChange(holder)
			end
		end, holder)
	end
	return container, box
end

-- A box on parent over the inset, onUserChange(box) called when the player types into it
function dataManager.NewTextBox(parent, inset, onUserChange)
	local holder = setmetatable({ Boxes = {}, Containers = {}, Shown = true, OnUserChange = onUserChange }, textBox)

	local ace = LibStub("AceGUI-3.0"):Create("MultiLineEditBox")
	ace.frame:SetParent(parent)
	ace:DisableButton(true)
	ace:SetLabel("")
	if onUserChange then
		ace:SetCallback("OnTextChanged", function()
			onUserChange(holder)
		end)
	end
	holder.Boxes.ace, holder.Containers.ace = ace, ace.frame

	for _, look in ipairs({ "plain", "border" }) do
		holder.Containers[look], holder.Boxes[look] = GameBox(holder, parent, look == "border")
	end

	for _, container in next, holder.Containers do
		container:SetPoint("TOPLEFT", inset, "TOPLEFT", 0, 4)
		container:SetPoint("BOTTOMRIGHT", inset, "BOTTOMRIGHT", -3, -5)
	end
	holder:Apply(dataManager.BoxLook)
	tinsert(textBoxes, holder)
	return holder
end

function dataManager.SetBoxLook(look)
	dataManager.BoxLook = look
	for _, holder in ipairs(textBoxes) do
		holder:Apply(look)
	end
end

function dataManager.NextBoxLook()
	for i, look in ipairs(lookOrder) do
		if look == dataManager.BoxLook then
			dataManager.SetBoxLook(lookOrder[i % #lookOrder + 1])
			return
		end
	end
end
-- TEMPORARY, the look gate's screenshots: /run KrowiAF.DebugBoxLook("plain", "text") or ("border", "log")
KrowiAF.DebugBoxLook = function(look, what)
	dataManager.SetBoxLook(look)
	if what == "log" then
		if KrowiAF_TextFrame then
			KrowiAF_TextFrame:Hide()
		end
		if not KrowiAF_DataManagerFrame and not AchievementFrame then
			AchievementFrame_LoadUI()
		end
		KrowiAF_DataManagerFrame:Show()
		KrowiAF_DataManagerFrame:SelectTab(2)
	elseif what == "text" then
		if KrowiAF_DataManagerFrame then
			KrowiAF_DataManagerFrame:Hide()
		end
		local frame = dataManager:GetTextFrame("Export (look test)")
		frame.Input:SetText(dataManager.EncodeCharacter(dataManager.GatherCharacter(UnitGUID("player"))))
		frame:Show()
	end
end

-- A character's export and import, shared by the Data Manager's buttons and the datamanager suite (Tests/DataManager.lua),
-- so the suite checks the text a player gets and pastes (docs/work/2026-11-25-leave-acegui)

-- What an export of a saved character holds: its list entry, the achievements it earned with their dates and the progress
-- of those it has not
function dataManager.GatherCharacter(guid)
	local completed = {}
	for achievementId, achievement in next, KrowiAF_Achievements.Completed do
		if achievement.EarnedBy and achievement.EarnedBy[guid] then
			tinsert(completed, {
				Id = achievementId,
				Date = achievement.EarnedBy[guid]
			})
		end
	end

	local notCompleted = {}
	for achievementId, achievement in next, KrowiAF_Achievements.NotCompleted do
		if achievement[guid] then
			tinsert(notCompleted, {
				Id = achievementId,
				Progress = achievement[guid]
			})
		end
	end

	return {
		Guid = guid,
		Character = KrowiAF_SavedData.CharacterList[guid],
		Completed = completed,
		NotCompleted = notCompleted
	}
end

-- The text of an export: serialized, compressed and made printable
function dataManager.EncodeCharacter(data)
	local LibSerialize = LibStub("LibSerialize")
	local LibDeflate = LibStub("LibDeflate")
	local serialized = LibSerialize:Serialize(data)
	local compressed = LibDeflate:CompressDeflate(serialized)
	return LibDeflate:EncodeForPrint(compressed)
end

-- An export's text read back into the saved data: true when it was one, false when it could not be read
function dataManager.ImportCharacter(text)
	local LibSerialize = LibStub("LibSerialize")
	local LibDeflate = LibStub("LibDeflate")

	local decoded = LibDeflate:DecodeForPrint(text)
	if not decoded then
		return false
	end
	local decompressed = LibDeflate:DecompressDeflate(decoded)
	if not decompressed then
		return false
	end
	local success, data = LibSerialize:Deserialize(decompressed)
	if not success then
		return false
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
	return true
end