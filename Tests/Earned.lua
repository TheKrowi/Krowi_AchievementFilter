local addonName, addon = ...
addon.Tests.Earned = {}
local earned = addon.Tests.Earned

-- What the achievement window recounts when an achievement is earned and the window is then opened on it, the way a
-- click on the achievement's toast does (docs/work/2026-10-25-toast-script-too-long). Blizzard's toast calls
-- AchievementFrame_SelectAchievement, the addon's replacement in Gui/BlizzardOverrides.lua, which selects the
-- achievement through KrowiAF_SelectAchievementFromID (Api/API.lua). An earn set one window-wide flag
-- (Data/AchievementCache.lua), and the categories frame's next OnShow recounted every top-level category of the tab it
-- showed: the 7149 rows of the Retail Expansions tab in one script, which the game stopped in combat with "script ran
-- too long". The categories frame recounts per top-level category (GetDisplayCategories in CategoriesFrameMixin.lua),
-- so a scenario records which top-level categories GetAchievementNumbers ran on. It simulates an earn through
-- addon.MarkEarnedInWindow, which saves nothing.
-- Recount labels: "whole tab" when every top-level category of the tab that the earn cannot change was recounted,
-- "earned only" when none of those was and the earned achievement's own one was, "none" when neither, and "partly n/m"
-- otherwise. The earn can change the top-level categories above every place the achievement and the next ones in its
-- series are listed, and the flexible ones (Current Zone, Watch List, ...). Labels, not counts, so the game and
-- headless lines agree while the special categories the options enable differ; the counts go to the observations.
-- The same scenarios run in game (/kaftest earned) against the real window and headlessly
-- (.claude/tools/headless/run-tests.lua) on the real data load, with a model of the window's tab switching.

earned.Achievement = 862 -- Explore Hellfire Peninsula: Expansions > The Burning Crusade > Zones on both clients
earned.EventsAchievement = 605 -- a Lunar Festival achievement: Events > Holidays on both clients

-- Recorded / Target, RecordedClassic / TargetClassic where the clients differ. Each scenario starts with the tabs it uses
-- recounted and showing the earned achievement's top-level category, not the Summary: a shown Summary refreshes on an
-- earn too (KrowiAF_SummaryFrameMixin:OnShow), which earn-select-summary covers. GameOnly: the headless model has no
-- Summary frame, so only the game runs it.
earned.Scenarios = {
    -- Expansions drawn, window closed, 862 earned, then selected as the toast does
    {Name = "earn-select-closed", Recorded = "whole tab, selected", Target = "earned only, selected"},
    -- the same with the Expansions Summary selected when the window closed; the first in-game run (Retail 12.1.5,
    -- 2026-10-25) validated 20686 rows in 276 ms here, out of combat: the Summary's earn refresh recounted the tab a second
    -- time (Update(true) in SummaryFrameMixin.lua)
    {Name = "earn-select-summary", GameOnly = true, Recorded = "whole tab, selected", Target = "earned only, selected"},
    -- the window open on Expansions when 862 is earned: the categories frame's refresh one second later
    {Name = "earn-window-open", Recorded = "whole tab", Target = "earned only"},
    -- Events and Expansions drawn, window closed, 605 earned, opened on Expansions, then switched to Events: is the
    -- top-level category that holds 605 recounted?
    {Name = "earn-other-tab", Recorded = "not recounted", Target = "recounted"},
    -- after selecting 862, every Expansions category is shown when its parent is on the selected category's path and
    -- expanded when it is on the path itself
    {Name = "expand-path-state", Recorded = "matches path rule", Target = "matches path rule"},
    -- every Expansions achievement filtered out, then 862's category selected: is it listed and selected, and what was
    -- recounted on the way?
    {Name = "select-empty-category", Recorded = "selected, whole tab", Target = "selected, none"}
}

-- "raised at <file> line <n>: <message>": an observation in the "<file>:<n>: " form would read as a failing scenario to
-- the unit-tests lint rule, which parses run-tests.lua -check output
local function DescribeError(problem)
    local file, line, message = tostring(problem):match("^(.-):(%d+): (.*)$")
    if not file then
        return "raised: " .. tostring(problem)
    end
    return ("raised at %s line %s: %s"):format(file, line, message)
