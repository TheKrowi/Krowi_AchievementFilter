local _, addon = ...;

KrowiAF.EventData = {};

-- function KrowiAF.AddCriteriumChildren(achievementId, criteriaIndex, children)
--     for k, criterium in next, addon.Data.PetBattleLinkData[achievementId].Criteria do
--         if criterium.CriteriaIndex == criteriaIndex then
--             addon.Data.PetBattleLinkData[achievementId].Criteria[k].Children = {};
--             for _, child in next, children do
--                 tinsert(addon.Data.PetBattleLinkData[achievementId].Criteria[k].Children, {
--                     Text = child[2],
--                     Link = child[1]
--                 });
--             end
--         end
--     end
-- end

-- function KrowiAF.AddPetBattleLinkDatum(achievementId, criteriaIndex, link)
--     if addon.Util.IsNumber(criteriaIndex) then
--         tinsert(addon.Data.PetBattleLinkData[achievementId].Criteria, {
--             CriteriaIndex = criteriaIndex,
--             Link = link
--         });
--     else
--         tinsert(addon.Data.PetBattleLinkData[achievementId].Criteria, {
--             Text = link,
--             Link = criteriaIndex
--         });
--     end
-- end

-- local function AddPetBattleLinkData(achievementId, link, criteria)
--     addon.Data.PetBattleLinkData[achievementId] = addon.Data.PetBattleLinkData[achievementId] or {
--         Criteria = {},
--         Link = link
--     };

--     if not criteria then
--         return;
--     end
--     for _, criterium in next, criteria do
--         KrowiAF.AddPetBattleLinkDatum(achievementId, criterium[1], criterium[2]);
--         if criterium[3] then
--             KrowiAF.AddCriteriumChildren(achievementId, criterium[1], criterium[3]);
--         end
--     end
-- end

-- function KrowiAF.AddPetBattleLinkData(achievementIds, link, criteria)
--     if not addon.Util.IsTable(achievementIds) then
--         achievementIds = {achievementIds};
--     end

--     for _, achievementId in next, achievementIds do
--         AddPetBattleLinkData(achievementId, link, criteria);
--     end
-- end