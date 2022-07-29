-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_DataManagerFrameMixin = {};
KrowiAF_CommunitiesMemberListMixin = {};
KrowiAF_CommunitiesMemberListEntryMixin = {};

function KrowiAF_DataManagerFrameMixin:OnLoad()
	ButtonFrameTemplate_HidePortrait(self);
    ButtonFrameTemplate_HideButtonBar(self);
end

local GUILD_COLUMN_INFO = {
	[1] = {
		title = addon.L["Points"],
		width = 50,
		attribute = "Points",
	},
	[2] = {
		title = COMMUNITIES_ROSTER_COLUMN_TITLE_CLASS,
		width = 45,
		attribute = "Class",
	},
	[3] = {
		title = addon.L["Name"],
		width = 100,
		attribute = "Name",
	},
	[4] = {
		title = addon.L["Realm"],
		width = 100,
		attribute = "Realm",
	}
};

function KrowiAF_CommunitiesMemberListMixin:OnLoad()
    self.ColumnDisplay:LayoutColumns(GUILD_COLUMN_INFO);
    self.ColumnDisplay:Show();
    
	HybridScrollFrame_CreateButtons(self.ListScrollFrame, "KrowiAF_CommunitiesMemberListEntry_Template", 0, 0);

    local scrollFrame = self.ListScrollFrame;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
    local button, character;
    local characters = {};
    for guid, character in next, SavedData.Characters do
        tinsert(characters, {
            Name = character.Name,
            Realm = character.Realm,
            Class = character.Class,
            Faction = character.Faction,
            Points = character.Points,
            Guid = guid
        });
    end
    for i = 1, #buttons do
        button = buttons[i];
        character = characters[i];
        print(character)
        if character then
            button:SetCharacter(character);
            button:Show();
        else
            button:SetCharacter();
            button:Hide();
        end
    end

end

function KrowiAF_CommunitiesMemberListEntryMixin:SetCharacter(character)
    if not character then
        return;
    end

    -- self.NameFrame.Name:SetText(character.Name or "");
    self.Points:SetText(character.Points or "tesdsfsdfdsft");
    self.Class:SetTexCoord(unpack(CLASS_ICON_TCOORDS[character.Class]));
    self.Name:SetText(character.Name or "tesdfdsfdsfst");
    self.Realm:SetText(character.Realm or "tesdfdsfdsfst");
end