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
-- addon keeps (written to each one's saved table), and a search of the open tab or of every tab. It passes every field
-- Krowi_Options 2 asks for (its configFields), most of them doing nothing.
local function SecondTab(lib)
    local saved = {}
    local option = {
        GetLabel = function() return "Zz Tooltip" end,
        IsHidden = function() return false end,
    }
    local tab = lib.CreateWindow({
        TabName = "Zz Test",
        Saved = saved,
        Groups = { { Name = "Zz", Sections = { "test" } } },
        SectionName = function() return "Zz Test" end,
        IsNew = function() return false end,
        Landing = function() return "test" end,
        OnSectionShown = function() end,
        GetElements = function() return { { Kind = "Option", Option = option } } end,
        GetHelp = function() return nil end,
        ResetSection = function() return false end,
        ChangedCount = function() return 0 end,
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
    local under = false
    for _, element in ipairs(window.Controller.Config.GetElements("overview")) do
        if element.Kind == "Header" then under = groups[element.Text] or false end
        if under and element.Kind == "Link" then
            n.links = n.links + 1
        elseif under and element.Kind == "Cards" then
            n.cards = n.cards + #element.Cards
            n.rows = n.rows + math.ceil(#element.Cards / KROWI_LIBMAN:GetLibrary("Krowi_Options_2").CardColumns)
            for _, card in ipairs(element.Cards) do
                if card.Picture then n.pictures = n.pictures + 1 elseif card.Icon then n.icons = n.icons + 1 end
                if card.Text and card.Text ~= "" then n.lines = n.lines + 1 end
            end
        end
    end
    return ("links=%d cards=%d rows=%d pictures=%d icons=%d lines=%d"):format(n.links, n.cards, n.rows, n.pictures, n.icons, n.lines)
end

-- A card's width on the game's 635 rows and the 619 left while the section list shows its scroll bar, and the part of a
-- help picture its picture area shows: a wide one (NewTabs, cut at its right) and a tall one (CategoryTree, at its bottom)
local function CardGeometryLine(lib)
    local pictures = addon.Options.Window.HelpPictures
    local parts = { ("width %g/%g"):format(lib.CardWidth(635), lib.CardWidth(619)) }
    for _, name in ipairs({ "NewTabs", "CategoryTree" }) do
        parts[#parts + 1] = ("%s %.5f,%.5f,%.5f,%.5f"):format(name, lib.CardCrop(pictures[name], lib.CardWidth(635)))
    end
    -- a section's own part of its picture (Reward preview's mount, Krowi, 2026-11-02): a square cut at its bottom
    local square = { Width = 400, Height = 400, TexCoords = { 0, 1, 0, 1 }, Part = { X = 0, Y = 1 } }
    parts[#parts + 1] = ("Bottom %.5f,%.5f,%.5f,%.5f"):format(lib.CardCrop(square, lib.CardWidth(635)))
    return table.concat(parts, " ")
end

-- A search of this addon's tab (docs/work/2026-11-03-blizzard-search), a result per row in the order shown:
-- "Section>Heading>Name", a row with no heading "Section>Name"
local function SearchRows(text, broad)
    local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
    local tab = addon.Options.Window.Controller
    local rows = {}
    for _, group in ipairs(lib.Search(text, false, tab, broad)) do
        for _, section in ipairs(group.Sections) do
            for _, row in ipairs(section.Rows) do
                local name = row.Option and row.Option:GetLabel() or row.Kind == "GridHeader" and "(columns)" or row.Item and row.Item.Show:GetLabel() or row.Text or row.Label
                rows[#rows + 1] = section.Name .. ">" .. (row.Heading and row.Heading ~= "" and (row.Heading .. ">") or "") .. tostring(name)
            end
        end
    end
    return rows
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
    -- One window for every Krowi addon, a tab each; KAF alone registers today (docs/work/2026-10-30-options-settings-look)
    {Name = "window-tabs",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
            if not lib.Tabs then return "no tab registry" end
            return "tabs=" .. TabNames(lib)
        end,
        Recorded = "tabs=Achievement Filter", -- "no tab registry" before the tabs
        Target = "tabs=Achievement Filter"},
    {Name = "window-second-tab",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
            if not lib.Tabs then return "no tab registry" end
            return SecondTab(lib)
        end,
        Recorded = "tabs=Achievement Filter,Zz Test shared=both open=Zz Test all=Achievement Filter,Zz Test after=Achievement Filter", -- "no tab registry" before the tabs
        Target = "tabs=Achievement Filter,Zz Test shared=both open=Zz Test all=Achievement Filter,Zz Test after=Achievement Filter"},
    -- The game's Options window's sizes (docs/work/2026-11-02-options-widths): its width with the help pane added, and
    -- the rows' names and controls in the right-hand column
    {Name = "window-width",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
            if not lib.WindowWidth then return "resizable from 1000x560" end
            return ("open=%d collapsed=%d"):format(lib.WindowWidth(false), lib.WindowWidth(true))
        end,
        Recorded = "open=1300 collapsed=950", -- "resizable from 1000x560" before the game's width
        Target = "open=1300 collapsed=950"},
    -- Krowi_Options 2 as a library of its own (docs/work/2026-11-04-krowi-options-library): the window's texts come from its
    -- own locale files, none from this addon's config, and it leaves no global but the window's name, so a second copy
    -- embedded by another addon finds nothing to collide with
    {Name = "library-strings",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
            if not lib.GetStrings then return "no strings of its own" end
            local count, empty = 0, 0
            for _, text in next, lib.GetStrings() do
                count = count + 1
                if type(text) ~= "string" or text == "" then empty = empty + 1 end
            end
            return ("strings=%d empty=%d config=%s"):format(count, empty, addon.Options.Window.Controller.Config.Strings and "yes" or "no")
        end,
        Recorded = "strings=22 empty=0 config=no", -- "no strings of its own" with Krowi_Options 1, whose 22 texts this addon passed
        Target = "strings=22 empty=0 config=no"},
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
    {Name = "library-globals",
        Observe = function()
            local windowName = KROWI_LIBMAN:GetLibrary("Krowi_Options_2").WindowName
            local found = {}
            for name in next, _G do
                if type(name) == "string" and name:find("^Krowi_Options") and name ~= windowName then
                    found[#found + 1] = name
                end
            end
            table.sort(found)
            return #found == 0 and "none" or table.concat(found, ",")
        end,
        Recorded = "none", -- the 16 Krowi_Options*Mixin tables with Krowi_Options 1; the window's name is lib.WindowName
        Target = "none"},
    {Name = "row-geometry",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
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
            for _, row in ipairs(SearchRows(addon.L["Reset position"])) do
                labels[#labels + 1] = row:match("([^>]+)$")
            end
            return Join(labels)
        end,
        -- the three check boxes first, by their buttons' whole text; then, since each word counts as the game's search counts
        -- it, the names holding only "reset" or "position" (docs/work/2026-11-03-blizzard-search); before, the three alone
        Recorded = "Remember Achievement Window position,Remember Achievement Calendar position,Remember Data Manager position,"
            .. "Calendar button: horizontal position,Calendar button: vertical position,Reset view on open,Remember Last Position,"
            .. "Position applies to,Presets,Reset Faction Filters,Presets,Reset Profile,Reset Profile",
        Target = "Remember Achievement Window position,Remember Achievement Calendar position,Remember Data Manager position,"
            .. "Calendar button: horizontal position,Calendar button: vertical position,Reset view on open,Remember Last Position,"
            .. "Position applies to,Presets,Reset Faction Filters,Presets,Reset Profile,Reset Profile"},
    -- The game's search finds options by their name only; the broad search adds their descriptions (Krowi, 2026-11-03,
    -- docs/work/2026-11-03-blizzard-search), not the sections' explanations (Krowi's look in game the same day)
    {Name = "search-names",
        Observe = function()
            return ("names=%d broad=%s"):format(#SearchRows("reminder", false), table.concat(SearchRows("reminder", true), "; "))
        end,
        -- before: one search of names, descriptions, headings and explanations ("names=8 broad=" the same 8 links, with
        -- Enable Upcoming Calendar Events and Compact found by their heading "Reminders"); then the broad search also gave
        -- Event reminders and Reminder events a "How it works" link for their explanation (Krowi in game: it reads as an
        -- option and says nothing of why it is there)
        Recorded = "names=0 broad=Event reminders>Reminders>Enable; Event reminders>Pop up position>Position applies to;"
            .. " Event reminders>Pop up position>Grow direction; Event reminders>Pop up position>Hide placeholders",
        Target = "names=0 broad=Event reminders>Reminders>Enable; Event reminders>Pop up position>Position applies to;"
            .. " Event reminders>Pop up position>Grow direction; Event reminders>Pop up position>Hide placeholders"},
    -- A name that only means something under its heading shows that heading above it (option A)
    {Name = "search-headings",
        Observe = function() return table.concat(SearchRows("loaded"), "; ") end,
        Recorded = "Other addons>Achievements Tab Fixes>Loaded; Other addons>Better Wardrobe>Loaded; Other addons>EllesmereUI>Loaded;"
            .. " Other addons>ElvUI>Loaded; Other addons>GW 2 UI>Loaded; Other addons>Instance Achievement Tracker>Loaded; Other addons>Zygor Guides Viewer>Loaded",
        Target = "Other addons>Achievements Tab Fixes>Loaded; Other addons>Better Wardrobe>Loaded; Other addons>EllesmereUI>Loaded;"
            .. " Other addons>ElvUI>Loaded; Other addons>GW 2 UI>Loaded; Other addons>Instance Achievement Tracker>Loaded; Other addons>Zygor Guides Viewer>Loaded"},
    -- A found row that hangs under another brings that one along, above it, as the game's search does
    {Name = "search-parent",
        Observe = function() return table.concat(SearchRows("reverse"), "; ") end,
        -- before: the five Reverse Sort rows alone, after Filtering and sorting's explanation
        Recorded = "Tooltips>Achievement points tooltip>Sort priority 1; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 2; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 3; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 4; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 5; Tooltips>Achievement points tooltip>Reverse Sort",
        Target = "Tooltips>Achievement points tooltip>Sort priority 1; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 2; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 3; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 4; Tooltips>Achievement points tooltip>Reverse Sort;"
            .. " Tooltips>Achievement points tooltip>Sort priority 5; Tooltips>Achievement points tooltip>Reverse Sort"},
    -- A child option comes with its parent also when a heading stands between them on the page (Show criteria if)
    {Name = "search-parent-heading",
        Observe = function()
            local rows = {}
            for _, row in ipairs(SearchRows(addon.L["Achievement is Completed"])) do
                if row:find("^" .. addon.L["Criteria on units"] .. ">") then rows[#rows + 1] = row end
            end
            return table.concat(rows, "; ")
        end,
        -- before the review (indent alone): the three without Show Criteria, whose heading came between
        Recorded = "Criteria on units>Unit tooltips>Show Criteria; Criteria on units>Show criteria if>Achievement is Completed;"
            .. " Criteria on units>Show criteria if>Achievement was Not Earned by Me; Criteria on units>Show criteria if>Criteria is Completed",
        Target = "Criteria on units>Unit tooltips>Show Criteria; Criteria on units>Show criteria if>Achievement is Completed;"
            .. " Criteria on units>Show criteria if>Achievement was Not Earned by Me; Criteria on units>Show criteria if>Criteria is Completed"},
    -- A found All / None heading brings every option it switches, so its buttons never switch rows the player cannot see
    {Name = "search-all-none",
        Observe = function()
            local source = addon.Options.Window.Source
            local members = 0
            for _, element in ipairs(source.Elements(source.Section("eventlist"))) do
                if element.Kind == "Sub" and element.Text == addon.L["All holidays"] then members = #element.Members end
            end
            local rows = SearchRows(addon.L["All holidays"])
            local under = 0 -- the rows under its heading; "all" finds other groups too
            local heading = rows[1] and rows[1]:match("^(.*>)[^>]+$")
            for _, row in ipairs(rows) do
                if heading and row:sub(1, #heading) == heading then under = under + 1 end
            end
            return ("%s with %d of its %d options"):format(tostring(rows[1]), under - 1, members)
        end,
        -- before the review: none of them, their All and None switching rows out of sight
        Recorded = "Reminder events>Holidays>All holidays with 13 of its 13 options",
        Target = "Reminder events>Holidays>All holidays with 13 of its 13 options",
        RecordedClassic = "Reminder events>Holidays>All holidays with 12 of its 12 options",
        TargetClassic = "Reminder events>Holidays>All holidays with 12 of its 12 options"},
    -- Each word counts, a row with more of them first: "Show in Tooltip" before "Skin Tooltip" (the game puts it after)
    {Name = "search-order",
        Observe = function()
            local names = {}
            for _, row in ipairs(SearchRows("show tooltip")) do
                local name = row:match("([^>]+)$")
                if name == "Show in Tooltip" or name == "Skin Tooltip" then names[#names + 1] = name end
            end
            return Join(names)
        end,
        Recorded = "Show in Tooltip,Skin Tooltip,Skin Tooltip", -- before: "none", the whole text as one piece
        Target = "Show in Tooltip,Skin Tooltip,Skin Tooltip"},
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
    {Name = "card-geometry",
        Observe = function()
            local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
            if not lib.CardWidth then return "no card helpers" end
            return CardGeometryLine(lib)
        end,
        -- "no card helpers" before the cards; the square's Bottom 0.00000,1.00000,0.00000,0.42645 before a section's Part
        Recorded = "width 203.667/198.333 NewTabs 0.00000,0.36838,0.00000,0.62500 CategoryTree 0.00000,0.71875,0.00000,0.15353 Bottom 0.00000,1.00000,0.57355,1.00000",
        -- three cards and two 12 gaps fill the row; a picture fills the 86 high area inside the card's 1 px border, cut from
        -- its top left inside the part of its texture it fills (Pictures.lua), or from the part its section names
        Target = "width 203.667/198.333 NewTabs 0.00000,0.36838,0.00000,0.62500 CategoryTree 0.00000,0.71875,0.00000,0.15353 Bottom 0.00000,1.00000,0.57355,1.00000"},
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
--   overview-cards, overview-cards-end: Overview's cards at its first group and at its end, each inside its row, as wide
--     as the others, with a picture or icon; text cut short is listed, as the sections' names are, without failing
--     (docs/work/2026-11-02-overview-cards)
--   toggle, range, input: one row of each changed through its own control: the value is stored, and the changed line and
--     the footer's count follow it; toggle-reset: the toggle's row shows its arrow on enter, before the name, and the
--     arrow sets the option back to its default (docs/work/2026-10-31-options-markers); toggle-help-follows: the help
--     pane's Reset to Default line comes and goes with a change made under the mouse, toggle-help-follows-grid the same
--     on a grid's check box (the code review of Krowi_Options 2.0); toggle-reset-clipped, the one step that waits for the
--     player's mouse (30 s, then skipped): the arrow goes when the mouse leaves a row through its part scrolled out of
--     view (both from the markers review, docs/work/2026-11-04-krowi-options-library)
--   greyed-help, greyed-help-collapsed: a greyed-out check box, dropdown, dropdown arrow and tab arrow still fire their
--     hover and explain their option, in the pane and in the collapsed pane's tooltip (the code review of Krowi_Options
--     2.0, #8)
--   search: the found options drawn as rows under their section's name (docs/work/2026-11-03-blizzard-search);
--     search-letter: from the first letter; search-pane: the pane explains the search, a hovered row with its section;
--     search-broad: Search descriptions finds a word only a description holds; search-change: a check box changed in
--     the results greys its child and the rows stay; search-confirm, -no: a question asked in the results, and No;
--     search-showif: turning debug info off in the results takes its child rows away, on brings them back
--   pane: the help pane collapses to its strip; close: the close button hides the window
-- /kaftest options <what> runs only some steps (SelectSteps, at the end of the file): a step's name, the start of names
-- (toggle, search, section), or a step's number in the banner, each with the steps it builds on and the open first.
-- At the end every value the steps changed and the window's saved state (place, pane, search breadth, last section, the
-- sections seen, which the walk marks) are put back, and the addon's Lua errors of the session are reported from BugGrabber. Combat
-- stops the run; the values go back once it ends.

local settle = 1 -- a state change -> its check and screenshot
local afterShot = 1 -- a screenshot -> the next step
local mouseWait, pollEvery = 30, 0.1 -- a step that needs the player's mouse waits this long, looking this often
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

-- The options window by the name its library gives it (lib.WindowName)
local function Window()
    return _G[KROWI_LIBMAN:GetLibrary("Krowi_Options_2").WindowName]
end

-- The page's drawn rows: Krowi_Options 2 hangs each row on a plain frame of its list, as frame.Row
-- (docs/work/2026-11-04-krowi-options-library)
local function ForEachRow(func)
    Window().PageScrollBox:ForEachFrame(function(frame)
        if frame.Row then func(frame.Row) end
    end)
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
    ForEachRow(function(row)
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
        local line = row:GetLeft() + KROWI_LIBMAN:GetLibrary("Krowi_Options_2").RowX(row.Geometry.Toggle, row:GetWidth())
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
    ForEachRow(function(row)
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

-- Overview's drawn cards (docs/work/2026-11-02-overview-cards): as wide as the others of their row and inside it, each
-- with its picture or icon; a name or line cut short is listed without failing, as SectionStep lists names. Scroll(window)
-- shows the part of the page to check.
local function CardsStep(name, text, Scroll)
    return {
        Name = name,
        Text = text,
        Run = function()
            Window():ShowSection("overview")
            Scroll(Window())
        end,
        Check = function()
            local cards, misfit, empty, cut = 0, {}, {}, {}
            ForEachRow(function(row)
                if not row.Cards then
                    return
                end
                local width
                for _, card in ipairs(row.Cards) do
                    if card:IsShown() then
                        cards = cards + 1
                        local cardName = card.Name:GetText() or "?"
                        width = width or card:GetWidth()
                        if math.abs(card:GetWidth() - width) > 0.5 or card:GetLeft() < row:GetLeft() - 0.5 or card:GetRight() > row:GetRight() + 0.5 then
                            tinsert(misfit, cardName)
                        end
                        if not (card.Picture:IsShown() and card.Picture:GetTexture() or card.Icon:IsShown() and card.Icon:GetTexture()) then
                            tinsert(empty, cardName)
                        end
                        if card.Name:IsTruncated() or card.Line:IsTruncated() then
                            tinsert(cut, cardName)
                        end
                    end
                end
            end)
            local ok = cards > 0 and #misfit == 0 and #empty == 0
            Add(ok and "PASS" or "FAIL", ("%d cards drawn%s%s%s"):format(cards,
                #misfit > 0 and (", out of their row: [" .. table.concat(misfit, ",") .. "]") or "",
                #empty > 0 and (", without a picture or icon: [" .. table.concat(empty, ",") .. "]") or "",
                #cut > 0 and (", text cut short: [" .. table.concat(cut, ",") .. "]") or ""))
        end
    }
end

local function ScrollToFirstCards(frame)
    for index, element in ipairs(frame.Elements or {}) do
        if element.Kind == "CardRow" then
            frame.PageScrollBox:ScrollToElementDataIndex(index, ScrollBoxConstants.AlignBegin, nil, ScrollBoxConstants.NoScrollInterpolation)
            return
        end
    end
end

local function ScrollToEnd(frame)
    frame.PageScrollBox:ScrollToEnd(ScrollBoxConstants.NoScrollInterpolation)
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
        Needs = kind .. "-shown",
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
        Needs = kind .. "-shown",
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

-- Whether the help pane holds the arrow's line, "Reset to Default"
local function HelpHasReset()
    local provider = Window().HelpScrollBox:GetDataProvider()
    for i = 1, provider and provider:GetSize() or 0 do
        local data = provider:Find(i)
        if type(data) == "table" and type(data.Text) == "string" and data.Text:find(RESET_TO_DEFAULT, 1, true) then
            return true
        end
    end
    return false
end

-- The help pane follows a change made under the mouse (from the markers review, docs/work/2026-11-04-krowi-options-library):
-- the row's enter is played, the option changed through its check box and set back, and before and after each change the
-- pane is read for the arrow's line, which shows exactly while the option is changed
local function HelpFollowsStep(optionId)
    local seen
    return {
        Name = "toggle-help-follows",
        Needs = "toggle-shown",
        Text = "the help pane follows a change made under the mouse",
        Run = function()
            local _, option = FindOption(optionId)
            local row = option and RowOf(option)
            if not row then
                return "its row is not drawn"
            end
            Remember(option)
            row:OnEnter()
            seen = { Was = option:IsChanged(), Before = HelpHasReset() }
            row.Toggle:Click()
            seen.Changed, seen.AfterChange = option:IsChanged(), HelpHasReset()
            row.Toggle:Click()
            seen.Back, seen.AfterBack = option:IsChanged(), HelpHasReset()
            row:OnLeave()
        end,
        Check = function()
            local follows = seen.Before == seen.Was and seen.AfterChange == seen.Changed and seen.AfterBack == seen.Back
            Add(follows and "PASS" or "FAIL", ("%s: the Reset to Default line %s before (changed %s), %s after the change (changed %s), %s after setting it back (changed %s)"):format(
                optionId, seen.Before and "shows" or "is absent", tostring(seen.Was), seen.AfterChange and "shows" or "is absent", tostring(seen.Changed),
                seen.AfterBack and "shows" or "is absent", tostring(seen.Back)))
        end
    }
end

-- The same on a grid's check box (from the code review of Krowi_Options 2.0): a grid row holds its options in its
-- element, not as the row's Option, and the help did not follow a change there. The first grid row of Event reminders
-- with a check box that can be changed.
local function GridHelpFollowsStep()
    local seen
    return {
        Name = "toggle-help-follows-grid",
        Text = "the help pane follows a change in a grid made under the mouse",
        Run = function()
            Window():ShowSection("events")
            local row, column
            ForEachRow(function(candidate)
                local element = candidate.Element
                if row or not element or element.Kind ~= "GridRow" then
                    return
                end
                for i, option in ipairs(element.Cells) do
                    if not row and not option:IsDisabled() then
                        row, column = candidate, i
                    end
                end
            end)
            if not row then
                return "no grid check box to change in events"
            end
            local option = row.Element.Cells[column]
            Remember(option)
            row:OnEnter(column)
            seen = { Id = option.Id, Was = option:IsChanged(), Before = HelpHasReset() }
            row.Cells[column]:Click()
            seen.Changed, seen.AfterChange = option:IsChanged(), HelpHasReset()
            row.Cells[column]:Click()
            seen.Back, seen.AfterBack = option:IsChanged(), HelpHasReset()
            row:OnLeave()
        end,
        Check = function()
            local follows = seen.Before == seen.Was and seen.AfterChange == seen.Changed and seen.AfterBack == seen.Back
            Add(follows and "PASS" or "FAIL", ("%s: the Reset to Default line %s before (changed %s), %s after the change (changed %s), %s after setting it back (changed %s)"):format(
                seen.Id, seen.Before and "shows" or "is absent", tostring(seen.Was), seen.AfterChange and "shows" or "is absent", tostring(seen.Changed),
                seen.AfterBack and "shows" or "is absent", tostring(seen.Back)))
        end
    }
end

-- The undo arrow goes when the mouse leaves a row through its part scrolled out of view (from the markers review): the
-- last plain check box of the longest section that has one is changed and scrolled half below the list's bottom edge,
-- the player hovers it and moves straight down off the list, and the step reads the arrow once the mouse is on the
-- hidden half. On Mists the longest section, the plugins, has no plain check box.
local function ClippedResetStep()
    local option, hovered
    return {
        Name = "toggle-reset-clipped",
        Text = ("hover the half-shown row at the list's bottom, then move straight down off the list (%d s)"):format(mouseWait),
        Run = function()
            local frame, window = Window(), addon.Options.Window
            local sections = {}
            for _, section in ipairs(window.Map.Sections) do
                tinsert(sections, { Section = section, Count = #window.Source.Elements(section) })
            end
            table.sort(sections, function(a, b) return a.Count > b.Count end)
            local index
            for _, entry in ipairs(sections) do
                frame:ShowSection(entry.Section.Id)
                for i, element in ipairs(frame.Elements or {}) do
                    local o = element.Option
                    if o and o.Type == "toggle" and not element.With and not o:IsDisabled() and not (o.GetNeedsReload and o:GetNeedsReload()) then
                        option, index = o, i
                    end
                end
                if option then
                    break
                end
            end
            if not option then
                return "no section has a plain check box"
            end
            local box = frame.PageScrollBox
            box:ScrollToElementDataIndex(index, ScrollBoxConstants.AlignEnd, nil, ScrollBoxConstants.NoScrollInterpolation)
            local row = RowOf(option)
            if not row then
                return "its row is not drawn"
            end
            box:ScrollToOffset(box:GetDerivedScrollOffset() - row:GetHeight() / 2, ScrollBoxConstants.NoScrollInterpolation)
            Remember(option)
            if not option:IsChanged() then
                row.Toggle:Click()
            end
            hovered = false
        end,
        -- For the kit: the visible half of the row inside the list, then its hidden half below the list's bottom edge
        Hover = function(kit)
            local row = RowOf(option)
            if row then
                kit.HoverAt(row, 0, (hovered and -1 or 1) * row:GetHeight() / 4)
            end
        end,
        -- First the mouse on the row inside the list, then on the row's part below the list
        Mouse = function()
            local row = RowOf(option)
            if not row then
                return false
            end
            local inList = Window().PageScrollBox:IsMouseOver()
            if row:IsMouseOver() and inList then
                hovered = true
            end
            return hovered and row:IsMouseOver() and not inList
        end,
        Check = function()
            local row = RowOf(option)
            local shown = row and row.Reset:IsShown()
            Add(row and not shown and "PASS" or "FAIL", ("%s: with the mouse on the row's hidden half the arrow is %s"):format(option.Id,
                not row and "not drawn" or shown and "still shown" or "gone"))
        end
    }
end

-- The search as the game's Options window searches (docs/work/2026-11-03-blizzard-search), through the window's own
-- functions: the rows it draws, from the first letter, the help pane beside them, the broad search, a change made in the
-- results, a question asked there, and a row that a change in them hides
local tabPriorityId = "Layout.args.Achievements.args.Style.args.TabPriority.args.EnableTabPriority"
local tabPriorityChildId = "Layout.args.Achievements.args.Style.args.TabPriority.args.TabPriority"
local debugId = "General.args.Debug.args.Debug.args.EnableDebugInfo"
local traceId = "General.args.Debug.args.Debug.args.EnableTraceInfo"
local testQuestion = "Krowi's Achievement Filter test?"

-- As the player types it
local function Search(text)
    local frame = Window()
    frame.SearchBox:SetText(text)
    frame:OnSearch(text)
end

-- Through its check box, as the player ticks it
local function SetBroad(on)
    local frame = Window()
    if (frame.BroadSearch and true or false) ~= on then frame.SearchBroad:Click() end
end

local function Kinds()
    local kinds = {}
    for _, element in ipairs(Window().Elements or {}) do kinds[element.Kind] = (kinds[element.Kind] or 0) + 1 end
    return kinds
end

local function InResults(option)
    for _, element in ipairs(Window().Elements or {}) do
        if element.Option == option then return true end
    end
    return false
end

local function HelpTitle()
    local provider = Window().HelpScrollBox:GetDataProvider()
    local first = provider and provider:Find(1)
    return first and first.Text
end

-- A word of an option's description that no option's name holds, so only the broad search finds it, in any language
local function DescriptionOnlyWord()
    local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
    local tab = addon.Options.Window.Controller
    for _, optionId in ipairs({ toggleId, rangeId, tabPriorityId }) do
        local _, option = FindOption(optionId)
        for word in (option and option:GetDescription() or ""):gmatch("[^%s%p]+") do
            if #word >= 5 and #lib.Search(word, false, tab, false) == 0 and #lib.Search(word, false, tab, true) > 0 then return word end
        end
    end
end

local function SearchSteps()
    local searchText, pane, broad, change, confirm, showIf
    return {
        {
            Name = "search",
            Text = "a search draws the found options as rows under their section's name",
            Run = function()
                SetBroad(false)
                local _, option = FindOption(toggleId)
                searchText = option and option:GetLabel():match("^(%S+)") or "a"
                Search(searchText)
            end,
            Check = function()
                local frame = Window()
                local kinds = Kinds()
                local first = frame.Elements and frame.Elements[1]
                local drawn, differ, misfit = CheckDrawnRows()
                local ok = frame.Searching and (kinds.Option or 0) > 0 and (kinds.SearchHeading or 0) > 0 and not kinds.Link and first
                    and (first.Kind == "SearchHeading" or first.Kind == "Header") and not frame.DefaultsButton:IsShown() and #differ == 0 and #misfit == 0
                Add(ok and "PASS" or "FAIL", ("'%s': %d rows under %d section names, %d links, Defaults %s, %d drawn%s%s"):format(searchText,
                    kinds.Option or 0, kinds.SearchHeading or 0, kinds.Link or 0, frame.DefaultsButton:IsShown() and "shown" or "hidden", drawn,
                    #differ > 0 and (", controls that do not show their value: [" .. table.concat(differ, ",") .. "]") or "",
                    #misfit > 0 and (", rows out of the layout: [" .. table.concat(misfit, "; ") .. "]") or ""))
            end
        },
        {
            Name = "search-letter",
            Needs = "search",
            Text = "one letter already searches, as the game's",
            Run = function()
                searchText = searchText:match("^[%z\1-\127\194-\244][\128-\191]*") -- one letter, also when it takes several bytes
                Search(searchText)
            end,
            Check = function()
                local kinds = Kinds()
                Add(Window().Searching and (kinds.Option or 0) > 0 and "PASS" or "FAIL", ("'%s' finds %d rows in %d sections"):format(searchText,
                    kinds.Option or 0, kinds.SearchHeading or 0))
            end
        },
        {
            Name = "search-pane",
            Text = "the help pane explains the search, and a hovered row with its own section",
            Run = function()
                local frame = Window()
                if frame.PaneCollapsed then frame:SetPaneCollapsed(false) end
                local _, child = FindOption(tabPriorityChildId)
                Search(child:GetLabel())
                pane = { Before = HelpTitle() }
                local row = RowOf(child)
                if not row then return "its row is not drawn" end
                row:OnEnter()
                pane.Hover, pane.Kicker = frame.HoverOption == child, frame.CollapseButton.Label:GetText()
                row:OnLeave()
                pane.After = HelpTitle()
            end,
            Check = function()
                local frame = Window()
                local search, section = frame.Strings.Search, frame.Config.SectionName((FindOption(tabPriorityChildId)))
                Add(pane.Before == search and pane.Hover and pane.Kicker == section and pane.After == search and "PASS" or "FAIL",
                    ("before '%s', on the row %s under '%s' (%s expected), after '%s'"):format(tostring(pane.Before),
                        pane.Hover and "its description" or "not its description", tostring(pane.Kicker), section, tostring(pane.After)))
            end
        },
        {
            Name = "search-broad",
            Text = "Search descriptions also finds options by their description, and no section by its explanation",
            Run = function()
                local word = DescriptionOnlyWord()
                if not word then return "no word of a description that no name holds" end
                SetBroad(false)
                Search(word)
                broad = { Word = word, Names = Kinds() }
                SetBroad(true)
            end,
            Check = function()
                local frame = Window()
                local kinds = Kinds()
                local kept = KrowiAF_SavedData.OptionsWindow.SearchBroad == true and frame.SearchBroad:GetChecked()
                Add(not broad.Names.Option and broad.Names.Note == 1 and (kinds.Option or 0) > 0 and not kinds.Link and kept and "PASS" or "FAIL",
                    ("'%s': by name %d rows, ticked %d rows and %d links, %s"):format(broad.Word, broad.Names.Option or 0, kinds.Option or 0,
                        kinds.Link or 0, kept and "kept with the window's state" or "not kept"))
            end
        },
        {
            Name = "search-change",
            Text = "a check box changed in the results greys its child row, and the rows stay",
            Run = function()
                SetBroad(false)
                local _, parent = FindOption(tabPriorityId)
                local _, child = FindOption(tabPriorityChildId)
                Search(parent:GetLabel())
                change = { Parent = parent, Child = child, Signature = Window().Signature }
                local row = RowOf(parent)
                if not row then return "its row is not drawn" end
                Remember(parent)
                row.Toggle:Click()
            end,
            Check = function()
                local frame = Window()
                local childRow = RowOf(change.Child)
                local greyed = childRow and (childRow.Label:GetFontObject() == GameFontDisable) == change.Child:IsDisabled()
                local stored = change.Parent:Get() ~= live.Before[change.Parent].Value
                local same = frame.Signature == change.Signature
                Add(stored and greyed and same and "PASS" or "FAIL", ("%s %s, %s %s, the rows %s"):format(change.Parent:GetLabel(),
                    stored and "changed" or "not changed", change.Child:GetLabel(), greyed and "follows it" or "does not follow it",
                    same and "stayed" or "were drawn again"))
            end
        },
        {
            Name = "search-confirm",
            Needs = "search",
            Text = "a question asked in the results shows in the header",
            Run = function()
                Search(searchText)
                confirm = {}
                -- The box reports its new text a frame later, which searches again and drops a question asked before it;
                -- a player picks the choice that asks only after typing
                After(0.2, function() Window():AskConfirm(testQuestion, function() confirm.Yes = true end) end)
            end,
            Check = function()
                local frame = Window()
                local asked = frame.CancelButton:IsShown() and frame.DefaultsButton:IsShown() and frame.ChangedText:GetText() == testQuestion
                Add(asked and "PASS" or "FAIL", ("the question %s, Yes %s, No %s"):format(frame.ChangedText:GetText() == testQuestion and "shows" or "does not show",
                    frame.DefaultsButton:IsShown() and "shown" or "hidden", frame.CancelButton:IsShown() and "shown" or "hidden"))
            end
        },
        {
            Name = "search-confirm-no",
            Needs = "search-confirm",
            Text = "No ends the question and does nothing",
            Run = function()
                Window().CancelButton:Click()
            end,
            Check = function()
                local frame = Window()
                local gone = not frame.CancelButton:IsShown() and not frame.DefaultsButton:IsShown() and frame.PageTitle:IsShown()
                Add(gone and not confirm.Yes and "PASS" or "FAIL", ("the question %s, its answer %s"):format(gone and "is gone" or "stays",
                    confirm.Yes and "ran" or "did not run"))
            end
        },
        {
            Name = "search-showif",
            Text = "a row that a change in the results hides goes, and comes back",
            Run = function()
                SetBroad(false)
                local _, debug = FindOption(debugId)
                local _, trace = FindOption(traceId)
                Search(trace:GetLabel())
                showIf = { Trace = trace, Before = InResults(trace) }
                Remember(debug)
                debug:Set(false)
                Window():OnOptionChanged(debug)
                showIf.Off = InResults(trace)
                debug:Set(true)
                Window():OnOptionChanged(debug)
            end,
            Check = function()
                local back = InResults(showIf.Trace)
                Add(showIf.Before and not showIf.Off and back and "PASS" or "FAIL", ("%s: %s, with debug info off %s, on again %s"):format(
                    showIf.Trace:GetLabel(), showIf.Before and "found" or "not found", showIf.Off and "still there" or "gone", back and "back" or "not back"))
            end
        },
    }
end

-- A greyed-out setting still explains itself under the mouse (the code review of Krowi_Options 2.0, #8): the game runs a
-- greyed button's OnEnter only when the button asks for it (SetMotionScriptsWhileDisabled, as the game's own settings
-- check box does), and that flag is what the fix added. A test does not move the mouse, so the steps read the flag and
-- play the button's own enter and leave: with the pane open the pane explains the option, collapsed the row's tooltip
-- does. The cases: a check box and a dropdown under a parent check box that is off (turned off for the run when it is
-- on), and the first tab's Up arrow, greyed on every client. Each step holds its last hover for its screenshot.
local greyedCases = {
    { Name = "check box", OptionId = "Layout.args.Criteria.args.Tooltip.args.ShowCriteriaIfAchievementIsCompleted", Control = function(row) return row.Toggle end },
    { Name = "dropdown", OptionId = tabPriorityChildId, Control = function(row) return row.Select.Dropdown end },
    { Name = "dropdown's arrow", OptionId = tabPriorityChildId, Control = function(row) return row.Select.IncrementButton end },
    { Name = "tab list's Up arrow", TabRow = true, Control = function(row) return row.Up end },
}

local function RowOfElement(element)
    local found
    ForEachRow(function(row)
        if row.Element == element then found = row end
    end)
    return found
end

-- Shows a case's row in view and greyed: its row, its control and the option the help names; or nil and why not. A
-- parent it turns off goes into turnedOff.
local function ShowGreyed(case, turnedOff)
    local frame, window = Window(), addon.Options.Window
    if case.TabRow then
        for _, section in ipairs(window.Map.Sections) do
            for _, element in ipairs(window.Source.Elements(section)) do
                if element.Kind == "TabList" then
                    frame:ShowSection(section.Id)
                    for index, shown in ipairs(frame.Elements or {}) do
                        if shown.Kind == "TabRow" and shown.Item.MoveUp == nil then
                            frame.PageScrollBox:ScrollToElementDataIndex(index, ScrollBoxConstants.AlignCenter, nil, ScrollBoxConstants.NoScrollInterpolation)
                            local row = RowOfElement(shown)
                            if not row then return nil, "the first tab's row is not drawn" end
                            return row, case.Control(row), shown.Item.Show
                        end
                    end
                    return nil, "the tab list has no first tab"
                end
            end
        end
        return nil, "no section has the tab list"
    end
    local sectionId, option = FindOption(case.OptionId)
    if not option then return nil, case.OptionId .. " is in no section on this client" end
    frame:ShowSection(sectionId, case.OptionId)
    local parent = option:GetParent()
    if parent and parent:Get() then
        Remember(parent)
        parent:Set(false)
        frame:OnOptionChanged(parent)
        tinsert(turnedOff, parent)
    end
    local row = RowOf(option)
    if not row then return nil, "its row is not drawn" end
    return row, case.Control(row), option
end

-- As the game runs it when the mouse comes onto the control or leaves it: the script and the hooks on it (Tooltip.lua)
local function Play(control, script)
    local handler = control:GetScript(script)
    if handler then handler(control, true) end
end

local function GreyedSteps()
    local seen, held, turnedOff = {}, nil, {}
    -- After the screenshot: the held hover ends and the parents the step turned off are on again, so the steps after it
    -- (search-change clicks Tab priority's parent) start from the player's values
    local function Release()
        if held then
            Play(held, "OnLeave")
            held = nil
        end
        for _, parent in ipairs(turnedOff) do
            parent:Set(true)
            Window():OnOptionChanged(parent)
        end
        wipe(turnedOff)
    end
    local function Measure(collapsed)
        local frame = Window()
        Release()
        if frame.PaneCollapsed ~= collapsed then frame:SetPaneCollapsed(collapsed) end
        seen = {}
        for i, case in ipairs(greyedCases) do
            local row, control, option = ShowGreyed(case, turnedOff)
            local result = { Case = case, Missing = not row and control or nil }
            if row then
                result.Label = option and option:GetLabel() or "?"
                result.Greyed = not control:IsEnabled()
                result.Asks = control:GetMotionScriptsWhileDisabled() and true or false
                Play(control, "OnEnter")
                local tooltip = frame.TooltipShown
                if collapsed then
                    result.Explains = option ~= nil and tooltip ~= nil and tooltip:IsShown() and tooltip:GetOwner() == row
                else
                    result.Explains = option ~= nil and frame.HoverOption == option
                end
                if i < #greyedCases then
                    Play(control, "OnLeave")
                    result.Ends = collapsed and not (tooltip and tooltip:IsShown()) or not collapsed and frame.HoverOption == nil
                else
                    held = control -- the last case stays hovered for the screenshot
                end
            end
            seen[i] = result
        end
    end
    local function Report(collapsed)
        for _, result in ipairs(seen) do
            if result.Missing then
                Add("SKIP", ("%s: %s"):format(result.Case.Name, result.Missing))
            else
                local ok = result.Greyed and result.Asks and result.Explains and result.Ends ~= false
                Add(ok and "PASS" or "FAIL", ("%s (%s): %s, %s, on enter %s%s"):format(result.Case.Name, result.Label,
                    result.Greyed and "greyed" or "not greyed", result.Asks and "hovers while greyed" or "no hover while greyed",
                    result.Explains and (collapsed and "its tooltip shows" or "the pane explains it") or (collapsed and "no tooltip" or "the pane does not explain it"),
                    result.Ends == false and ", and the help stays after leaving" or ""))
            end
        end
    end
    -- The screenshot is taken right after the check with the hover held; the next step starts afterShot after it
    return {
        Name = "greyed-help",
        Text = "a greyed-out check box, dropdown and arrow explain themselves under the mouse",
        Run = function() Measure(false) end,
        Check = function()
            Report(false)
            After(afterShot / 2, Release)
        end
    }, {
        Name = "greyed-help-collapsed",
        Text = "the same with the help pane collapsed: the row's tooltip",
        Run = function() Measure(true) end,
        Check = function()
            Report(true)
            After(afterShot / 2, function()
                Release()
                Window():SetPaneCollapsed(false)
            end)
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
                local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
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
                local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_2")
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
        SectionStep("overview", KROWI_LIBMAN:GetLibrary("Krowi_Options_2").GetStrings().Overview),
        CardsStep("overview-cards", "Overview's first cards", ScrollToFirstCards),
        CardsStep("overview-cards-end", "Overview's last cards", ScrollToEnd)
    }
    for _, section in ipairs(window.Map.Sections) do
        tinsert(list, SectionStep(section.Id, section.Name))
    end
    for _, step in ipairs({ ChangeSteps("toggle", toggleId, function(row) row.Toggle:Click() end) }) do tinsert(list, step) end
    tinsert(list, ResetStep("toggle", toggleId, function(row) row.Toggle:Click() end))
    tinsert(list, HelpFollowsStep(toggleId))
    tinsert(list, GridHelpFollowsStep())
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
    for _, step in ipairs({ GreyedSteps() }) do tinsert(list, step) end
    for _, step in ipairs(SearchSteps()) do tinsert(list, step) end
    tinsert(list, ClippedResetStep())
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
            local width = KROWI_LIBMAN:GetLibrary("Krowi_Options_2").WindowWidth(frame.PaneCollapsed)
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
        -- The broad search the window reads, and its check box; the saved field goes back with the table below
        frame.BroadSearch = live.SavedWindow.SearchBroad and true or false
        frame.SearchBroad:SetChecked(frame.BroadSearch)
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

-- A step that needs the player's mouse checks as soon as its Mouse() holds, or is skipped after mouseWait. While the
-- kit's marker addon is loaded (KrowiGameInput, Krowi_ClaudeKit's docs/work/2026-11-05-kit-test-runs), its Hover(kit)
-- asks the kit for the hover on every poll, so an unattended run gets it; the request is cleared once the step is over.
local function WaitForMouse(step, waited)
    local ok, ready = pcall(step.Mouse)
    if ok and ready then
        if KrowiGameInput then
            KrowiGameInput.Clear()
        end
        Capture()
        return
    end
    if not ok or waited >= mouseWait then
        if KrowiGameInput then
            KrowiGameInput.Clear()
        end
        Add(ok and "SKIP" or "FAIL", ok and ("waited %d s for the mouse: %s"):format(mouseWait, step.Text) or ("test error: " .. tostring(ready)))
        After(afterShot, function()
            RunStep(live.StepIndex + 1)
        end)
        return
    end
    if KrowiGameInput and step.Hover then
        pcall(step.Hover, KrowiGameInput)
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
        WaitForMouse(step, 0)
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

-- /kaftest options <what>: only the steps named what or whose name starts with "what-" (toggle: every toggle step;
-- section: every section), or the step with that number in the banner, each with the steps it builds on (Needs) and with
-- the window's open first; nil when nothing matches. The scenarios before the steps run either way: they take no time.
local function SelectSteps(list, what)
    if not what or what == "" then
        return list
    end
    local wanted, number = what:lower(), tonumber(what)
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
        if i == number or step.Name == wanted or step.Name:sub(1, #wanted + 1) == wanted .. "-" then
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
    local frame = Window()
    KrowiAF_SavedData.OptionsWindow = KrowiAF_SavedData.OptionsWindow or {}
    live = {
        Results = options.Run(),
        Observations = options.Observations(),
        Finish = done,
        Before = {},
        SavedWindow = DeepCopy(KrowiAF_SavedData.OptionsWindow),
        WasShown = frame and frame:IsShown() and frame.SectionId or nil,
        AllSteps = #all
    }
    if not banner then
        CreateBanner()
    end
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    steps = chosen
    print(("|cFF88CCFFKrowiAF Tests:|r options: %d of %d steps, about %d s; the options it changes go back at the end.%s"):format(#steps, #all,
        #steps * (settle + afterShot), what and "" or " /kaftest options <name, start of a name or number> runs only those steps."))
    RunStep(1)
end