local _, addon = ...
addon.Tests.Tooltip = {}
local tooltip = addon.Tests.Tooltip

-- Whether the achievement tooltip's transmog set progress section finishes (docs/work/2026-10-08-getiteminfo-removed).
-- A scenario builds the tooltip of an achievement with transmog set data the way hovering it does
-- (addon.Gui.AchievementTooltip:ShowTooltip) and records "done" when the section replaced its "Collecting data" line
-- with the set progress lines, or "stuck" when "Collecting data" is still there. Recorded is the behaviour of the
-- current code; Target the desired behaviour. The same scenarios run in game (/kaftest tooltip) against the real tooltip
-- and data, and headlessly (.claude/tools/headless/run-tests.lua) against a model of the transmog and item APIs.
--
-- What 12.1.5 changes: Blizzard deleted Blizzard_DeprecatedItemScript, the file that defined the global GetItemInfo as
-- C_Item.GetItemInfo (and on 12.1.0 only when the loadDeprecationFallbacks CVar is on). The section read the item's equip
-- slot through that global inside a coroutine, so the call failed with "attempt to call a nil value", coroutine.resume
-- swallowed the error and the tooltip kept "Collecting data". The headless environment has no global GetItemInfo, like
-- 12.1.5. The in-game run simulates 12.1.5 by clearing the global for the scenario and restoring it afterwards: an addon
-- write to a global taints that key until the next /reload, which is harmless here because nothing secure reads the old
-- alias (Blizzard's code calls C_Item.GetItemInfo), but reload before relying on another addon that still calls it.
--
-- The section only finishes at once when the set items are in the item cache; otherwise it waits for
-- GET_ITEM_INFO_RECEIVED. The suite's Ready check requests the items and waits until the cache has them, so the line can
-- be read right after the tooltip is built. Retail only: no Classic achievement has transmog set data.

-- Id: the achievement whose tooltip is built (one with TransmogSetIds; the headless model uses a fake with this id)
-- Recorded / Target: "done" or "stuck"
-- Before the fix the section never finished on 12.1.5 ("stuck", verified in game on the 12.1.5 PTR on 2026-10-08); it now
-- reads the item through C_Item.GetItemInfo
tooltip.Scenarios = {
    {Name = "transmog-set-progress", Id = 40469, -- I'm Bringing Nerub-ack, DataAddons/Retail/11_TheWarWithin/TransmogSetData.lua
        Recorded = "done", Target = "done"}
}

-- env: IsRetail(), Setup(scenario, observations) -> ok[, reason], Show(scenario) -> ok[, reason], Lines() -> list of the
-- tooltip's left texts, CollectingText(), ProgressText(), Teardown()
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function Inspect(env)
    local lines = env.Lines()
    local progressAt
    for i, text in ipairs(lines) do
        if text == env.CollectingText() then
            return "stuck"
        end
        if text == env.ProgressText() then
            progressAt = i
        end
    end
    if progressAt and #lines > progressAt then
        return "done"
    end
    return "empty" -- no section output at all: the section did not run
end

local function RunScenario(env, scenario, observations)
    local ready, reason = env.Setup(scenario, observations)
    local got
    if ready then
        local ok, err = pcall(function()
            local shown, why = env.Show(scenario)
            if shown then
                got = Inspect(env)
            else
                reason = why or "cannot show the tooltip"
            end
        end)
        env.Teardown() -- after an error too: it puts the global and the tooltip back
        if not ok then
            error(err, 0)
        end
    end

    local status, targetMet, tail
    if not got then
        status, tail = "SKIP", reason or "setup failed"
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=%s target=%s %s"):format(got, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("tooltip/%s: %s id=%d recorded=%s %s"):format(scenario.Name, status, scenario.Id, scenario.Recorded, tail)
    }
end

function tooltip.Run(env, observations)
    local results = {}
    if not env.IsRetail() then
        tinsert(observations, "no scenarios on Classic: no achievement there has transmog set data")
        return results
    end
    for _, scenario in ipairs(tooltip.Scenarios) do
        tinsert(results, RunScenario(env, scenario, observations))
    end
    return results
end

-- [[ Environment: the real tooltip, data and item cache; the headless runner provides a model of the same calls ]] --

