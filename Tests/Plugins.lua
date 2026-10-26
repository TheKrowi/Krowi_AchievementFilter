local addonName, addon = ...
addon.Tests.Plugins = {}
local plugins = addon.Tests.Plugins

-- The plugins that bring other addons into the achievement window (Plugins/).
-- Zygor Guides Viewer (issue #365, docs/work/365-zygor-icons): Zygor puts a magnifying glass on each row of Blizzard's
-- achievement list that has a Zygor guide, and Plugins/ZygorGuidesViewer.lua does the same on the addon's rows, drawing
-- the way Zygor draws (UpdateIcons from a hook on the list's ScrollBox Update, Zygor's shared icon pool). A scenario
-- opens the window one way on a category holding an achievement with a Zygor guide, and after half a second records
-- whether the visible rows with a guide show the icon:
--   all, some or none; with no row with a guide in view the scenario SKIPs
-- The same scenarios run in game (/kaftest plugins) against the real window, Zygor and its guides, and headlessly
-- (.claude/tools/headless/run-tests.lua) against a model of Zygor's achievement module and of the window, with the
-- plugin, the plugin API and the addon's ADDON_LOADED wiring real. The first scenario loads the window, so it is the
-- list's first draw of the session only right after a /reload, before the window was opened: in game run it as
-- /kaftest login plugins.

-- Tab: the addon's tab the list is drawn in. The Blizzard-binding scenario runs first, the first draw, and never calls
-- the addon's toggle, which used to start the plugin. The addon-binding one runs after it in the same session, on
-- another tab so the toggle really clicks it: a guard that the toggle keeps its icons, not a first draw.
-- Before the fix (verified in game on Retail 12.1.5 with Zygor 9.6, Doomhammer, 2026-10-26) the plugin started only from a
-- post-hook on KrowiAF_ToggleAchievementFrame: Blizzard's binding never started it (0 of 13 rows with a guide had the
-- icon), and the addon's started it after the list had drawn, yet the rows got the icons a frame later (13 of 13): a
-- row that changes size makes the list queue a full update for the next frame (ScrollUtil.AddResizableChildrenBehavior,
-- AchievementsFrameMixin.lua), which the plugin's hook then catches. Since the fix the plugin sets up as soon as Zygor and
-- the addon's list both exist (PluginsApi:LoadPluginsWithBlizzard_AchievementUI), before the list's first draw.
plugins.Scenarios = {
    -- Blizzard's ToggleAchievementFrame, what Y does on Blizzard's Toggle Achievements binding, then a click on the tab
    {Name = "zygor-blizzard-binding", Tab = "Expansions", Recorded = "all", Target = "all"},
    -- the window closed, then KrowiAF_ToggleAchievementFrame, what the addon's tab bindings and the micro button do
    {Name = "zygor-addon-binding", Tab = "Achievements", Recorded = "all", Target = "all"}
}

local settle = 0.5 -- the open -> the count; Zygor draws on a timer

local opens = {
    ["zygor-blizzard-binding"] = function(env, scenario)
        env.OpenWithBlizzardBinding()
        local picked, reason = env.PickAchievement(scenario.Tab)
        if not picked then
            return nil, reason
        end
        env.ClickTab(scenario.Tab, picked)
        return picked
    end,
    ["zygor-addon-binding"] = function(env, scenario)
        env.CloseWindow()
        local picked, reason = env.PickAchievement(scenario.Tab)
        if not picked then
            return nil, reason
        end
        local skip = env.ToggleWithAddonBinding(scenario.Tab, picked)
        if skip then
            return nil, skip
        end
        return picked
    end
}

-- The visible rows of the addon's list whose achievement has a Zygor guide, and how many of them show Zygor's icon
local function CountIcons()
    local onRow = {}
    local pool = ZGV.SearchIconPool
    if pool then
        for icon in pool:EnumerateActive() do
            if icon:IsShown() then
                onRow[icon:GetParent()] = true
            end
        end
    end
    local withGuide, withIcon = 0, 0
    for _, row in ipairs(KrowiAF_AchievementsFrame.ScrollView:GetFrames()) do
        if row:IsVisible() and row.Achievement and ZGV.Achievement.AvailGuides[row.Achievement.Id] then
            withGuide = withGuide + 1
            if onRow[row] then
                withIcon = withIcon + 1
            end
        end
    end
    local detail = ("%d of %d rows with a guide show the icon"):format(withIcon, withGuide)
    if withGuide == 0 then
        return nil, detail
    end
    return withIcon == withGuide and "all" or withIcon == 0 and "none" or "some", detail
end

local function Result(scenario, status, tail, targetMet)
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("plugins/%s: %s recorded=[%s] %s"):format(scenario.Name, status, scenario.Recorded, tail)
    }
end

