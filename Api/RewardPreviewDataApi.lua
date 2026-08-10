local _, addon = ...

KrowiAF.Enum.RewardPreviewType = EnumUtil.MakeEnum(
    "MountId",
    "PetSpeciesId",
    "HousingDecorId",
    "CreatureDisplayId"
)

-- Public registration API (KAF's own data + 3rd-party plugins can both feed this)
function KrowiAF.AddRewardPreviewData(achievementIds, rewardPreviewType, rewardId, name, spellId)
    addon.Data.RewardPreviewData = addon.Data.RewardPreviewData or {}

    if not addon.Util.IsTable(achievementIds) then
        achievementIds = {achievementIds}
    end

    for _, achievementId in next, achievementIds do
        addon.Data.RewardPreviewData[achievementId] = addon.Data.RewardPreviewData[achievementId] or {}
        tinsert(addon.Data.RewardPreviewData[achievementId], {
            RewardPreviewType = rewardPreviewType,
            RewardId = rewardId,
            Name = name,
            SpellId = spellId
        })
    end
end
