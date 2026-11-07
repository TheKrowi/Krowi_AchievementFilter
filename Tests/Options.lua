local addonName, addon = ...
addon.Tests.Options = {}
local options = addon.Tests.Options

-- The options window (docs/work/2026-10-25-options-revamp): whether every option of the AceConfig pages reaches the
-- window, behaves there as it does in AceConfig, and whether the game's Settings > AddOns holds the stub page only.
-- The window's model (addon.Options.Window.Model) answers without drawing anything, so the same scenarios run in game
-- (/kaftest options) and headlessly (.claude/tools/headless/run-tests.lua) against the whole addon loaded by
-- .claude/tools/headless/options-env.lua. Recorded is the behaviour of the current code; a scenario passes when the
-- code still behaves that way. Target is the desired behaviour; a scenario whose Recorded differs from Target is open.
-- These scenarios are stage 2's regression suite: the definition format that replaces AceConfig must keep them green.
-- The suite is this addon's own (docs/work/2026-11-06-options-tests-move): its options and their mapping into the
-- window, defaults, the move of Y at login, its window config and help content, the plugin groups, and a smoke through
-- Krowi_Options' public surface. The library tests its own internals (search, row and card geometry, the window's
-- frames, hover help, tabs, sizes, strings, globals) in Krowi_Libraries\Krowi_Options: its test addon
-- Tests/Krowi_OptionsTests (/kotest, which hosts the library without this addon) and its headless suites in
-- Tests/headless.

local function Model()
    return addon.Options.Window and addon.Options.Window.Model
end

-- AceConfigDialog:AddToBlizOptions keeps every page it adds under BlizOptions[appName]
local function CountKafPages()
    local pages = LibStub("AceConfigDialog-3.0").BlizOptions or {}
    local n = 0
    for _, app in ipairs({ addon.Metadata.Title, "KrowiAF_Layout", "KrowiAF_EventReminders", "KrowiAF_Profiles", "KrowiAF_Plugins", "KrowiAF_Credits" }) do
        if pages[app] then n = n + 1 end
    end
    return n
end

local function Join(list)
    return #list == 0 and "none" or table.concat(list, ",")
end

