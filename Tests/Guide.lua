local _, addon = ...
addon.Tests.Guide = {}
local guide = addon.Tests.Guide

-- Achievement guides and waypoints (docs/work/2026-10-11-achievement-guides). Recorded is the behaviour of the current
-- code, Target the desired one; the same scenarios run in game (/kaftest guide) and headlessly
-- (.claude/tools/headless/run-tests.lua), where a model of the garrison, map, spell and POI APIs stands in for the game.
-- Recorded was "none" everywhere before the feature (verified in game on 2026-10-11); since milestone A of the plan only
-- the menu's Open guide entry, which comes with the side panel, is still open. Five kinds:
--   Surface: the tooltip or the right-click menu of a real achievement (60962 has a guide, 11223 none), with the guide
--     options set for the run and restored after. The tooltip gives "shown" when its Guide header is followed by the
--     first rendered line, "header-only" when it is not, "none" without a header. The menu runs only the guide section,
--     into a recording menu builder, and gives "Guide:<enabled>/<entries>" for its submenu, "none" without one.
--   Talent: the research state of a garrison talent table shaped like C_Garrison.GetTalentInfo's, for the player's own
--     class or another, with the achievement's criterion completed or not. The availability values are
--     Enum.GarrisonTalentAvailability (Blizzard_APIDocumentationGenerated/GarrisonConstantsDocumentation.lua:355-371).
--   Faction: the steps of a guide written here, a Paladin portal per faction (step 0 of the plan), shown to one faction.
--   Waypoint: the waypoint actions for a waypoint, the provider option and what can place the point.
--   Availability: what can place a waypoint on two real maps: Acherus 648 allows the map pin, Dalaran 627 refuses it.
-- Surface, Talent and Availability are Retail only: Classic has no guide data, no garrison and none of these maps.
--
-- The code these scenarios hold the feature to (plan, Files that change):
--   addon.Gui.Guide.GetLines(achievement) -> list of {Kind, Text, State, Waypoint}, the steps as every surface shows them
--   addon.Gui.Guide.GetSteps(achievement, faction) -> the achievement.Guide steps a player of that faction sees, where
--     faction is a KrowiAF.Enum.Faction value and a step without Faction shows to both
--   addon.Gui.Guide.GetTalentState(info, isOwnClass, isCriterionCompleted) -> "researched", "researching", "locked",
--     "cost" or "not-yet"; nil for another class, which sees the talent's name only
--   addon.Gui.Guide.Waypoint.GetActions(waypoint, provider, available) -> list of {Kind = "MapPin"|"Poi"|"TomTom", Text,
--     Enabled, Func}, where provider is Achievements.Guide.WaypointProvider and available is {MapPin, Poi, TomTom, Combat}:
--     MapPin is whether the map allows one, Combat whether the player is in combat
--   addon.Gui.Guide.Waypoint.GetAvailability(waypoint) -> that available table, read from the game
--   addon.Gui.RightClickMenu.AchievementMenu.GuideSection, the menu section (CheckAdd, Add)
--   addon.Options.db.profile.Achievements.Guide: Tooltip, RightClickMenu, Icon, ExpandedRow, WaypointProvider

local provider = {Both = 1, MapPin = 2, TomTom = 3} -- Achievements.Guide.WaypointProvider
local zubashi = {MapId = 648, X = 47.7, Y = 53.8} -- Archivist Zubashi, Acherus: the map pin is allowed there
local dalaran = {MapId = 627, X = 32.7, Y = 69.8} -- a spot in Dalaran, which refuses the map pin
local paladinPortal = {PoiId = 5057, MapId = 627, X = 32.7, Y = 69.8} -- the Alliance Paladin portal, Dalaran

