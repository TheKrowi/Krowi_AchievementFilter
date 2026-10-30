--[[
    Copyright (c) 2026 Krowi
    Licensed under the terms of the LICENSE file in this repository.
]]

---@diagnostic disable: undefined-global

-- An options window that explains each feature next to its settings: sections on the left, the section's options in
-- the middle, a help pane on the right with the section's explanation or the description of the option under the
-- mouse. It knows nothing of the addons that use it: each one registers a tab and passes its sections, the elements of
-- a section (options that answer Get, Set, IsDisabled, ...), the help, a saved table and its strings. The window looks
-- like the game's own Options window on every client and holds one tab per registered addon
-- (docs/work/2026-10-30-options-settings-look). Lives inside Krowi_AchievementFilter for now
-- (docs/work/2026-10-25-options-revamp); extracting it is a move into Krowi_Libraries.

local lib = KROWI_LIBMAN:NewLibrary('Krowi_Options_1', 1)
if not lib then return end

-- The registered tabs, sorted by name, and the one window they share (lib.Frame, made on the first open). Both live on
-- lib, which a newer copy of the library keeps.
lib.Tabs = lib.Tabs or {}

-- TEMPORARY (docs/work/2026-10-30-options-settings-look): the details of the look Krowi compares in game, removed with
-- the pick. InnerFrame: Blizzard's inner frame art instead of the dark fills; HeaderLine: a line under the page's group
-- headers; Steppers: the game's settings dropdown with an arrow on each side
lib.Look = lib.Look or { InnerFrame = false, HeaderLine = true, Steppers = false }

function lib.SetLook(name, on)
    if lib.Look[name] == nil then return false end
    if on == nil then on = not lib.Look[name] end
    lib.Look[name] = on
    if lib.Frame then lib.Frame:ApplyLook() end
    return true
end

--[[ config:
    TabName         the tab's text: the addon's name, not translated
    Saved           a table the addon keeps the window's place, size, pane state, search scope, its last section and the
                    sections seen in, or a function returning it (called on the first need, so it can live in saved
                    variables not loaded yet); the window's place, size, pane state and search scope are written to every
                    tab's table (lib.SetShared)
    Groups          { { Name, Sections = { sectionId, ... } } } for the navigation; "overview" is always first
    SectionName(id) the navigation name of a section
    IsNew(id)       whether the navigation marks a section New
    Landing()       the section to open when no section is asked for
    OnSectionShown(id)
    GetElements(id) the section's elements, see Rows.lua
    GetHelp(id)     { Title, Blocks = { {Heading} | {Text} | {Term, Text} | {Picture, Width, Height} }, ShowMe, ShowMeNote } or nil
    Search(text)    { { SectionId, Path, Label, OptionId } }
    ResetSection(id), ChangedCount(id)
    OnCreated(frame) called once per tab: when the window is made, or when the tab registers after that
    Strings         see WindowMixin.lua
]]
local tab = {}
tab.__index = tab

function tab:GetSaved()
    if not self.Saved then
        local saved = self.Config.Saved
        self.Saved = type(saved) == "function" and saved() or saved
    end
    return self.Saved
end

function tab:GetFrame()
    return lib.GetFrame(self)
end

function tab:Open(sectionId)
    lib.GetFrame(self):ShowTab(self, sectionId)
end

function tab:Toggle(sectionId)
    if self:IsShown() then
        lib.Frame:Hide()
    else
        self:Open(sectionId)
    end
end

-- Shown on this tab; the window can be open on another addon's
function tab:IsShown()
    local frame = lib.Frame
    return frame and frame:IsShown() and frame.Tab == self or false
end

function tab:Refresh()
    if self:IsShown() then lib.Frame:Refresh() end
end

-- For the tests: a tab registered for a scenario goes again
function tab:Unregister()
    for i, registered in ipairs(lib.Tabs) do
        if registered == self then
            tremove(lib.Tabs, i)
            break
        end
    end
    if lib.Frame then lib.Frame:RefreshTabs() end
end

local function SortTabs()
    table.sort(lib.Tabs, function(a, b) return (a.Config.TabName or "") < (b.Config.TabName or "") end)
end

function lib.CreateWindow(config)
    local registered = setmetatable({ Config = config }, tab)
    tinsert(lib.Tabs, registered)
    SortTabs()
    if lib.Frame then
        if config.OnCreated then config.OnCreated(lib.Frame) end
        lib.Frame:RefreshTabs()
    end
    return registered
end

-- The window, made on its first need from the place the opening addon remembers
function lib.GetFrame(opening)
    if not lib.Frame then
        local frame = CreateFrame("Frame", "Krowi_OptionsWindow", UIParent, "Krowi_OptionsWindowTemplate")
        frame:Init((opening or lib.Tabs[1]):GetSaved())
        lib.Frame = frame
        for _, registered in ipairs(lib.Tabs) do
            if registered.Config.OnCreated then registered.Config.OnCreated(frame) end
        end
        frame:RefreshTabs()
    end
    return lib.Frame
end

-- The window's place, size, pane state and search scope are one for every addon: each addon's saved table gets them, so
-- any one addon alone still opens the window as the player left it
function lib.SetShared(key, value)
    for _, registered in ipairs(lib.Tabs) do
        registered:GetSaved()[key] = value
    end
end

-- A search of the current tab, or of every tab: { { Tab, Results }, ... } in tab order, only the tabs that found something
function lib.Search(text, all, current)
    local groups = {}
    for _, registered in ipairs(lib.Tabs) do
        if (all or registered == current) and registered.Config.Search then
            local results = registered.Config.Search(text)
            if #results > 0 then groups[#groups + 1] = { Tab = registered, Results = results } end
        end
    end
    return groups
end