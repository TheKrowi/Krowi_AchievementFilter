local _, addon = ...
addon.Tests.Guide = {}
local guide = addon.Tests.Guide

-- Achievement guides and waypoints (docs/work/2026-10-11-achievement-guides). Recorded is the behaviour of the current
-- code, Target the desired one; the same scenarios run in game (/kaftest guide) and headlessly
-- (.claude/tools/headless/run-tests.lua), where a model of the garrison, map, spell and POI APIs stands in for the game.
-- Recorded was "none" everywhere before the feature (verified in game on 2026-10-11). Milestone A met every target but the
-- menu's Open guide entry, which came with the side panel in milestone B. Twelve kinds:
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
--   Panel: the side panel opened next to a stand-in row (and toggled closed), "icons:<n> links:<n>" or "hidden".
--   Chain: the panel shown by a hover and pinned by a click, "shown" or "hidden", or opened while a stand-in side panel
--     is open for the same row or another, what it is anchored to before and after the stand-in closes.
--   Row: the guide block under a stand-in objectives frame, as an expanded row shows it, "icons:<n> links:<n>" or
--     "none". The row's real height sum stays an in-game check.
--   NpcName: the name a one-step NPC guide shows, whose data name is a marker no NPC has: "game" when the headline and
--     the waypoint title carry the player's client's name for the NPC, "fallback" when they carry the data's
--     (docs/work/2026-10-14-guide-npc-names).
--   NpcRequest: the NPC ids the login warm-up asks the client for, over the loaded data.
--   RowName: the NPC name in the guide block under a stand-in expanded row, displayed once while the client has no
--     name, then again, not forced, after it learned one: "game" or "fallback", as NpcName
--     (docs/work/2026-10-14-guide-row-npc-name).
--   AreaName: the headline of a one-step area guide (docs/work/2026-10-21-legendary-research-guides): "game" when the
--     headline and the waypoint title carry the area's name as C_Map.GetAreaInfo gives it on this client, "spot" when the
--     game has no name for the area and the headline sends the player to the marked spot, either with its place line.
-- Surface, Talent, Availability, Panel, Chain, Row, NpcName, NpcRequest, RowName and AreaName are Retail only: Classic has
-- no guide data, no garrison and none of these maps.
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
--   addon.Gui.Guide.Panel:TogglePin(row, achievement) and :Close(), with .Frame.Content holding NumGuideLines and
--     NumGuideButtons
--   addon.Gui.Guide.Content.DisplayUnderObjectives(objectives, achievement) -> the height the row grows by, the block as
--     objectives.GuideBlock with NumGuideLines and NumGuideButtons
--   addon.Gui.Guide.RequestNpcNames(achievements) -> the sorted NPC ids of their guides, each asked of the client once
--   addon.Options.db.profile.Achievements.Guide: Tooltip, RightClickMenu, Icon, ExpandedRow, WaypointProvider