guide.Scenarios = {
    {Name = "tooltip-60962", Kind = "Surface", Surface = "Tooltip", Id = 60962, Options = {Tooltip = true},
        Recorded = "shown", Target = "shown"},
    {Name = "tooltip-options-off", Kind = "Surface", Surface = "Tooltip", Id = 60962, Options = {Tooltip = false},
        Recorded = "none", Target = "none"},
    {Name = "tooltip-no-guide-11223", Kind = "Surface", Surface = "Tooltip", Id = 11223, Options = {Tooltip = true},
        Recorded = "none", Target = "none"},
    -- Open guide (the side panel, with the icon option on) and the map pin for Zubashi
    {Name = "menu-60962", Kind = "Surface", Surface = "Menu", Id = 60962,
        Options = {RightClickMenu = true, Icon = true, WaypointProvider = provider.MapPin},
        Recorded = "Guide:1/1", Target = "Guide:2/2"},
    {Name = "menu-options-off", Kind = "Surface", Surface = "Menu", Id = 60962, Options = {RightClickMenu = false},
        Recorded = "none", Target = "none"},
    {Name = "menu-no-guide-11223", Kind = "Surface", Surface = "Menu", Id = 11223, Options = {RightClickMenu = true},
        Recorded = "none", Target = "none"},

    {Name = "talent-not-yet", Kind = "Talent", OwnClass = true, -- Available
        Talent = {researched = false, isBeingResearched = false, talentAvailability = 0},
        Recorded = "not-yet", Target = "not-yet"},
    {Name = "talent-researching", Kind = "Talent", OwnClass = true, -- the Mage's Teleportation Nexus
        Talent = {researched = false, isBeingResearched = true, talentAvailability = 2},
        Recorded = "researching", Target = "researching"},
    {Name = "talent-locked", Kind = "Talent", OwnClass = true, -- UnavailableTierUnavailable, the step-0 Death Knight
        Talent = {researched = false, isBeingResearched = false, talentAvailability = 5},
        Recorded = "locked", Target = "locked"},
    {Name = "talent-cost", Kind = "Talent", OwnClass = true, -- UnavailableNotEnoughResources, the Priest's Tier VII
        Talent = {researched = false, isBeingResearched = false, talentAvailability = 3},
        Recorded = "cost", Target = "cost"},
    {Name = "talent-researched", Kind = "Talent", OwnClass = true, -- UnavailableAlreadyHave
        Talent = {researched = true, isBeingResearched = false, talentAvailability = 7},
        Recorded = "researched", Target = "researched"},
    -- The Paladin completed 60968 with one Tier VII talent, then swapped to the other: the criterion stays done
    {Name = "talent-swapped", Kind = "Talent", OwnClass = true, CriterionCompleted = true,
        Talent = {researched = false, isBeingResearched = false, talentAvailability = 0},
        Recorded = "researched", Target = "researched"},
    {Name = "talent-other-class", Kind = "Talent", OwnClass = false, -- the Paladin reading a Death Knight talent
        Talent = {researched = false, isBeingResearched = false, talentAvailability = 5},
        Recorded = "name-only", Target = "name-only"},

    {Name = "faction-alliance", Kind = "Faction", Faction = "Alliance",
        Recorded = "Poi:5057,Criteria", Target = "Poi:5057,Criteria"},
    {Name = "faction-horde", Kind = "Faction", Faction = "Horde",
        Recorded = "Poi:5058,Criteria", Target = "Poi:5058,Criteria"},

    {Name = "waypoint-both-without-tomtom", Kind = "Waypoint", Waypoint = zubashi, Provider = provider.Both,
        Available = {MapPin = true, TomTom = false},
        Recorded = "MapPin:on", Target = "MapPin:on"},
    {Name = "waypoint-both-with-tomtom", Kind = "Waypoint", Waypoint = zubashi, Provider = provider.Both,
        Available = {MapPin = true, TomTom = true},
        Recorded = "MapPin:on,TomTom:on", Target = "MapPin:on,TomTom:on"},
    {Name = "waypoint-tomtom-missing", Kind = "Waypoint", Waypoint = zubashi, Provider = provider.TomTom,
        Available = {MapPin = true, TomTom = false},
        Recorded = "TomTom:off", Target = "TomTom:off"},
    {Name = "waypoint-map-pin-disallowed", Kind = "Waypoint", Waypoint = dalaran, Provider = provider.MapPin,
        Available = {MapPin = false, TomTom = false},
        Recorded = "MapPin:off", Target = "MapPin:off"},
    -- "Both" with nothing that can place the point still offers the map pin, disabled with its reason
    {Name = "waypoint-both-nothing-places", Kind = "Waypoint", Waypoint = dalaran, Provider = provider.Both,
        Available = {MapPin = false, TomTom = false},
        Recorded = "MapPin:off", Target = "MapPin:off"},
    -- C_Map.SetUserWaypoint fires USER_WAYPOINT_UPDATED synchronously, so Blizzard's world map handlers run in the
    -- addon's taint and can be blocked in combat (taint review of milestone A): no map pin from the addon in combat
    {Name = "waypoint-map-pin-in-combat", Kind = "Waypoint", Waypoint = zubashi, Provider = provider.MapPin,
        Available = {MapPin = true, Combat = true, TomTom = false},
        Recorded = "MapPin:off", Target = "MapPin:off"},
    {Name = "waypoint-both-in-combat", Kind = "Waypoint", Waypoint = zubashi, Provider = provider.Both,
        Available = {MapPin = true, Combat = true, TomTom = true},
        Recorded = "TomTom:on", Target = "TomTom:on"},
    {Name = "waypoint-poi", Kind = "Waypoint", Waypoint = paladinPortal, Provider = provider.MapPin,
        Available = {MapPin = false, Poi = true, TomTom = false},
        Recorded = "Poi:on", Target = "Poi:on"},
    -- Another class cannot see the Paladin portal's POI, so only TomTom can place it
    {Name = "waypoint-poi-hidden", Kind = "Waypoint", Waypoint = paladinPortal, Provider = provider.Both,
        Available = {MapPin = false, Poi = false, TomTom = true},
        Recorded = "TomTom:on", Target = "TomTom:on"},

    {Name = "waypoint-availability", Kind = "Availability", Maps = {648, 627},
        Recorded = "648:on,627:off", Target = "648:on,627:off"},
}

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line

