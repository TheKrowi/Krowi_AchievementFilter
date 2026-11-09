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

-- Per feature section (one whose first entry is a feature's switch, Features.lua): whether the first option drawn is the
-- switch, and whether with the switch off every other option is disabled and the switch is not
local function FeatureSectionsLine()
    local window, features = addon.Options.Window, addon.Features
    local source = window.Source
    local n = { sections = 0, first = 0, greyed = 0 }
    for _, section in ipairs(window.Map.Sections) do
        local entry = section.Groups and section.Groups[1] and section.Groups[1].Entries and section.Groups[1].Entries[1]
        local name = entry and entry.Path and entry.Path:match("^Features%.args%.([^.]+)%.args%.Enabled$")
        if name then
            n.sections = n.sections + 1
            local rows = {}
            for _, element in ipairs(source.Elements(section)) do
                if element.Option then tinsert(rows, element.Option) end
                if element.With then tinsert(rows, element.With) end
            end
            local switch = rows[1]
            if switch and switch.Info[#switch.Info] == "Enabled" and switch.Info[#switch.Info - 1] == name then
                n.first = n.first + 1
            end
            local was = features.GetSwitch(name)
            features.SetSwitch(name, false)
            local greyed = switch ~= nil and not switch:IsDisabled() and #rows > 1
            for i = 2, #rows do
                if not rows[i]:IsDisabled() then greyed = false end
            end
            features.SetSwitch(name, was)
            if greyed then n.greyed = n.greyed + 1 end
        end
    end
    return ("sections=%d switch-first=%d greyed-when-off=%d"):format(n.sections, n.first, n.greyed)
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
            for _, app in ipairs({ addon.Metadata.Title, "KrowiAF_Layout", "KrowiAF_EventReminders", "KrowiAF_Profiles", "KrowiAF_Plugins", "KrowiAF_Credits", "KrowiAF_Features" }) do
                if registry:GetOptionsTable(app, "cmd", "KROWIAF-0.0") then n = n + 1 end
            end
            return ("apps=%d"):format(n)
        end,
        Recorded = "apps=7", -- apps=6 before the Features page (docs/work/2026-11-08-feature-split-poc)
        Target = "apps=7"},
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
        -- The feature split added Reward preview's switch and moved its six rows under Features.args.RewardPreview
        -- (408 / 304 before, 13b38c99 / 122eff6c; docs/work/2026-11-08-feature-split-poc)
        -- The right-click menu's switch added and its three rows moved under Features.args.RightClickMenu (409 / 305
        -- before, 8e6ec075 / 50b2fed1; docs/work/2026-11-09-right-click-menu)
        Recorded = "options=410 hash=bfbb66bf",
        Target = "options=410 hash=bfbb66bf",
        RecordedClassic = "options=306 hash=86480864",
        TargetClassic = "options=306 hash=86480864"},
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
    -- The features that switch off (docs/work/2026-11-08-feature-split-poc): each feature's section opens with its switch,
    -- and while the switch is off every other row of the section is greyed out and the switch is not. The switch is set
    -- in the profile directly, without its setter, and put back
    -- (one section until the right-click menu became the second feature, docs/work/2026-11-09-right-click-menu)
    {Name = "feature-sections",
        Observe = FeatureSectionsLine,
        Recorded = "sections=2 switch-first=2 greyed-when-off=2",
        Target = "sections=2 switch-first=2 greyed-when-off=2"},
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
--   settings-menu, settings-open, settings-showme, settings-close, settings-return, settings-showme-back: the Maps
--     help's Show me while Blizzard's Settings window or the game menu is open, through real clicks on Blizzard's own
--     buttons (docs/work/2026-11-07-settings-panel-taint; Game only: Blizzard's Settings window and the game menu, below).
--     These also read the window's own frames (Show me, its note, the help pane's state) and the map route's test seam.
--     A click comes from Krowi_ClaudeKit's marker addon (KrowiGameInput.ClickAt) or the player, within 30 s a step.
-- /kaftest options <what> runs only some steps (SelectSteps, at the end of the file): the set smoke (what
-- Krowi_ClaudeKit's two-copy release gate runs), a step's name, the start of names (settings: the six above), or a
-- step's number in the banner, each with the steps it builds on and the open first.
-- At the end this addon's saved table for the window (the shared Window block, LastSection and Seen) goes back as it was
-- before the run, through the tab's GetSaved (restore), the window is open or closed as before the run, and the addon's
-- Lua errors of the session are reported from BugGrabber (lua-errors). Combat stops the run; the saved state goes back
-- once it ends.

local settle = 1 -- a state change -> its check and screenshot
local afterShot = 1 -- a screenshot -> the next step
local mouseWait, pollEvery = 30, 0.25 -- a step that needs a click or the mouse waits this long, looking this often
local clickHold = 1 -- a click the kit made -> when it counts as one that changed nothing

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

-- [[ Game only: Blizzard's Settings window and the game menu, by real clicks ]] --

-- docs/work/2026-11-07-settings-panel-taint: the Maps help's Show me while Blizzard's Settings window (SettingsPanel,
-- HIGH) is open. The map route's see-through secure button lies one strata above this window (DIALOG), so above Settings;
-- while Settings is shown the route is to answer false and lay nothing (Show me hidden, the Maps help's note shown), and
-- to lay it again once Settings is gone. The game menu is left alone (it never shows over this window: every way to it
-- reaches CloseAllWindows first); the steps only pass through it. Test code never opens, closes or hides a
-- Blizzard window and never calls into one: it only reads them (shown, children, texts, levels). Every change to them
-- comes from one real click per step, asked of Krowi_ClaudeKit's marker addon (KrowiGameInput.ClickAt, which serves a
-- request once) or made by the player within mouseWait. A click is asked only on a button found and checked right
-- before: the micro menu's game menu button, the game menu's Options and Return to Game (found among the menu's
-- buttons by their text), and Settings' Close button (SettingsPanel.CloseButton, its text checked); never another game
-- menu button. The steps:
--   settings-menu: this window closed (test code), a click on the micro menu's game menu button: the game menu shows
--   settings-open: a click on the game menu's Options: Settings shows
--   settings-showme: no click: this window opened on Maps over Settings (test code); Show me hidden, its note shown,
--     nothing laid
--   settings-close: this window closed (test code: it covers Settings' Close, and Lower() leaves it on top), a click on
--     Settings' Close: Settings hides and Blizzard's way back shows the game menu
--   settings-return: a click on the game menu's Return to Game, when the menu came back: the menu hides
--   settings-showme-back: no click: this window on Maps (opened again by test code when a step closed it), neither of
--     Blizzard's windows shown; Show me shown and laid
-- An option's hover help replaces the section's help and its Show me, so the two steps without a click move the mouse
-- onto the page's title first when it rests on an option row (a hover asked of the marker). A step whose state the step
-- before should have left is not there SKIPs and says why. A click that did not land can leave a Blizzard window open:
-- the run says so and leaves it to the player. Whether the button is laid is read through the map route's test seam,
-- help.maps.SecureLaid() (Options/Window/Help/ShowMe.lua); "unknown" while it has none.

-- What the mouse is on, by the frame's debug name
local function MouseFocusName()
    local foci = GetMouseFoci and GetMouseFoci()
    local focus = foci and foci[1]
    if not focus then
        return "no frame"
    end
    local ok, name = pcall(function() return focus:GetDebugName() end)
    return ok and name and name ~= "" and name or "a frame without a name"
end

-- The map route's see-through button through its seam: "laid", "not laid", or "unknown (why)"
local function SecureLaid()
    local maps = addon.Options.Window.Help and addon.Options.Window.Help.maps
    if not (maps and type(maps.SecureLaid) == "function") then
        return "unknown (no help.maps.SecureLaid seam)"
    end
    local ok, laid = pcall(maps.SecureLaid)
    if not ok then
        return "unknown (" .. tostring(laid) .. ")"
    end
    return laid and "laid" or "not laid"
end

-- The help pane where Show me goes, read from the window's own frames (Krowi_Options internals, read knowingly):
-- nil and why when the pane shows no section help, else whether Show me and the note are shown
local function ShowMeShown()
    local frame = Window()
    if not (frame and frame:IsShown()) then
        return nil, "this window is closed"
    end
    if frame.PaneCollapsed then
        return nil, "the help pane is collapsed (the player's choice), so it draws neither Show me nor its note"
    end
    if frame.HoverOption then
        return nil, "the mouse rests on an option row, so the help pane shows that option instead of Show me"
    end
    return frame.ShowMeButton:IsShown() and true or false, frame.ShowMeNote:IsShown() and true or false
end

-- One of the game menu's buttons, found among its children by its text; only Options and Return to Game are ever asked
-- for. The menu builds them from a pool each time it shows (Blizzard_GameMenu/Shared/GameMenuFrame.lua InitButtons,
-- MainMenuFrameTemplates.lua AddButton and AddCloseButton, live and classic)
local function MenuButton(text)
    if text ~= GAMEMENU_OPTIONS and text ~= RETURN_TO_GAME then
        return nil, "the run clicks no game menu button but Options and Return to Game"
    end
    local found
    for _, child in ipairs({GameMenuFrame:GetChildren()}) do
        if child:IsObjectType("Button") and child:IsVisible() and child:GetText() == text then
            if found then
                return nil, ("two game menu buttons read %q"):format(text)
            end
            found = child
        end
    end
    if not found then
        return nil, ("no game menu button reads %q"):format(text)
    end
    if not found:IsEnabled() then
        return nil, ("the game menu's %q is disabled"):format(text)
    end
    return found
end

-- The step's one click, asked of the marker once, on the button Find returns right then; false and why when there is none
local function AskClick(kit, Find)
    local click = live.Click
    if click.Asked ~= nil or not kit.ClickAt then
        return
    end
    local button, why = Find()
    if not button then
        click.Asked, click.Refused = false, why
        return
    end
    click.Asked = kit.ClickAt(button, 0, 0) and true or false
    if not click.Asked then
        click.Refused = "the marker cannot click there: the button has no place or lies off the screen"
    end
end

-- Whether the click step may go on to its check: its state holds, the marker refused, or a click it made was heard
-- (GLOBAL_MOUSE_UP) clickHold ago and changed nothing
local function ClickDone(Holds)
    local click = live.Click
    if Holds() or click.Refused then
        return true
    end
    if click.UpAt and GetTime() - click.UpAt >= clickHold then
        click.Missed = true
        return true
    end
    return false
end

-- The click's own line when it did not do what the step needs; true when it did
local function ClickLanded(what)
    local click = live.Click
    if click.Refused then
        Add("SKIP", ("%s: %s"):format(what, click.Refused))
        return false
    end
    if click.Missed then
        Add("FAIL", ("%s: the kit's click landed on %s and changed nothing"):format(what, tostring(click.UpOn)))
        return false
    end
    return true
end

local function ClickedBy()
    return live.Click and live.Click.Asked and "the kit's marker" or "the player"
end

-- Starts a click step: its click state, and the click heard anywhere (only a click the kit made counts as a miss)
local function StartClick()
    live.Click = {}
    pcall(banner.RegisterEvent, banner, "GLOBAL_MOUSE_UP")
end

-- A step without a click that needs the mouse off the page's option rows: the hover onto the page's title, once
local function HoverOffRows(kit)
    local frame = Window()
    if live.Hovered ~= nil or not (frame and frame:IsShown() and frame.HoverOption) then
        return
    end
    live.Hovered = kit.HoverAt(frame.PageTitle, 0, 0) and true or false
end

local function MouseOffRows()
    local frame = Window()
    return not (frame and frame:IsShown() and frame.HoverOption)
end

local function BlizzardWindowsShown()
    local shown = {}
    if SettingsPanel and SettingsPanel:IsShown() then
        shown[#shown + 1] = "Settings"
    end
    if GameMenuFrame and GameMenuFrame:IsShown() then
        shown[#shown + 1] = "the game menu"
    end
    return shown
end

local function SettingsSteps(tab)
    local function Line(shown, note)
        return ("Show me %s, the note %s, the see-through button %s"):format(shown and "shown" or "hidden",
            note and "shown" or "hidden", SecureLaid())
    end
    return {
        {
            Name = "settings-menu",
            Text = ("click the game menu button of the micro menu (%d s)"):format(mouseWait),
            Waits = "the click on the micro menu's game menu button",
            Clicks = true,
            Run = function()
                if InCombatLockdown() then
                    return "in combat"
                end
                local open = BlizzardWindowsShown()
                if #open > 0 then
                    return table.concat(open, " and ") .. " already open; the steps start with both closed"
                end
                if not (MainMenuMicroButton and MainMenuMicroButton:IsVisible()) then
                    return "the micro menu's game menu button is hidden (the player's layout or another addon)"
                end
                if tab:IsShown() then
                    tab:Toggle()
                end
                StartClick()
            end,
            Hover = function(kit)
                AskClick(kit, function()
                    if not (MainMenuMicroButton:IsVisible() and MainMenuMicroButton:IsEnabled()) then
                        return nil, "the micro menu's game menu button is hidden or disabled"
                    end
                    return MainMenuMicroButton
                end)
            end,
            Mouse = function()
                return ClickDone(function() return GameMenuFrame:IsShown() end)
            end,
            Check = function()
                if not ClickLanded("the micro menu's game menu button") then
                    return
                end
                local shown = GameMenuFrame:IsShown()
                Add(shown and "PASS" or "FAIL", ("a click on the micro menu's game menu button (by %s): the game menu %s"):format(
                    ClickedBy(), shown and "shows" or "does not show"))
            end
        },
        {
            Name = "settings-open",
            Needs = "settings-menu",
            Text = ("click the game menu's %s (%d s)"):format(tostring(GAMEMENU_OPTIONS), mouseWait),
            Waits = "the click on the game menu's Options",
            Clicks = true,
            Run = function()
                if not GameMenuFrame:IsShown() then
                    return "the game menu is not open (settings-menu)"
                end
                StartClick()
            end,
            Hover = function(kit)
                AskClick(kit, function() return MenuButton(GAMEMENU_OPTIONS) end)
            end,
            Mouse = function()
                return ClickDone(function() return SettingsPanel:IsShown() end)
            end,
            Check = function()
                if not ClickLanded("the game menu's Options") then
                    return
                end
                local shown = SettingsPanel:IsShown()
                Add(shown and "PASS" or "FAIL", ("a click on the game menu's Options (by %s): Blizzard's Settings window %s"):format(
                    ClickedBy(), shown and "shows" or "does not show"))
            end
        },
        {
            Name = "settings-showme",
            Needs = "settings-open",
            Text = "this addon's window on Maps over Blizzard's Settings: Show me off, its note shown (mouse off the option rows)",
            Waits = "the mouse to leave the page's option rows",
            Run = function()
                if not SettingsPanel:IsShown() then
                    return "Blizzard's Settings window is not open (settings-open)"
                end
                tab:Open("maps")
            end,
            Hover = HoverOffRows,
            Mouse = MouseOffRows,
            Check = function()
                local section = tab:GetSaved().LastSection
                local shown, note = ShowMeShown()
                if shown == nil then
                    Add("SKIP", note)
                    return
                end
                local laid = SecureLaid()
                -- The route's own answer (the seam ships with the fix): "not laid" exactly, an unknown is no pass. Show me also
                -- hides when the minimap's map button is hidden, so settings-showme-back proves the same route lays it again.
                Add(section == "maps" and not shown and note and laid == "not laid" and "PASS" or "FAIL",
                    ("on %s over Blizzard's Settings window: %s"):format(tostring(section), Line(shown, note)))
            end
        },
        {
            Name = "settings-close",
            Needs = "settings-showme",
            Text = ("click Close in Blizzard's Settings window (%d s)"):format(mouseWait),
            Waits = "the click on Settings' Close",
            Clicks = true,
            Run = function()
                if not (SettingsPanel:IsShown() and tab:IsShown()) then
                    return "Blizzard's Settings window and this addon's window are not both open (settings-showme)"
                end
                local shown = ShowMeShown()
                if shown or SecureLaid() == "laid" then
                    return "Show me is on over Settings (settings-showme), so the see-through button may lie over Settings' Close; a click there would open the map"
                end
                -- This window (wider than Settings, shown over it) covers Settings' Close, and Lower() leaves both at one
                -- level with this window still on top (2026-11-07, both clients): it is closed first (test code, this
                -- addon's own window), and settings-showme-back opens it again
                tab:Toggle()
                live.Levels = tab:IsShown() and "this window could not be closed first" or "this window closed first"
                StartClick()
            end,
            Hover = function(kit)
                AskClick(kit, function()
                    local button = SettingsPanel.CloseButton
                    if not (button and button:IsVisible()) then
                        return nil, "Settings' Close button is not shown"
                    end
                    if button:GetText() ~= SETTINGS_CLOSE then
                        return nil, ("Settings' Close button reads %q, not %q"):format(tostring(button:GetText()), tostring(SETTINGS_CLOSE))
                    end
                    return button
                end)
            end,
            Mouse = function()
                return ClickDone(function() return not SettingsPanel:IsShown() end)
            end,
            Check = function()
                if not ClickLanded("Settings' Close (" .. tostring(live.Levels) .. ")") then
                    return
                end
                local settings, menu = SettingsPanel:IsShown(), GameMenuFrame:IsShown()
                Add(not settings and "PASS" or "FAIL", ("a click on Settings' Close (by %s): Settings %s, the game menu %s; this window was closed by the test before the click"):format(
                    ClickedBy(), settings and "stays open" or "hides", menu and "shows" or "does not show"))
            end
        },
        {
            Name = "settings-return",
            Needs = "settings-close",
            Text = ("click the game menu's %s (%d s)"):format(tostring(RETURN_TO_GAME), mouseWait),
            Waits = "the click on the game menu's Return to Game",
            Clicks = true,
            Run = function()
                if SettingsPanel:IsShown() then
                    return "Blizzard's Settings window is still open (settings-close)"
                end
                if not GameMenuFrame:IsShown() then
                    return "the game menu did not come back when Settings closed (this window was closed by the test before the click)"
                end
                StartClick()
            end,
            Hover = function(kit)
                AskClick(kit, function() return MenuButton(RETURN_TO_GAME) end)
            end,
            Mouse = function()
                return ClickDone(function() return not GameMenuFrame:IsShown() end)
            end,
            Check = function()
                if not ClickLanded("the game menu's Return to Game") then
                    return
                end
                local shown = GameMenuFrame:IsShown()
                Add(not shown and "PASS" or "FAIL", ("a click on the game menu's Return to Game (by %s): the game menu %s"):format(
                    ClickedBy(), shown and "stays open" or "hides"))
            end
        },
        {
            Name = "settings-showme-back",
            Needs = "settings-return",
            Text = "this addon's window on Maps with Blizzard's windows closed: Show me back (mouse off the option rows)",
            Waits = "the mouse to leave the page's option rows",
            Run = function()
                local open = BlizzardWindowsShown()
                if #open > 0 then
                    return table.concat(open, " and ") .. " still open (a click did not land), so Show me stays off; close it by hand"
                end
                live.Reopened = not tab:IsShown() or tab:GetSaved().LastSection ~= "maps"
                if live.Reopened then
                    tab:Open("maps")
                end
            end,
            Hover = HoverOffRows,
            Mouse = MouseOffRows,
            Check = function()
                local section = tab:GetSaved().LastSection
                local shown, note = ShowMeShown()
                if shown == nil then
                    Add("SKIP", note)
                    return
                end
                local laid = SecureLaid()
                Add(section == "maps" and shown and laid == "laid" and "PASS" or "FAIL", ("on %s with Settings and the game menu closed%s: %s"):format(
                    tostring(section), live.Reopened and " (opened again by the test)" or "", Line(shown, note)))
            end
        },
    }
end

-- The steps, on this addon's tab (window.Controller) through the library's public surface only, then the Settings steps
-- above, which read the window's own frames too
local function BuildSteps()
    local window = addon.Options.Window
    local tab = window.Controller
    local list = {
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
    for _, step in ipairs(SettingsSteps(tab)) do
        tinsert(list, step)
    end
    return list
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
-- window opens again on the section it showed, when it was open on this addon's tab before the run, and closes when it
-- was not (the Settings steps leave it open on Maps).
local function Restore()
    local tab = addon.Options.Window.Controller
    if live.WasShown and not (tab:IsShown() and tab:GetSaved().LastSection == live.WasShown) then
        tab:Open(live.WasShown)
    elseif not live.WasShown and tab:IsShown() then
        tab:Toggle()
    end
    local saved = tab:GetSaved()
    wipe(saved)
    for k, v in next, DeepCopy(live.SavedBefore) do
        saved[k] = v
    end
end

-- Nothing more asked of the kit's marker, and no click listened for
local function EndMouse()
    if KrowiGameInput then
        KrowiGameInput.Clear()
    end
    pcall(banner.UnregisterEvent, banner, "GLOBAL_MOUSE_UP")
end

local function Finish()
    EndMouse()
    banner:UnregisterAllEvents()
    -- Blizzard's windows are the player's: a click of the Settings steps that did not land can leave one open
    if live.SettingsSteps then
        local open = BlizzardWindowsShown()
        if #open > 0 then
            tinsert(live.Observations, table.concat(open, " and ") .. " left open for the player: the Settings steps never close a Blizzard window themselves")
        end
    end
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
    EndMouse()
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

-- Why a step that needs the mouse got nothing within mouseWait
local function WaitedFor(step)
    local why
    if not KrowiGameInput then
        why = "Krowi_ClaudeKit's marker addon (KrowiGameInput) is not loaded, and nobody did it by hand"
    elseif step.Clicks and not KrowiGameInput.ClickAt then
        why = "the kit's marker addon cannot click (no KrowiGameInput.ClickAt: an older kit), and nobody clicked by hand"
    else
        why = "the kit's marker was asked, and it did not happen"
    end
    return ("waited %d s for %s: %s"):format(mouseWait, step.Waits or "the mouse", why)
end

-- A step that needs a click or the mouse (Mouse): while the kit's marker addon is loaded (KrowiGameInput, Krowi_ClaudeKit's
-- docs/work/2026-11-05-kit-test-runs) its Hover(kit) asks for the click or hover, once (the marker serves a request
-- once, Krowi_Options' show-me-secure-click); without it the player has mouseWait to do it. Once Mouse() holds the
-- request is cleared at once, so a -WaitForDone started again does not click a second time, and the check and the
-- screenshot follow; after mouseWait the step SKIPs and says why
local function WaitForMouse(step, waited)
    local ok, ready = pcall(step.Mouse)
    if ok and ready then
        EndMouse()
        After(settle, Capture)
        return
    end
    if not ok or waited >= mouseWait then
        EndMouse()
        Add(ok and "SKIP" or "FAIL", ok and WaitedFor(step) or ("test error: " .. tostring(ready)))
        After(afterShot, function()
            RunStep(live.StepIndex + 1)
        end)
        return
    end
    if KrowiGameInput and step.Hover then
        local asked, err = pcall(step.Hover, KrowiGameInput)
        if not asked then
            EndMouse()
            Add("FAIL", "test error: " .. tostring(err))
            After(afterShot, function()
                RunStep(live.StepIndex + 1)
            end)
            return
        end
    end
    After(pollEvery, function()
        WaitForMouse(step, waited + pollEvery)
    end)
end

RunStep = function(n)
    local step = steps[n]
    if not step then
        Stop()
        return
    end
    live.StepIndex, live.StepName = n, step.Name
    live.Click, live.Hovered = nil, nil
    if step.Name:sub(1, 9) == "settings-" then
        live.SettingsSteps = true
    end
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
    if step.Mouse then
        -- A moment first, so a row the window just opened under the mouse has had its hover (the Settings steps)
        After(pollEvery, function()
            WaitForMouse(step, 0)
        end)
    else
        After(settle, Capture)
    end
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
    banner:SetScript("OnEvent", function(_, event, mouseButton)
        if not live then
            return
        end
        if event == "SCREENSHOT_FAILED" and live.Shot then
            live.Shot.Failed = true
        elseif event == "GLOBAL_MOUSE_UP" then
            -- A Settings step's click: the first left click after the kit was asked for it, and where it landed
            local click = live.Click
            if click and click.Asked and not click.UpAt and mouseButton == "LeftButton" then
                click.UpAt, click.UpOn = GetTime(), MouseFocusName()
            end
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
    local clicks = 0
    for _, step in ipairs(steps) do
        if step.Clicks then clicks = clicks + 1 end
    end
    local waits = clicks == 0 and "" or (" %d steps click Blizzard's game menu and Settings through Krowi_ClaudeKit's marker addon, or wait up to %d s each for your click on what the banner names."):format(clicks, mouseWait)
    print(("|cFF88CCFFKrowiAF Tests:|r options: %d of %d steps, about %d s; the window's saved state goes back at the end.%s%s"):format(#steps, #all,
        #steps * (settle + afterShot), waits, what and "" or " /kaftest options <smoke, a name, start of a name or number> runs only those steps."))
    RunStep(1)
end