local gameEnv = {}
tooltip.GameEnv = gameEnv

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

function gameEnv.CollectingText()
    return addon.L["Collecting data"]
end

function gameEnv.ProgressText()
    return addon.L["Objectives progress"]
end

-- The item ids of the achievement's usable transmog sets; nil and a reason when the scenario cannot run here
local function GetSetItems(achievementId)
    local achievement = addon.Data.Achievements[achievementId]
    if not achievement or not achievement.TransmogSetIds then
        return nil, "achievement " .. achievementId .. " has no transmog set data"
    end
    local setIds = addon.GetUsableSets(achievement.TransmogSetIds)
    if #setIds == 0 then
        return nil, "this character's class has no usable set for achievement " .. achievementId
    end
    local items = {}
    for _, setId in ipairs(setIds) do
        for _, appearance in ipairs(C_TransmogSets.GetSetPrimaryAppearances(setId) or {}) do -- MayReturnNothing
            local sourceInfo = C_TransmogCollection.GetSourceInfo(appearance.appearanceID)
            if sourceInfo and sourceInfo.itemID then
                tinsert(items, sourceInfo.itemID)
            end
        end
    end
    return items
end

addon.Tests.Ready.tooltip = function()
    if not addon.Util.IsMainline then
        return true
    end
    if not addon.Data.Achievements[tooltip.Scenarios[1].Id] then
        return false, "the achievement data is not loaded yet"
    end
    for _, scenario in ipairs(tooltip.Scenarios) do
        local items = GetSetItems(scenario.Id)
        for _, itemId in ipairs(items or {}) do
            if not select(9, C_Item.GetItemInfo(itemId)) then
                C_Item.RequestLoadItemDataByID(itemId)
                return false, "loading the set items of achievement " .. scenario.Id .. " into the item cache"
            end
        end
    end
    return true
end

local anchor, savedGetItemInfo, cleared, touchedGlobal
function gameEnv.Setup(scenario, observations)
    if not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show then
        return false, "Objectives progress is off in the tooltip options"
    end
    local items, reason = GetSetItems(scenario.Id)
    if not items then
        return false, reason
    end
    anchor = anchor or CreateFrame("Frame", nil, UIParent)
    anchor:SetSize(100, 20)
    anchor:SetPoint("CENTER")
    -- Last, so nothing that can error runs between clearing the global and RunScenario's pcall around Show and Teardown.
    -- Only a client that still has the global gets a write (12.1.0 with loadDeprecationFallbacks on); 12.1.5 gets none.
    savedGetItemInfo = _G["GetItemInfo"] -- by string: the removed-api lint rule bans reading the name, which is the point
    tinsert(observations, ("global GetItemInfo %s before the run (12.1.5 removes it; 12.1.0 has it with loadDeprecationFallbacks on)"):format(savedGetItemInfo and "present" or "absent"))
    if savedGetItemInfo ~= nil then
        _G["GetItemInfo"] = nil
        cleared, touchedGlobal = true, true
    end
    return true
end

function gameEnv.Show(scenario)
    local achievement = addon.Data.Achievements[scenario.Id]
    anchor.Achievement = achievement -- the section checks the tooltip owner's achievement before it writes
    addon.Gui.AchievementTooltip:ShowTooltip(anchor, achievement)
    return true
end

function gameEnv.Lines()
    local lines = {}
    for i = 1, Krowi_Tooltip:NumLines() do
        tinsert(lines, _G["Krowi_TooltipTextLeft" .. i]:GetText() or "")
    end
    return lines
end

function gameEnv.Teardown()
    if cleared then
        _G["GetItemInfo"] = savedGetItemInfo
        cleared = nil
    end
    savedGetItemInfo = nil
    Krowi_Tooltip:Hide()
    if anchor then
        anchor.Achievement = nil
    end
end

addon.Tests.Suites.tooltip = function()
    local observations = {}
    touchedGlobal = nil
    local results = tooltip.Run(gameEnv, observations)
    if touchedGlobal then
        tinsert(observations, "the run cleared and restored the global GetItemInfo, which stays tainted until the next /reload")
    end
    return results, observations
end