-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementFrameHeader = {};
local header = addon.GUI.AchievementFrameHeader;

function header:Load()
    if addon.IsWrathClassic then
        local tex = AchievementFrameHeader:CreateTexture();
        tex:SetTexture("Interface/AchievementFrame/UI-Achievement-RightDDLInset");
        tex:SetSize(128, 32);
        tex:SetPoint("TOPLEFT", 112, -56);
        tex:Hide();
        AchievementFrameHeaderLeftDDLInset = tex;
    end
end

local headerSortPriorities = {
    addon.L["Points"],
    addon.L["Name"],
    addon.L["Realm"],
    addon.L["Faction"],
    addon.L["Class"]
}

local function SetPriority(index, value)
    local priorities = addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Priority;
    local otherIndex;
    for i, prio in next, priorities do
        if prio == value then
            otherIndex = i;
        end
    end
    local currentValue = addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Priority[index];
    addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Priority[index] = value;
    addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Priority[otherIndex] = currentValue;
    local currentReverse = addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Reverse[index]
    addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Reverse[index] = addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Reverse[otherIndex];
    addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Reverse[otherIndex] = currentReverse;
end

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = addon.InjectOptions.AdjustedWidth;
function header.InjectDynamicOptions()
    for i = 1, #headerSortPriorities do
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Priority" .. i, {
            order = OrderPP(), type = "select", width = AdjustedWidth(0.95),
            name = "",
            -- desc = (""):KAF_AddDefaultValueText("AchievementPoints.Tooltip.Sort.Priority." .. i, headerSortPriorities), -- Does not show cause name is empty
            values = headerSortPriorities,
            get = function() return addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Priority[i]; end,
            set = function (_, value) SetPriority(i, value); end
        });
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Blank1" .. i, {
            order = OrderPP(), type = "description", width = AdjustedWidth(0.1),
            name = ""
        });
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Reverse" .. i, {
            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.95),
            name = addon.L["Reverse Sort"],
            desc = (""):KAF_AddDefaultValueText("AchievementPoints.Tooltip.Sort.Reverse." .. i),
            get = function() return addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Reverse[i]; end,
            set = function() addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Reverse[i] = not addon.Options.db.profile.AchievementPoints.Tooltip.Sort.Reverse[i]; end
        });
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Blank2" .. i, {
            order = OrderPP(), type = "description", width = AdjustedWidth(0.85),
            name = ""
        });
    end
end

local processHook = true;
function header.HookSetPointsText()
    AchievementFrame.Header.Points:SetPoint("TOP", AchievementFrame.Header.PointBorder, "TOP", -10, -13);
    AchievementFrame.Header.PointBorder:SetWidth(175);

    hooksecurefunc(AchievementFrame.Header.Points, "SetText", function()
        -- print("hooked function", addon.InGuildView(), processHook)
        if not addon.InGuildView() and processHook then
            local _, points = addon.BuildCache();
            processHook = false;
            if addon.Options.db.profile.AchievementPoints.Format == 1 then
            elseif addon.Options.db.profile.AchievementPoints.Format == 2 then
                AchievementFrame.Header.Points:SetText(BreakUpLargeNumbers(points) .. " / " .. BreakUpLargeNumbers(GetTotalAchievementPoints()));
            elseif addon.Options.db.profile.AchievementPoints.Format == 3 then
                AchievementFrame.Header.Points:SetText(BreakUpLargeNumbers(points));
            end
        end
        processHook = true;
    end);
end

local sortFuncs = {
    addon.Objects.CompareFunc:New("number", "Points");
    addon.Objects.CompareFunc:New("string", "Name");
    addon.Objects.CompareFunc:New("string", "Realm");
    addon.Objects.CompareFunc:New("string", "Faction");
    addon.Objects.CompareFunc:New("string", "Class");
};