end

local function TopLevel(category)
    while category.Parent and not category.Parent.TabName do
        category = category.Parent
    end
    return category
end

-- Runs call(...) with both counters on and puts the real functions back, also when the call raises
local recounted, rows = {}, 0
local function Count(call, ...)
    wipe(recounted)
    rows = 0
    local class, getRow = addon.Objects.Category, addon.GetAchievementNumbers
    local getNumbers = class.GetAchievementNumbers
    class.GetAchievementNumbers = function(self, ...)
        if self.Parent and self.Parent.TabName then
            recounted[self] = true
        end
        return getNumbers(self, ...)
    end
    addon.GetAchievementNumbers = function(...)
        rows = rows + 1
        return getRow(...)
    end
    local ok, result = pcall(call, ...)
    class.GetAchievementNumbers, addon.GetAchievementNumbers = getNumbers, getRow
    if not ok then
        error(result, 0)
    end
    return result
end

local function AddPlaces(set, achievement)
    if achievement.Category then
        set[TopLevel(achievement.Category)] = true
    end
    for _, key in next, {"MoreCategories", "WatchListCategories", "ExcludedCategories"} do
        for _, category in next, achievement[key] or {} do
            set[TopLevel(category)] = true
        end
    end
end

-- The top-level categories an earn of this achievement can change
local function EarnSet(achievement)
    local set = {}
    AddPlaces(set, achievement)
    for _, nextAchievement in next, achievement.NextAchievements or {} do
        AddPlaces(set, nextAchievement)
    end
    for _, tab in next, addon.Tabs do
        for _, category in next, tab.Categories or {} do
            if category.HasFlexibleData then
                set[category] = true
            end
        end
    end
    return set
end

local function RecountLabel(tabName, set, own)
    local others, othersRecounted = 0, 0
    for _, category in next, addon.Tabs[tabName].Categories do
        if not set[category] then
            others = others + 1
            if recounted[category] then
                othersRecounted = othersRecounted + 1
            end
        end
    end
    if others > 0 and othersRecounted == others then
        return "whole tab"
    end
    if othersRecounted > 0 then
        return ("partly %d/%d"):format(othersRecounted, others)
    end
    return own and recounted[own] and "earned only" or "none"
end

local function OpenTab(tabName)
    KrowiAF_ToggleAchievementFrame(addonName, tabName, nil, true)
end

