local _, addon = ...
addon.Tests.Menu = {}
local menu = addon.Tests.Menu

-- The right-click menu's "go to" entries and its title, for achievements the addon or the game does not know.
-- - Whether an entry for an achievement the addon does not register ("(Missing)") is greyed out
--   (docs/work/2026-10-11-latent-bugs, defect B). AchievementMenu:AddGoToAchievementLine labels such an entry "(Missing)"
--   and means to disable it, but until 2026-10-13 passed its disabled flag where the menu builder takes isEnabled. The
--   builder disables an entry only when that argument is false (Libs/Krowi_Menu/Krowi_MenuBuilder.lua:
--   CreateSubmenuButton, Retail and Classic), so true left it enabled.
-- - Whether an entry for an id the game does not know, and the menu of such an achievement, can be built at all
--   (docs/work/2026-10-24-menu-unknown-achievement). The entry's text and the title came from addon.GetAchievmentName,
--   which is nil for such an id, so the entry raised "attempt to concatenate a nil value" and the title was empty.
-- An entry scenario builds the entry the way the related-achievement sections do (chain, required for, other faction,
-- first category); a menu scenario builds the whole menu through AchievementMenu:CreateMenu. In game (/kaftest menu) both
-- go into a real root menu that is never shown, a Blizzard menu description on Retail and a Krowi_Menu_2 menu item on
-- Classic; headlessly (.claude/tools/headless/run-tests.lua) into a model of the builder's rule.

-- Find: the id the scenario links to, found at run time (in game the first match from id 1 up, headlessly a fake id; it
--   is reported as an observation, so the lines of both runs stay comparable):
--   missing      the game knows it and the addon does not register it
--   unknown      neither the game nor the addon knows it
--   placeholder  the addon registers it and the game does not know it (DoesNotExist)
--   otherwise Id is an achievement every client registers
-- Menu: build the whole menu of that achievement and record its title, instead of one "go to" entry linking to it
-- Recorded / Target: "error" when building raises; otherwise an entry's "enabled" or "disabled", followed by
--   " placeholder" when the game does not know the id and the text starts with the placeholder name
--   addon.GetAchievementInfo gives it, and " missing" when the text ends with "(Missing)"; a menu's title "untitled",
--   "placeholder" or "name"
-- The "(Missing)" entry stayed enabled before the 2026-10-13 fix (verified in game on Retail 12.1.0 and Classic 5.5.4 on
-- 2026-10-11, linking to 49); it now passes isEnabled = false
-- Before the 2026-10-25 fix both entries for an id the game does not know raised and the placeholder's menu had no title
-- (verified in game on Retail 12.1.5 and Mists 5.5.4 on 2026-10-25, linking to 1 and to 7295 on Mists); they now take
-- the name from addon.GetAchievementInfo
menu.Scenarios = {
    {Name = "missing-achievement-entry", Find = "missing",
        Recorded = "disabled missing", Target = "disabled missing"},
    {Name = "registered-achievement-entry", Id = 6, -- Level 10, DataAddons/Shared/03_WrathOfTheLichKing/AchievementData.lua
        Recorded = "enabled", Target = "enabled"},
    {Name = "unknown-achievement-entry", Find = "unknown",
        Recorded = "disabled placeholder missing", Target = "disabled placeholder missing"},
    {Name = "placeholder-entry", Find = "placeholder",
        Recorded = "enabled placeholder", Target = "enabled placeholder"},
    {Name = "placeholder-menu", Find = "placeholder", Menu = true,
        Recorded = "placeholder", Target = "placeholder"}
}

-- The name addon.GetAchievementInfo gives an id the game does not know, or nil when the game knows it
local function PlaceholderName(id)
    if GetAchievementInfo(id) then
        return
    end
    local _, name = addon.GetAchievementInfo(id)
    return name
end

