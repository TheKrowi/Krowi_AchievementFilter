local _, addon = ...;

KrowiAF.PetBattleLinkData = {};

function KrowiAF.AddPetBattleLinkDatum(achievementId, criteriaIndex, link)
    tinsert(addon.Data.PetBattleLinkData[achievementId], {
        CriteriaIndex = criteriaIndex,
        Link = link
    });
end

local function AddPetBattleLinkData(achievementId, link, criteria)
    addon.Data.PetBattleLinkData[achievementId] = addon.Data.PetBattleLinkData[achievementId] or {};
    addon.Data.PetBattleLinkData[achievementId].Link = link;

    for _, criterium in next, criteria do
        KrowiAF.AddPetBattleLinkDatum(achievementId, criterium[1], criterium[2]);
    end
end

function KrowiAF.AddPetBattleLinkData(achievementIds, link, criteria)
    if not addon.Util.IsTable(achievementIds) then
        achievementIds = {achievementIds};
    end

    for _, achievementId in next, achievementIds do
        AddPetBattleLinkData(achievementId, link, criteria);
    end
end

addon.Data.PetBattleLinkData[achievementId] = {
    Text = KrowiAF_RegisterDeSelectAllEventOptions,
    Link = KrowiAF_RegisterDeSelectAllEventOptions,
    Criteria = {
        CriteriaIndex = criteriaIndex,
        Link = dfsdfsdf
    }
}