local provider = {Both = 1, MapPin = 2, TomTom = 3} -- Achievements.Guide.WaypointProvider
local actionStyle = {Icons = 1, Links = 2} -- Achievements.Guide.ActionStyle
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
        Recorded = "Guide:2/2", Target = "Guide:2/2"},
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
    -- Super-tracking a POI can create the navigation frame (NAVIGATION_FRAME_CREATED is synchronous), so the portal is
    -- not super-tracked from the addon in combat either (code review of the branch)
    {Name = "waypoint-poi-in-combat", Kind = "Waypoint", Waypoint = paladinPortal, Provider = provider.MapPin,
        Available = {MapPin = false, Poi = true, TomTom = false, Combat = true},
        Recorded = "Poi:off", Target = "Poi:off"},
    -- Another class cannot see the Paladin portal's POI, so only TomTom can place it
    {Name = "waypoint-poi-hidden", Kind = "Waypoint", Waypoint = paladinPortal, Provider = provider.Both,
        Available = {MapPin = false, Poi = false, TomTom = true},
        Recorded = "TomTom:on", Target = "TomTom:on"},

    -- The side panel the row icon opens, and the block under an expanded row: with the map pin provider, 60962 has one
    -- waypoint action, for Zubashi, shown as an icon or a text link (Achievements.Guide.ActionStyle). Its number of lines
    -- depends on the character (the tiers still to research), so it is not counted
    {Name = "panel-60962", Kind = "Panel", Id = 60962, Options = {WaypointProvider = provider.MapPin, ActionStyle = actionStyle.Icons},
        Recorded = "icons:1 links:0", Target = "icons:1 links:0"},
    {Name = "panel-60962-links", Kind = "Panel", Id = 60962, Options = {WaypointProvider = provider.MapPin, ActionStyle = actionStyle.Links},
        Recorded = "icons:0 links:1", Target = "icons:0 links:1"},
    {Name = "panel-toggle-closes", Kind = "Panel", Id = 60962, Toggles = 2, Options = {WaypointProvider = provider.MapPin},
        Recorded = "hidden", Target = "hidden"},
    -- Hovering the row's guide icon shows the panel and leaving hides it, unless a click pinned it, like the reward
    -- preview. A panel opened while another side panel is open for the same row sits next to that one, and moves back
    -- next to the row when it closes; one open for another row is left alone (Krowi, 2026-10-11, Gui/SidePanels.lua).
    -- The other side panel is a stand-in frame registered in the chain.
    {Name = "panel-hover", Kind = "Chain", Mode = "hover", Id = 60962,
        Recorded = "hidden", Target = "hidden"},
    {Name = "panel-hover-then-click", Kind = "Chain", Mode = "hover-click", Id = 60962,
        Recorded = "shown", Target = "shown"},
    {Name = "chain-same-row", Kind = "Chain", Mode = "same-row", Id = 60962,
        Recorded = "stand-in>row", Target = "stand-in>row"},
    {Name = "chain-other-row", Kind = "Chain", Mode = "other-row", Id = 60962,
        Recorded = "row", Target = "row"},
    {Name = "row-60962", Kind = "Row", Id = 60962, Options = {ExpandedRow = true, WaypointProvider = provider.MapPin, ActionStyle = actionStyle.Icons},
        Recorded = "icons:1 links:0", Target = "icons:1 links:0"},
    {Name = "row-option-off", Kind = "Row", Id = 60962, Options = {ExpandedRow = false},
        Recorded = "none", Target = "none"},

    {Name = "waypoint-availability", Kind = "Availability", Maps = {648, 627},
        Recorded = "648:on,627:off", Target = "648:on,627:off"},

    -- An NPC step names the NPC as the player's client does, in its language (C_TooltipInfo on a unit link); the English
    -- name in the data is the fallback while the client has none
    {Name = "npc-name-from-game", Kind = "NpcName", NpcId = 97485, -- Archivist Zubashi, in the client's cache
        Recorded = "game", Target = "game"},
    {Name = "npc-name-unknown", Kind = "NpcName", NpcId = 999999, -- no such creature (Wowhead 404 on 2026-10-14)
        Recorded = "fallback", Target = "fallback"},
    -- A name that is a secret value, or tooltip data that is a secret table (encounter and other restrictions), is never
    -- indexed, compared or shown. Only the headless model can make them, so the game skips these scenarios
    {Name = "npc-name-secret", Kind = "NpcName", Secret = "value",
        Recorded = "fallback", Target = "fallback"},
    {Name = "npc-name-secret-table", Kind = "NpcName", Secret = "table", -- the taint review of the branch
        Recorded = "fallback", Target = "fallback"},
    -- A name the client gave once is kept for the session, so a secret value later on (an encounter) does not switch
    -- the step back to the data's English name (docs/work/2026-10-14-guide-row-npc-name). Headless only, like the above
    {Name = "npc-name-kept", Kind = "NpcName", NpcId = 424246, Kept = true,
        Recorded = "game", Target = "game"},
    -- The block under an expanded row picks the NPC's name up at the next list update once the client has it, instead
    -- of keeping the English name it was first drawn with. Headless only: the game cannot fill its cache on demand
    {Name = "row-npc-name-arrives", Kind = "RowName", NpcId = 424245, Options = {ExpandedRow = true, WaypointProvider = provider.MapPin},
        Recorded = "game", Target = "game"},
    -- At login the addon asks the client once for every guide NPC, so the name is cached before a guide shows
    {Name = "npc-names-requested", Kind = "NpcRequest", -- the twelve Legendary Research NPCs
        Recorded = "97485,97989,98939,105998,107994,108018,108050,108331,108527,109901,110725,112199",
        Target = "97485,97989,98939,105998,107994,108018,108050,108331,108527,109901,110725,112199"},

    -- An area step names the place as the game does, in the player's language, and points at the spot where the player
    -- walks in (the Illidari Gateway in Dalaran for The Fel Hammer)
    {Name = "area-name-from-game", Kind = "AreaName", AreaId = 8023, -- The Fel Hammer, the Demon Hunter hall's area
        Recorded = "game", Target = "game"},
    {Name = "area-name-unknown", Kind = "AreaName", AreaId = 999999, -- no such area in AreaTable
        Recorded = "spot", Target = "spot"},
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
            local next = lines[i + 1]
            return first and next and next:find(first.Text, 1, true) and "shown" or "header-only" -- the line adds the step number
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

