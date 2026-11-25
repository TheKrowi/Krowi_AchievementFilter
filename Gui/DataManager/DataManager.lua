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
-- The Data Manager's multi-line boxes, the text window's and the log tab's: the game's scrolling text box and its minimal
-- scroll bar, linked as Blizzard links them (MailFrame.lua's MailEditBox), inside AceGUI's black backdrop and grey border,
-- which replaced AceGUI's MultiLineEditBox (docs/work/2026-11-25-leave-acegui; Krowi chose the border, without which the
-- text ran to the window's inset). The frame answers SetText and GetText, as the AceGUI widget did, and GetEditBox.
local backdrop = {
	bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
	insets = { left = 4, right = 3, top = 4, bottom = 3 }
}

local textBox = {}

function textBox:SetText(text)
	self.Box:SetText(text)
end

function textBox:GetText()
	return self.Box:GetText()
end

function textBox:GetEditBox()
	return self.Box:GetEditBox()
end

-- A box on parent over the inset; onTextChanged(frame), when given, runs on every change of its text. Not only on typing:
-- the template's Enter adds a line through Insert, which reports itself as not typed (code review, 2026-11-25)
function dataManager.NewTextBox(parent, inset, onTextChanged)
	local frame = Mixin(CreateFrame("Frame", nil, parent, "BackdropTemplate"), textBox)
	frame:SetBackdrop(backdrop)
	frame:SetBackdropColor(0, 0, 0)
	frame:SetBackdropBorderColor(0.4, 0.4, 0.4)
	frame:SetPoint("TOPLEFT", inset, "TOPLEFT", 0, 4)
	frame:SetPoint("BOTTOMRIGHT", inset, "BOTTOMRIGHT", -3, -5)

	local box = CreateFrame("Frame", nil, frame, "ScrollingEditBoxTemplate")
	box:SetPoint("TOPLEFT", 8, -8)
	box:SetPoint("BOTTOMRIGHT", -22, 8)
	local scrollBar = CreateFrame("EventFrame", nil, frame, "MinimalScrollBar")
	scrollBar:SetPoint("TOPLEFT", box, "TOPRIGHT", 6, 0)
	scrollBar:SetPoint("BOTTOMLEFT", box, "BOTTOMRIGHT", 6, 0)
	ScrollUtil.RegisterScrollBoxWithScrollBar(box.ScrollBox, scrollBar)
	frame.Box, frame.ScrollBar = box, scrollBar

	if onTextChanged then
		box:RegisterCallback("OnTextChanged", function()
			onTextChanged(frame)
		end, frame)
	end
	return frame
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