local _, addon = ...

KrowiAF.GuideData = {}

function KrowiAF.AddGuideData(achievementId, steps)
    local achievement = addon.Data.Achievements[achievementId]
    if not achievement then
        addon.Data.LoadDiagnostics:Report(addon.Data.LoadDiagnostics.Kind.UnregisteredAchievement, achievementId, "guide")
        return
    end
    assert(not achievement.Guide, "Achievement " .. achievementId .. " already has a guide")
    achievement.Guide = steps
end