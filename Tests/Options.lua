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

-- The window's tabs, one per addon that registered with Krowi_Options (docs/work/2026-10-30-options-settings-look)
local function TabNames(lib)
    local names = {}
    for _, tab in ipairs(lib.Tabs) do names[#names + 1] = tab.Config.TabName end
    return Join(names)
end

local function GroupNames(groups)
    local names = {}
    for _, group in ipairs(groups) do names[#names + 1] = group.Tab.Config.TabName end
    return Join(names)
end

-- A second addon's tab, registered for the scenario and taken away again: the tab order, the window's state that every
-- addon keeps (written to each one's saved table), and a search of the open tab or of every tab
local function SecondTab(lib)
    local saved = {}
    local tab = lib.CreateWindow({
        TabName = "Zz Test",
        Saved = saved,
        Search = function(text) return { { SectionId = "test", Path = "Zz Test", Label = "Zz " .. text } } end,
    })
    local ok, line = pcall(function()
        local tabs = TabNames(lib)
        lib.SetShared("TestShared", true)
        local kaf = addon.Options.Window.Controller:GetSaved()
        local shared = (kaf.TestShared and saved.TestShared) and "both" or ("kaf=" .. tostring(kaf.TestShared) .. ",test=" .. tostring(saved.TestShared))
        lib.SetShared("TestShared", nil)
        local open = GroupNames(lib.Search("Tooltip", false, tab))
        local all = GroupNames(lib.Search("Tooltip", true, tab))
        return ("tabs=%s shared=%s open=%s all=%s"):format(tabs, shared, open, all)
    end)
    tab:Unregister()
    if not ok then error(line, 0) end
    return line .. " after=" .. TabNames(lib)
end

-- Where a row's name and controls stand, as x from the row's left, in the right-hand column
-- (docs/work/2026-11-02-options-widths), on the game's 635 rows and the 619 left while the section list shows its scroll
-- bar; the name's left at indent 0 and 1
local rowControls = { "Toggle", "Range", "Select", "Execute", "Input", "Key", "Sub", "TabArrows" }
local function RowGeometryLine(lib)
    local parts = {}
    for _, width in ipairs({ 635, 619 }) do
        local flat, indented = lib.RowGeometry(0), lib.RowGeometry(1)
        local line = { ("name %g/%g-%g"):format(lib.RowX(flat.NameLeft, width), lib.RowX(indented.NameLeft, width), lib.RowX(flat.NameRight, width)) }
        for _, key in ipairs(rowControls) do line[#line + 1] = ("%s %g"):format(key, lib.RowX(flat[key], width)) end
        parts[#parts + 1] = ("column %d [%s]"):format(width, table.concat(line, " "))
    end
    return table.concat(parts, " ")
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
    -- One window for every Krowi addon, a tab each; KAF alone registers today (docs/work/2026-10-30-options-settings-look)
    {Name = "window-tabs",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")
            if not lib.Tabs then return "no tab registry" end
            return "tabs=" .. TabNames(lib)
        end,
        Recorded = "tabs=Achievement Filter", -- "no tab registry" before the tabs
        Target = "tabs=Achievement Filter"},
    {Name = "window-second-tab",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")
            if not lib.Tabs then return "no tab registry" end
            return SecondTab(lib)
        end,
        Recorded = "tabs=Achievement Filter,Zz Test shared=both open=Zz Test all=Achievement Filter,Zz Test after=Achievement Filter", -- "no tab registry" before the tabs
        Target = "tabs=Achievement Filter,Zz Test shared=both open=Zz Test all=Achievement Filter,Zz Test after=Achievement Filter"},
    -- The game's Options window's sizes (docs/work/2026-11-02-options-widths): its width with the help pane added, and
    -- the rows' names and controls in the right-hand column
    {Name = "window-width",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")
            if not lib.WindowWidth then return "resizable from 1000x560" end
            return ("open=%d collapsed=%d"):format(lib.WindowWidth(false), lib.WindowWidth(true))
        end,
        Recorded = "open=1300 collapsed=950", -- "resizable from 1000x560" before the game's width
        Target = "open=1300 collapsed=950"},
    {Name = "row-geometry",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")
            if not lib.RowGeometry then return "column 300 from the right, names from 16" end
            return RowGeometryLine(lib)
        end,
        -- "column 300 from the right, names from 16" before the game's sizes; the column's Select 315 before Krowi's look in
        -- game, and the game's placement from the row's centre beside it until Krowi kept the column (2026-11-02)
        Recorded = "column 635 [name 16/36-293 Toggle 305 Range 305 Select 323.5 Execute 305 Input 311 Key 305 Sub 305 TabArrows 305]"
            .. " column 619 [name 16/36-277 Toggle 289 Range 289 Select 307.5 Execute 289 Input 295 Key 289 Sub 289 TabArrows 289]",
        -- Krowi's look in game (2026-11-02): the dropdown's left arrow on the check boxes' line, 2.5 in as the game has it,
        -- and the input box 6 in from it, so its border starts on that line
        Target = "column 635 [name 16/36-293 Toggle 305 Range 305 Select 323.5 Execute 305 Input 311 Key 305 Sub 305 TabArrows 305]"
            .. " column 619 [name 16/36-277 Toggle 289 Range 289 Select 307.5 Execute 289 Input 295 Key 289 Sub 289 TabArrows 289]"},
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
    -- A button that belongs to a check box is found as its check box's row
    {Name = "search-reset-position",
        Observe = function()
            local labels = {}
            for _, result in ipairs(Model().Search(addon.L["Reset position"])) do
                if result.OptionId then labels[#labels + 1] = result.Label end
            end
            return Join(labels)
        end,
        Recorded = "Remember Achievement Window position,Remember Achievement Calendar position,Remember Data Manager position",
        Target = "Remember Achievement Window position,Remember Achievement Calendar position,Remember Data Manager position"},
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

-- After the scenarios the suite drives the real window, the /kevutest way (Krowi_ExtendedVendorUI): each step sets a state
-- through the window's own functions, names itself in a banner over the window, checks what the window shows and takes a
-- screenshot, which Read-GameTests.ps1 pairs with its file.
--   open: /kaf opens the window where the landing rule says (the first open after a /reload also builds it)
--   tabs: a tab per addon that registered with the window, this addon's selected, under the game's Options title
--     (docs/work/2026-10-30-options-settings-look)
--   section-<id>: Overview and every section draw their rows, and every drawn check box, slider and text box shows its
--     option's value
--   toggle, range, input: one row of each changed through its own control: the value is stored, and the changed line and
--     the footer's count follow it; toggle-reset: the toggle's row shows its arrow on enter, before the name, and the
--     arrow sets the option back to its default (docs/work/2026-10-31-options-markers)
--   search: a search lists results; pane: the help pane collapses to its strip; close: the close button hides the window
-- At the end every value the steps changed and the window's saved state (place, pane, last section, the sections seen,
-- which the walk marks) are put back, and the addon's Lua errors of the session are reported from BugGrabber. Combat
-- stops the run; the values go back once it ends.

local settle = 1 -- a state change -> its check and screenshot
local afterShot = 1 -- a screenshot -> the next step
local toggleId = "Layout.args.Header.args.General.args.CenterHeader"
local rangeId = "Layout.args.Categories.args.Indentation.args.Indentation"
local inputId = "Layout.args.Achievements.args.TemporarilyObtainable.args.StartTimeAndEndTime.args.Custom"

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

local function Window()
    return Krowi_OptionsWindow
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

-- The section that draws an option, and the option
local function FindOption(optionId)
    local window = addon.Options.Window
    for _, section in ipairs(window.Map.Sections) do
        for _, element in ipairs(window.Source.Elements(section)) do
            if element.Option and element.Option.Id == optionId then
                return section.Id, element.Option
            end
        end
    end
end

-- The first option whose check box carries a slider, and its section
local function FindSliderPair()
    local window = addon.Options.Window
    for _, section in ipairs(window.Map.Sections) do
        for _, element in ipairs(window.Source.Elements(section)) do
            if element.With and element.With.Type == "range" and not element.Option:IsHidden() then
                return section.Id, element.Option
            end
        end
    end
end

-- The drawn row of an option on the current page
local function RowOf(option)
    local found
    Window().PageScrollBox:ForEachFrame(function(row)
        if row.Option == option then
            found = row
        end
    end)
    return found
end

-- The first value change of an option keeps the player's value, which Restore puts back
local function Remember(option)
    if not live.Before[option] then
        live.Before[option] = { Value = option:Get() }
    end
end

-- The game's control widths (docs/work/2026-11-02-options-widths), by the row's key; the dropdown's is inside Select
local controlWidths = { Toggle = 30, Range = 250, Execute = 200, Key1 = 160, Key2 = 160 }
local rowControlKeys = { "Toggle", "Range", "Execute", "Input", "Key1", "Key2", "All", "None", "Up", "Down" }

-- How far a name's text reaches, whatever its anchors: a sub row's text spans the row
local function NameEnd(name)
    return name:GetLeft() + math.min(name:GetStringWidth(), name:GetWidth())
end

-- Where a drawn row breaks the layout: a control of the wrong width, one past the row's right edge, a name's text that
-- runs into the first control, a dropdown whose left arrow is off the check boxes' line (the game's stands 2.5 in from
-- it); and whether the name is cut short
local function RowLayout(row)
    local right = row:GetRight()
    if not right then
        return nil
    end
    local wrong, firstLeft = {}, nil
    if row.Geometry and row.Select and row.Select:IsShown() then
        local line = row:GetLeft() + KROWI_LIBMAN:GetLibrary("Krowi_Options_1").RowX(row.Geometry.Toggle, row:GetWidth())
        if math.abs(row.Select.DecrementButton:GetLeft() - line - 2.5) > 0.5 then
            tinsert(wrong, ("arrow %g from the check boxes' line"):format(row.Select.DecrementButton:GetLeft() - line))
        end
    end
    -- The option after a check box 5 after it, as the game's Tutorials and Mouse Sensitivity rows
    local withControl = row.With and (row.With.Type == "range" and row.Range or row.Execute)
    if withControl and withControl:IsShown() and math.abs(withControl:GetLeft() - row.Toggle:GetRight() - 5) > 0.5 then
        tinsert(wrong, ("%s %g after its check box"):format(row.With.Type, withControl:GetLeft() - row.Toggle:GetRight()))
    end
    local function Control(key, control, width)
        if not control or not control:IsShown() or not control:GetRight() then
            return
        end
        if width and math.abs(control:GetWidth() - width) > 0.5 then
            tinsert(wrong, ("%s %g wide"):format(key, control:GetWidth()))
        end
        if control:GetRight() > right + 0.5 then
            tinsert(wrong, key .. " past the row's edge")
        end
        firstLeft = math.min(firstLeft or control:GetLeft(), control:GetLeft())
    end
    for _, key in ipairs(rowControlKeys) do
        -- the game's slider after a check box is 214 (SettingsCheckboxSliderControlMixin)
        Control(key, row[key], key == "Range" and withControl == row.Range and 214 or controlWidths[key])
    end
    if row.Select and row.Select:IsShown() then
        Control("Dropdown", row.Select.Dropdown, 220)
        Control("arrow", row.Select.DecrementButton)
        Control("arrow", row.Select.IncrementButton)
    end
    local name = row.Source and row.Source:GetText() ~= "" and row.Source or row.Label or row.Text
    local cut = false
    if name and name:IsShown() and name:GetLeft() and firstLeft and not row.Cells then
        if NameEnd(name) > firstLeft + 0.5 then
            tinsert(wrong, "name into the control")
        end
        cut = name.IsTruncated and name:IsTruncated() or false
    end
    return wrong, cut
end

-- The slider moves in whole steps: a value saved between them (the reward preview's size after a resize of the preview)
-- shows on the nearest step
local function SliderShows(row, option)
    local value = option:Get()
    local min, max, step = option:GetRange()
    if value and step and step > 0 then
        value = math.min(math.max(min + math.floor((value - min) / step + 0.5) * step, min), max)
    end
    return value == nil or math.abs(row.Range.Slider:GetValue() - value) < 0.001
end

-- Drawn rows whose control does not show its option's value, rows that break the layout, and names cut short
local function CheckDrawnRows()
    local drawn, differ, misfit, cut = 0, {}, {}, {}
    Window().PageScrollBox:ForEachFrame(function(row)
        drawn = drawn + 1
        local wrong, isCut = RowLayout(row)
        local id = row.Option and row.Option.Id or (row.Element and (row.Element.Text or row.Element.Label)) or tostring(drawn)
        if wrong and #wrong > 0 then
            tinsert(misfit, id .. ": " .. table.concat(wrong, ", "))
        end
        if isCut then
            tinsert(cut, id)
        end
        local option = row.Option
        if not option or not option.Type then
            return
        end
        local value = option:Get()
        local shows
        if option.Type == "toggle" then
            shows = (row.Toggle:GetChecked() and true or false) == (value and true or false)
                and (not row.With or row.With.Type ~= "range" or SliderShows(row, row.With))
        elseif option.Type == "range" then
            shows = SliderShows(row, option)
        elseif option.Type == "input" then
            shows = row.Input:HasFocus() or row.Input:GetText() == tostring(value or "")
        elseif option.Type == "select" then
            -- the dropdowns never show GameTooltip from our rows (docs/work/2026-10-30-options-settings-look)
            shows = not row.Select.Dropdown:ShouldShowTooltip()
        else
            shows = true
        end
        if not shows then
            tinsert(differ, option.Id)
        end
    end)
    return drawn, differ, misfit, cut
end

local function SectionStep(sectionId, name)
    return {
        Name = "section-" .. sectionId,
        Text = name,
        Run = function()
            Window():ShowSection(sectionId)
        end,
        Check = function()
            local rows = #(Window().Elements or {})
            local drawn, differ, misfit, cut = CheckDrawnRows()
            local ok = (rows == 0 or drawn > 0) and #differ == 0 and #misfit == 0
            Add(ok and "PASS" or "FAIL", ("%d rows, %d drawn%s%s%s"):format(rows, drawn,
                #differ > 0 and (", controls that do not show their value: [" .. table.concat(differ, ",") .. "]") or "",
                #misfit > 0 and (", rows out of the layout: [" .. table.concat(misfit, "; ") .. "]") or "",
                #cut > 0 and (", names cut short: [" .. table.concat(cut, ",") .. "]") or ""))
        end
    }
end

-- The footer names the section's changed options
local function FooterAgrees(sectionId)
    local window = Window()
    local count = addon.Options.Window.Model.ChangedCount(sectionId)
    local expected = count > 0 and window.Strings.ChangedCount:format(count) or ""
    return (window.ChangedText:GetText() or "") == expected, count
end

-- Shows the option's section scrolled to it, then changes it through its row's control in Change(row, option)
local function ChangeSteps(kind, optionId, Change)
    local sectionId, option
    return {
        Name = kind .. "-shown",
        Text = ("the %s row to change"):format(kind),
        Run = function()
            sectionId, option = FindOption(optionId)
            if not option then
                return optionId .. " is in no section on this client"
            end
            Window():ShowSection(sectionId, optionId)
        end,
        Check = function()
            Add(RowOf(option) and "PASS" or "FAIL", ("%s is drawn in %s"):format(optionId, sectionId))
        end
    }, {
        Name = kind,
        Text = ("a %s changed through its own control"):format(kind),
        Run = function()
            local row = option and RowOf(option)
            if not row then
                return "its row is not drawn"
            end
            Remember(option)
            Change(row, option)
        end,
        Check = function()
            local row = RowOf(option)
            local stored = option:Get() ~= live.Before[option].Value
            local line = row and row.ChangedBar:IsShown() == option:IsChanged()
            local footer, count = FooterAgrees(sectionId)
            Add(stored and line and footer and "PASS" or "FAIL", ("%s: %s -> %s, changed line %s, footer %s (%d changed)"):format(optionId,
                tostring(live.Before[option].Value), tostring(option:Get()), line and "follows" or "wrong", footer and "follows" or "wrong", count))
        end
    }
end

-- The arrow on a changed row sets its option back to the default (docs/work/2026-10-31-options-markers). A test does not
-- move the mouse, so the step runs the row's own enter and leave and the arrow's click. An option still at its default
-- is changed through its control first. The arrow is hidden away from the mouse, shows on enter with its atlas in the
-- margin before the name, and its click sets the option back and takes the line away.
local function ResetStep(kind, optionId, Change)
    local sectionId, option, arrow
    return {
        Name = kind .. "-reset",
        Text = ("the %s set back by its row's arrow"):format(kind),
        Run = function()
            sectionId, option = FindOption(optionId)
            local row = option and RowOf(option)
            if not row then
                return "its row is not drawn"
            end
            Remember(option)
            if not option:IsChanged() then
                Change(row, option)
            end
            local reset = row.Reset
            local hiddenAway = row:IsMouseOver() or not reset:IsShown()
            row:OnEnter()
            local texture = reset:GetNormalTexture()
            arrow = {
                Hidden = hiddenAway,
                Shown = reset:IsShown(),
                Atlas = texture and texture:GetAtlas() == "common-icon-undo" or false,
                Margin = (reset:GetLeft() or -1) >= (row:GetLeft() or 0) and (reset:GetRight() or 1e9) <= (row.Label:GetLeft() or 0) + 0.5,
            }
            reset:GetScript("OnClick")(reset, "LeftButton")
            row:OnLeave()
        end,
        Check = function()
            local row = RowOf(option)
            local back = not option:IsChanged()
            local line = row and not row.ChangedBar:IsShown()
            local shows = arrow.Hidden and arrow.Shown and arrow.Atlas and arrow.Margin
            local footer, count = FooterAgrees(sectionId)
            Add(back and line and shows and footer and "PASS" or "FAIL", ("%s: %s, changed line %s, arrow %s, footer %s (%d changed)"):format(optionId,
                back and "back at its default" or "still changed", line and "gone" or "still shown",
                shows and "hidden away from the mouse and shown on enter before the name" or ("wrong (hidden away %s, shown on enter %s, atlas %s, in the margin %s)"):format(
                    tostring(arrow.Hidden), tostring(arrow.Shown), tostring(arrow.Atlas), tostring(arrow.Margin)),
                footer and "follows" or "wrong", count))
        end
    }
end

local function BuildSteps()
    local window = addon.Options.Window
    local list = {
        {
            Name = "open",
            Required = true,
            Text = "/kaf opens the window",
            Run = function()
                live.FirstOpen = Window() == nil
                live.Landing = window.Landing()
                if Window() then
                    Window():Hide()
                end
                SlashCmdList.KAF("")
            end,
            Check = function()
                local frame = Window()
                local shown = frame and frame:IsShown()
                Add(shown and frame.SectionId == live.Landing and "PASS" or "FAIL", ("the window opens on %s, the landing section %s (first open after a /reload: %s)"):format(
                    tostring(frame and frame.SectionId), live.Landing, live.FirstOpen and "yes" or "no"))
            end
        },
        {
            Name = "tabs",
            Text = "a tab per addon, this addon's selected",
            Run = function() end,
            Check = function()
                local frame = Window()
                local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")
                local shown, selected = 0, "none"
                for _, button in ipairs(frame.TabButtons) do
                    if button:IsShown() then
                        shown = shown + 1
                        if button:IsSelected() then selected = button.Tab.Config.TabName end
                    end
                end
                local title = frame.NineSlice.Text:GetText()
                local searchAll = frame.SearchAll:IsShown()
                local ok = shown == #lib.Tabs and frame.Tab == window.Controller and selected == "Achievement Filter"
                    and title == SETTINGS_TITLE and searchAll == (#lib.Tabs > 1)
                Add(ok and "PASS" or "FAIL", ("%d of %d tabs shown, %s selected, title '%s', Search all tabs %s"):format(shown, #lib.Tabs, selected,
                    tostring(title), searchAll and "shown" or "hidden"))
            end
        },
        -- The game's Options window's sizes (docs/work/2026-11-02-options-widths)
        {
            Name = "sizes",
            Text = "the window, its rows and its controls at the sizes of the game's Options window",
            Run = function() end,
            Check = function()
                local frame = Window()
                local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")
                local function Is(value, expected) return math.abs(value - expected) < 0.5 end
                local width = lib.WindowWidth(frame.PaneCollapsed)
                local minWidth, _, maxWidth = width, nil, width
                if frame.GetResizeBounds then minWidth, _, maxWidth = frame:GetResizeBounds() end
                local rows = frame.NavScrollShown and 619 or 635
                local defaults = frame.DefaultsButton
                local fitsIn96 = defaults:GetFontString():GetStringWidth() + 24 <= 96
                local ok = Is(frame:GetWidth(), width) and Is(minWidth, width) and Is(maxWidth, width) and Is(frame:PageWidth(), rows)
                    and Is(frame.SearchBox:GetWidth(), 350) and (fitsIn96 and Is(defaults:GetWidth(), 96) or not fitsIn96 and defaults:GetWidth() > 96)
                    and Is(frame.SearchAll:GetWidth(), 30) and Is(frame.SearchAll:GetHeight(), 29) and Is(frame.Divider:GetWidth(), 630)
                Add(ok and "PASS" or "FAIL", ("window %g wide (resizes from %g to %g), rows %g, search box %g, Defaults %g, check box %gx%g, divider %g, scale %.2f"):format(
                    frame:GetWidth(), minWidth, maxWidth, frame:PageWidth(), frame.SearchBox:GetWidth(), defaults:GetWidth(),
                    frame.SearchAll:GetWidth(), frame.SearchAll:GetHeight(), frame.Divider:GetWidth(), frame:GetScale()))
            end
        },
        SectionStep("overview", addon.L["Overview"])
    }
    for _, section in ipairs(window.Map.Sections) do
        tinsert(list, SectionStep(section.Id, section.Name))
    end
    for _, step in ipairs({ ChangeSteps("toggle", toggleId, function(row) row.Toggle:Click() end) }) do tinsert(list, step) end
    tinsert(list, ResetStep("toggle", toggleId, function(row) row.Toggle:Click() end))
    for _, step in ipairs({ ChangeSteps("range", rangeId, function(row, option)
        local min, max = option:GetRange()
        row.Range:SetValue(option:Get() ~= min and min or max)
    end) }) do tinsert(list, step) end
    for _, step in ipairs({ ChangeSteps("input", inputId, function(row, option)
        row.Input:SetText((option:Get() or "") .. " x")
        row.Input:GetScript("OnEnterPressed")(row.Input)
    end) }) do tinsert(list, step) end
    -- Over a check box's slider the help pane explains the slider, not the check box (Krowi, 2026-11-02: Force two
    -- columns threshold); the mouse's arrival on the bar is played through the row's own handler
    local pairSection, pairOption
    tinsert(list, {
        Name = "slider-help",
        Text = "a check box's slider explains itself",
        Run = function()
            local frame = Window()
            pairSection, pairOption = FindSliderPair()
            if frame.PaneCollapsed then frame:SetPaneCollapsed(false) end
            if pairSection then frame:ShowSection(pairSection, pairOption.Id) end
        end,
        Check = function()
            local row = pairOption and RowOf(pairOption)
            if not row then
                Add("FAIL", "no drawn row whose check box carries a slider")
                return
            end
            row:OnEnter(row.Range.Slider)
            local shown = Window().HoverOption
            row:OnLeave()
            Add(shown == row.With and "PASS" or "FAIL", ("over %s's slider the help explains %s"):format(pairOption:GetLabel(),
                shown and shown:GetLabel() or "the section"))
        end
    })
    local searchText
    tinsert(list, {
        Name = "search",
        Text = "a search lists results",
        Run = function()
            local _, option = FindOption(toggleId)
            searchText = option and option:GetLabel():match("^(%S+)") or "a"
            Window().SearchBox:SetText(searchText)
            Window():OnSearch(searchText)
        end,
        Check = function()
            local links = 0
            for _, element in ipairs(Window().Elements or {}) do
                if element.Kind == "Link" then
                    links = links + 1
                end
            end
            Add(Window().Searching and links > 0 and "PASS" or "FAIL", ("'%s' lists %d results"):format(searchText, links))
        end
    })
    tinsert(list, {
        Name = "pane",
        Text = "the help pane collapsed to its strip",
        Run = function()
            local frame = Window()
            frame:ShowSection("window")
            frame:SetPaneCollapsed(not frame.PaneCollapsed)
        end,
        Check = function()
            local frame = Window()
            local agrees = frame.ExpandButton:IsShown() == frame.PaneCollapsed and frame.HelpScrollBox:IsShown() == not frame.PaneCollapsed
            -- The pane adds its own width to the game's window (docs/work/2026-11-02-options-widths)
            local width = KROWI_LIBMAN:GetLibrary("Krowi_Options_1").WindowWidth(frame.PaneCollapsed)
            local wide = math.abs(frame:GetWidth() - width) < 0.5 and math.abs(frame:PageWidth() - (frame.NavScrollShown and 619 or 635)) < 0.5
            Add(agrees and wide and "PASS" or "FAIL", ("the pane is %s and shows it, the window %g wide (%g expected), rows %g"):format(
                frame.PaneCollapsed and "collapsed" or "open", frame:GetWidth(), width, frame:PageWidth()))
        end
    })
    tinsert(list, {
        Name = "close",
        Text = "the close button hides the window",
        Run = function()
            Window().CloseButton:Click()
        end,
        Check = function()
            Add(not Window():IsShown() and "PASS" or "FAIL", "the window is hidden")
        end
    })
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

-- Every value the steps changed goes back, then the window's saved state as it was before the run
local function Restore()
    local frame = Window()
    local notBack = {}
    for option, before in next, live.Before do
        pcall(option.Set, option, before.Value)
        if option:Get() ~= before.Value then
            tinsert(notBack, option.Id)
        end
    end
    if frame then
        if frame.PaneCollapsed ~= (live.SavedWindow.PaneCollapsed and true or false) then
            frame:SetPaneCollapsed(live.SavedWindow.PaneCollapsed and true or false)
        end
        if live.WasShown then
            frame:Open(live.WasShown)
        end
    end
    local saved = KrowiAF_SavedData.OptionsWindow -- the window keeps this table, so its fields go back in place
    wipe(saved)
    for k, v in next, live.SavedWindow do
        saved[k] = v
    end
    return notBack
end

local function Finish()
    banner:UnregisterAllEvents()
    live.StepName = "restore"
    local ok, notBack = pcall(Restore)
    if not ok then
        Add("FAIL", "could not put the values back: " .. tostring(notBack))
    else
        Add(#notBack == 0 and "PASS" or "FAIL", "the changed values and the window's saved state are as before the run"
            .. (#notBack > 0 and (", except [" .. table.concat(notBack, ",") .. "]") or ""))
    end
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
        print("|cFF88CCFFKrowiAF Tests:|r options: stopped for combat; the changed values go back when it ends")
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
    banner.Text:SetText(("Krowi's Achievement Filter test %d/%d: %s"):format(n, #steps, step.Text))
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

addon.Tests.Async.options = true
addon.Tests.Suites.options = function(done)
    local frame = Window()
    KrowiAF_SavedData.OptionsWindow = KrowiAF_SavedData.OptionsWindow or {}
    live = {
        Results = options.Run(),
        Observations = options.Observations(),
        Finish = done,
        Before = {},
        SavedWindow = DeepCopy(KrowiAF_SavedData.OptionsWindow),
        WasShown = frame and frame:IsShown() and frame.SectionId or nil
    }
    if not banner then
        CreateBanner()
    end
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    steps = BuildSteps()
    print(("|cFF88CCFFKrowiAF Tests:|r options: %d steps, about %d s; it changes three options and puts them back"):format(#steps, #steps * (settle + afterShot)))
    RunStep(1)
end