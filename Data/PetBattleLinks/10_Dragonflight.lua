local _, addon = ...;

local t = addon.L["Xu-Fu's Pet Guides"];
local u = "https://www.wow-petguide.com/";
local e = u .. "Encounter/";

KrowiAF.PetBattleLinkData = KrowiAF.PetBattleLinkData or {};
KrowiAF.PetBattleLinkData.Dragonflight = {
    { -- Battle on the Dragon Isles
        16464,
        u .. "Section/97",
        {
            {1, e .. "1370"},
            {2, e .. "1373"},
            {3, e .. "1366"},
            {4, e .. "1372"},
            {5, e .. "1376"},
            {6, e .. "1367"},
            {7, e .. "1369"},
            {8, e .. "1375"},
        }
    }
};


-- {C, 16464, 8, e .. "1375"},
-- {C, 16464, 7, e .. "1369"},
-- {C, 16464, 6, e .. "1367"},
-- {C, 16464, 5, e .. "1376"},
-- {C, 16464, 4, e .. "1372"},
-- {C, 16464, 3, e .. "1366"},
-- {C, 16464, 2, e .. "1373"},
-- {C, 16464, 1, e .. "1370"},
-- {N, 16464, t, u .. "Section/97"}, -- Battle on the Dragon Isles


-- N = function lib:NewExtLink(text, externalLink)
--     return self:New({
--         Text = text,
--         Func = function()
--             popupDialog.ShowExternalLink(externalLink);
--         end
--     });
-- end

-- C = menuItem van N, hier dit oproepen

-- function menuItem:AddCritExtLinkFull(achievementID, criteriaNum, externalLink)
--     local exists = select(16, addon.GetAchievementInfo(achievementID));
--     local criteriaString;
--     if exists then
--         criteriaString = addon.GetAchievementCriteriaInfo(achievementID, criteriaNum);
--     else
--         criteriaString = "* Placeholder for " .. achievementID .. " and " .. criteriaNum .. " * ";
--     end
--     return self:AddExtLinkFull(criteriaString, externalLink);
-- end