-- The waypoint controls a guide frame shows, by kind: Gui/Guide/Content.lua pools icons and text links separately
local function CountControls(frame)
    local icons, links = frame.GuideIcons, frame.GuideLinks
    return ("icons:%d links:%d"):format(icons and icons.Used or 0, links and links.Used or 0)
end

-- Opens the panel next to a stand-in row (Toggles times) and reads what it laid out
local function RunPanel(env, scenario, observations)
    local module = GetModule()
    local panel = module and module.Panel
    if not panel then
        return "none"
    end
    local achievement, reason = env.Achievement(scenario.Id)
    if not achievement then
        return nil, reason
    end
    env.SetOptions(scenario.Options, observations)
    local ok, got = pcall(function()
        local anchor = env.Anchor()
        for _ = 1, scenario.Toggles or 1 do
            panel:TogglePin(anchor, achievement)
        end
        local frame = panel.Frame
        if not frame or not frame:IsShown() then
            return "hidden"
        end
        return CountControls(frame.Content)
    end)
    panel:Close()
    env.Teardown()
    if not ok then
        error(got, 0)
    end
    return got
end

-- What the panel is anchored to: the stand-in row, the stand-in side panel or anything else
local function GetAnchorName(env, frame)
    local _, relativeTo = frame:GetPoint(1)
    if relativeTo == env.Anchor() then
        return "row"
    end
    if relativeTo == env.StandIn() then
        return "stand-in"
    end
    return "other"
end

-- Hover and pin (Mode "hover", "hover-click"), or open the panel while a stand-in side panel is open for the same row or
-- another one and read the anchor before and after the stand-in closes (Mode "same-row", "other-row")
local function RunChain(env, scenario, observations)
    local module = GetModule()
    local panel = module and module.Panel
    if not panel or not panel.ShowUnpinned or not addon.Gui.RegisterSidePanel then
        return "none"
    end
    local achievement, reason = env.Achievement(scenario.Id)
    if not achievement then
        return nil, reason
    end
    env.SetOptions(scenario.Options, observations)
    local row, standIn = env.Anchor(), env.StandIn()
    addon.Gui.RegisterSidePanel(standIn)
    local ok, got = pcall(function()
        if scenario.Mode == "hover" or scenario.Mode == "hover-click" then
            panel:ShowUnpinned(row, achievement)
            if scenario.Mode == "hover-click" then
                panel:TogglePin(row, achievement)
            end
            panel:HideIfUnpinned(row)
            return panel.Frame:IsShown() and "shown" or "hidden"
        end
        standIn.OwnerButton = scenario.Mode == "same-row" and row or env.OtherRow()
        standIn:Show()
        panel:TogglePin(row, achievement)
        local first = GetAnchorName(env, panel.Frame)
        standIn:Hide()
        local second = GetAnchorName(env, panel.Frame)
        return first == second and first or first .. ">" .. second
    end)
    standIn:Hide()
    panel:Close()
    env.Teardown()
    if not ok then
        error(got, 0)
    end
    return got
end

-- Displays the block under a stand-in objectives frame, as an expanded row does, and reads what it laid out
local function RunRow(env, scenario, observations)
    local module = GetModule()
    local content = module and module.Content
    if not content or not content.DisplayUnderObjectives then
        return "none"
    end
    local achievement, reason = env.Achievement(scenario.Id)
    if not achievement then
        return nil, reason
    end
    env.SetOptions(scenario.Options, observations)
    local ok, got = pcall(function()
        local objectives = env.Objectives()
        local height = content.DisplayUnderObjectives(objectives, achievement)
        local block = objectives.GuideBlock
        if height == 0 or not block or not block:IsShown() then
            return "none"
        end
        return CountControls(block)
    end)
    env.Teardown()
    if not ok then
        error(got, 0)
    end
    return got
end

local fallbackName = "Fallback name" -- a data name no NPC has, so a step that shows it shows the data's name