-- Runs the scenarios in order, each after the one before has counted; done(results) at the end
function plugins.Run(env, observations, done)
    local results = {}
    local ready, reason = env.Setup(observations)
    local index = 0
    local Next
    Next = function()
        index = index + 1
        local scenario = plugins.Scenarios[index]
        if not scenario then
            if ready then
                env.Teardown(observations, results)
            end
            done(results)
            return
        end
        if not ready then
            tinsert(results, Result(scenario, "SKIP", reason))
            Next()
            return
        end
        local ok, picked, skipped = pcall(opens[scenario.Name], env, scenario)
        if not ok then
            tinsert(results, Result(scenario, "FAIL", "test error: " .. tostring(picked)))
            Next()
            return
        end
        if not picked then
            tinsert(results, Result(scenario, "SKIP", skipped))
            Next()
            return
        end
        env.After(settle, function()
            local counted, got, detail = pcall(CountIcons)
            local result
            if not counted then
                result = Result(scenario, "FAIL", "test error: " .. tostring(got))
            elseif got == nil then
                tinsert(observations, ("%s: achievement %s, %s"):format(scenario.Name, tostring(picked.Id), detail))
                result = Result(scenario, "SKIP", "no row with a Zygor guide in view")
            else
                tinsert(observations, ("%s: achievement %s, %s"):format(scenario.Name, tostring(picked.Id), detail))
                local targetMet = got == scenario.Target
                result = Result(scenario, got == scenario.Recorded and "PASS" or "FAIL", ("got=[%s] target=[%s] %s"):format(got, scenario.Target,
                    targetMet and "met" or "open"), targetMet)
                result.Got = got
            end
            tinsert(results, result)
            if not (env.Shot and pcall(env.Shot, result, Next)) then -- Shot calls Next once its screenshot is taken
                Next()
            end
        end)
    end
    Next()
end

-- [[ In-game environment: the real window, Zygor and its guides ]] --

local gameEnv = {InGame = true}
plugins.GameEnv = gameEnv

local snapshot -- each touched tab's selected category and achievement, put back by the teardown
local banner

local function TabButton(tabName)
    local tabs = addon.Gui.Tabs[addonName]
    return tabs and tabs[tabName]
end

-- The category in the tab that lists the achievement, merged the way the list shows it
local function CategoryInTab(achievement, tabName)
    local candidates = {achievement.Category}
    for _, moreCategory in next, achievement.MoreCategories or {} do
        tinsert(candidates, moreCategory)
    end
    for _, category in next, candidates do
        if category:GetTree()[1].TabName == tabName then
            return category:GetMergedCategory()
        end
    end
end

-- Selects the achievement's category in the tab without a draw: the always visible marks on its path that
-- KrowiAF_SelectCategory sets for a category the filters would hide (Api/API.lua), so the categories frame keeps it
-- selected, and the tab's selected achievement, so ShowSubFrames scrolls the list to it. Returns the undo of the marks.
local function Preset(tabName, picked)
    local button = TabButton(tabName)
    snapshot[tabName] = snapshot[tabName] or {Category = button.SelectedCategory, Achievement = button.SelectedAchievement}
    local tree = picked.Category:GetTree()
    local marks = {}
    for i, pathCategory in ipairs(tree) do
        marks[i] = pathCategory.AlwaysVisible
        pathCategory.AlwaysVisible = true
    end
    button.SelectedCategory = picked.Category
    button.SelectedAchievement = picked.Achievement
    return function()
        for i, pathCategory in ipairs(tree) do
            pathCategory.AlwaysVisible = marks[i]
        end
    end
end

function gameEnv.Setup(observations)
    snapshot = {}
    if not (C_AddOns.IsAddOnLoaded("ZygorGuidesViewer") and ZGV and ZGV.Achievement and ZGV.Achievement.AvailGuides) then
        return false, "Retail's Zygor Guides Viewer with its achievement guides is not loaded" -- the plugin serves only that one
    end
    tinsert(observations, ("Zygor Guides Viewer %s; Y runs %s"):format(tostring(C_AddOns.GetAddOnMetadata("ZygorGuidesViewer", "Version")),
        tostring(GetBindingAction("Y"))))
    if C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        return false, "the achievement window was loaded before the run, so it is no first draw: type /kaftest login plugins, then /reload"
    end
    return true
end

function gameEnv.OpenWithBlizzardBinding()
    ToggleAchievementFrame()
end

