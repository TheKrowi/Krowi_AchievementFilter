local _, addon = ...
addon.Tests.WorldMap = {}
local worldMap = addon.Tests.WorldMap

-- Whether the world map button stays in front of the map on Classic when the map changes size
-- (docs/work/2026-10-02-classic-world-map-button). A scenario starts from the state after a /reload (map closed and
-- small, MEDIUM, button HIGH), opens and resizes the map the way the player does, and records whether the button's
-- strata ranks above the canvas's: "above", or "covered" when it is the same or lower. The same strata counts as
-- covered because the canvas sits at level 3, the button at 2 and the map pins from 2000 up
-- (MapCanvas_PinFrameLevelsManager.lua). Recorded is the behaviour of the current code, verified in game; Target the
-- desired behaviour. The same scenarios run in game (/kaftest worldmap) against the real map and headlessly
-- (.claude/tools/headless/run-tests.lua) against a model of it; both drive the environment below.
--
-- How the Mists Classic map works (Blizzard_WorldMap/Cata/Blizzard_WorldMap.lua and Wrath/QuestLogOwnerMixin.lua,
-- classic branch): the maximize and minimize buttons go through HandleUserActionMaximizeSelf/MinimizeSelf, which set
-- the miniWorldMap CVar and call SetDisplayState; that calls Maximize or Minimize only when the size changes, and
-- those end in SynchronizeDisplayState, which calls SetFrameStrata("FULLSCREEN") or SetFrameStrata("MEDIUM") on the
-- map. The game moves every descendant of a frame to its new strata, so the button (a child of WorldMapFrame through
-- Krowi_WorldMapButtons, HIGH from its template) lands in the map's strata under the canvas. Opening a small map does
-- not change the size, so the button looks fine until the first resize. ElvUI's smaller world map and GW2_UI set the
-- map to HIGH, Leatrix Maps to MEDIUM. Retail's map never sets its own strata, so the suite has no Retail scenarios.
--
-- The in-game run drives Blizzard's map from addon code (ToggleWorldMap, MaximizeMinimizeFrame), which taints the
-- map's display state until the /reload that writes the results; it refuses to run while a map addon is loaded.

worldMap.StrataOrder = {"BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG", "TOOLTIP"}

-- Steps: run in that order after the reset. Recorded / Target: "above" or "covered"
-- Target (decided 2026-10-03, docs/work/2026-10-02-classic-world-map-button/spec.md): above after every step. Before
-- 101.1 the button was covered after every step but the first, which the in-game run on 5.5.4 confirmed on 2026-10-03
worldMap.Scenarios = {
    {Name = "small-map-opened", Steps = {"OpenSmall"}, Recorded = "above", Target = "above"},
    {Name = "large-map-opened", Steps = {"OpenLarge"}, Recorded = "above", Target = "above"},
    {Name = "maximized", Steps = {"OpenSmall", "Maximize"}, Recorded = "above", Target = "above"},
    {Name = "maximized-and-minimized", Steps = {"OpenSmall", "Maximize", "Minimize"}, Recorded = "above", Target = "above"},
    {Name = "addon-sets-map-strata", Steps = {"OpenSmall", "AddonStrata"}, Recorded = "above", Target = "above"} -- what ElvUI's smaller world map and GW2_UI do
}

local function Rank(strata)
    for i, name in ipairs(worldMap.StrataOrder) do
        if name == strata then
            return i
        end
    end
    return 0
end

-- env: IsRetail(), Setup() -> ok[, reason], Reset(), Step(stepKey) -> ok[, reason], ButtonStrata(), CanvasStrata(),
-- Teardown()
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(env, scenario, setupProblem)
    local blocked = setupProblem
    local got, buttonStrata, canvasStrata
    if not blocked then
        env.Reset()
        for _, step in ipairs(scenario.Steps) do
            if not blocked then
                local done, reason = env.Step(step)
                if not done then
                    blocked = "cannot " .. step .. (reason and (": " .. reason) or "")
                end
            end
        end
        if not blocked then
            buttonStrata, canvasStrata = env.ButtonStrata(), env.CanvasStrata()
            got = Rank(buttonStrata) > Rank(canvasStrata) and "above" or "covered"
        end
    end

    local status, targetMet, tail
    if blocked then
        status, tail = "SKIP", blocked
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=%s (button %s, canvas %s) target=%s %s"):format(got, buttonStrata, canvasStrata, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("worldmap/%s: %s steps=[%s] recorded=%s %s"):format(scenario.Name, status, table.concat(scenario.Steps, ","), scenario.Recorded, tail)
    }