local function GetModule()
    return addon.Gui.Guide -- nil until the feature exists
end

-- A menu builder that records what a menu section adds, in the shape of the Krowi_MenuBuilder calls the sections use
local function NewRecorder()
    local function NewMenu(text)
        return {Text = text, Entries = {}}
    end
    local recorder = setmetatable({}, {__index = function(_, method)
        return function(_, menu)
            tinsert(menu.Entries, {Kind = method}) -- a call this recorder does not model, kept for the count
        end
    end})
    function recorder:CreateSubmenuButton(_, text)
        local child = NewMenu(text)
        child.Kind = "Submenu"
        return child
    end
    function recorder:AddChildMenu(menu, child)
        tinsert(menu.Entries, child)
    end
    function recorder:CreateButtonAndAdd(menu, text, _, isEnabled)
        tinsert(menu.Entries, {Kind = "Button", Text = text, Enabled = isEnabled ~= false}) -- the builder disables only on false
    end
    function recorder:CreateDivider(menu)
        tinsert(menu.Entries, {Kind = "Divider"})
    end
    function recorder:CreateTitle(menu, text)
        tinsert(menu.Entries, {Kind = "Title", Text = text})
    end
    return recorder, NewMenu()
end

local function InspectTooltip(env, achievement)
    local header = env.Text("Guide")
    if not header then
        return "none" -- the string does not exist yet, so neither does the section
    end
    local lines = env.TooltipLines(achievement)
    for i, text in ipairs(lines) do
        if text == header then
            local module = GetModule()
            local first = module and module.GetLines and module.GetLines(achievement)[1]
            return first and lines[i + 1] == first.Text and "shown" or "header-only"
        end
    end
    return "none"
end

local function InspectMenu(env, achievement)
    local achievementMenu = addon.Gui.RightClickMenu and addon.Gui.RightClickMenu.AchievementMenu
    local section = achievementMenu and achievementMenu.GuideSection
    if not section or not section:CheckAdd(achievement) then
        return "none"
    end
    local recorder, root = NewRecorder()
    section:Add(root, achievement, recorder)
    for _, entry in ipairs(root.Entries) do
        if entry.Kind == "Submenu" and entry.Text == env.Text("Guide") then
            local enabled = 0
            for _, child in ipairs(entry.Entries) do
                if child.Enabled then
                    enabled = enabled + 1
                end
            end
            return ("Guide:%d/%d"):format(enabled, #entry.Entries)
        end
    end
    return "no-submenu"
end

local function RunSurface(env, scenario, observations)
    local achievement, reason = env.Achievement(scenario.Id)
    if not achievement then
        return nil, reason
    end
    env.SetOptions(scenario.Options, observations)
    local ok, got = pcall(scenario.Surface == "Tooltip" and InspectTooltip or InspectMenu, env, achievement)
    env.Teardown() -- after an error too: it puts the options and the tooltip back
    if not ok then
        error(got, 0)
    end
    return got
end

local function RunTalent(_, scenario)
    local module = GetModule()
    if not module or not module.GetTalentState then
        return "none"
    end
    return module.GetTalentState(scenario.Talent, scenario.OwnClass, scenario.CriterionCompleted) or "name-only"
end

local function RunFaction(env, scenario)
    local module = GetModule()
    if not module or not module.GetSteps then
        return "none"
    end
    local alliance, horde = env.Faction("Alliance"), env.Faction("Horde")
    local achievement = {Id = 60968, Guide = { -- Legendary Research of the Silver Hand, as its guide could read
        {Type = "Poi", PoiId = 5057, MapId = 627, X = 32.7, Y = 69.8, Faction = alliance},
        {Type = "Poi", PoiId = 5058, MapId = 627, X = 61.9, Y = 13.5, Faction = horde},
        {Type = "Criteria"}
    }}
    local parts = {}
    for _, step in ipairs(module.GetSteps(achievement, env.Faction(scenario.Faction))) do
        tinsert(parts, step.PoiId and step.Type .. ":" .. step.PoiId or step.Type)
    end
    return #parts > 0 and table.concat(parts, ",") or "empty"
end

local function RunWaypoint(_, scenario)
    local module = GetModule()
    local waypoint = module and module.Waypoint
    if not waypoint or not waypoint.GetActions then
        return "none"
    end
    local parts = {}
    for _, action in ipairs(waypoint.GetActions(scenario.Waypoint, scenario.Provider, scenario.Available)) do
        tinsert(parts, action.Kind .. ":" .. (action.Enabled and "on" or "off"))
    end
    return #parts > 0 and table.concat(parts, ",") or "empty"
end

local function RunAvailability(_, scenario)
    local module = GetModule()
    local waypoint = module and module.Waypoint
    if not waypoint or not waypoint.GetAvailability then
        return "none"
    end
    local parts = {}
    for _, mapId in ipairs(scenario.Maps) do
        local available = waypoint.GetAvailability({MapId = mapId, X = 50, Y = 50})
        tinsert(parts, mapId .. ":" .. (available.MapPin and "on" or "off"))
    end
    return table.concat(parts, ",")
end

local runners = {
    Surface = RunSurface,
    Talent = RunTalent,
    Faction = RunFaction,
    Waypoint = RunWaypoint,
    Availability = RunAvailability
}

local retailOnly = {Surface = true, Talent = true, Availability = true}

local function RunScenario(env, scenario, observations)
    local got, reason = runners[scenario.Kind](env, scenario, observations)
    local status, targetMet, tail
    if not got then
        status, tail = "SKIP", reason or "could not run"
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=%s target=%s %s"):format(got, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("guide/%s: %s recorded=%s %s"):format(scenario.Name, status, scenario.Recorded, tail)
    }