-- The move of Y at login (issue #197, docs/work/197-reopen-where-left-off) on a model of the key bindings, so no scenario
-- touches the player's own (Gui/Gui.lua UseBindingsForTest). Unless the case says otherwise: Y on Blizzard's Toggle
-- Achievements, the account's binding set, out of combat, a new install's pending move, and the addon's Achievements tab
-- as the micro button's. The line is what Y runs afterwards, whether the move is still pending and the set it saved
local function MoveYAtLogin(case)
    local gui = addon.Gui
    if not gui.UseBindingsForTest then
        return "no move at login"
    end
    local keys = { Y = case.Y or "TOGGLEACHIEVEMENT" }
    local setUp = { YBindingPending = not case.Existing or nil }
    local saved = "none"
    gui:UseBindingsForTest({
        FirstTimeSetUp = function() return setUp end,
        MicroButtonCommand = function() return case.Command or "KrowiAF_OPEN_TAB_Achievements" end,
        BindingSet = function() return Enum.BindingSet[case.BindingSet or "Account"] end,
        InCombat = function() return case.InCombat or false end,
        CommandOnKey = function(key) return keys[key] or "" end,
        Bind = function(key, command)
            if case.BindFails then
                return false
            end
            keys[key] = command
            return true
        end,
        Save = function(set) saved = tostring(set) end
    })
    local ok, err = pcall(gui.MoveYToMicroButtonTab, gui)
    gui:UseBindingsForTest(nil)
    if not ok then
        error(err, 0)
    end
    return ("y=%s pending=%s saved=%s"):format(keys.Y, tostring(setUp.YBindingPending), saved)
end

-- The headings of every section that have nothing under them on this client, and the All / None rows whose options are
-- all hidden, as section/heading. A heading's rows end at the next heading, a sub-heading's also at the next sub-heading;
-- a note is a row (About's credits are notes), an All / None row is not one of its own.
local contentKinds = { Note = true, Grid = true, TabList = true, Link = true, Cards = true }
local function EmptyHeadings()
    local window = addon.Options.Window
    local empty = {}
    for _, section in ipairs(window.Map.Sections) do
        local header, subHeading
        local function Close(heading)
            if heading and not heading.Filled then empty[#empty + 1] = section.Id .. "/" .. heading.Text end
        end
        for _, element in ipairs(window.Source.Elements(section)) do
            local kind = element.Kind
            if kind == "Header" then
                Close(subHeading)
                Close(header)
                header, subHeading = { Text = element.Text }, nil
            elseif kind == "SubHeading" then
                Close(subHeading)
                subHeading = { Text = element.Text }
            elseif kind == "Sub" then
                local shown = false
                for _, member in ipairs(element.Members or {}) do
                    if not member:IsHidden() then shown = true end
                end
                if not shown then empty[#empty + 1] = section.Id .. "/" .. element.Text end
            elseif contentKinds[kind] or (kind == "Option" and not element.Option:IsHidden()) then
                if header then header.Filled = true end
                if subHeading then subHeading.Filled = true end
            end
        end
        Close(subHeading)
        Close(header)
    end
    return #empty == 0 and "none" or table.concat(empty, ",")
end

-- The rows under one of a section's headings (docs/work/2026-11-02-options-widths): each row's option key, and the
-- option drawn after its check box with its key, and a button's text, as the game's Tutorials and Mouse Sensitivity rows
local function RowsUnder(sectionId, header)
    local source = addon.Options.Window.Source
    local rows, under = {}, false
    for _, element in ipairs(source.Elements(source.Section(sectionId))) do
        if element.Kind == "Header" then under = element.Text == header end
        if under and element.Option then
            local key, with = element.Option.Info[#element.Option.Info], element.With
            local withKey = with and with.Info[#with.Info]
            rows[#rows + 1] = not with and key or with.Type == "execute" and ("%s+%s[%s]"):format(key, withKey, with:GetButtonText())
                or ("%s+%s"):format(key, withKey)
        end
    end
    return table.concat(rows, " ")
end

-- What Overview shows under each group's header (docs/work/2026-11-02-overview-cards): the links or cards, the rows the
-- cards take, and what fills each card's picture area and line
local function OverviewLine()
    local window = addon.Options.Window
    local groups = {}
    for _, group in ipairs(window.Map.Groups) do groups[group.Name] = true end
    local n = { links = 0, cards = 0, rows = 0, pictures = 0, icons = 0, lines = 0 }
    local optionsLib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
    local columns = (optionsLib.Internal or optionsLib).CardColumns
    local under = false
    for _, element in ipairs(window.Controller.Config.GetElements("overview")) do
        if element.Kind == "Header" then under = groups[element.Text] or false end
        if under and element.Kind == "Link" then
            n.links = n.links + 1
        elseif under and element.Kind == "Cards" then
            n.cards = n.cards + #element.Cards
            n.rows = n.rows + math.ceil(#element.Cards / columns)
            for _, card in ipairs(element.Cards) do
                if card.Picture then n.pictures = n.pictures + 1 elseif card.Icon then n.icons = n.icons + 1 end
                if card.Text and card.Text ~= "" then n.lines = n.lines + 1 end
            end
        end
    end
    return ("links=%d cards=%d rows=%d pictures=%d icons=%d lines=%d"):format(n.links, n.cards, n.rows, n.pictures, n.icons, n.lines)
end

-- Observe: a function returning the line's value, or nil and the reason it could not run
options.Scenarios = {
    {Name = "settings-entry",
        Observe = function()
            local stub = addon.Options.Window and addon.Options.Window.StubCategory and "yes" or "no"
            return ("pages=%d stub=%s"):format(CountKafPages(), stub)
        end,
        Recorded = "pages=0 stub=yes",
        Target = "pages=0 stub=yes"},
    {Name = "options-registered",
        Observe = function()
            local registry = LibStub("AceConfigRegistry-3.0")
            local n = 0
            for _, app in ipairs({ addon.Metadata.Title, "KrowiAF_Layout", "KrowiAF_EventReminders", "KrowiAF_Profiles", "KrowiAF_Plugins", "KrowiAF_Credits" }) do
                if registry:GetOptionsTable(app, "cmd", "KROWIAF-0.0") then n = n + 1 end
            end
            return ("apps=%d"):format(n)
        end,
        Recorded = "apps=6",
        Target = "apps=6"},
    {Name = "every-option-mapped-once",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            local c = model.Coverage()
            return ("unmapped=%d double=%d missing-paths=%d"):format(#c.Unmapped, #c.Double, #c.MissingPaths)
        end,
        Recorded = "unmapped=0 double=0 missing-paths=0", -- unmapped=1 (the tutorial button) until the tutorial went
        Target = "unmapped=0 double=0 missing-paths=0"},
    {Name = "set-through-window-equals-aceconfig",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("mismatches=%d"):format(#model.CheckRoundTrip())
        end,
        Recorded = "mismatches=0",
        Target = "mismatches=0"},
    -- every option's id, type and derived default: stage 2's definitions must reproduce it (labels and the disabled
    -- state are left out: headless labels come from stand-in global strings, and the disabled state follows the
    -- player's own settings, so neither would match between the game and the headless run)
    {Name = "options-fingerprint",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("options=%d hash=%s"):format(model.Fingerprint())
        end,
        -- The key binding options' keys carry an auto-numbered order (Binding523Key1): removing the tutorial button
        -- (2026-10-25) took one number out and moved them all, c7f9546a / 3ffe49dd before. Stage 2 gives them fixed ids.
        -- #188 added Position applies to and Hide placeholders (406 / 302 before, 8bb98662 / 06ba645e)
        Recorded = "options=408 hash=13b38c99",
        Target = "options=408 hash=13b38c99",
        RecordedClassic = "options=304 hash=122eff6c",
        TargetClassic = "options=304 hash=122eff6c"},
    {Name = "defaults-restore-acedb",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("differences=%d"):format(#model.CheckDefaults())
        end,
        Recorded = "differences=0",
        Target = "differences=0"},
    {Name = "derived-default-matches-text",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("mismatches=%d"):format(#(model.CheckDerivedDefaults()))
        end,
        Recorded = "mismatches=0",
        Target = "mismatches=0"},
    {Name = "changed-line",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("wrong=%d"):format(#model.CheckChangedLines())
        end,
        Recorded = "wrong=0",
        Target = "wrong=0"},
    {Name = "plugins-present",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return "groups=" .. Join(model.PluginGroups())
        end,
        Recorded = "groups=Achievements Tab Fixes,Better Wardrobe,EllesmereUI,ElvUI,GW 2 UI,Instance Achievement Tracker,Zygor Guides Viewer",
        Target = "groups=Achievements Tab Fixes,Better Wardrobe,EllesmereUI,ElvUI,GW 2 UI,Instance Achievement Tracker,Zygor Guides Viewer"},
    {Name = "retail-only-hidden-on-classic",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("visible-retail-only=%d"):format(#model.VisibleRetailOnly())
        end,
        Recorded = "visible-retail-only=0",
        Target = "visible-retail-only=0"},
    -- No heading without rows under it, and no All / None row with nothing to switch (Krowi on Mists, 2026-11-04: Reminder
    -- events' World Events and Other calendar events headings, whose options are all Retail-only)
    {Name = "no-empty-headings",
        Observe = function()
            if not (addon.Options.Window and addon.Options.Window.Map) then return "no window" end
            return EmptyHeadings()
        end,
        Recorded = "none",
        Target = "none",
        -- before the map marked them Retail as headings: eventlist/All other calendar events, eventlist/Other calendar events
        -- and the six eventlist/World Events: <expansion> headings
        RecordedClassic = "none",
        TargetClassic = "none"},
    -- Issue #197: a new install moves Y from Blizzard's Toggle Achievements to the micro button's tab once the key bindings
    -- are loaded. The headless load is a new install, with the bindings loaded as the game loads them (none at
    -- ADDON_LOADED, the account's set by PLAYER_LOGIN); a game session is not, so the game skips this one
    {Name = "y-on-new-install",
        Observe = function()
            local seen = addon.Tests.NewInstall
            if not seen then
                return nil, "needs a new install (headless only)"
            end
            return ("y=%s pending=%s"):format(tostring(seen.Y), tostring(seen.Pending))
        end,
        Recorded = "y=KrowiAF_OPEN_TAB_Achievements pending=nil", -- y=TOGGLEACHIEVEMENT until the fix: the first run called the removed GetBindingByKey before any binding was loaded
        Target = "y=KrowiAF_OPEN_TAB_Achievements pending=nil"},
    {Name = "y-at-login-new",
        Observe = function() return MoveYAtLogin({}) end,
        Recorded = "y=KrowiAF_OPEN_TAB_Achievements pending=nil saved=1", -- "no move at login" until the fix, as for every case below
        Target = "y=KrowiAF_OPEN_TAB_Achievements pending=nil saved=1"},
    {Name = "y-at-login-bindings-not-loaded",
        Observe = function() return MoveYAtLogin({BindingSet = "Default"}) end, -- 0, what the game reports before they load
        Recorded = "y=TOGGLEACHIEVEMENT pending=true saved=none",
        Target = "y=TOGGLEACHIEVEMENT pending=true saved=none"},
    {Name = "y-at-login-character-set",
        Observe = function() return MoveYAtLogin({BindingSet = "Character"}) end,
        Recorded = "y=TOGGLEACHIEVEMENT pending=true saved=none",
        Target = "y=TOGGLEACHIEVEMENT pending=true saved=none"},
    {Name = "y-at-login-combat",
        Observe = function() return MoveYAtLogin({InCombat = true}) end, -- a /reload in combat
        Recorded = "y=TOGGLEACHIEVEMENT pending=true saved=none",
        Target = "y=TOGGLEACHIEVEMENT pending=true saved=none"},
    {Name = "y-at-login-y-taken",
        Observe = function() return MoveYAtLogin({Y = "TOGGLEWORLDMAP"}) end,
        Recorded = "y=TOGGLEWORLDMAP pending=nil saved=none",
        Target = "y=TOGGLEWORLDMAP pending=nil saved=none"},
    {Name = "y-at-login-existing-account",
        Observe = function() return MoveYAtLogin({Existing = true}) end, -- first run before this fix: Y is left alone (Krowi, 2026-10-26)
        Recorded = "y=TOGGLEACHIEVEMENT pending=nil saved=none",
        Target = "y=TOGGLEACHIEVEMENT pending=nil saved=none"},
    {Name = "y-at-login-bind-refused",
        Observe = function() return MoveYAtLogin({BindFails = true}) end, -- SetBinding returns false: nothing saved, tried again next login
        Recorded = "y=TOGGLEACHIEVEMENT pending=true saved=none",
        Target = "y=TOGGLEACHIEVEMENT pending=true saved=none"},
    {Name = "y-at-login-blizzard-tab",
        Observe = function() return MoveYAtLogin({Command = "TOGGLEACHIEVEMENT"}) end, -- the micro button opens Blizzard's own tab
        Recorded = "y=TOGGLEACHIEVEMENT pending=nil saved=none",
        Target = "y=TOGGLEACHIEVEMENT pending=nil saved=none"},
    -- One window for every Krowi addon, a tab each (docs/work/2026-10-30-options-settings-look): this addon's tab is in
    -- the registry under its name, whatever tabs other addons add (the library's test addon adds its own). The registry's
    -- order and the other tabs are the library's to test (Krowi_Options' window-tabs and window-second-tab).
    {Name = "window-tabs",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
            local tabs = (lib.Internal or lib).Tabs
            if not tabs then return "no tab registry" end
            local names = {}
            for _, tab in ipairs(tabs) do
                if tab == addon.Options.Window.Controller then names[#names + 1] = tab.Config.TabName end
            end
            return "tabs=" .. Join(names)
        end,
        -- "no tab registry" before the tabs; until 2026-11-06 the whole list, so another addon's tab failed it
        -- ("tabs=Achievement Filter,Options Test" with the library's test addon in game)
        Recorded = "tabs=Achievement Filter",
        Target = "tabs=Achievement Filter"},
    -- The window's texts are Krowi_Options' own (docs/work/2026-11-04-krowi-options-library): this addon's config passes
    -- none. This addon's half only; the library's half, its strings with none empty, is Krowi_Options' library-strings.
    {Name = "library-strings",
        Observe = function()
            return "config=" .. (addon.Options.Window.Controller.Config.Strings and "yes" or "no")
        end,
        -- "strings=22 empty=0 config=no" with the library's half until 2026-11-06; "no strings of its own" with
        -- Krowi_Options 1, whose 22 texts this addon passed
        Recorded = "config=no",
        Target = "config=no"},
    -- The Overview's legend explains the reload arrow with the very line the hover text shows (code review of PR #395).
    -- It used Krowi_Util's phrase, which is orange on every client but English, while the library's hover text is plain:
    -- the two differed on those clients only, so this English run cannot show it.
    {Name = "help-reload-line",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
            local prefix = lib.Markup.Reload .. " "
            for _, block in ipairs(addon.Options.Window.Help.overview.Blocks) do
                if block.Text and block.Text:sub(1, #prefix) == prefix then
                    return block.Text:sub(#prefix + 1) == lib.GetStrings().NeedsReload and "the hover text" or "another text"
                end
            end
            return "no reload line"
        end,
        Recorded = "the hover text",
        Target = "the hover text"},
    -- Krowi (2026-11-02): each window's reset button after its Remember check box, named as its own row was
    {Name = "position-rows",
        Observe = function() return RowsUnder("window", addon.L["Position"]) end,
        -- a row per option before: "SwitchMovable AchievementWindowRememberLastPosition AchievementWindowResetPosition ...",
        -- then each button named as its row had been ("[Reset window position]")
        Recorded = "SwitchMovable AchievementWindowRememberLastPosition+AchievementWindowResetPosition[Reset position]"
            .. " CalendarRememberLastPosition+CalendarResetPosition[Reset position]"
            .. " DataManagerRememberLastPosition+DataManagerResetPosition[Reset position]",
        -- then (Krowi, the same day) one "Reset position" for all three: the check box's name says which window
        Target = "SwitchMovable AchievementWindowRememberLastPosition+AchievementWindowResetPosition[Reset position]"
            .. " CalendarRememberLastPosition+CalendarResetPosition[Reset position]"
            .. " DataManagerRememberLastPosition+DataManagerResetPosition[Reset position]"},
    -- Krowi (2026-11-02): the threshold's slider after the Force two columns check box, as the game's Mouse Sensitivity
    {Name = "objectives-rows",
        Observe = function() return RowsUnder("achievements", addon.L["Objectives"]) end,
        Recorded = "ForceTwoColumns+ForceTwoColumnsThreshold CriteriaBehaviour", -- a row each before
        Target = "ForceTwoColumns+ForceTwoColumnsThreshold CriteriaBehaviour"},
    -- Krowi (2026-11-02): the pop outs' delay and snap distance after their check boxes
    {Name = "popout-rows",
        Observe = function() return RowsUnder("popout", addon.L["Pop Outs"]) end,
        Recorded = "PersistAcrossSessions RememberSize RememberLastPosition DefaultWidth CloseOnEarn+CloseOnEarnDelay EnableSnapping+SnapDistance", -- a row each before
        Target = "PersistAcrossSessions RememberSize RememberLastPosition DefaultWidth CloseOnEarn+CloseOnEarnDelay EnableSnapping+SnapDistance"},
    -- Krowi (2026-11-02): Overview shows each group's sections as cards, three to a row, with the section's first help
    -- picture or, without one, a game icon, and a line on what it covers; Achievement guides has no picture on Mists
    {Name = "overview-cards",
        Observe = OverviewLine,
        Recorded = "links=0 cards=22 rows=9 pictures=15 icons=7 lines=22", -- "links=22 cards=0 rows=0 pictures=0 icons=0 lines=0" before the cards
        RecordedClassic = "links=0 cards=22 rows=9 pictures=14 icons=8 lines=22",
        Target = "links=0 cards=22 rows=9 pictures=15 icons=7 lines=22",
        TargetClassic = "links=0 cards=22 rows=9 pictures=14 icons=8 lines=22"},
}

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(scenario)
    local ok, got, reason = pcall(scenario.Observe)
    local isRetail = addon.Util.IsMainline
    local recorded = (not isRetail and scenario.RecordedClassic) or scenario.Recorded
    local target = (not isRetail and scenario.TargetClassic) or scenario.Target
    if not ok then
        return { Name = scenario.Name, Status = "FAIL", TargetMet = false, Line = ("options/%s: FAIL error=[%s]"):format(scenario.Name, tostring(got)) }
    end
    if got == nil then
        return { Name = scenario.Name, Status = "SKIP", Line = ("options/%s: SKIP %s"):format(scenario.Name, reason or "could not run") }
    end
    local status = got == recorded and "PASS" or "FAIL"
    local targetMet = got == target
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("options/%s: %s got=[%s] target=[%s] %s"):format(scenario.Name, status, got, target, targetMet and "met" or "open")
    }
end

function options.Run()
    local results = {}
    for _, scenario in ipairs(options.Scenarios) do
        tinsert(results, RunScenario(scenario))
    end
    return results
end

-- Not scenarios: the options without a default (no changed line, skipped by Defaults), and the setters whose side effects
-- errored during the round trip (headless: frames and lists the load does not build; in game BugGrabber names them)
function options.Observations()
    local model = Model()
    if not model then return {} end
    local _, withoutDefault = model.CheckDerivedDefaults()
    local _, sideEffects = model.CheckRoundTrip()
    local out = { "options without a default: " .. Join(withoutDefault or {}) }
    -- "file.lua line 90" rather than "file.lua:90:", which the unit-tests lint rule would read as a failing scenario
    for _, line in ipairs(sideEffects or {}) do out[#out + 1] = "setter side effect: " .. line:gsub("(%.lua):(%d+):", "%1 line %2:") end
    return out
end

-- [[ Game only: the window itself ]] --

-- After the scenarios the suite opens the real window, the /kevutest way (Krowi_ExtendedVendorUI): each step sets a
-- state, names itself in a banner over the window, checks what the window shows and takes a screenshot, which
-- Read-GameTests.ps1 pairs with its file. The steps reach the window only through Krowi_Options' public surface (a tab's
-- Open, Toggle, IsShown, GetFrame and GetSaved, and lib.WindowName; Krowi_Options.lua's header), so a change inside the
-- library cannot break them; the window's own steps are the library's (Tests/Krowi_OptionsTests in Krowi_Options).
--   open: /kaf opens the window on this addon's tab, on the section its Landing names (the first open after a /reload
--     also builds it)
--   close: the tab's Toggle hides it again
-- /kaftest options <what> runs only some steps (SelectSteps, at the end of the file): the set smoke (what
-- Krowi_ClaudeKit's two-copy release gate runs), a step's name, the start of names, or a step's number in the banner,
-- each with the steps it builds on and the open first.
-- At the end this addon's saved table for the window (the shared Window block, LastSection and Seen) goes back as it was
-- before the run, through the tab's GetSaved (restore), and the addon's Lua errors of the session are reported from
-- BugGrabber (lua-errors). Combat stops the run; the saved state goes back once it ends.

local settle = 1 -- a state change -> its check and screenshot
local afterShot = 1 -- a screenshot -> the next step

local live -- the run in progress
local runToken = 0 -- bumped by every stop, so a stopped run's timers do nothing
local banner
local steps

local function Add(status, text)
    tinsert(live.Results, {
        Name = "live-" .. live.StepName,
        Status = status,
        GameOnly = true,
        Line = ("options/live-%s: %s %s"):format(live.StepName, status, text)
    })
end

local function After(seconds, func)
    local token = runToken
    C_Timer.After(seconds, function()
        if live and token == runToken then
            func()
        end
    end)
end

-- The options window by the name its library gives it (lib.WindowName)
local function Window()
    return _G[KROWI_LIBMAN:GetLibrary("Krowi_Options_2").WindowName]
end

local function DeepCopy(value)
    if type(value) ~= "table" then
        return value
    end
    local copy = {}
    for k, v in next, value do
        copy[k] = DeepCopy(v)
    end
    return copy
end

-- The steps, on this addon's tab (window.Controller) through the library's public surface only
local function BuildSteps()
    local window = addon.Options.Window
    local tab = window.Controller
    return {
        {
            Name = "open",
            Required = true,
            Text = "/kaf opens the window on this addon's tab",
            Run = function()
                live.FirstOpen = Window() == nil
                live.Landing = window.Landing()
                if tab:IsShown() then
                    tab:Toggle()
                end
                SlashCmdList.KAF("")
            end,
            -- The section shown is the one the library saves as LastSection
            Check = function()
                local shown = tab:IsShown() and tab:GetFrame():IsShown()
                local section = tab:GetSaved().LastSection
                Add(shown and section == live.Landing and "PASS" or "FAIL", ("the window %s on this addon's tab, on %s, the landing section %s (first open after a /reload: %s)"):format(
                    shown and "opens" or "does not open", tostring(section), live.Landing, live.FirstOpen and "yes" or "no"))
            end
        },
        {
            Name = "close",
            Text = "the tab's Toggle closes the window",
            Run = function()
                if not tab:IsShown() then
                    return "the window is not open on this addon's tab"
                end
                tab:Toggle()
            end,
            Check = function()
                local frame = Window()
                Add(not tab:IsShown() and not (frame and frame:IsShown()) and "PASS" or "FAIL", "the window is hidden")
            end
        },
    }
end

local function CheckErrors()
    if not (BugGrabber and type(BugGrabber.GetDB) == "function" and type(BugGrabber.GetSessionId) == "function") then
        tinsert(live.Observations, "no BugGrabber, so Lua errors are not checked")
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

-- This addon's saved table for the window as it was before the run, read and written through the tab's GetSaved (the
-- library's public surface): the Window block every addon shares (place, size, pane, search ticks and their change
-- time), LastSection and Seen, which the open writes. It goes back in place, since the window keeps the table; the
-- window opens again on the section it showed, when it was open on this addon's tab before the run.
local function Restore()
    local tab = addon.Options.Window.Controller
    if live.WasShown and not tab:IsShown() then
        tab:Open(live.WasShown)
    end
    local saved = tab:GetSaved()
    wipe(saved)
    for k, v in next, DeepCopy(live.SavedBefore) do
        saved[k] = v
    end
end

local function Finish()
    banner:UnregisterAllEvents()
    live.StepName = "restore"
    local restored, restoreError = pcall(Restore)
    Add(restored and "PASS" or "FAIL", restored and "this addon's saved state for the window is as before the run"
        or ("could not put the window's saved state back: " .. tostring(restoreError)))
    live.StepName = "lua-errors"
    local checked, err = pcall(CheckErrors)
    if not checked then
        Add("FAIL", "test error: " .. tostring(err))
    end
    local finish, results, observations = live.Finish, live.Results, live.Observations
    live = nil
    finish(results, observations)
end

local function Stop(reason, combatStarted)
    runToken = runToken + 1
    banner:Hide()
    if reason then
        tinsert(live.Observations, "stopped: " .. reason)
    end
    if combatStarted or InCombatLockdown() then
        banner:UnregisterAllEvents()
        banner:RegisterEvent("PLAYER_REGEN_ENABLED")
        print("|cFF88CCFFKrowiAF Tests:|r options: stopped for combat; the window's saved state goes back when it ends")
        return
    end
    Finish()
end

local RunStep

local function Capture()
    local ok, err = pcall(steps[live.StepIndex].Check)
    if not ok then
        Add("FAIL", "test error: " .. tostring(err))
    end
    live.Shot = { Time = date("%Y-%m-%d %H:%M:%S") }
    live.Results[#live.Results].Screenshot = live.Shot
    Screenshot()
    After(afterShot, function()
        RunStep(live.StepIndex + 1)
    end)
end

RunStep = function(n)
    local step = steps[n]
    if not step then
        Stop()
        return
    end
    live.StepIndex, live.StepName = n, step.Name
    banner.Text:SetText(("Krowi's Achievement Filter test %d/%d: %s"):format(step.Number or n, live.AllSteps or #steps, step.Text))
    local ok, skip = pcall(step.Run)
    if not ok or (skip and step.Required) then
        Add("FAIL", ok and skip or ("test error: " .. tostring(skip)))
        Stop("step " .. step.Name .. " failed")
        return
    end
    if skip then -- the steps after it do not build on it
        Add("SKIP", skip)
        RunStep(n + 1)
        return
    end
    if n == 1 then
        banner:ClearAllPoints()
        banner:SetPoint("BOTTOM", Window(), "TOP", 0, 6)
        banner:Show()
    end
    After(settle, Capture)
end

local function CreateBanner()
    banner = CreateFrame("Frame", nil, UIParent)
    banner:SetFrameStrata("DIALOG")
    banner:SetSize(620, 26)
    local background = banner:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0, 0, 0, 0.85)
    banner.Text = banner:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    banner.Text:SetPoint("CENTER")
    banner:SetScript("OnEvent", function(_, event)
        if not live then
            return
        end
        if event == "SCREENSHOT_FAILED" and live.Shot then
            live.Shot.Failed = true
        elseif event == "PLAYER_REGEN_DISABLED" then
            Stop("combat started", true)
        elseif event == "PLAYER_REGEN_ENABLED" then
            Finish()
        end
    end)
    banner:Hide()
end

addon.Tests.Ready.options = function()
    if live then
        return false, "the previous options run is still going"
    end
    if not addon.Data.IsLoaded then -- some setters refresh the achievement window's data
        return false, "the achievement data is not loaded yet"
    end
    return true
end

-- The named set of steps, for Krowi_ClaudeKit's two-copy release gate, whose mixed cases need no full run (Krowi,
-- 2026-11-05: the full run with equal copies, a short one elsewhere): smoke opens the window on this addon's tab and
-- closes it; restore and lua-errors end it, as they end every run
local smokeSteps = { open = true, close = true }
local stepSets = {
    smoke = function(step) return smokeSteps[step.Name] end
}

-- /kaftest options <what>: the smoke set's steps, only the steps named what or whose name starts with "what-", or the
-- step with that number in the banner, each with the steps it builds on (Needs) and with the window's open first; nil
-- when nothing matches. The scenarios before the steps run either way: they take no time.
local function SelectSteps(list, what)
    if not what or what == "" then
        return list
    end
    local wanted, number = what:lower(), tonumber(what)
    local InSet = stepSets[wanted]
    local byName, chosen, any = {}, {}, false
    for _, step in ipairs(list) do
        byName[step.Name] = step
    end
    local function Choose(step)
        while step and not chosen[step] do
            chosen[step] = true
            step = byName[step.Needs]
        end
    end
    for i, step in ipairs(list) do
        if InSet and InSet(step) or not InSet and (i == number or step.Name == wanted or step.Name:sub(1, #wanted + 1) == wanted .. "-") then
            Choose(step)
            any = true
        end
    end
    if not any then
        return nil
    end
    Choose(byName.open)
    local selected = {}
    for _, step in ipairs(list) do
        if chosen[step] then
            tinsert(selected, step)
        end
    end
    return selected
end

addon.Tests.Async.options = true
addon.Tests.Suites.options = function(done, what)
    local all = BuildSteps()
    for i, step in ipairs(all) do
        step.Number = i
    end
    local chosen = SelectSteps(all, what)
    if not chosen then
        local names = {}
        for _, step in ipairs(all) do
            tinsert(names, ("%d %s"):format(step.Number, step.Name))
        end
        done({{Name = "select", Status = "SKIP", GameOnly = true,
            Line = ("options/select: SKIP no step '%s'; one of: %s"):format(what, table.concat(names, ", "))}}, {})
        return
    end
    -- Before the scenarios and the steps, so restore puts back the player's own
    local tab = addon.Options.Window.Controller
    local savedBefore = DeepCopy(tab:GetSaved())
    live = {
        Results = options.Run(),
        Observations = options.Observations(),
        Finish = done,
        SavedBefore = savedBefore,
        WasShown = tab:IsShown() and savedBefore.LastSection or nil,
        AllSteps = #all
    }
    if not banner then
        CreateBanner()
    end
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    steps = chosen
    print(("|cFF88CCFFKrowiAF Tests:|r options: %d of %d steps, about %d s; the window's saved state goes back at the end.%s"):format(#steps, #all,
        #steps * (settle + afterShot), what and "" or " /kaftest options <smoke, a name, start of a name or number> runs only those steps."))
    RunStep(1)
end