-- The tab shown on the given category (the earned achievement's top-level one unless told otherwise), with every
-- top-level category counted and no earn pending
local function Fresh(achievementId, category)
    local achievement = addon.Data.Achievements[achievementId]
    KrowiAF_SelectCategory(category or TopLevel(achievement.Category))
    KrowiAF_CategoriesFrame:Update(true)
    return achievement
end

local function Summary(tabName)
    for _, category in next, addon.Tabs[tabName].Categories do
        if category.IsSummary then
            return category
        end
    end
end

local function Selected(achievement)
    local category = addon.Gui.SelectedTab and addon.Gui.SelectedTab.SelectedCategory
    for _, key in next, {"Achievements", "MergedAchievements"} do
        for _, listed in next, category and category[key] or {} do
            if listed == achievement then
                return true
            end
        end
    end
    return false
end

-- env: IsRetail(), Setup() -> ok[, reason], CloseWindow(), Select(id) (the toast's call), Teardown(); in game only InGame
-- and Clock()
local steps = {}

-- The window closed on the tab as Fresh left it, the achievement earned, then selected as its toast does
local function SelectAfterEarn(env, notes, name, achievement)
    env.CloseWindow()
    addon.MarkEarnedInWindow(achievement.Id)
    local started = env.Clock and env.Clock()
    Count(env.Select, achievement.Id)
    tinsert(notes, ("%s: the select validated %d achievement rows"):format(name, rows))
    if started then
        tinsert(notes, ("%s: the select took %.1f ms"):format(name, env.Clock() - started))
    end
    local recount = RecountLabel("Expansions", EarnSet(achievement), TopLevel(achievement.Category))
    return recount .. ", " .. (Selected(achievement) and "selected" or "not selected")
end

steps["earn-select-closed"] = function(env, notes)
    return SelectAfterEarn(env, notes, "earn-select-closed", Fresh(earned.Achievement))
end

steps["earn-select-summary"] = function(env, notes)
    return SelectAfterEarn(env, notes, "earn-select-summary", Fresh(earned.Achievement, Summary("Expansions")))
end

steps["earn-window-open"] = function()
    local achievement = Fresh(earned.Achievement)
    addon.MarkEarnedInWindow(achievement.Id)
    Count(KrowiAF_CategoriesFrame.OnAchievementEarned, KrowiAF_CategoriesFrame)
    return RecountLabel("Expansions", EarnSet(achievement), TopLevel(achievement.Category))
end

steps["earn-other-tab"] = function(env)
    local achievement = Fresh(earned.EventsAchievement)
    Fresh(earned.Achievement)
    env.CloseWindow()
    addon.MarkEarnedInWindow(achievement.Id)
    OpenTab("Expansions")
    Count(OpenTab, "Events")
    return recounted[TopLevel(achievement.Category)] and "recounted" or "not recounted"
end

steps["expand-path-state"] = function(env, notes)
    Fresh(earned.Achievement)
    env.Select(earned.Achievement)
    local path = {}
    local tree = addon.Gui.SelectedTab.SelectedCategory:GetTree()
    for _, category in next, tree do
        path[category] = true
    end
    local total, mismatches = 0, 0
    local function Check(category)
        total = total + 1
        local shown, expanded = category.NotHidden and true or false, category.NotCollapsed and true or false
        if shown ~= (path[category.Parent] or false) or expanded ~= (path[category] or false) then
            mismatches = mismatches + 1
        end
        for _, child in next, category.Children or {} do
            Check(child)
        end
    end
    for _, category in next, addon.Tabs.Expansions.Categories do
        Check(category)
    end
    tinsert(notes, ("expand-path-state: %d categories checked, %d on the path"):format(total, #tree))
    return mismatches == 0 and "matches path rule" or ("differs in %d of %d"):format(mismatches, total)
end

steps["select-empty-category"] = function()
    local achievement = Fresh(earned.Achievement)
    local completion = addon.Gui.SelectedTab.Filters.Completion
    local completed, notCompleted = completion.Completed, completion.NotCompleted
    completion.Completed, completion.NotCompleted = false, false
    local ok, result = pcall(function()
        KrowiAF_CategoriesFrame:Update(true)
        local category = Count(KrowiAF_SelectCategory, achievement.Category)
        local dataProvider = KrowiAF_CategoriesFrame.ScrollBox:GetDataProvider()
        local shown = dataProvider ~= nil and dataProvider:FindIndex(category) ~= nil
        local selected = addon.Gui.SelectedTab.SelectedCategory == category
        local state = (shown and selected) and "selected" or (shown and "shown, not selected" or "not shown")
        return state .. ", " .. RecountLabel("Expansions", {}, nil)
    end)
    completion.Completed, completion.NotCompleted = completed, notCompleted
    KrowiAF_CategoriesFrame:Update(true)
    if not ok then
        error(result, 0)
    end
    return result
end

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line, GameOnly
local function RunScenario(env, observations, scenario, isRetail, ready, reason)
    local recorded = (not isRetail and scenario.RecordedClassic) or scenario.Recorded
    local target = (not isRetail and scenario.TargetClassic) or scenario.Target
    local status, targetMet, tail
    if not ready then
        status, tail = "SKIP", reason or "setup failed"
    else
        -- no earn left over from the scenario before
        addon.AchievementEarnedUpdateCategoriesFrameOnNextShow, addon.AchievementEarnedUpdateSummaryFrameOnNextShow, addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = nil, nil, nil
        local ok, got = pcall(steps[scenario.Name], env, observations)
        if not ok then
            tinsert(observations, scenario.Name .. " " .. DescribeError(got))
            got = "error"
        end
        status = got == recorded and "PASS" or "FAIL"
        targetMet = got == target
        tail = ("got=[%s] target=[%s] %s"):format(got, target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        GameOnly = scenario.GameOnly,
        Line = ("earned/%s: %s recorded=[%s] %s"):format(scenario.Name, status, recorded, tail)
    }
end

function earned.Run(env, observations)
    local results = {}
    local isRetail = env.IsRetail()
    local ready, reason = env.Setup()
    for _, scenario in ipairs(earned.Scenarios) do
        if env.InGame or not scenario.GameOnly then
            tinsert(results, RunScenario(env, observations, scenario, isRetail, ready, reason))
        end
    end
    if ready then
        env.Teardown()
    end
    return results
end

-- [[ In-game environment: the real window, tabs and toast call ]] --

local gameEnv = {InGame = true}
earned.GameEnv = gameEnv
local observations = {}

local tabNames = {"Events", "Expansions"}

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
    local tabs = addon.Gui.Tabs[addonName]
    for _, tabName in next, tabNames do
        local button = tabs and tabs[tabName]
        if not button then
            return false, "no " .. tabName .. " tab"
        end
        if not button:IsShown() then
            return false, "the " .. tabName .. " tab is hidden (Options > Layout > Tabs)"
        end
    end
    for _, id in next, {earned.Achievement, earned.EventsAchievement} do
        local achievement = addon.Data.Achievements[id]
        if not (achievement and achievement.Category) then
            return false, "achievement " .. id .. " has no category"
        end
    end
    snapshot = {
        Shown = AchievementFrame:IsShown(),
        Flags = {addon.AchievementEarnedUpdateCategoriesFrameOnNextShow, addon.AchievementEarnedUpdateSummaryFrameOnNextShow, addon.AchievementEarnedUpdateAchievementsFrameOnNextShow},
        Tracked = {},
        Selected = {}
    }
    local selectedButton = _G["AchievementFrameTab" .. tostring(PanelTemplates_GetSelectedTab(AchievementFrame))]
    for owner, ownerTabs in next, addon.Gui.Tabs do
        for tabName, button in next, ownerTabs do
            if button == selectedButton then
                snapshot.Tab = {owner, tabName} -- restored through the same toggle the scenarios use
            end
        end
    end
    for _, tabName in next, tabNames do
        snapshot.Selected[tabName] = tabs[tabName].SelectedCategory
    end
    for _, id in next, {earned.Achievement, earned.EventsAchievement} do
        snapshot.Tracked[id] = addon.Data.Achievements[id].IsTracked
    end
    tinsert(observations, "window was " .. (snapshot.Shown and ("open on " .. (snapshot.Tab and table.concat(snapshot.Tab, " ") or "an unregistered tab")) or "closed"))
    return true
end

function gameEnv.CloseWindow()
    if AchievementFrame:IsShown() then
        AchievementFrame:Hide()
    end
end

function gameEnv.Select(id)
    AchievementFrame_SelectAchievement(id)
end

gameEnv.Clock = debugprofilestop

-- Each tab gets its selected category back, the way a click selects one, and is recounted, which also clears the marks
-- the scenarios left; other categories the player had expanded stay collapsed
function gameEnv.Teardown()
    for _, tabName in next, tabNames do
        if snapshot.Selected[tabName] then
            KrowiAF_SelectCategory(snapshot.Selected[tabName])
        else
            OpenTab(tabName)
        end
        KrowiAF_CategoriesFrame:Update(true)
    end
    addon.AchievementEarnedUpdateCategoriesFrameOnNextShow, addon.AchievementEarnedUpdateSummaryFrameOnNextShow, addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = unpack(snapshot.Flags, 1, 3)
    for id, tracked in next, snapshot.Tracked do
        addon.Data.Achievements[id].IsTracked = tracked
    end
    if not snapshot.Shown then
        gameEnv.CloseWindow()
    elseif snapshot.Tab then
        KrowiAF_ToggleAchievementFrame(snapshot.Tab[1], snapshot.Tab[2], nil, true)
    end
    snapshot = nil
end

addon.Tests.Suites.earned = function()
    wipe(observations)
    return earned.Run(gameEnv, observations), observations
end

addon.Tests.Ready.earned = function()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end