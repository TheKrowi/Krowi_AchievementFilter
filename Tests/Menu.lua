local _, addon = ...
addon.Tests.Menu = {}
local menu = addon.Tests.Menu

-- Whether the right-click menu greys out a "go to" entry for an achievement the addon does not register
-- (docs/work/2026-10-11-latent-bugs, defect B). AchievementMenu:AddGoToAchievementLine labels such an entry "(Missing)"
-- and means to disable it, but until 2026-10-13 passed its disabled flag where the menu builder takes isEnabled. The
-- builder disables an entry only when that argument is false (Libs/Krowi_Menu/Krowi_MenuBuilder.lua:
-- CreateSubmenuButton, Retail and Classic), so true left it enabled. A scenario builds the entry the way the related-achievement sections do (chain,
-- required for, other faction, first category) and records "enabled" or "disabled". In game (/kaftest menu) the entry
-- goes into a real root menu, a Blizzard menu description on Retail read back with IsEnabled and a Krowi_Menu_2 menu item
-- on Classic read back through its Disabled field; headlessly (.claude/tools/headless/run-tests.lua) into a model of the
-- builder's rule.

-- Missing: the entry links to an id the game knows and the addon does not register (found at run time in game, a fake id
--   headlessly; it is reported as an observation, so the lines of both runs stay comparable); otherwise Id is an
--   achievement every client registers
-- Recorded / Target: "enabled" or "disabled"
-- Before the fix the "(Missing)" entry stayed enabled (verified in game on Retail 12.1.0 and Classic 5.5.4 on 2026-10-11,
-- linking to 49); it now passes isEnabled = false
menu.Scenarios = {
    {Name = "missing-achievement-entry", Missing = true,
        Recorded = "disabled", Target = "disabled"},
    {Name = "registered-achievement-entry", Id = 6, -- Level 10, DataAddons/Shared/03_WrathOfTheLichKing/AchievementData.lua
        Recorded = "enabled", Target = "enabled"}
}

-- env: MissingId(observations) -> id or nil, reason; Build(id) -> root; IsEntryEnabled(root) -> bool or nil, reason
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(env, scenario, observations)
    local id, reason = scenario.Id, nil
    if scenario.Missing then
        id, reason = env.MissingId(observations)
    end
    local got
    if id then
        local enabled
        enabled, reason = env.IsEntryEnabled(env.Build(id))
        if enabled ~= nil then
            got = enabled and "enabled" or "disabled"
        end
    end

    local status, targetMet, tail
    if not got then
        status, tail = "SKIP", reason or "no entry was built"
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=%s target=%s %s"):format(got, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("menu/%s: %s recorded=%s %s"):format(scenario.Name, status, scenario.Recorded, tail)
    }
end

function menu.Run(env, observations)
    local results = {}
    for _, scenario in ipairs(menu.Scenarios) do
        tinsert(results, RunScenario(env, scenario, observations))
    end
    return results
end

-- [[ Environment: the real menu builder and data; the headless runner provides a model of the same calls ]] --

local gameEnv = {}
menu.GameEnv = gameEnv

local highestIdToScan = 100000 -- past the highest achievement id of either client; the first hit is a low statistic id

function gameEnv.MissingId(observations)
    for id = 1, highestIdToScan do
        if not addon.Data.Achievements[id] and GetAchievementInfo(id) then
            tinsert(observations, ("missing-achievement-entry links to %d, which the game knows and the addon does not register"):format(id))
            return id
        end
    end
    return nil, "every achievement id up to " .. highestIdToScan .. " is registered or unknown to the game"
end

function gameEnv.Build(id)
    local root
    if addon.Util.IsMainline then
        root = MenuUtil.CreateRootMenuDescription(MenuVariants.GetDefaultContextMenuMixin())
    else
        root = LibStub("Krowi_Menu_2").MenuItem:New({Text = "root"})
    end
    addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementLine(root, id)
    return root
end

function gameEnv.IsEntryEnabled(root)
    if addon.Util.IsMainline then
        for _, description in root:EnumerateElementDescriptions() do
            return description:IsEnabled()
        end
        return nil, "the root menu got no entry"
    end
    local entry = root.Children and root.Children[1]
    if not entry then
        return nil, "the root menu got no entry"
    end
    return not entry.Disabled
end

addon.Tests.Ready.menu = function()
    for _, scenario in ipairs(menu.Scenarios) do
        if scenario.Id and not addon.Data.Achievements[scenario.Id] then
            return false, "the achievement data is not loaded yet"
        end
    end
    return true
end

addon.Tests.Suites.menu = function()
    local observations = {}
    local results = menu.Run(gameEnv, observations)
    return results, observations
end