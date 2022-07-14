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
    for _, character in next, SavedData.Characters do
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