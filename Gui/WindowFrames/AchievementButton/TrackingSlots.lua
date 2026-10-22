local _, addon = ...
addon.Gui.TrackingSlots = {}
local trackingSlots = addon.Gui.TrackingSlots

-- The checks the addon's Track button makes before it tracks an achievement (docs/work/2026-10-22-free-tracking-slots).

-- What the checks read from the game. The tracking suite swaps in a model of it (Tests/Tracking.lua, UseSourceForTest),
-- so the same steps run in game and headlessly; these functions are made once, at load.
local game = {
    GetNumTracked = function() return GetNumTrackedAchievements() end,
    GetMaxTracked = function() return MAX_TRACKED_ACHIEVEMENTS end,
    GetAchievementInfo = function(id) return GetAchievementInfo(id) end,
    GetEarnedByFilter = function() return addon.Filters.db.profile.EarnedBy end,
    ShowError = function(text) UIErrorsFrame:AddMessage(text, 1.0, 0.1, 0.1, 1.0) end,
}
local source = game

-- nil when the achievement may be tracked; otherwise why not, "full" or "completed", after the error is shown
function trackingSlots.MakeRoom(id)
    local max = source.GetMaxTracked()
    if source.GetNumTracked() >= max then
        source.ShowError(format(ACHIEVEMENT_WATCH_TOO_MANY, max))
        return "full"
    end

    local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = source.GetAchievementInfo(id)
    local earnedByFilter = source.GetEarnedByFilter()
    if (earnedByFilter == 'Account' and completed or wasEarnedByMe) or (earnedByFilter == 'CharacterAccount' and completed and wasEarnedByMe) then
        source.ShowError(ERR_ACHIEVEMENT_WATCH_COMPLETED)
        return "completed"
    end
end

-- [[ For the suites ]] --

-- For the tracking suite: a model of the game in place of the game, nil for the game again
function trackingSlots.UseSourceForTest(model)
    source = model or game
end