-- The line GetLines gives for a one-step guide that sends the player to the NPC
local function RunNpcName(env, scenario)
    local module = GetModule()
    if not module or not module.GetLines then
        return "none"
    end
    local npcId = scenario.NpcId
    if scenario.Secret then
        if not env.SecretNpcId then
            return nil, "the game cannot make a secret name on demand"
        end
        npcId = env.SecretNpcId(scenario.Secret)
    end
    if scenario.Kept and not env.HideNpcName then
        return nil, "the game cannot make a name secret on demand"
    end
    -- Under encounter, PvP, map and similar restrictions the client hands addons its NPC names as secret values (seen
    -- in game in a raid on 2026-10-14 and in a scenario on 2026-10-17), and the guide shows a name kept from earlier in
    -- the session or else the data's: whether the client's name is read cannot be checked there
    if not scenario.Secret and not scenario.Kept and env.NpcNameIsSecret and env.NpcNameIsSecret(npcId) then
        return nil, "the client's NPC names are secret values here (encounter, PvP, map or similar restrictions); run it elsewhere"
    end
    local achievement = {Guide = {{Type = "Npc", NpcId = npcId, Name = fallbackName, MapId = zubashi.MapId, X = zubashi.X, Y = zubashi.Y}}}
    if scenario.Kept then
        if not pcall(module.GetLines, achievement) then -- the client gives the name once
            return "error"
        end
        env.HideNpcName(npcId) -- and a secret value from then on
    end
    local ok, lines = pcall(module.GetLines, achievement)
    if not ok then
        return "error" -- reading the name broke the whole guide
    end
    local line = lines[1]
    local title = line and line.Waypoint and line.Waypoint.Title
    if type(title) ~= "string" or title == "" or not line.Text:find(title, 1, true) then
        return "mixed" -- the headline and the waypoint disagree, or there is no name
    end
    return title == fallbackName and "fallback" or "game"
end

-- Headlessly the model logs which NPCs the client was asked for; the game cannot, so there the ids the warm-up returns
-- stand in
local function RunNpcRequest(env)
    local module = GetModule()
    if not module or not module.RequestNpcNames then
        return "none"
    end
    local stopLog = env.LogNpcQueries and env.LogNpcQueries()
    local ids = module.RequestNpcNames(env.Achievements())
    if stopLog then
        ids = stopLog()
    end
    return #ids > 0 and table.concat(ids, ",") or "empty"
end

-- A one-step NPC guide under the stand-in objectives: displayed while the client has no name for the NPC, then the
-- client learns one and the block is displayed again the way the next list update does, without forcing a render
local function RunRowName(env, scenario, observations)
    local module = GetModule()
    local content = module and module.Content
    if not content or not content.DisplayUnderObjectives then
        return "none"
    end
    if not env.TeachNpcName then
        return nil, "the game cannot add a name to its creature cache on demand"
    end
    env.SetOptions(scenario.Options, observations)
    local ok, got = pcall(function()
        local objectives = env.Objectives()
        local achievement = {Id = 1, Guide = {{Type = "Npc", NpcId = scenario.NpcId, Name = fallbackName, MapId = zubashi.MapId, X = zubashi.X, Y = zubashi.Y}}}
        local function Headline()
            local headlines = objectives.GuideBlock and objectives.GuideBlock.GuideHeadlines
            local text = headlines and headlines[1] and headlines[1]:GetText() or ""
            if text:find("Learned Name", 1, true) then
                return "game"
            end
            return text:find(fallbackName, 1, true) and "fallback" or "mixed"
        end
        content.DisplayUnderObjectives(objectives, achievement)
        local first = Headline()
        if first ~= "fallback" then
            return "first:" .. first -- the client knew the name already, so the second display proves nothing
        end
        env.TeachNpcName(scenario.NpcId, "Learned Name")
        content.DisplayUnderObjectives(objectives, achievement)
        return Headline()
    end)
    env.Teardown()
    if not ok then
        error(got, 0)
    end
    return got
end

-- The area's name as this client has it, in its language; nil when the game has none
local function GetGameAreaName(areaId)
    local name = C_Map.GetAreaInfo and C_Map.GetAreaInfo(areaId)
    if type(name) == "string" and name ~= "" then
        return name
    end
end

