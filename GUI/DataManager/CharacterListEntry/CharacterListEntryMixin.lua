-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_CharacterListEntryMixin = {};

function KrowiAF_CharacterListEntryMixin:PostLoad(scrollFrame)
	self:SetPoint("RIGHT", scrollFrame, -5, 0);
end

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
    self.Points:SetText(character.Points or "99999");
    self.Guid = character.Guid;
    self.HeaderTooltip:SetChecked(not character.ExcludeFromHeaderTooltip);
    self.EarnedByAchievementTooltip:SetChecked(not character.ExcludeFromEarnedByAchievementTooltip);
    self.MostProgressAchievementTooltip:SetChecked(not character.ExcludeFromMostProgressAchievementTooltip);
    self.IgnoreCharacter:SetChecked(character.IgnoreCharacter);
end

function KrowiAF_CharacterListEntryMixin:ToggleHeaderTooltip()
    if self.HeaderTooltip:GetChecked() then
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip = nil;
        KrowiAF_SavedData.Characters[self.Guid].Ignore = nil;

        self.IgnoreCharacter:SetChecked(false);
    else
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip = true;
    end
    self.Character.ExcludeFromHeaderTooltip = KrowiAF_SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.Characters[self.Guid].Ignore;
end

function KrowiAF_CharacterListEntryMixin:ToggleEarnedByAchievementTooltip()
    if self.EarnedByAchievementTooltip:GetChecked() then
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromEarnedByAchievementTooltip = nil;
        KrowiAF_SavedData.Characters[self.Guid].Ignore = nil;

        self.IgnoreCharacter:SetChecked(false);
    else
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromEarnedByAchievementTooltip = true;
    end
    self.Character.ExcludeFromEarnedByAchievementTooltip = KrowiAF_SavedData.Characters[self.Guid].ExcludeFromEarnedByAchievementTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.Characters[self.Guid].Ignore;
end

function KrowiAF_CharacterListEntryMixin:ToggleMostProgressAchievementTooltip()
    if self.MostProgressAchievementTooltip:GetChecked() then
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromMostProgressAchievementTooltip = nil;
        KrowiAF_SavedData.Characters[self.Guid].Ignore = nil;

        self.IgnoreCharacter:SetChecked(false);
    else
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromMostProgressAchievementTooltip = true;
    end
    self.Character.ExcludeFromMostProgressAchievementTooltip = KrowiAF_SavedData.Characters[self.Guid].ExcludeFromMostProgressAchievementTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.Characters[self.Guid].Ignore;
end

function KrowiAF_CharacterListEntryMixin:ToggleIgnoreCharacter()
    if self.IgnoreCharacter:GetChecked() then
        KrowiAF_SavedData.Characters[self.Guid].Ignore = true;
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip = true;
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromEarnedByAchievementTooltip = true;
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromMostProgressAchievementTooltip = true;
        KrowiAF_SavedData.Characters[self.Guid].CompletedAchievements = {};
        KrowiAF_SavedData.Characters[self.Guid].NotCompletedAchievements = {};
        KrowiAF_SavedData.Characters[self.Guid].LastCompleted = nil;
        KrowiAF_SavedData.Characters[self.Guid].Points = 0;

        self.Points:SetText("0");
        self.HeaderTooltip:SetChecked(false);
        self.EarnedByAchievementTooltip:SetChecked(false);
        self.MostProgressAchievementTooltip:SetChecked(false);
    else
        KrowiAF_SavedData.Characters[self.Guid].Ignore = nil;
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip = nil;
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromEarnedByAchievementTooltip = nil;
        KrowiAF_SavedData.Characters[self.Guid].ExcludeFromMostProgressAchievementTooltip = nil;
        if self.Guid == UnitGUID("player") then
            addon.ResetCache();
            addon.BuildCache();
            self.Points:SetText(KrowiAF_SavedData.Characters[self.Guid].Points or "99999");
        end

        self.HeaderTooltip:SetChecked(true);
        self.EarnedByAchievementTooltip:SetChecked(true);
        self.MostProgressAchievementTooltip:SetChecked(true);
    end
    self.Character.ExcludeFromHeaderTooltip = KrowiAF_SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip;
    self.Character.ExcludeFromEarnedByAchievementTooltip = KrowiAF_SavedData.Characters[self.Guid].ExcludeFromEarnedByAchievementTooltip;
    self.Character.ExcludeFromMostProgressAchievementTooltip = KrowiAF_SavedData.Characters[self.Guid].ExcludeFromMostProgressAchievementTooltip;
    self.Character.IgnoreCharacter = KrowiAF_SavedData.Characters[self.Guid].Ignore;
end

local function DeleteCharacterCallback(self)
    KrowiAF_SavedData.Characters[self.Guid] = nil;
    addon.GUI.DataManagerFrame.CharacterList:Refresh();
end

function ShowWrathClassicDeleteCharacterConfirmation(self)
    -- GENERIC_CONFIRMATION
    StaticPopupDialogs["KrowiAF_ConfirmDeleteCharacter"] = {
        text = addon.L["Are you sure you want to delete character?"]:K_ReplaceVars
            {
                character = KrowiAF_SavedData.Characters[self.Guid].Name:SetColorYellow(),
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

function KrowiAF_CharacterListEntryMixin:DeleteCharacterFunction()
    if addon.IsWrathClassic then
        ShowWrathClassicDeleteCharacterConfirmation(self);
        return;
    end

    if not StaticPopup_IsCustomGenericConfirmationShown("KrowiAF_ConfirmDeleteCharacter") then
        StaticPopup_ShowCustomGenericConfirmation(
            {
                text = addon.L["Are you sure you want to delete character?"]:K_ReplaceVars
                {
                    character = KrowiAF_SavedData.Characters[self.Guid].Name:SetColorYellow(),
                    ignore = addon.L["Ignore"]:SetColorYellow()
                },
                callback = function()
                    DeleteCharacterCallback(self);
                end,
                referenceKey = "KrowiAF_ConfirmDeleteCharacter"
            }
        );
    end
end