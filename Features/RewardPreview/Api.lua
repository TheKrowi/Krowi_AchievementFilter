local _, addon = ...
local feature = addon.RewardPreview

KrowiAF.Enum.RewardPreviewType = EnumUtil.MakeEnum(
    "MountId",
    "PetSpeciesId",
    "HousingDecorId",
    "CreatureDisplayId"
)

local function Store(achievementIds, rewardPreviewType, rewardId, name, spellId)
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

-- Calls made before the registry decided who starts (Features.lua StartAll), kept for Start or dropped for a feature
-- that stays off
local queue = {}

-- Public registration API (3rd-party plugins feed this; KAF's own data comes through the data fields below). It keeps
-- nothing while the feature is off, and never errors then.
function KrowiAF.AddRewardPreviewData(achievementIds, rewardPreviewType, rewardId, name, spellId)
    local features = addon.Features
    if not features.HasStarted() then
        tinsert(queue, {achievementIds, rewardPreviewType, rewardId, name, spellId})
        return
    end
    if features.IsStarted("RewardPreview") then
        Store(achievementIds, rewardPreviewType, rewardId, name, spellId)
    end
end

function feature.TakeQueue()
    for _, call in ipairs(queue) do
        Store(unpack(call, 1, 5))
    end
    queue = {}
end

function feature.DropQueue()
    queue = {}
end

-- The reward ids the achievement data builder writes (Api/AchievementDataBuilder.lua), handed over by the core while the
-- feature is started (Slots.lua, AchievementData): an id or a list of them, and for CreatureDisplayId a list of
-- {Id, SpellId}
local function Ids(rewardPreviewType)
    return function(achievementId, value)
        if addon.Util.IsTable(value) then
            for _, previewId in next, value do
                Store(achievementId, rewardPreviewType, previewId)
            end
        else
            Store(achievementId, rewardPreviewType, value)
        end
    end
end

local rewardPreviewType = KrowiAF.Enum.RewardPreviewType
addon.Features.AddDataFields("RewardPreview", {
    HousingDecorId = Ids(rewardPreviewType.HousingDecorId),
    MountId = Ids(rewardPreviewType.MountId),
    PetSpeciesId = Ids(rewardPreviewType.PetSpeciesId),
    CreatureDisplayId = function(achievementId, previews)
        for _, preview in next, previews do
            Store(achievementId, rewardPreviewType.CreatureDisplayId, preview.Id, nil, preview.SpellId)
        end
    end
})