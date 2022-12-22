-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_CharacterListFrameMixin = {};

local CharacterColumns = {
	{
		title = addon.L["Name"],
		width = 150,
		attribute = "Name"
	},
	{
		title = addon.L["Realm"],
		width = 150,
		attribute = "Realm"
	},
	{
		title = addon.L["Class"],
		width = 50,
		attribute = "Class"
	},
	{
		title = addon.L["Faction"],
		width = 60,
		attribute = "Faction"
	},
	{
		title = addon.L["Points"],
		width = 75,
		attribute = "Points",
        reverse = true
	},
	{
		title = addon.L["Header tooltip"],
		width = 100,
		attribute = "ExcludeFromHeaderTooltip"
	},
	{
		title = addon.L["Earned By"],
		width = 100,
		attribute = "ExcludeFromEarnedByAchievementTooltip"
	},
	{
		title = addon.L["Ignore"],
		width = 100,
		attribute = "IgnoreCharacter"
	},
	{
		title = addon.L["Delete"],
		width = 100,
		attribute = "DeleteCharacter"
	}
};

local cachedCharacters;

local sortFuncs = {
    addon.Objects.CompareFunc:New("number", "Points");
    addon.Objects.CompareFunc:New("string", "Name");
    addon.Objects.CompareFunc:New("string", "Realm");
    addon.Objects.CompareFunc:New("string", "Faction");
    addon.Objects.CompareFunc:New("string", "Class");
    addon.Objects.CompareFunc:New("bool", "ExcludeFromHeaderTooltip");
    addon.Objects.CompareFunc:New("bool", "ExcludeFromEarnedByAchievementTooltip");
    addon.Objects.CompareFunc:New("bool", "IgnoreCharacter");
};

local function GetSortedCharacters(column)
    local characters = {};
    SavedData.Characters = SavedData.Characters or {};
    for guid, character in next, SavedData.Characters do
        tinsert(characters, {
            Name = character.Name,
            Realm = character.Realm,
            Class = character.Class,
            Faction = character.Faction,
            Points = character.Points,
            ExcludeFromHeaderTooltip = character.ExcludeFromHeaderTooltip,
            ExcludeFromEarnedByAchievementTooltip = character.ExcludeFromEarnedByAchievementTooltip,
            IgnoreCharacter = character.Ignore,
            Guid = guid
        });
    end

    local sortFunc;
    if not column then
        sortFunc = sortFuncs[1];
        sortFuncs[1].Fallback = sortFuncs[2];
        sortFuncs[1].Reverse = true;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "Points" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[1];
        sortFuncs[1].Fallback = sortFuncs[2];
        sortFuncs[1].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "Name" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[2];
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[2].Reverse = column.reverse;
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "Realm" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[3];
        sortFuncs[3].Fallback = sortFuncs[2];
        sortFuncs[3].Reverse = column.reverse;
        sortFuncs[2]:SetDefaultFallback();
    elseif column.attribute == "Faction" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[4];
        sortFuncs[4].Fallback = sortFuncs[2];
        sortFuncs[4].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "Class" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[5];
        sortFuncs[5].Fallback = sortFuncs[2];
        sortFuncs[5].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "ExcludeFromHeaderTooltip" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[6];
        sortFuncs[6].Fallback = sortFuncs[2];
        sortFuncs[6].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "ExcludeFromEarnedByAchievementTooltip" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[7];
        sortFuncs[7].Fallback = sortFuncs[2];
        sortFuncs[7].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "IgnoreCharacter" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[8];
        sortFuncs[8].Fallback = sortFuncs[2];
        sortFuncs[8].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    end

    table.sort(characters, function(a, b)
        return sortFunc:Compare(a, b);
    end);
    return characters;
end

function KrowiAF_CharacterListFrameMixin:OnLoad()
    self.ColumnDisplay:LayoutColumns(CharacterColumns);
    self.ColumnDisplay.sortingFunction = self.Sort;
    self.ColumnDisplay:Show();

    local scrollFrame = self.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;
    local scrollBarShow = getmetatable(scrollBar).__index.Show;
    scrollBar.Show = function(selfFunc)
        self:SetPoint("BOTTOMRIGHT", -24, 3);
        scrollBarShow(selfFunc);
    end
    local scrollBarHide = getmetatable(scrollBar).__index.Hide;
    scrollBar.Hide = function(selfFunc)
        self:SetPoint("BOTTOMRIGHT", 0, 3);
        scrollBarHide(selfFunc);
    end
    -- scrollBar.doNotHide = true;

	scrollFrame.update = function()
		self:Update(cachedCharacters);
	end

	HybridScrollFrame_CreateButtons(scrollFrame, "KrowiAF_CharacterListEntry_Template", 0, 0);
    local buttons = scrollFrame.buttons;
    for _, button in next, buttons do
		button:PostLoad(scrollFrame);
	end

    cachedCharacters = GetSortedCharacters();
end

function KrowiAF_CharacterListFrameMixin:Update(characters)
    characters = characters or cachedCharacters;
    local scrollFrame = self.ScrollFrame;
    local buttons = scrollFrame.buttons;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
    local button, character;
    -- cachedCharacters = GetSortedCharacters();
    -- tinsert(characters, {
    --     Name = "NAME@@@@@@@@@@@@@@@@@@@@",
    --     Realm = "NAME@@@@@@@@@@@@@@@@@@@@",
    --     Class = "PALADIN",
    --     Faction = "Alliance",
    --     Points = "NAME@@@@@@@@@@@@@@@@@@@@",
    --     Guid = guid
    -- });

	local displayedHeight = 0;
    for i = 1, #buttons do
        button = buttons[i];
        character = characters[i + offset];
        if character then
            button:SetCharacter(character);
			displayedHeight = displayedHeight + button:GetHeight();
            button:Show();
        else
            button:SetCharacter();
            button:Hide();
        end
    end

    local totalHeight = #cachedCharacters * button:GetHeight();

	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end

function KrowiAF_CharacterListFrameMixin:Sort(columnIndex)
    self:GetParent():Update(GetSortedCharacters(CharacterColumns[columnIndex]));
end

function KrowiAF_CharacterListFrameMixin:Refresh()
    self:Update(GetSortedCharacters());
end