local _, addon = ...
addon.Tests.Help = {}
local help = addon.Tests.Help

-- The help content of the options window (docs/work/2026-10-25-options-revamp, plan-help.md): whether every section
-- has its explanation, every block is well formed and translated, every picture has its size and file, and which
-- sections have a Show me. It reads only the seam addon.Options.Window.Help, so the same scenarios run in game
-- (/kaftest help) and headlessly (.claude/tools/headless/run-tests.lua) against the whole addon loaded by
-- .claude/tools/headless/options-env.lua. Recorded is the behaviour of the current code; a scenario passes when the
-- code still behaves that way. Target is the desired behaviour; a scenario whose Recorded differs from Target is open.
-- One scenario is headless only (map-showme-under-settings): it shows and hides models of Blizzard's Settings window and
-- the game menu, which test code never does in game, so the game SKIPs it; the options suite's live steps cover it there
-- with real clicks.

-- The sections of plan.md (Track A, step 4), in the order of the window's navigation
local sectionIds = {"overview", "tabs", "window", "categories", "summary", "achievements", "filters", "search", "tooltips",
    "rightclick", "popout", "rewards", "guides", "calendar", "maps", "criteria", "events", "eventlist", "keys", "plugins",
    "profiles", "advanced", "about"}

local function Window()
    return addon.Options.Window
end

local function Entries()
    local window = Window()
    local entries = window and window.Help
    if not entries or not next(entries) then
        return
    end
    return entries
end

local function Join(list)
    sort(list)
    return #list == 0 and "none" or table.concat(list, ",")
end

-- A string the locale does not know comes back as its key, "Help <Section> <Part>", without punctuation
local function IsUnresolved(text)
    return type(text) ~= "string" or text == "" or text:match("^Help %u%a* %u[%a ]*$") ~= nil
end

local function IsBadBlock(block)
    if type(block) ~= "table" then
        return true
    end
    if block.Picture then
        return block.Heading or block.Text or block.Term or type(block.Width) ~= "number" or type(block.Height) ~= "number"
            or type(block.TexCoords) ~= "table" or #block.TexCoords ~= 4
    end
    if block.Heading then
        return block.Text or block.Term
    end
    return block.Text == nil
end

-- The Maps help's map route (Options/Window/Help/ShowMe.lua) once: route.Maps.ShowMeSecure with the pane's Show me
-- button, answered and looked at. "laid": it answers true with its see-through secure button shown over Show me; "off":
-- it answers false and lays nothing, so the window hides Show me and shows the Maps help's note; anything else is spelt
-- out
local function MapRouteCase(route)
    local answer = route.Maps.ShowMeSecure(route.Owner, route.Close)
    local laid = route.Laid()
    if answer == true and laid then
        return "laid"
    end
    if answer == false and not laid then
        return "off"
    end
    return ("answered %s, %s"):format(tostring(answer), laid and "laid" or "nothing laid")
end

