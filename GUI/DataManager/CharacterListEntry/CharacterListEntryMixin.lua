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

    self.Name:SetText(character.Name or "Name");
    self.Realm:SetText(character.Realm or "Realm");
    self.Class:SetTexCoord(unpack(CLASS_ICON_TCOORDS[character.Class]));
    self.Faction:SetAtlas(GetFactionIcon(character.Faction));
    self.Points:SetText(character.Points or "99999");
    self.Guid = character.Guid;
    self.HeaderTooltip:SetChecked(not character.ExcludeFromHeaderTooltip);
end

function KrowiAF_CharacterListEntryMixin:ToggleHeaderTooltip()
    if self.HeaderTooltip:GetChecked() then
        SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip = nil;
    else
        SavedData.Characters[self.Guid].ExcludeFromHeaderTooltip = true;
    end
end