end

function worldMap.Run(env, observations)
    local results = {}
    if env.IsRetail() then
        tinsert(observations, "no scenarios on Retail: its map never sets its own strata")
        return results
    end
    local ready, reason = env.Setup(observations)
    local setupProblem = not ready and (reason or "setup failed") or nil
    for _, scenario in ipairs(worldMap.Scenarios) do
        tinsert(results, RunScenario(env, scenario, setupProblem))
    end
    if ready then
        env.Teardown()
    end
    return results
end

-- [[ Environment: the real map, button and CVar; the headless runner provides a model of the same globals ]] --

local gameEnv = {}
worldMap.GameEnv = gameEnv

local mapAddons = {"ElvUI", "GW2_UI", "Leatrix_Maps"} -- they set the map's strata and parent themselves

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

local snapshot
function gameEnv.Setup(observations)
    if not addon.Options.db.profile.ShowWorldmapIcon then
        return false, "Show world map icon is off (Options > General)"
    end
    if addon.Gui.WorldMapButton:GetParent() ~= WorldMapFrame then
        return false, "the button is not a child of WorldMapFrame (another addon set the library's HasNoOverlay first)"
    end
    for _, name in ipairs(mapAddons) do
        if C_AddOns.IsAddOnLoaded(name) then
            return false, name .. " is loaded and changes the map itself"
        end
    end
    snapshot = {Shown = WorldMapFrame:IsShown(), Maximized = WorldMapFrame:IsMaximized(), MiniWorldMap = GetCVar("miniWorldMap")}
    tinsert(observations, ("map was %s and %s, miniWorldMap=%s"):format(snapshot.Shown and "open" or "closed", snapshot.Maximized and "maximized" or "small", tostring(snapshot.MiniWorldMap)))
    return true
end

-- The state after a /reload: the map closed and small at Blizzard's MEDIUM, the button at its template's HIGH
function gameEnv.Reset()
    if WorldMapFrame:IsMaximized() then
        WorldMapFrame.MaximizeMinimizeFrame:Minimize() -- the minimize button's path; it opens the map
    end
    HideUIPanel(WorldMapFrame)
    WorldMapFrame:SetFrameStrata("MEDIUM")
    addon.Gui.WorldMapButton:SetFrameStrata("HIGH")
end

local function Open(miniWorldMap)
    if WorldMapFrame:IsShown() then
        return false, "the map is already open"
    end
    SetCVar("miniWorldMap", miniWorldMap)
    ToggleWorldMap() -- the key binding's path
    return true
end

local function Resize(maximize)
    if not WorldMapFrame:IsShown() then
        return false, "the map is not open"
    end
    if maximize then
        WorldMapFrame.MaximizeMinimizeFrame:Maximize()
    else
        WorldMapFrame.MaximizeMinimizeFrame:Minimize()
    end
    return true
end

local steps = {
    OpenSmall = function() return Open("1") end,
    OpenLarge = function() return Open("0") end,
    Maximize = function() return Resize(true) end,
    Minimize = function() return Resize(false) end,
    AddonStrata = function()
        WorldMapFrame:SetFrameStrata("HIGH")
        return true
    end
}

function gameEnv.Step(step)
    return steps[step]()
end

function gameEnv.ButtonStrata()
    return addon.Gui.WorldMapButton:GetFrameStrata()
end

function gameEnv.CanvasStrata()
    return WorldMapFrame.ScrollContainer.Child:GetFrameStrata()
end

function gameEnv.Teardown()
    gameEnv.Reset()
    if snapshot.Maximized then
        WorldMapFrame.MaximizeMinimizeFrame:Maximize() -- opens the map at full size
    end
    if snapshot.Shown then
        ShowUIPanel(WorldMapFrame)
    else
        HideUIPanel(WorldMapFrame)
    end
    SetCVar("miniWorldMap", snapshot.MiniWorldMap)
    snapshot = nil
end

addon.Tests.Suites.worldmap = function()
    local observations = {}
    return worldMap.Run(gameEnv, observations), observations
end