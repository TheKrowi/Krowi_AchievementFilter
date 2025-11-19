local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);

function section:CheckAdd(achievement)
    return addon.Data.PetBattleLinkData and addon.Data.PetBattleLinkData[achievement.Id];
end

local function GetCriteriumText(achievement, criterium)
    local exists = addon.Util.IsTable(achievement) and select(16, addon.GetAchievementInfo(achievement.Id));
    if exists then
        return GetAchievementCriteriaInfo(achievement.Id, criterium.CriteriaIndex);
    end
    return "* Placeholder for " .. achievement.Id .. " and " .. criterium.CriteriaIndex .. " * ";
end

local function AddCriteriumChildren(menu, children)
    for _, child in next, children do
        addon.MenuUtil:CreateButtonAndAdd(
            menu,
            child.Text,
            function()
                LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(child.Link);
            end
        );
    end
end

local function AddCriterium(menu, achievement, criterium)
    local criteriaString = criterium.Text or GetCriteriumText(achievement, criterium);
    local criteriumFunc;
    if criterium.Link then
        criteriumFunc = function()
            LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(criterium.Link);
        end
    end
    local criteriumLink = addon.MenuUtil:CreateButton(
        menu,
        criteriaString,
        criteriumFunc
    );
    if criterium.Children then
        AddCriteriumChildren(criteriumLink, criterium.Children);
    end
    addon.MenuUtil:AddChildMenu(menu, criteriumLink);
end

local AddData;
function AddNestedCriterium(menu, achievement, criterium)
    AddData(menu, addon.Data.Achievements[criterium.Link], GetCriteriumText(achievement, criterium));
end

local function AddCriteria(menu, achievement, criteria)
    for _, criterium in next, criteria do
        if addon.Util.IsString(criterium.Link) then
            AddCriterium(menu, achievement, criterium);
        else
            AddNestedCriterium(menu, achievement, criterium);
        end
    end
end

function AddData(menu, achievement, linkText)
    local petBattleLinkData = addon.Data.PetBattleLinkData[achievement.Id];
    local petBattleLinkFunc;
    if petBattleLinkData.Link then
        petBattleLinkFunc = function()
            LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(petBattleLinkData.Link);
        end
    end
    local petBattleLink = addon.MenuUtil:CreateButton(
        menu,
        linkText or addon.L["Xu-Fu's Pet Guides"],
        petBattleLinkFunc
    );
    if petBattleLinkData.Criteria then
        AddCriteria(petBattleLink, achievement, petBattleLinkData.Criteria);
    end

    addon.MenuUtil:AddChildMenu(menu, petBattleLink);
end


function section:Add(menu, achievement)
    AddData(menu, achievement, addon.Data.PetBattleLinkData[achievement.Id].Text);
end