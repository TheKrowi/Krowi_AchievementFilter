--[[
    Copyright (c) 2026 Krowi
    Licensed under the terms of the LICENSE file in this repository.
]]

---@diagnostic disable: undefined-global

-- An options window that explains each feature next to its settings: sections on the left, the section's options in
-- the middle, a help pane on the right with the section's explanation or the description of the option under the
-- mouse. It knows nothing of the addon that uses it: the consumer passes its sections, the elements of a section
-- (options that answer Get, Set, IsDisabled, ...), the help, a saved table and its strings. Lives inside
-- Krowi_AchievementFilter for now (docs/work/2026-10-25-options-revamp); extracting it is a move into Krowi_Libraries.

local lib = KROWI_LIBMAN:NewLibrary('Krowi_Options_1', 0)
if not lib then return end

--[[ config:
    Name            global frame name, so skins can find the window later
    Title, Icon     the title bar and the portrait (an icon file id or path; optional)
    Saved           a table the window keeps its place, size, pane state and last section in, or a function returning
                    it (called on the first open, so it can live in saved variables not loaded yet)
    Groups          { { Name, Sections = { sectionId, ... } } } for the navigation; "overview" is always first
    SectionName(id) the navigation name of a section
    IsNew(id)       whether the navigation marks a section New
    Landing()       the section to open when no section is asked for
    OnSectionShown(id)
    GetElements(id) the section's elements, see Rows.lua
    GetHelp(id)     { Title, Blocks = { {Heading} | {Text} | {Term, Text} | {Picture, Width, Height} }, ShowMe, ShowMeNote } or nil
    Search(text)    { { SectionId, Path, Label, OptionId } }
    ResetSection(id), ChangedCount(id)
    OnCreated(frame) called once, before the first Show
    Strings         see WindowMixin.lua
]]
function lib.CreateWindow(config)
    local controller = { Config = config }

    function controller:GetFrame()
        if not self.Frame then
            local frame = CreateFrame("Frame", config.Name, UIParent, "Krowi_OptionsWindowTemplate")
            frame:Init(config)
            if config.OnCreated then config.OnCreated(frame) end
            self.Frame = frame
        end
        return self.Frame
    end

    function controller:Open(sectionId)
        self:GetFrame():Open(sectionId)
    end

    function controller:Toggle(sectionId)
        if self.Frame and self.Frame:IsShown() then
            self.Frame:Hide()
        else
            self:Open(sectionId)
        end
    end

    function controller:IsShown()
        return self.Frame and self.Frame:IsShown() or false
    end

    function controller:Refresh()
        if self.Frame and self.Frame:IsShown() then self.Frame:Refresh() end
    end

    return controller
end