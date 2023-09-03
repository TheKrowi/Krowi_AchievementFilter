-- [[ Namespaces ]] --
local _, addon = ...;
addon.Objects = {};
local objects = addon.Objects;

-- [[ KrowiMenuItem ]] --
objects.MenuItem = LibStub("Krowi_MenuItem-1.0");
local menuItem = objects.MenuItem;

function menuItem:AddCritExtLinkFull(achievementID, criteriaNum, externalLink)
    local exists = select(16, addon.GetAchievementInfo(achievementID));
    if not exists then
        return {};
    end
    local criteriaString = addon.GetAchievementCriteriaInfo(achievementID, criteriaNum);
    return self:AddExtLinkFull(criteriaString, externalLink);
end