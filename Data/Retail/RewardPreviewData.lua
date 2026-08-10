local _, addon = ...
addon.Data.RewardPreviewData = addon.Data.RewardPreviewData or {}

local rewardPreviewType = KrowiAF.Enum.RewardPreviewType

addon.RewardPreviewData = {}
local rewardPreviewData = addon.RewardPreviewData

local function GetMountDisplayId(mountId)
    -- 6th return (modelSceneID) is the mount's own tuned scene, not the generic housing-decor default
    local displayId, _, _, _, _, sceneId = C_MountJournal.GetMountInfoExtraByID(mountId)
    return displayId, sceneId
end

-- Resolves an entry into something the preview window knows how to render, or nil if not previewable
local function BuildPreviewData(entry)
    if entry.RewardPreviewType == rewardPreviewType.MountId then
        local name, _, icon = C_MountJournal.GetMountInfoByID(entry.RewardId)
        entry.Name = entry.Name or name
        entry.Icon = entry.Icon or icon
        local displayId, sceneId = GetMountDisplayId(entry.RewardId)
        if displayId then
            return {Kind = "Model", DisplayId = displayId, SceneId = sceneId}
        end
        return nil
    end

    if entry.RewardPreviewType == rewardPreviewType.PetSpeciesId then
        local speciesName, speciesIcon, _, _, _, _, _, _, _, _, _, displayId = C_PetJournal.GetPetInfoBySpeciesID(entry.RewardId)
        entry.Name = entry.Name or speciesName
        entry.Icon = entry.Icon or speciesIcon
        if displayId then
            return {Kind = "Model", DisplayId = displayId, SpeciesId = entry.RewardId}
        end
        return nil
    end

    if entry.RewardPreviewType == rewardPreviewType.HousingDecorId then
        if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
            return nil
        end
        local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, Enum.HousingCatalogEntryType.Decor, entry.RewardId)
        if not ok then
            addon.Diagnostics.Debug("GetCatalogEntryInfoByRecordID failed for " .. entry.RewardId .. ": " .. tostring(info))
            return nil
        end
        if info then
            entry.Name = entry.Name or info.name
            entry.Icon = entry.Icon or info.iconTexture
            entry.IconAtlas = entry.IconAtlas or info.iconAtlas
            if info.asset then
                return {Kind = "Model", Asset = info.asset, SceneId = info.uiModelSceneID}
            end
            addon.Diagnostics.Debug("No asset found for housing decor " .. entry.RewardId)
        end
        return nil
    end

    return nil
end
rewardPreviewData.BuildPreviewData = BuildPreviewData

function rewardPreviewData.GetPreviewableEntries(achievementId)
    local entries = addon.Data.RewardPreviewData[achievementId]
    if not entries then
        return nil
    end

    local previewable = {}
    for _, entry in next, entries do
        if BuildPreviewData(entry) then
            tinsert(previewable, entry)
        end
    end

    if #previewable == 0 then
        return nil
    end
    return previewable
end

function rewardPreviewData.HasPreviewableEntries(achievementId)
    return rewardPreviewData.GetPreviewableEntries(achievementId) ~= nil
end

function rewardPreviewData.GetLabel(entry)
    return entry.Name or ("#" .. entry.RewardId)
end

-- Returns texture, atlas (only one of the two is ever set)
function rewardPreviewData.GetIcon(entry)
    return entry.Icon, entry.IconAtlas
end
