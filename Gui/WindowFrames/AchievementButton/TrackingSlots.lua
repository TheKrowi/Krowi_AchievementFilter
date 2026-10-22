local _, addon = ...
addon.Gui.TrackingSlots = {}
local trackingSlots = addon.Gui.TrackingSlots

-- The checks the addon's Track button makes before it tracks an achievement (docs/work/2026-10-22-free-tracking-slots).
-- The game caps tracked achievements at MAX_TRACKED_ACHIEVEMENTS. One this character earned can stay tracked, after a
-- crash before the game saved or when another character completed it, and Blizzard's tracker hides it while it keeps its
-- slot; so at the cap the checks first stop tracking the achievements that are done, and name each in chat.

-- What the checks read from and do in the game. The tracking suite swaps in a model of it (Tests/Tracking.lua,
-- UseSourceForTest), so the same steps run in game and headlessly; these functions are made once, at load.
local game = {
    GetTrackedIds = function()
        if C_ContentTracking then
            return C_ContentTracking.GetTrackedIDs(Enum.ContentTrackingType.Achievement)
        end
        return {GetTrackedAchievements()}
    end,
    GetNumTracked = function() return GetNumTrackedAchievements() end,
    GetMaxTracked = function() return MAX_TRACKED_ACHIEVEMENTS end,
    GetAchievementInfo = function(id) return GetAchievementInfo(id) end,
    GetAchievementLink = function(id) return GetAchievementLink(id) end,
    GetEarnedByFilter = function() return addon.Filters.db.profile.EarnedBy end,
    Untrack = function(id) RemoveTrackedAchievement(id) end,
    ShowError = function(text) UIErrorsFrame:AddMessage(text, 1.0, 0.1, 0.1, 1.0) end,
    Print = function(...) print(...) end,
}
local source = game

-- Done: the game no longer knows the id, or this character earned it (Blizzard's tracker hides those,
-- Blizzard_AchievementObjectiveTracker.lua LayoutContents), or it is completed and can progress no further, a guild or an
-- account-wide achievement. A character achievement another character completed is kept: this character can still earn
-- it, and Blizzard's own Track button allows it (Blizzard_AchievementUI.lua, AchievementTemplateMixin:ToggleTracking).
function trackingSlots.IsDone(id)
    local knownId, _, _, completed, _, _, _, _, flags, _, _, isGuild, wasEarnedByMe = source.GetAchievementInfo(id)
    if not knownId or wasEarnedByMe then
        return true
    end
    if not completed then
        return false
    end
    return isGuild or addon.Objects.Flags:New(flags).IsAccountWide
end

-- Stops tracking the done achievements and names each in chat; returns how many it stopped tracking
local function FreeDone()
    local freed = 0
    for _, id in ipairs(source.GetTrackedIds()) do -- a new table on both clients, so untracking while walking it is safe
        if trackingSlots.IsDone(id) then
            source.Untrack(id)
            source.Print(addon.Metadata.Title, "-", addon.L["Stopped tracking completed achievement"] .. ":", source.GetAchievementLink(id) or id)
            freed = freed + 1
        end
    end
    return freed
end

-- nil when the achievement may be tracked; otherwise why not, "completed" or "full", after the error is shown. The
-- completed check comes first, so a click that is refused anyway frees nothing.
function trackingSlots.MakeRoom(id)
    local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = source.GetAchievementInfo(id)
    local earnedByFilter = source.GetEarnedByFilter()
    if (earnedByFilter == 'Account' and completed or wasEarnedByMe) or (earnedByFilter == 'CharacterAccount' and completed and wasEarnedByMe) then
        source.ShowError(ERR_ACHIEVEMENT_WATCH_COMPLETED)
        return "completed"
    end

    local max = source.GetMaxTracked()
    local count = source.GetNumTracked()
    -- Counted before freeing, so the answer does not depend on when the game's own count drops
    if count >= max and count - FreeDone() >= max then
        source.ShowError(format(ACHIEVEMENT_WATCH_TOO_MANY, max))
        return "full"
    end
end

-- [[ For the suites ]] --

-- For the tracking suite: a model of the game in place of the game, nil for the game again
function trackingSlots.UseSourceForTest(model)
    source = model or game
end