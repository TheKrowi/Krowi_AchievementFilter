local _, addon = ...
addon.Tests.Navigation = {}
local navigation = addon.Tests.Navigation

-- Which navigation buttons the achievement window's header shows on each tab (issue #325). A scenario
-- selects tabs in order, the way the addon's own key bindings do (KrowiAF_ToggleAchievementFrame with
-- forceOpen), optionally toggles Track Achievement Browser History off and on again, and records which
-- navigation is visible: Back is Blizzard's HeaderDetails.Back (Retail 12.1 and later only), Arrows the
-- addon's browsing-history buttons (Gui/BrowsingHistory/BrowsingHistory.lua). Recorded is the behaviour of
-- the current code, verified in game; a scenario passes when the code still behaves that way. Target is
-- the desired behaviour; scenarios whose Recorded differs from Target are open defects, counted separately.
-- The same scenarios run in game (/kaftest navigation) against the real frames and headlessly
-- (.claude/tools/headless/run-tests.lua) against a model of Blizzard_AchievementUI's tab switching.
--
-- How the header works on Retail 12.1 (Blizzard_AchievementUI/Mainline, live): the HeaderDetails strip above
-- the list holds Back (UIPanelButtonTemplate, 100 x 22 at TOPLEFT 6, -10) and the Filters frame.
-- AchievementFrameBaseTab_OnClick shows the tab's page through AchievementFrame_ShowSubFrame, refreshes the
-- guild or personal look on tabs 1 and 2 (InitAchievementPage -> AchievementFrame_RefreshView), and ends with
-- AchievementFrame_RefreshBackButton(tabIndex ~= Statistics), so Back shows on every tab but Statistics. The
-- addon's post-hook on AchievementFrame_ShowSubFrame (Gui/Gui.lua) shows only the addon sub frames a tab
-- lists; its search box hides Back in OnShow. Classic has no HeaderDetails and no Back; the arrows sit in
-- AchievementFrame.Header next to the points.
-- The first in-game run (Retail 12.1.0, 2026-09-30, before the #325 fix) matched the model line for line: 7 PASS,
-- 1 SKIP (Blizzard's own Achievements tab hidden, its default), 0 addon errors.

-- Order of the keys is the order they are listed in the results
navigation.Keys = {"Back", "Arrows"}

-- Tab keys: the tab button the addon registered (KrowiAF_RegisterTabButton) under addon name and tab name
navigation.Tabs = {
    Addon = {"Krowi_AchievementFilter", "Achievements"},
    BlizzardAchievements = {"Blizzard_AchievementUI", "Achievements"},
    Guild = {"Blizzard_AchievementUI", "Guild"},
    Statistics = {"Blizzard_AchievementUI", "Statistics"}
}

-- Tabs: selected in that order, starting from a closed window. Toggle: the browsing history option is set
-- off and on again after the last tab, through the option's own setter. Recorded / Target: navigation
-- visible afterwards. RecordedClassic / TargetClassic: Classic values where they differ.
-- Target (decided 2026-09-30, docs/work/325-guild-tab-nav-buttons/spec.md): the arrows only on the addon's
-- tabs, Blizzard's tabs keep Blizzard's own Back; Classic unchanged.
navigation.Scenarios = {
    {Name = "addon-tab", Tabs = {"Addon"}, Recorded = {"Arrows"}, Target = {"Arrows"}},
    {Name = "guild-tab", Tabs = {"Guild"}, Recorded = {"Back", "Arrows"}, Target = {"Back"}, RecordedClassic = {"Arrows"}, TargetClassic = {"Arrows"}}, -- #325: both drawn on the same spot
    {Name = "statistics-tab", Tabs = {"Statistics"}, Recorded = {"Arrows"}, Target = {}, RecordedClassic = {"Arrows"}, TargetClassic = {"Arrows"}},
    {Name = "blizzard-achievements-tab", Tabs = {"BlizzardAchievements"}, Recorded = {"Back", "Arrows"}, Target = {"Back"}, RecordedClassic = {"Arrows"}, TargetClassic = {"Arrows"}},
    {Name = "addon-then-guild", Tabs = {"Addon", "Guild"}, Recorded = {"Back", "Arrows"}, Target = {"Back"}, RecordedClassic = {"Arrows"}, TargetClassic = {"Arrows"}},
    {Name = "guild-then-addon", Tabs = {"Guild", "Addon"}, Recorded = {"Arrows"}, Target = {"Arrows"}},
    {Name = "guild-tab-option-toggled", Tabs = {"Guild"}, Toggle = true, Recorded = {"Back", "Arrows"}, Target = {"Back"}, RecordedClassic = {"Arrows"}, TargetClassic = {"Arrows"}},
    {Name = "addon-tab-option-toggled", Tabs = {"Addon"}, Toggle = true, Recorded = {"Arrows"}, Target = {"Arrows"}}
}

local function Keys(list)
    local set = {}
    for _, key in ipairs(list) do
        set[key] = true
    end
    local ordered = {}
    for _, key in ipairs(navigation.Keys) do
        if set[key] then
            tinsert(ordered, key)
        end
    end
    return table.concat(ordered, ",")
end

-- env: IsRetail(), Setup() -> ok[, reason], SelectTab(tabKey) -> ok[, reason], ToggleOption(), IsVisible(key),
-- Reset() (closes the window), Teardown()
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(env, scenario, isRetail, setupProblem)
    local recorded = (not isRetail and scenario.RecordedClassic) or scenario.Recorded
    local target = (not isRetail and scenario.TargetClassic) or scenario.Target
    local blocked = setupProblem
    local got
    if not blocked then
        env.Reset()
        for _, tabKey in ipairs(scenario.Tabs) do
            if not blocked then
                local selected, reason = env.SelectTab(tabKey)
                if not selected then
                    blocked = "cannot select " .. tabKey .. (reason and (": " .. reason) or "")
                end
            end
        end
        if not blocked then
            if scenario.Toggle then
                env.ToggleOption()
            end
            local visible = {}
            for _, key in ipairs(navigation.Keys) do
                if env.IsVisible(key) then
                    tinsert(visible, key)
                end
            end
            got = table.concat(visible, ",")
        end
    end

    local status, targetMet, tail
    if blocked then
        status, tail = "SKIP", blocked
    else
        status = got == Keys(recorded) and "PASS" or "FAIL"
        targetMet = got == Keys(target)
        tail = ("got=[%s] target=[%s] %s"):format(got, Keys(target), targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("navigation/%s: %s tabs=[%s] toggle=%s recorded=[%s] %s"):format(scenario.Name, status, table.concat(scenario.Tabs, ","), scenario.Toggle and "yes" or "no", Keys(recorded), tail)
    }
end

function navigation.Run(env)
    local results = {}
    local isRetail = env.IsRetail()
    local ready, reason = env.Setup()
    local setupProblem = not ready and (reason or "setup failed") or nil
    for _, scenario in ipairs(navigation.Scenarios) do
        tinsert(results, RunScenario(env, scenario, isRetail, setupProblem))
    end
    if ready then
        env.Teardown()
    end
    return results
end

-- [[ In-game environment: the real frames, tabs and option setter ]] --

local gameEnv = {}
navigation.GameEnv = gameEnv
local observations = {}

local optionPath = "Layout.args.Header.args.BrowserHistory.args.Track" -- Options/Layout.lua, BrowserHistoryTrackSet

local function Arrows()
    return KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton, KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton
end

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

local snapshot
function gameEnv.Setup()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    if not AchievementFrame then
        AchievementFrame_LoadUI()
    end
    if not Arrows() then
        return false, "the browsing history buttons do not exist (Track Achievement Browser History was off at login)"
    end
    if not addon.Options.db.profile.TrackAchievementBrowserHistory then
        return false, "Track Achievement Browser History is off"
    end
    if not addon.InjectOptions:GetTable(optionPath) then
        return false, "layout option " .. optionPath .. " is not injected"
    end
    snapshot = {
        Shown = AchievementFrame:IsShown(),
        Tab = PanelTemplates_GetSelectedTab(AchievementFrame)
    }
    tinsert(observations, "window was " .. (snapshot.Shown and ("open on tab " .. tostring(snapshot.Tab)) or "closed"))
    return true
end

function gameEnv.Reset()
    if AchievementFrame:IsShown() then
        AchievementFrame:Hide()
    end
end

function gameEnv.SelectTab(tabKey)
    local addonName, tabName = unpack(navigation.Tabs[tabKey])
    local button = addon.Gui.Tabs[addonName] and addon.Gui.Tabs[addonName][tabName]
    if not button then
        return false, "no such tab on this client"
    end
    if not button:IsShown() then
        return false, "the tab is hidden (Options > Layout > Tabs)"
    end
    KrowiAF_ToggleAchievementFrame(addonName, tabName, nil, true)
    return true
end

function gameEnv.ToggleOption()
    local option = addon.InjectOptions:GetTable(optionPath)
    option.set(nil, false)
    option.set(nil, true)
end

function gameEnv.IsVisible(key)
    if key == "Back" then
        return AchievementFrame.HeaderDetails ~= nil and AchievementFrame.HeaderDetails.Back:IsVisible()
    end
    local prevButton, nextButton = Arrows()
    return prevButton:IsVisible() or nextButton:IsVisible()
end

function gameEnv.Teardown()
    if not snapshot.Shown then
        gameEnv.Reset()
    elseif snapshot.Tab then
        local ourTab = addon.Gui.AchievementFrameTabButtonFactory:GetTabs()[snapshot.Tab]
        if ourTab then
            ourTab:Select()
        else
            AchievementFrameTab_OnClick(snapshot.Tab) -- what the addon's registered select functions for Blizzard's tabs call
        end
    end
    snapshot = nil
end

addon.Tests.Suites.navigation = function()
    wipe(observations)
    return navigation.Run(gameEnv), observations
end

addon.Tests.Ready.navigation = function()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end