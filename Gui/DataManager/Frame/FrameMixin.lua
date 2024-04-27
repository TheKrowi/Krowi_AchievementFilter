local _, addon = ...;

KrowiAF_DataManagerFrameImportMixin = {};

local textFrame;
local function Import(input)
	local LibSerialize = LibStub("LibSerialize");
    local LibDeflate = LibStub("LibDeflate");

    local decoded = LibDeflate:DecodeForPrint(input);
    if not decoded then
		return;
	end
    local decompressed = LibDeflate:DecompressDeflate(decoded);
    if not decompressed then
		return;
	end
    local success, data = LibSerialize:Deserialize(decompressed);
    if not success then
		return;
	end

    KrowiAF_SavedData.CharacterList[data.Guid] = data.Character;
    for _, achievement in next, data.Completed do
        local achievementInfo = addon.GetAchievementInfoTable(achievement.Id);
        local dateTable = date("*t", achievement.Date);
        achievementInfo.DateTime = {
            Year = dateTable.year - 2000,
            Month = dateTable.month,
            Day = dateTable.day
        };
        addon.Data.SavedData.AchievementData.SetEarnedBy(data.Guid, achievementInfo);
    end
    for _, achievement in next, data.NotCompleted do
        local achievementInfo = addon.GetAchievementInfoTable(achievement.Id);
        achievementInfo.WasEarnedByMe = false;
        addon.Data.SavedData.AchievementData.SetNotEarnedBy(data.Guid, achievementInfo);
        for criteriaIndex, criteriaValue in next, achievement.Progress do
            addon.Data.SavedData.AchievementData.SetCriteriaProgress(data.Guid, achievementInfo, criteriaIndex, criteriaValue);
        end
    end
	textFrame:Hide();
	if KrowiAF_DataManagerFrame.CharacterList:IsShown() then
		KrowiAF_DataManagerFrame.CharacterList:Refresh();
	end
end

function KrowiAF_DataManagerFrameImportMixin:OnClick()
	textFrame = addon.Gui.DataManager:GetTextFrame(addon.L["Import"], addon.L["Import"], Import);
    textFrame.Input:SetText("");
	textFrame:Show();
end

KrowiAF_DataManagerFrameMixin = {};

function KrowiAF_DataManagerFrameMixin:OnLoad()
	self.CloseButton:SetScript("OnClick", function(selfFunc)
		selfFunc:GetParent():Hide();
	end);
	addon.Gui:RegisterSafeCloseButtonDuringCombat(self.CloseButton);
	self.CloseButton:SetScript("OnKeyDown", addon.Gui.HandleCloseButtonOnKeyDown);

	if addon.Util.IsClassicWithAchievements then
		self.TitleText:SetText(addon.L["Data Manager"]);
	else
    	self:SetTitle(addon.L["Data Manager"]);
	end
	self.Import:SetText(addon.L["Import"]);

	ButtonFrameTemplate_HidePortrait(self);
end

function KrowiAF_DataManagerFrameMixin:OnShow()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN);
end

function KrowiAF_DataManagerFrameMixin:OnHide()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE);
end

function KrowiAF_DataManagerFrameMixin:ResetPosition()
    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
    KrowiAF_SavedData.RememberLastPosition["DataManager"] = {
        X = 150,
        Y = -80
    };
	addon.Gui:SetFrameToLastPosition(self, "DataManager");
end