-- Observe(headless): a function returning the line's value, or nil and the reason it could not run. headless is the
-- headless runner's model (run-tests.lua suites.help), nil in game
help.Scenarios = {
    {Name = "sections",
        Observe = function()
            local entries = Entries()
            if not entries then return "no help" end
            local known, missing, extra, count = {}, {}, {}, 0
            for _, id in ipairs(sectionIds) do
                known[id] = true
                if not entries[id] then tinsert(missing, id) end
            end
            for id in next, entries do
                count = count + 1
                if not known[id] then tinsert(extra, tostring(id)) end
            end
            return ("entries=%d missing=%s extra=%s"):format(count, Join(missing), Join(extra))
        end,
        Recorded = "entries=23 missing=none extra=none",
        Target = "entries=23 missing=none extra=none"},
    {Name = "blocks",
        Observe = function()
            local entries = Entries()
            if not entries then return "no help" end
            local bad, unresolved = 0, 0
            for _, entry in next, entries do
                if IsUnresolved(entry.Title) then unresolved = unresolved + 1 end
                if type(entry.Blocks) ~= "table" or #entry.Blocks == 0 then
                    bad = bad + 1
                else
                    for _, block in ipairs(entry.Blocks) do
                        if IsBadBlock(block) then
                            bad = bad + 1
                        else
                            for _, field in ipairs({"Heading", "Term", "Text"}) do
                                if block[field] ~= nil and IsUnresolved(block[field]) then unresolved = unresolved + 1 end
                            end
                        end
                    end
                end
            end
            return ("bad=%d unresolved=%d"):format(bad, unresolved)
        end,
        Recorded = "bad=0 unresolved=0",
        Target = "bad=0 unresolved=0"},
    {Name = "pictures",
        Observe = function()
            local entries = Entries()
            if not entries then return "no help" end
            local window = Window()
            local missing = #(window.HelpMissingPictures or {})
            -- headlessly the runner can look for the file itself; the game cannot, so there the generated sizes count
            local exists = addon.Tests.FileExists
            for _, entry in next, entries do
                for _, block in ipairs(entry.Blocks or {}) do
                    if type(block) == "table" and block.Picture and exists and not exists(block.Picture .. ".tga") then
                        missing = missing + 1
                    end
                end
            end
            return ("missing=%d"):format(missing)
        end,
        Recorded = "missing=0",
        Target = "missing=0"},
    {Name = "show-me",
        Observe = function()
            local entries = Entries()
            if not entries then return "no help" end
            local ids = {}
            for id, entry in next, entries do
                if type(entry.ShowMe) == "function" or type(entry.ShowMeSecure) == "function" then
                    tinsert(ids, id)
                end
            end
            return Join(ids)
        end,
        Recorded = "achievements,calendar,categories,eventlist,events,filters,guides,maps,popout,rewards,rightclick,search,summary,tabs,tooltips,window",
        RecordedClassic = "achievements,calendar,categories,eventlist,events,filters,maps,popout,rewards,rightclick,search,summary,tabs,tooltips,window",
        Target = "achievements,calendar,categories,eventlist,events,filters,guides,maps,popout,rewards,rightclick,search,summary,tabs,tooltips,window",
        TargetClassic = "achievements,calendar,categories,eventlist,events,filters,maps,popout,rewards,rightclick,search,summary,tabs,tooltips,window"},
    {Name = "map-agrees",
        Observe = function()
            -- Track A's map: Map.Sections, each {Id, Name, ...}; Overview is the window's own page and has no entry there
            local window = Window()
            local sections = window and window.Map and window.Map.Sections
            if type(sections) ~= "table" then return "no map" end
            local entries = Entries() or {}
            local without = {}
            for _, section in ipairs(sections) do
                if not entries[section.Id] then
                    tinsert(without, tostring(section.Id))
                end
            end
            return #without == 0 and "agrees" or ("no help for=" .. Join(without))
        end,
        Recorded = "agrees",
        Target = "agrees"},
    -- The Maps help's Show me while Blizzard's Settings window is open (docs/work/2026-11-07-settings-panel-taint): the map
    -- route lays its see-through secure button one strata above the options window (DIALOG), so above Settings (HIGH),
    -- where a click meant for Settings, brought to the front over the options window, opened the map and closed the
    -- options window. While Settings is shown the route is to answer false and lay nothing (the Maps help's note shows
    -- instead), and to lay its button again once it is gone. The game menu is left alone: it never shows over the options
    -- window (Escape, the micro button and Settings' way back all reach CloseAllWindows first), so its case stays laid.
    -- The route lays it first with neither shown, so the Settings case also checks that a button already laid is let go;
    -- then Settings is shown, then the game menu instead, then neither. Headless only: in game test code never shows or
    -- hides Blizzard's windows; the options suite's live steps open and close them by real clicks instead.
    {Name = "map-showme-under-settings",
        Observe = function(headless)
            if not (headless and headless.MapRoute) then
                return nil, "headless only: shows and hides models of Blizzard's Settings window and the game menu"
            end
            local route = headless.MapRoute()
            if not (route.Maps and route.Maps.ShowMeSecure) then return "no map route" end
            route.SetWindows(false, false)
            local first = MapRouteCase(route)
            if first ~= "laid" then
                return "with neither shown first: " .. first
            end
            route.SetWindows(true, false)
            local settings = MapRouteCase(route)
            route.SetWindows(false, true)
            local menu = MapRouteCase(route)
            route.SetWindows(false, false)
            local neither = MapRouteCase(route)
            return ("settings: %s; menu: %s; neither: %s"):format(settings, menu, neither)
        end,
        Recorded = "settings: laid; menu: laid; neither: laid", -- before the fix the button stayed over Settings
        Target = "settings: off; menu: laid; neither: laid"},
}

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(scenario, headless)
    local ok, got, reason = pcall(scenario.Observe, headless)
    local isRetail = addon.Util.IsMainline
    local recorded = (not isRetail and scenario.RecordedClassic) or scenario.Recorded
    local target = (not isRetail and scenario.TargetClassic) or scenario.Target
    if not ok then
        return { Name = scenario.Name, Status = "FAIL", TargetMet = false, Line = ("help/%s: FAIL error=[%s]"):format(scenario.Name, tostring(got)) }
    end
    if got == nil then
        return { Name = scenario.Name, Status = "SKIP", Line = ("help/%s: SKIP %s"):format(scenario.Name, reason or "could not run") }
    end
    local status = got == recorded and "PASS" or "FAIL"
    local targetMet = got == target
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("help/%s: %s got=[%s] target=[%s] %s"):format(scenario.Name, status, got, target, targetMet and "met" or "open")
    }
end

-- headless: the headless runner's model, nil in game
function help.Run(headless)
    local results = {}
    for _, scenario in ipairs(help.Scenarios) do
        tinsert(results, RunScenario(scenario, headless))
    end
    return results
end

-- Not a scenario: the pictures still to be made, by name
function help.Observations()
    local window = Window()
    local missing = window and window.HelpMissingPictures
    if not missing or #missing == 0 then return {} end
    local names = {}
    for i, name in ipairs(missing) do names[i] = name end
    return { "pictures not made yet: " .. Join(names) }
end

addon.Tests.Suites.help = function()
    return help.Run(), help.Observations()
end

addon.Tests.Ready.help = function()
    return true
end