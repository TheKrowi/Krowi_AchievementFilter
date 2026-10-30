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
    {Name = "changed-dot",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("wrong=%d"):format(#model.CheckChangedDots())
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

-- Not scenarios: the options without a default (no dot, skipped by Defaults), and the setters whose side effects
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
--   toggle, range, input: one row of each changed through its own control: the value is stored, and the changed dot and
--     the footer's count follow it
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

-- The first value change of an option keeps the player's value, which Finish puts back
local function Remember(option)
    if not live.Before[option] then
        live.Before[option] = { Value = option:Get() }
    end
end

-- Drawn rows whose control does not show its option's value
local function CheckDrawnRows()
    local drawn, differ = 0, {}
    Window().PageScrollBox:ForEachFrame(function(row)
        drawn = drawn + 1
        local option = row.Option
        if not option or not option.Type then
            return
        end
        local value = option:Get()
        local shows
        if option.Type == "toggle" then
            shows = (row.Toggle:GetChecked() and true or false) == (value and true or false)
        elseif option.Type == "range" then
            -- the slider moves in whole steps: a value saved between them (the reward preview's size after a resize
            -- of the preview) shows on the nearest step
            local min, max, step = option:GetRange()
            local expected = value
            if expected and step and step > 0 then
                expected = math.min(math.max(min + math.floor((expected - min) / step + 0.5) * step, min), max)
            end
            shows = expected == nil or math.abs(row.Range.Slider:GetValue() - expected) < 0.001
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
    return drawn, differ
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
            local drawn, differ = CheckDrawnRows()
            local ok = (rows == 0 or drawn > 0) and #differ == 0
            Add(ok and "PASS" or "FAIL", ("%d rows, %d drawn%s"):format(rows, drawn,
                #differ > 0 and (", controls that do not show their value: [" .. table.concat(differ, ",") .. "]") or ""))
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
            local dot = row and row.Dot:IsShown() == option:IsChanged()
            local footer, count = FooterAgrees(sectionId)
            Add(stored and dot and footer and "PASS" or "FAIL", ("%s: %s -> %s, dot %s, footer %s (%d changed)"):format(optionId,
                tostring(live.Before[option].Value), tostring(option:Get()), dot and "follows" or "wrong", footer and "follows" or "wrong", count))
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
                    and title == SETTINGS_TITLE and searchAll
                Add(ok and "PASS" or "FAIL", ("%d of %d tabs shown, %s selected, title '%s', Search all tabs %s"):format(shown, #lib.Tabs, selected,
                    tostring(title), searchAll and "shown" or "hidden"))
            end
        },
        SectionStep("overview", addon.L["Overview"])
    }
    for _, section in ipairs(window.Map.Sections) do
        tinsert(list, SectionStep(section.Id, section.Name))
    end
    for _, step in ipairs({ ChangeSteps("toggle", toggleId, function(row) row.Toggle:Click() end) }) do tinsert(list, step) end
    for _, step in ipairs({ ChangeSteps("range", rangeId, function(row, option)
        local min, max = option:GetRange()
        row.Range:SetValue(option:Get() ~= min and min or max)
    end) }) do tinsert(list, step) end
    for _, step in ipairs({ ChangeSteps("input", inputId, function(row, option)
        row.Input:SetText((option:Get() or "") .. " x")
        row.Input:GetScript("OnEnterPressed")(row.Input)
    end) }) do tinsert(list, step) end
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
            Add(agrees and "PASS" or "FAIL", ("the pane is %s and shows it"):format(frame.PaneCollapsed and "collapsed" or "open"))
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