-- A one-step area guide on a spot in Dalaran, read the way every surface reads it
local function RunAreaName(env, scenario)
    local module = GetModule()
    if not module or not module.GetLines then
        return "none"
    end
    local achievement = {Guide = {{Type = "Area", AreaId = scenario.AreaId, MapId = dalaran.MapId, X = dalaran.X, Y = dalaran.Y}}}
    local ok, lines = pcall(module.GetLines, achievement)
    if not ok then
        return "error"
    end
    local line = lines[1]
    if not line then
        return "none" -- the renderer skips a step type it does not know
    end
    if not line.Details or not line.Details[1] then
        return "no-place"
    end
    local name = GetGameAreaName(scenario.AreaId)
    if name then
        local title = line.Waypoint and line.Waypoint.Title
        return title == name and line.Text:find(name, 1, true) and "game" or "mixed"
    end
    return line.Text == env.Text("Guide Go To Spot") and "spot" or "mixed"
end

local runners = {
    Surface = RunSurface,
    Talent = RunTalent,
    Faction = RunFaction,
    Waypoint = RunWaypoint,
    Availability = RunAvailability,
    Panel = RunPanel,
    Chain = RunChain,
    Row = RunRow,
    NpcName = RunNpcName,
    NpcRequest = RunNpcRequest,
    RowName = RunRowName,
    AreaName = RunAreaName
}

local retailOnly = {Surface = true, Talent = true, Availability = true, Panel = true, Chain = true, Row = true, NpcName = true,
    NpcRequest = true, RowName = true, AreaName = true}

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
        tinsert(observations, ("%d surface, talent, panel, chain, row, availability, NPC and area scenarios are Retail only: Classic has no guide data, no garrison and none of their maps"):format(skipped))
    end
    -- What 60962's guide reads for the character running the suite: the scenarios above check its shape, this its words,
    -- which depend on the character's class and talent tree
    local module = GetModule()
    local achievement = env.IsRetail() and module and module.GetLines and env.Achievement(60962)
    if achievement then
        for _, line in ipairs(module.GetLines(achievement)) do
            local details = line.Details and #line.Details > 0 and " | " .. table.concat(line.Details, " | ") or ""
            tinsert(observations, ("60962 step %d (%s%s): %s%s"):format(line.Number or 0, line.Kind, line.State and ", " .. line.State or "", line.Text, details))
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

function gameEnv.Achievements()
    return addon.Data.Achievements
end

-- Whether the client hands addons the NPC's name as a secret value where the player is now. Every step is checked
-- before it is indexed or compared, as Gui/Guide/Guide.lua does; no data at all is not secret, just unknown
function gameEnv.NpcNameIsSecret(npcId)
    if not C_TooltipInfo or not C_TooltipInfo.GetHyperlink or not canaccessvalue then
        return false
    end
    local data = C_TooltipInfo.GetHyperlink(("unit:Creature-0-0-0-0-%d-0000000000"):format(npcId))
    for _, key in ipairs({"lines", 1}) do
        if type(data) ~= "table" then
            return false
        end
        if canaccesstable and not canaccesstable(data) then
            return true
        end
        data = data[key]
    end
    if type(data) ~= "table" then
        return false
    end
    if canaccesstable and not canaccesstable(data) then
        return true
    end
    local text = data.leftText
    return type(text) == "string" and not canaccessvalue(text)
end

addon.Tests.Ready.guide = function()
    if addon.Util.IsMainline and not addon.Data.Achievements[60962] then
        return false, "the achievement data is not loaded yet"
    end
    return true
end

local savedOptions, anchor, objectivesStandIn, otherRow, sidePanelStandIn

-- A second stand-in row, for a side panel that belongs to another achievement
function gameEnv.OtherRow()
    otherRow = otherRow or CreateFrame("Frame", nil, UIParent)
    return otherRow
end

-- A stand-in for the reward preview: an empty frame the side panel chain treats as another panel; hidden between runs
function gameEnv.StandIn()
    if not sidePanelStandIn then
        sidePanelStandIn = CreateFrame("Frame", nil, UIParent)
        sidePanelStandIn:SetSize(10, 10)
        sidePanelStandIn:Hide()
    end
    return sidePanelStandIn
end

-- A stand-in for an achievement row: the panel anchors to it
function gameEnv.Anchor()
    anchor = anchor or CreateFrame("Frame", nil, UIParent)
    anchor:SetSize(100, 20)
    anchor:SetPoint("CENTER")
    return anchor
end

-- A stand-in for the objectives frame of an expanded row, hidden: the block only needs its width
function gameEnv.Objectives()
    if not objectivesStandIn then
        objectivesStandIn = CreateFrame("Frame", nil, UIParent)
        objectivesStandIn:Hide()
    end
    objectivesStandIn:SetSize(400, 20)
    return objectivesStandIn
end

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