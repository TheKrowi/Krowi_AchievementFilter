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