local function GetSortedCharacters()
    local characters = {};
    for guid, character in next, KrowiAF_SavedData.Characters do
        tinsert(characters, {
            Name = character.Name,
            Realm = character.Realm,
            Class = character.Class,
            Faction = character.Faction,
            Points = character.Points,
            ExcludeFromHeaderTooltip = character.ExcludeFromHeaderTooltip,
            Guid = guid
        });
    end

    local sortOptions = addon.Options.db.profile.AchievementPoints.Tooltip.Sort;
    for index, sortFunc in next, sortOptions.Priority do
        sortFuncs[sortFunc].Reverse = sortOptions.Reverse[index];
    end

    local sortFunc = sortFuncs[sortOptions.Priority[1]];
    for i = 1, #sortOptions.Priority - 1 do
        sortFuncs[sortOptions.Priority[i]].Fallback = sortFuncs[sortOptions.Priority[i + 1]];
    end
    sortFuncs[sortOptions.Priority[#sortOptions.Priority]]:SetDefaultFallback();

    table.sort(characters, function(a, b)
        return sortFunc:Compare(a, b);
    end);
    return characters;
end

local function LimitNumCharacters(characters)
    local maxNumCharacters = addon.Options.db.profile.AchievementPoints.Tooltip.MaxNumCharacters;
    local trimmedCharacters = {};

    if not addon.Options.db.profile.AchievementPoints.Tooltip.KeepCurrentCharacter then -- We can just take the 1st x characters and return
        for i = 1, maxNumCharacters do
            tinsert(trimmedCharacters, characters[i]);
        end
        return trimmedCharacters;
    end

    -- Here we need to check if we added the current character or not
    local currentCharacterAdded = false;
    local playerGUID = UnitGUID("player");
    for i = 1, #characters do
        if not characters[i].ExcludeFromHeaderTooltip then
            if characters[i].Guid == playerGUID then
                tinsert(trimmedCharacters, characters[i]);
                currentCharacterAdded = true;
            elseif currentCharacterAdded or #trimmedCharacters < maxNumCharacters - 1 then
                tinsert(trimmedCharacters, characters[i]);
            end
            if #trimmedCharacters >= maxNumCharacters then
                return trimmedCharacters;
            end
        end
    end
    return trimmedCharacters;
end

local function AddFactionIcon(name, faction)
    if addon.Options.db.profile.AchievementPoints.Tooltip.ShowFaction then
        local icon;
        if faction == addon.Objects.Faction[addon.Objects.Faction.Alliance] then
            icon = "|A:worldquest-icon-alliance:15:16|a";
        elseif faction == addon.Objects.Faction[addon.Objects.Faction.Horde] then
            icon = "|A:worldquest-icon-horde:15:16|a";
        else -- Neutral
            icon = "|A:worldquest-questmarker-questionmark:15:16|a";
        end
        name = icon .. addon.L["TAB"] .. name;
    end
    return name;
end

local function OnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT");
    GameTooltip:SetText(addon.L["Achievement points earned by"]);
    local characters = GetSortedCharacters();
    characters = LimitNumCharacters(characters);
    for _, character in next, characters do
        local r, g, b = GetClassColor(character.Class);
        local name = character.Name;
        if addon.Options.db.profile.AchievementPoints.Tooltip.AlwaysShowRealm or character.Realm ~= (select(2, UnitFullName("player"))) then
            name = name .. " - " .. character.Realm;
        end
        name = AddFactionIcon(name, character.Faction);
        GameTooltip:AddDoubleLine(name, tostring(BreakUpLargeNumbers(character.Points)), r, g, b, 1, 1, 1);
    end
    GameTooltip:Show();
end

function header.CreateTooltip()
    local frame = CreateFrame("Button", nil, AchievementFrame.Header);
    addon.GUI.AchievementFrameHeader.Button = frame;
    frame:SetPoint("TOPLEFT", AchievementFrame.Header.PointBorder);
    frame:SetPoint("BOTTOMRIGHT", AchievementFrame.Header.PointBorder);
    frame:SetScript("OnEnter", OnEnter);
    frame:SetScript("OnLeave", function()
        GameTooltip:Hide();
    end);
    frame:SetScript("OnClick", function()
        addon.GUI.DataManagerFrame:Show();
    end);
end