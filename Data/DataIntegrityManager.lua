local _, addon = ...
local diagnostics = addon.Diagnostics
local data = addon.Data
data.DataIntegrityManager = {}
local dataIntegrityManager = data.DataIntegrityManager

local LoadVerifications, Verify, LoadSolutions, Resolve

local function VersionLessThan(a, b)
    local aParts = {strsplit(".", a)}
    local bParts = {strsplit(".", b)}
    for i = 1, math.max(#aParts, #bParts) do
        local aNum = tonumber(aParts[i]) or 0
        local bNum = tonumber(bParts[i]) or 0
        if aNum < bNum then return true end
        if aNum > bNum then return false end
    end
    return false -- equal
end

local function IsNewerThan(prevBuild, currBuild, prevVersion, currVersion)
    if prevBuild == nil or prevVersion == nil then return true end
    if VersionLessThan(prevBuild, currBuild) then return true end
    return prevBuild == currBuild and VersionLessThan(prevVersion, currVersion)
end

function dataIntegrityManager.Load()
    KrowiAF_SavedData = KrowiAF_SavedData or {} -- Does not exist yet for new users
    KrowiAF_SavedData.Fixes = KrowiAF_SavedData.Fixes or {} -- Does not exist yet for new users
    KrowiAF_SavedData.Verifications = KrowiAF_SavedData.Verifications or {} -- Does not exist yet for new users

    local prevBuild = KrowiAF_SavedData["Build"]
    diagnostics.Debug("Previous Build: " .. tostring(prevBuild)) -- Can be nil
    KrowiAF_SavedData["Build"] = addon.Metadata.Build
    local currBuild = KrowiAF_SavedData["Build"]
    diagnostics.Debug("Current Build: " .. KrowiAF_SavedData["Build"])

    local prevVersion = KrowiAF_SavedData["Version"]
    diagnostics.Debug("Previous Version: " .. tostring(prevVersion)) -- Can be nil
    KrowiAF_SavedData["Version"] = addon.Metadata.Version
    local currVersion = KrowiAF_SavedData["Version"]
    diagnostics.Debug("Current Version: " .. KrowiAF_SavedData["Version"])

    local firstTime = prevBuild == nil and prevVersion == nil
    Resolve(LoadSolutions(), prevBuild, currBuild, prevVersion, currVersion, firstTime)

    Verify(LoadVerifications())

    diagnostics.Debug("SavedData loaded")
end

local VerifyCharacterList, VerifyAchievementsData
function LoadVerifications()
    local verifications = {
        VerifyCharacterList, -- 1
        VerifyAchievementsData, -- 2
    }

    return verifications
end

function Verify(verifications)
    for _, verification in next, verifications do
        verification()
    end
    diagnostics.Debug("Verified all")
end

function LoadSolutions()
    local solutions = {
        -- Add new solutions here
    }

    return solutions
end

function Resolve(solutions, prevBuild, currBuild, prevVersion, currVersion, firstTime)
    if not IsNewerThan(prevBuild, currBuild, prevVersion, currVersion) then
        diagnostics.Debug("Nothing to resolve, same build and version")
        return
    end

    for _, solution in next, solutions do
        solution(prevBuild, currBuild, prevVersion, currVersion, firstTime)
    end
    diagnostics.Debug("Resolved all")
end

function VerifyCharacterList()
    if not KrowiAF_SavedData.CharacterList then
        diagnostics.Debug("Nothing to verify for CharacterList")
        return
    end

    for guid, character in next, KrowiAF_SavedData.CharacterList do
        local _, realm, name = strsplit("-", guid)
        if character.Name == nil then
            KrowiAF_SavedData.CharacterList[guid].Name = name
        end
        if character.Realm == nil then
            KrowiAF_SavedData.CharacterList[guid].Realm = realm
        end
    end

    diagnostics.Debug("Verified CharacterList")
end

function VerifyAchievementsData()
    if not addon.Util.IsMainline or not KrowiAF_Achievements then
        diagnostics.Debug("Nothing to verify for AchievementsData")
        return
    end
    if KrowiAF_SavedData.Verifications.AchievementsData then
        diagnostics.Debug("Already verified AchievementsData")
        return
    end

    for achievementId, _ in next, KrowiAF_Achievements.Completed do
        local achievementInfo = addon.GetAchievementInfoTable(achievementId)
        if achievementInfo.Flags.IsAccountWide then
            KrowiAF_Achievements.Completed[achievementId].EarnedBy = nil
        end
    end

    for achievementId, _ in next, KrowiAF_Achievements.NotCompleted do
        local achievementInfo = addon.GetAchievementInfoTable(achievementId)
        if achievementInfo.Flags.IsAccountWide then
            KrowiAF_Achievements.NotCompleted[achievementId] = nil
        end
    end

    KrowiAF_SavedData.Verifications.AchievementsData = true

    diagnostics.Debug("Verified AchievementsData")
end