-- The first achievement with a Zygor guide that the tab lists and its filters show
function gameEnv.PickAchievement(tabName)
    local button = TabButton(tabName)
    if not (button and button:IsShown()) then
        return nil, "the " .. tabName .. " tab is hidden (Options > Layout > Tabs)"
    end
    local tabFilters = addon.Tabs[tabName].Filters
    local ids = {}
    for id in next, ZGV.Achievement.AvailGuides do
        tinsert(ids, id)
    end
    sort(ids)
    for _, id in ipairs(ids) do
        local achievement = addon.Data.Achievements[id]
        local category = achievement and achievement.Category and CategoryInTab(achievement, tabName)
        if category and addon.Filters.GetHighestAchievementWhenCollapseSeries(tabFilters, achievement) == achievement
            and addon.Filters.Validate(tabFilters, achievement, category.IgnoreFilters) > 0 then
            return {Id = id, Achievement = achievement, Category = category}
        end
    end
    return nil, "no achievement with a Zygor guide is shown in the " .. tabName .. " tab"
end

function gameEnv.ClickTab(tabName, picked)
    local undo = Preset(tabName, picked)
    local button = TabButton(tabName)
    local ok, err = pcall(button.Select, button)
    undo() -- also after an error, so no category stays forced visible
    if not ok then
        error(err, 0)
    end
end

function gameEnv.CloseWindow()
    if AchievementFrame and AchievementFrame:IsShown() then
        AchievementFrame:Hide()
    end
end

function gameEnv.ToggleWithAddonBinding(tabName, picked)
    if addon.Options.db.profile.ResetViewOnOpen then
        return "Reset view on open is on, which selects the tab's first category"
    end
    local undo = Preset(tabName, picked)
    local ok, err = pcall(KrowiAF_ToggleAchievementFrame, addonName, tabName)
    undo()
    if not ok then
        error(err, 0)
    end
end

gameEnv.After = C_Timer.After

local function SetBanner(text)
    if not banner then
        banner = CreateFrame("Frame", nil, UIParent)
        banner:SetFrameStrata("DIALOG")
        banner:SetSize(620, 26)
        banner:SetPoint("TOP", 0, -40)
        local background = banner:CreateTexture(nil, "BACKGROUND")
        background:SetAllPoints()
        background:SetColorTexture(0, 0, 0, 0.85)
        banner.Text = banner:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        banner.Text:SetPoint("CENTER")
    end
    banner.Text:SetText(text)
    banner:Show()
end

-- A banner naming the scenario, then a screenshot of the rows, which Read-GameTests.ps1 pairs with the line
function gameEnv.Shot(result, nextStep)
    SetBanner(("plugins/%s: icons %s"):format(result.Name, tostring(result.Got)))
    C_Timer.After(0.2, function()
        result.Screenshot = {Time = date("%Y-%m-%d %H:%M:%S")}
        Screenshot()
        C_Timer.After(1, function()
            banner:Hide()
            nextStep()
        end)
    end)
end

-- This addon's Lua errors in this session, also from before the run, as BugGrabber caught them
local function CheckErrors(observations, results)
    local function Add(status, text)
        tinsert(results, {Name = "lua-errors", Status = status, GameOnly = true, Line = "plugins/lua-errors: " .. status .. " " .. text})
    end
    if not (BugGrabber and type(BugGrabber.GetDB) == "function" and type(BugGrabber.GetSessionId) == "function") then
        tinsert(observations, "no BugGrabber, so Lua errors are not checked")
        return
    end
    local session = BugGrabber:GetSessionId()
    local found = 0
    for _, err in ipairs(BugGrabber:GetDB()) do
        if err.session == session and ((type(err.message) == "string" and err.message:find(addonName, 1, true))
            or (type(err.stack) == "string" and err.stack:find(addonName, 1, true))) then
            found = found + 1
            Add("FAIL", ("Lua error x%d: %s"):format(err.counter or 1, tostring(err.message):sub(1, 300)))
        end
    end
    if found == 0 then
        Add("PASS", "no Lua error from this addon this session (BugGrabber)")
    end
end

-- Each touched tab gets its selected category and achievement back, the window closes, then the Lua errors
function gameEnv.Teardown(observations, results)
    for tabName, selected in next, snapshot do
        local button = TabButton(tabName)
        button.SelectedCategory = selected.Category
        button.SelectedAchievement = selected.Achievement
    end
    snapshot = nil
    gameEnv.CloseWindow()
    tinsert(observations, "the run opened the window from addon code: /reload before entering combat")
    local ok, err = pcall(CheckErrors, observations, results)
    if not ok then
        tinsert(results, {Name = "lua-errors", Status = "FAIL", GameOnly = true, Line = "plugins/lua-errors: FAIL test error: " .. tostring(err)})
    end
end

addon.Tests.Ready.plugins = function()
    if not addon.Data.IsLoaded then -- categories are set only at the end of the login data load (Data/Data.lua)
        return false, "the achievement data is not loaded yet"
    end
    return true
end

addon.Tests.Async.plugins = true
addon.Tests.Suites.plugins = function(done)
    local observations = {}
    plugins.Run(gameEnv, observations, function(results)
        done(results, observations)
    end)
end