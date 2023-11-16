local _, addon = ...;

local function PlayCheckButtonSoundOnClick(self)
    PlaySound(self:GetChecked() and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
end

KrowiAF_CharacterListEntryHeaderTooltipMixin = {};

function KrowiAF_CharacterListEntryHeaderTooltipMixin:OnClick()
    PlayCheckButtonSoundOnClick(self);
    self:GetParent():ToggleHeaderTooltip();
end

KrowiAF_CharacterListEntryEarnedByAchievementTooltipMixin = {};

function KrowiAF_CharacterListEntryEarnedByAchievementTooltipMixin:OnClick()
    PlayCheckButtonSoundOnClick(self);
    self:GetParent():ToggleEarnedByAchievementTooltip();
end

KrowiAF_CharacterListEntryMostProgressAchievementTooltipMixin = {};

function KrowiAF_CharacterListEntryMostProgressAchievementTooltipMixin:OnClick()
    PlayCheckButtonSoundOnClick(self);
    self:GetParent():ToggleMostProgressAchievementTooltip();
end

KrowiAF_CharacterListEntryIgnoreCharacterMixin = {};

function KrowiAF_CharacterListEntryIgnoreCharacterMixin:OnClick()
    PlayCheckButtonSoundOnClick(self);
    self:GetParent():ToggleIgnoreCharacter();
end

KrowiAF_CharacterListEntryDeleteCharacterMixin = {};

function KrowiAF_CharacterListEntryDeleteCharacterMixin:OnClick()
    self:GetParent():DeleteCharacterFunction();
end

KrowiAF_CharacterListEntryCopyCharacterMixin = {};

function KrowiAF_Import()
    local LibSerialize = LibStub("LibSerialize");
    local LibDeflate = LibStub("LibDeflate");

    local text = KrowiAF_Export.Input:GetText()

    local decoded = LibDeflate:DecodeForPrint(text)
    if not decoded then return end
    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then return end
    local success, data = LibSerialize:Deserialize(decompressed)
    if not success then return end

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
end

function KrowiAF_CharacterListEntryCopyCharacterMixin:OnClick()
    local LibSerialize = LibStub("LibSerialize");
    local LibDeflate = LibStub("LibDeflate");

    local guid = self:GetParent().Guid;

    local completed = {};
    for achievementId, achievement in next, KrowiAF_Achievements.Completed do
        if achievement.EarnedBy and achievement.EarnedBy[guid] then
            tinsert(completed, {
                Id = achievementId,
                Date = achievement.EarnedBy[guid]
            });
        end
    end

    local notCompleted = {};
    for achievementId, achievement in next, KrowiAF_Achievements.NotCompleted do
        if achievement[guid] then
            tinsert(notCompleted, {
                Id = achievementId,
                Progress = achievement[guid]
            });
        end
    end

    local data = {
        Guid = self:GetParent().Guid,
        Character = KrowiAF_SavedData.CharacterList[self:GetParent().Guid],
        Completed = completed,
        NotCompleted = notCompleted
    };

    local serialized = LibSerialize:Serialize(data)
    local compressed = LibDeflate:CompressDeflate(serialized)
    local encoded = LibDeflate:EncodeForPrint(compressed)
    DebugTable = {Serialized = serialized, Compressed = compressed, Encoded = encoded};

    KrowiAF_Export:Show();
    KrowiAF_Export.Input:SetText(encoded)
end

KrowiAF_CharacterListEntryMixin = {};

local function GetFactionIcon(faction)
    if faction == addon.Objects.Faction[addon.Objects.Faction.Alliance] then
        return "worldquest-icon-alliance";
    elseif faction == addon.Objects.Faction[addon.Objects.Faction.Horde] then
        return "worldquest-icon-horde";
    else -- Neutral
        return "worldquest-questmarker-questionmark";
    end
end

function KrowiAF_CharacterListEntryMixin:SetCharacter(character)
    if not character then
        return;
    end

    self.Character = character;
    self.Name:SetText(character.Name or "Unknown");
    self.Realm:SetText(character.Realm or "Unknown");
    self.Class:SetTexCoord(unpack(CLASS_ICON_TCOORDS[character.Class]));
    self.Faction:SetAtlas(GetFactionIcon(character.Faction));
    self.Points:SetText(character.Points or "-1");
    self.Guid = character.Guid;
    self.HeaderTooltip:SetChecked(not character.ExcludeFromHeaderTooltip);
    self.EarnedByAchievementTooltip:SetChecked(not character.ExcludeFromEarnedByAchievementTooltip);
    self.MostProgressAchievementTooltip:SetChecked(not character.ExcludeFromMostProgressAchievementTooltip);
    self.IgnoreCharacter:SetChecked(character.IgnoreCharacter);
end

function KrowiAF_CharacterListEntryMixin:ToggleHeaderTooltip()
    if self.HeaderTooltip:GetChecked() then
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromHeaderTooltip = nil;
        KrowiAF_SavedData.CharacterList[self.Guid].Ignore = nil;

        self.IgnoreCharacter:SetChecked(false);
    else
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromHeaderTooltip = true;
    end
    self.Character.ExcludeFromHeaderTooltip = KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromHeaderTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.CharacterList[self.Guid].Ignore;
end

function KrowiAF_CharacterListEntryMixin:ToggleEarnedByAchievementTooltip()
    if self.EarnedByAchievementTooltip:GetChecked() then
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromEarnedByAchievementTooltip = nil;
        KrowiAF_SavedData.CharacterList[self.Guid].Ignore = nil;

        self.IgnoreCharacter:SetChecked(false);
    else
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromEarnedByAchievementTooltip = true;
    end
    self.Character.ExcludeFromEarnedByAchievementTooltip = KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromEarnedByAchievementTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.CharacterList[self.Guid].Ignore;
end

function KrowiAF_CharacterListEntryMixin:ToggleMostProgressAchievementTooltip()
    if self.MostProgressAchievementTooltip:GetChecked() then
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromMostProgressAchievementTooltip = nil;
        KrowiAF_SavedData.CharacterList[self.Guid].Ignore = nil;

        self.IgnoreCharacter:SetChecked(false);
    else
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromMostProgressAchievementTooltip = true;
    end
    self.Character.ExcludeFromMostProgressAchievementTooltip = KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromMostProgressAchievementTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.CharacterList[self.Guid].Ignore;
end

function KrowiAF_CharacterListEntryMixin:ToggleIgnoreCharacter()
    if self.IgnoreCharacter:GetChecked() then
        KrowiAF_SavedData.CharacterList[self.Guid].Ignore = true;
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromHeaderTooltip = true;
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromEarnedByAchievementTooltip = true;
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromMostProgressAchievementTooltip = true;
        addon.Data.SavedData.AchievementData.DeleteForCharacter(self.Guid);
        KrowiAF_SavedData.CharacterList[self.Guid].Points = 0;

        self.Points:SetText("0");
        self.HeaderTooltip:SetChecked(false);
        self.EarnedByAchievementTooltip:SetChecked(false);
        self.MostProgressAchievementTooltip:SetChecked(false);
    else
        KrowiAF_SavedData.CharacterList[self.Guid].Ignore = nil;
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromHeaderTooltip = nil;
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromEarnedByAchievementTooltip = nil;
        KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromMostProgressAchievementTooltip = nil;
        if self.Guid == UnitGUID("player") then
            addon.ResetCache();
            addon.BuildCacheAsync(function()
                self.Points:SetText(KrowiAF_SavedData.CharacterList[self.Guid].Points or "-1");
            end);
        end

        self.HeaderTooltip:SetChecked(true);
        self.EarnedByAchievementTooltip:SetChecked(true);
        self.MostProgressAchievementTooltip:SetChecked(true);
    end
    self.Character.ExcludeFromHeaderTooltip = KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromHeaderTooltip;
    self.Character.ExcludeFromEarnedByAchievementTooltip = KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromEarnedByAchievementTooltip;
    self.Character.ExcludeFromMostProgressAchievementTooltip = KrowiAF_SavedData.CharacterList[self.Guid].ExcludeFromMostProgressAchievementTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.CharacterList[self.Guid].Ignore;
end

local function DeleteCharacterCallback(self)
    addon.Data.SavedData.CharacterData.Delete(self.Guid);
    addon.Data.SavedData.AchievementData.DeleteForCharacter(self.Guid);
    KrowiAF_DataManagerFrame.CharacterList:Refresh();
end

if addon.Util.IsWrathClassic then
    function KrowiAF_CharacterListEntryMixin:DeleteCharacterFunction()
        -- GENERIC_CONFIRMATION
        StaticPopupDialogs["KrowiAF_ConfirmDeleteCharacter"] = {
            text = addon.L["Are you sure you want to delete character?"]:K_ReplaceVars{
                character = KrowiAF_SavedData.CharacterList[self.Guid].Name:SetColorYellow(),
                ignore = addon.L["Ignore"]:SetColorYellow()
            },
            button1 = YES,
            button2 = NO,
            OnAccept = function()
                DeleteCharacterCallback(self);
            end,
            hideOnEscape = 1,
            timeout = 0,
            multiple = 1,
            whileDead = 1,
            wide = 1, -- Always wide to accomodate the alert icon if it is present.
        };
        StaticPopup_Show("KrowiAF_ConfirmDeleteCharacter");
    end
else
    function KrowiAF_CharacterListEntryMixin:DeleteCharacterFunction()
        if StaticPopup_IsCustomGenericConfirmationShown("KrowiAF_ConfirmDeleteCharacter") then
            return;
        end
        StaticPopup_ShowCustomGenericConfirmation({
            text = addon.L["Are you sure you want to delete character?"]:K_ReplaceVars{
                character = KrowiAF_SavedData.CharacterList[self.Guid].Name:SetColorYellow(),
                ignore = addon.L["Ignore"]:SetColorYellow()
            },
            callback = function()
                DeleteCharacterCallback(self);
            end,
            referenceKey = "KrowiAF_ConfirmDeleteCharacter"
        });
    end
end