-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementFrameHeader = {};
local header = addon.GUI.AchievementFrameHeader;

local processHook = true;
function header.HookSetPointsText()
    AchievementFrameHeaderPoints:SetPoint("TOP", "AchievementFrameHeaderPointBorder", "TOP", -10, -13);
    AchievementFrameHeaderPointBorder:SetWidth(175);

    hooksecurefunc(AchievementFrameHeaderPoints, "SetText", function()
        if not addon.InGuildView() and processHook then
            local _, points = addon.BuildCache();
            processHook = false;
            if addon.Options.db.AchievementPoints.Format == 1 then
            elseif addon.Options.db.AchievementPoints.Format == 2 then
                AchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(points) .. " / " .. BreakUpLargeNumbers(GetTotalAchievementPoints()));
            elseif addon.Options.db.AchievementPoints.Format == 3 then
                AchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(points));
            end
        end
        processHook = true;
    end);
end

local function CompareRealms(a, b, reverse)
    local realmA, realmB = a.Realm, b.Realm;
    if realmA == nil then
        return false;
    end
    if realmB == nil then
        return true;
    end

    local realmAlower, realmBlower = realmA:lower(), realmB:lower();
    if realmAlower == realmBlower then
        return CompareRealms(a, b, reverse);
    end

    if reverse then
        return realmAlower < realmBlower;
    end
    return realmAlower > realmBlower;
end

local function CompareNames(a, b, reverse)
    local nameA, nameB = a.Name, b.Name;
    if nameA == nil then
        return false;
    end
    if nameB == nil then
        return true;
    end

    local nameAlower, nameBlower = nameA:lower(), nameB:lower();
    if nameAlower == nameBlower then
        return CompareRealms(a, b, reverse);
    end

    if reverse then
        return nameAlower < nameBlower;
    end
    return nameAlower > nameBlower;
end

local function ComparePoints(a, b, reverse)
    local pointsA, pointsB = a.Points, b.Points;
    if pointsA == nil then
        return false;
    end
    if pointsB == nil then
        return true;
    end

    if pointsA == pointsB then
        return CompareNames(a, b, reverse);
    end

    if reverse then
        return pointsA < pointsB;
    end
    return pointsA > pointsB;
end

local function GetSortedCharacters()
    local characters = {};
    for _, character in next, SavedData.Characters do
        tinsert(characters, character);
    end

    -- local sortFunc = ComparePoints;

    -- table.sort(characters, function(a, b)
    --     sortFunc(a, b, false);
    -- end);
    return characters;
end

local function AddFactionIcon(name, faction)
    if addon.Options.db.AchievementPoints.Tooltip.ShowFaction then
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
    for _, character in next, characters do
        local r, g, b = GetClassColor(character.Class);
        local name = character.Name;
        if addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm or character.Realm ~= (select(2, UnitFullName("player"))) then
            name = name .. " - " .. character.Realm;
        end
        name = AddFactionIcon(name, character.Faction)
        GameTooltip:AddDoubleLine(name, tostring(BreakUpLargeNumbers(character.Points)), r, g, b, 1, 1, 1);
    end
    GameTooltip:Show();
end

function header.CreateTooltip()
    local frame = CreateFrame("Frame", nil, AchievementFrameHeader);
    frame:SetSize(175, 20);
    frame:SetPoint("CENTER", "AchievementFrameHeader", "CENTER", 20, -16);
    frame:SetScript("OnEnter", OnEnter);
    frame:SetScript("OnLeave", function()
        GameTooltip:Hide();
    end);
end