end

function guide.Run(env, observations)
    local results = {}
    local skipped = 0
    for _, scenario in ipairs(guide.Scenarios) do
        if retailOnly[scenario.Kind] and not env.IsRetail() then
            skipped = skipped + 1
        else
            tinsert(results, RunScenario(env, scenario, observations))
        end
    end
    if skipped > 0 then
        tinsert(observations, ("%d surface, talent and availability scenarios are Retail only: Classic has no guide data, no garrison and none of their maps"):format(skipped))
    end
    -- What 60962's guide reads for the character running the suite; the scenarios above check its shape, this its words
    local module = GetModule()
    local achievement = env.IsRetail() and module and module.GetLines and env.Achievement(60962)
    if achievement then
        for i, line in ipairs(module.GetLines(achievement)) do
            tinsert(observations, ("60962 line %d (%s%s): %s"):format(i, line.Kind, line.State and ", " .. line.State or "", line.Text))
        end
    end
    return results
end

-- [[ Environment: the real tooltip, data and options; the headless runner provides a model of the same calls ]] --

local gameEnv = {}
guide.GameEnv = gameEnv

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

-- rawget: AceLocale reports a missing key as an error, and the guide strings do not exist until the feature does
function gameEnv.Text(key)
    return rawget(addon.L, key)
end

function gameEnv.Faction(name)
    return KrowiAF.Enum.Faction[name]
end

function gameEnv.Achievement(id)
    local achievement = addon.Data.Achievements[id]
    if not achievement then
        return nil, "achievement " .. id .. " is not loaded"
    end
    return achievement
end

addon.Tests.Ready.guide = function()
    if addon.Util.IsMainline and not addon.Data.Achievements[60962] then
        return false, "the achievement data is not loaded yet"
    end
    return true
end

local savedOptions, anchor
function gameEnv.SetOptions(options)
    local achievements = addon.Options.db.profile.Achievements
    local guideOptions = achievements and achievements.Guide -- absent until the feature exists: nothing to set
    savedOptions = {}
    if guideOptions then
        for key, value in next, options or {} do
            savedOptions[key] = {Value = guideOptions[key]}
            guideOptions[key] = value
        end
    end
end

function gameEnv.TooltipLines(achievement)
    anchor = anchor or CreateFrame("Frame", nil, UIParent)
    anchor:SetSize(100, 20)
    anchor:SetPoint("CENTER")
    anchor.Achievement = achievement -- sections check the tooltip owner's achievement before they write
    addon.Gui.AchievementTooltip:ShowTooltip(anchor, achievement)
    local lines = {}
    for i = 1, Krowi_Tooltip:NumLines() do
        tinsert(lines, _G["Krowi_TooltipTextLeft" .. i]:GetText() or "")
    end
    return lines
end

function gameEnv.Teardown()
    local guideOptions = addon.Options.db.profile.Achievements and addon.Options.db.profile.Achievements.Guide
    for key, saved in next, savedOptions or {} do
        guideOptions[key] = saved.Value
    end
    savedOptions = nil
    Krowi_Tooltip:Hide()
    if anchor then
        anchor.Achievement = nil
    end
end

addon.Tests.Suites.guide = function()
    local observations = {}
    return guide.Run(gameEnv, observations), observations
end