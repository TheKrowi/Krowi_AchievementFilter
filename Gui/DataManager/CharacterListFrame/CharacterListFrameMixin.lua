local _, addon = ...;

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
		title = addon.L["Most progress"],
		width = 100,
		attribute = "ExcludeFromMostProgressAchievementTooltip"
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

local sortFuncs = {
    addon.Objects.CompareFunc:New("number", "Points");
    addon.Objects.CompareFunc:New("string", "Name");
    addon.Objects.CompareFunc:New("string", "Realm");
    addon.Objects.CompareFunc:New("string", "Faction");
    addon.Objects.CompareFunc:New("string", "Class");
    addon.Objects.CompareFunc:New("bool", "ExcludeFromHeaderTooltip");
    addon.Objects.CompareFunc:New("bool", "ExcludeFromEarnedByAchievementTooltip");
    addon.Objects.CompareFunc:New("bool", "ExcludeFromMostProgressAchievementTooltip");
    addon.Objects.CompareFunc:New("bool", "IgnoreCharacter");
};

KrowiAF_CharacterListFrameInsetFrameMixin = {};

function KrowiAF_CharacterListFrameInsetFrameMixin:OnLoad()
    self.Bg:Hide();
    self:SetFrameLevel(100);
end

KrowiAF_CharacterListFrameMixin = {};

local function GetSortedCharacters(column)
    local characters = {};
    KrowiAF_SavedData.CharacterList = KrowiAF_SavedData.CharacterList or {};
    for guid, character in next, KrowiAF_SavedData.CharacterList do
        tinsert(characters, {
            Name = character.Name,
            Realm = character.Realm,
            Class = character.Class,
            Faction = character.Faction,
            Points = character.Points,
            ExcludeFromHeaderTooltip = character.ExcludeFromHeaderTooltip,
            ExcludeFromEarnedByAchievementTooltip = character.ExcludeFromEarnedByAchievementTooltip,
            ExcludeFromMostProgressAchievementTooltip = character.ExcludeFromMostProgressAchievementTooltip,
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
    elseif column.attribute == "ExcludeFromMostProgressAchievementTooltip" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[8];
        sortFuncs[8].Fallback = sortFuncs[2];
        sortFuncs[8].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    elseif column.attribute == "IgnoreCharacter" then
        column.reverse = not column.reverse;
        sortFunc = sortFuncs[9];
        sortFuncs[9].Fallback = sortFuncs[2];
        sortFuncs[9].Reverse = column.reverse;
        sortFuncs[2].Fallback = sortFuncs[3];
        sortFuncs[3]:SetDefaultFallback();
    end

    table.sort(characters, function(a, b)
        return sortFunc:Compare(a, b);
    end);
    return characters;
end

local function CreateScrollView(self)
	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer("KrowiAF_CharacterListEntry_Template", function(button, character)
		button:SetCharacter(character);
	end);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView);
end

local function AddManagedScrollBarVisibilityBehavior(self)
	local anchorsWithBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, 0),
        CreateAnchor("BOTTOMRIGHT", self.ScrollBar, "BOTTOMLEFT", 0, 5)
    };

    local anchorsWithoutBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, 0),
        CreateAnchor("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 5)
    };

    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.ScrollBox, self.ScrollBar, anchorsWithBar, anchorsWithoutBar);
end

local cachedCharacters;
function KrowiAF_CharacterListFrameMixin:OnLoad()
    self.ColumnDisplay:LayoutColumns(CharacterColumns);
    self.ColumnDisplay.sortingFunction = self.Sort;
    self.ColumnDisplay:Show();

	-- self.ScrollBox.wheelPanScalar = addon.Options.db.profile.SearchBox.MouseWheelPanScalar;
	-- self.ScrollBar.wheelPanScalar = addon.Options.db.profile.SearchBox.MouseWheelPanScalar;

    CreateScrollView(self);
	AddManagedScrollBarVisibilityBehavior(self);
    cachedCharacters = GetSortedCharacters();
end

function KrowiAF_CharacterListFrameMixin:UpdateDataProvider(characters)
	local newDataProvider = CreateDataProvider();
	for _, character in next, characters do
		newDataProvider:Insert(character);
	end
	self.ScrollBox:SetDataProvider(newDataProvider);
end

function KrowiAF_CharacterListFrameMixin:Update(characters)
    characters = characters or cachedCharacters;
    self:UpdateDataProvider(characters);
end

function KrowiAF_CharacterListFrameMixin:Sort(columnIndex)
    self:GetParent():Update(GetSortedCharacters(CharacterColumns[columnIndex]));
end

function KrowiAF_CharacterListFrameMixin:Refresh()
    self:Update(GetSortedCharacters());
end