local function StartsWithPlaceholder(id, text)
    local placeholder = PlaceholderName(id)
    return placeholder ~= nil and type(text) == "string" and text:sub(1, #placeholder) == placeholder
end

local function DescribeEntry(env, id, root)
    local enabled, text = env.ReadEntry(root)
    if enabled == nil then
        return nil, text
    end
    local got = enabled and "enabled" or "disabled"
    if StartsWithPlaceholder(id, text) then
        got = got .. " placeholder"
    end
    local missing = " (" .. addon.L["Missing"] .. ")"
    if type(text) == "string" and text:sub(-#missing) == missing then
        got = got .. " missing"
    end
    return got
end

local function DescribeTitle(id, text)
    if text == nil or text == "" then
        return "untitled"
    end
    return StartsWithPlaceholder(id, text) and "placeholder" or "name"
end

-- "raised at <file> line <n>: <message>": an observation in the "<file>:<n>: " form would read as a failing scenario to
-- the unit-tests lint rule, which parses run-tests.lua -check output
local function DescribeError(problem)
    local file, line, message = tostring(problem):match("^(.-):(%d+): (.*)$")
    if not file then
        return "raised: " .. tostring(problem)
    end
    return ("raised at %s line %s: %s"):format(file, line, message)
end

-- env: Find(kind) -> id, note[, cleanup] or nil, reason; Build(id) -> root; BuildMenu(id) -> root;
-- ReadEntry(root) -> enabled, text or nil, reason; ReadTitle(root) -> text
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(env, scenario, observations)
    local id, reason, cleanup = scenario.Id, nil, nil
    if scenario.Find then
        local note
        id, note, cleanup = env.Find(scenario.Find)
        if id then
            tinsert(observations, ("%s links to %s"):format(scenario.Name, note))
        else
            reason = note
        end
    end
    local got
    if id then
        local built, root = pcall(scenario.Menu and env.BuildMenu or env.Build, id)
        if cleanup then -- before anything else can raise, so a stand-in never stays registered
            cleanup()
        end
        if not built then
            got = "error"
            tinsert(observations, scenario.Name .. " " .. DescribeError(root))
        elseif scenario.Menu then
            got = DescribeTitle(id, env.ReadTitle(root))
        else
            got, reason = DescribeEntry(env, id, root)
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

local highestIdToScan = 100000 -- past the highest achievement id of either client; the first hit is a low id

local function FirstId(matches)
    for id = 1, highestIdToScan do
        if matches(id) then
            return id
        end
    end
end

local function IsMissing(id)
    return not addon.Data.Achievements[id] and GetAchievementInfo(id) ~= nil
end

local function IsUnknown(id)
    return not addon.Data.Achievements[id] and not GetAchievementInfo(id)
end

local finders = {}

function finders.missing()
    local id = FirstId(IsMissing)
    if not id then
        return nil, "every achievement id up to " .. highestIdToScan .. " is registered or unknown to the game"
    end
    return id, id .. ", which the game knows and the addon does not register"
end

function finders.unknown()
    local id = FirstId(IsUnknown)
    if not id then
        return nil, "every achievement id up to " .. highestIdToScan .. " is registered or known to the game"
    end
    return id, id .. ", which neither the game nor the addon knows"
end

-- The lowest registered placeholder, or a stand-in registered under an unknown id until the cleanup
function finders.placeholder()
    local lowest
    for id, achievement in next, addon.Data.Achievements do
        if achievement.DoesNotExist and not GetAchievementInfo(id) and (not lowest or id < lowest) then
            lowest = id
        end
    end
    if lowest then
        return lowest, lowest .. ", a placeholder the addon registers"
    end
    local id = FirstId(IsUnknown)
    if not id then
        return nil, "no placeholder is registered and no id up to " .. highestIdToScan .. " is free for a stand-in"
    end
    local standIn = addon.Objects.Achievement:New(id)
    standIn.DoesNotExist = true
    addon.Data.Achievements[id] = standIn
    return id, id .. ", a stand-in placeholder registered for the scenario only", function()
        addon.Data.Achievements[id] = nil
    end
end

function gameEnv.Find(kind)
    return finders[kind]()
end

local function NewRoot()
    if addon.Util.IsModern then
        return MenuUtil.CreateRootMenuDescription(MenuVariants.GetDefaultContextMenuMixin())
    end
    return LibStub("Krowi_Menu_2").MenuItem:New({Text = "root"})
end

function gameEnv.Build(id)
    local root = NewRoot()
    addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementLine(root, id)
    return root
end

-- The first-category section follows the player's selected category, so the build runs with no tab selected, which keeps
-- that section out and the result the same on every run; every other section and the plugin entries run for real
function gameEnv.BuildMenu(id)
    local root = NewRoot()
    local gui = addon.Gui
    local selectedTab = gui.SelectedTab
    gui.SelectedTab = nil
    local built, problem = pcall(gui.RightClickMenu.AchievementMenu.CreateMenu, gui.RightClickMenu.AchievementMenu, root, addon.Data.Achievements[id])
    gui.SelectedTab = selectedTab
    if not built then
        error(problem, 0)
    end
    return root
end

local function FirstElement(root)
    if addon.Util.IsModern then
        for _, description in root:EnumerateElementDescriptions() do
            return description, description:IsEnabled(), MenuUtil.GetElementText(description)
        end
        return
    end
    local entry = root.Children and root.Children[1]
    if entry then
        return entry, not entry.Disabled, entry.Text
    end
end

function gameEnv.ReadEntry(root)
    local entry, enabled, text = FirstElement(root)
    if not entry then
        return nil, "the root menu got no entry"
    end
    return enabled, text
end

function gameEnv.ReadTitle(root)
    local _, _, text = FirstElement(root)
    return text
end

addon.Tests.Ready.menu = function()
    if not addon.Data.IsLoaded then -- the cache build registers the achievements the game knows and marks the placeholders
        return false, "the data load has not finished"
    end
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