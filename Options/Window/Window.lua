local _, addon = ...
local options = addon.Options
local window = options.Window
local map, source, model = window.Map, window.Source, window.Model
local L = addon.L

-- The options window (docs/work/2026-10-25-options-revamp): Krowi_Options draws it, this file hands it the sections
-- (Map.lua), their options (Source.lua), the explanations (window.Help, filled by Options/Window/Help) and the place
-- it keeps in KrowiAF_SavedData.OptionsWindow = { Point, Size, PaneCollapsed, SearchAll, LastSection,
-- Seen = { [sectionId] = version } }.

window.Help = window.Help or {}

local function Saved()
    KrowiAF_SavedData.OptionsWindow = KrowiAF_SavedData.OptionsWindow or {}
    local saved = KrowiAF_SavedData.OptionsWindow
    saved.Seen = saved.Seen or {}
    return saved
end

local function VersionLessThan(a, b)
    local aParts, bParts = {}, {}
    for number in tostring(a):gmatch("%d+") do aParts[#aParts + 1] = tonumber(number) end
    for number in tostring(b):gmatch("%d+") do bParts[#bParts + 1] = tonumber(number) end
    for i = 1, math.max(#aParts, #bParts) do
        local x, y = aParts[i] or 0, bParts[i] or 0
        if x ~= y then return x < y end
    end
    return false
end

-- A section is New when it changed in a version newer than the one the player last opened it in
function window.IsNew(sectionId)
    local section = source.Section(sectionId)
    if not (section and section.ChangedIn) then return false end
    local seen = Saved().Seen[sectionId]
    return seen == nil or VersionLessThan(seen, section.ChangedIn)
end

function window.AnyNew()
    for _, section in ipairs(map.Sections) do
        if window.IsNew(section.Id) then return true end
    end
    return false
end

-- Overview while a section is New, otherwise the section the player looked at last
function window.Landing()
    if window.AnyNew() then return "overview" end
    local last = Saved().LastSection
    if last and source.Section(last) then return last end
    return "overview"
end

local function OpenSection(section)
    return function() window.Controller:Open(section.Id) end
end

local function SectionLink(section)
    return { Kind = "Link", Text = section.Name, OnClick = OpenSection(section) }
end

-- The section's first help picture, or its game icon while its help has none (docs/work/2026-11-02-overview-cards); a
-- section with neither, such as one whose picture is not made yet, gets the question mark rather than an empty card
local function SectionCard(section)
    local card = { Name = section.Name, Text = section.Card, IsNew = window.IsNew(section.Id), OnClick = OpenSection(section) }
    local help = window.Help[section.Id]
    for _, block in ipairs(help and help.Blocks or {}) do
        if block.Picture then
            card.Picture, card.Width, card.Height, card.TexCoords = block.Picture, block.Width, block.Height, block.TexCoords
            card.Part = section.CardPart
            return card
        end
    end
    card.Icon = section.CardIcon or "Interface\\Icons\\INV_Misc_QuestionMark"
    return card
end

-- New sections, the current version's changelog (Changelog.lua, generated at release) and every section by group as cards
local function OverviewElements()
    local elements = {}
    local new = {}
    for _, section in ipairs(map.Sections) do
        if window.IsNew(section.Id) then new[#new + 1] = section end
    end
    if #new > 0 then
        elements[#elements + 1] = { Kind = "Header", Text = L["New"] }
        for _, section in ipairs(new) do elements[#elements + 1] = SectionLink(section) end
    end
    local changelog = window.Changelog
    if changelog then
        elements[#elements + 1] = { Kind = "Header", Text = L["What changed in {version}"]:K_ReplaceVars{ version = changelog.Version } }
        for _, part in ipairs(changelog.Parts) do
            elements[#elements + 1] = { Kind = "SubHeading", Text = part.Heading }
            for _, line in ipairs(part.Lines) do elements[#elements + 1] = { Kind = "Note", Text = line } end
        end
    end
    for _, group in ipairs(map.Groups) do
        elements[#elements + 1] = { Kind = "Header", Text = group.Name }
        local cards = {}
        for _, id in ipairs(group.Sections) do cards[#cards + 1] = SectionCard(source.Section(id)) end
        elements[#elements + 1] = { Kind = "Cards", Cards = cards }
    end
    return elements
end

-- The addon's tab in the window every Krowi addon shares (docs/work/2026-10-30-options-settings-look)
window.Controller = KROWI_LIBMAN:GetLibrary("Krowi_Options_1").CreateWindow({
    TabName = "Achievement Filter",
    Saved = Saved,
    Groups = map.Groups,
    SectionName = function(id)
        if id == "overview" then return L["Overview"] end
        local section = source.Section(id)
        return section and section.Name or id
    end,
    IsNew = window.IsNew,
    Landing = window.Landing,
    OnSectionShown = function(id)
        if id ~= "overview" then Saved().Seen[id] = addon.Metadata.Version end
    end,
    GetElements = function(id)
        if id == "overview" then return OverviewElements() end
        local section = source.Section(id)
        return section and source.Elements(section) or {}
    end,
    GetHelp = function(id) return window.Help[id] end,
    Search = model.Search,
    ResetSection = model.ResetSection,
    ChangedCount = model.ChangedCount,
    OnCreated = function(frame)
        addon.Gui:RegisterFrameForClosing(frame)
        addon.Gui:RegisterFrameForClosing(frame.Lightbox) -- Escape closes an enlarged picture before the window
    end,
    Strings = {
        Overview = L["Overview"],
        Search = L["Search"],
        SearchAll = L["Search all tabs"],
        SearchResults = L["Search results"],
        NoResults = L["Nothing found."],
        Defaults = L["Defaults"],
        ResetSection = L["Set every option of {section} back to its default?"]:K_ReplaceVars{ section = "%s" },
        ChangedCount = L["{count} changed"]:K_ReplaceVars{ count = "%d" },
        ReloadText = L["Some changes take effect after a reload."],
        ReloadNow = L["Reload now"],
        ShowMe = L["Show me"],
        HowItWorks = L["How it works"],
        All = L["All"],
        None = L["None"],
        NotBound = L["Not bound"],
        PressAKey = L["Press a key"],
        Default = L["Default: {value}"]:K_ReplaceVars{ value = "%s" },
        NeedsReload = addon.Util.L["Requires a reload"],
        NotInCombat = L["Not in combat"],
    },
})

-- Replaces Krowi_Util's Options:Open, which opened the Settings pages. Called with and without self (the minimap
-- icon calls addon.Options:Open(), the filter menu hands addon.Options.Open to the menu), so a section id counts
-- only when it is a string.
function options.Open(_, sectionId)
    if type(sectionId) ~= "string" or not (sectionId == "overview" or source.Section(sectionId)) then sectionId = nil end
    window.Controller:Open(sectionId)
end

SLASH_KAF1 = "/kaf"
SlashCmdList.KAF = function(msg)
    options.Open(nil, (msg or ""):lower():match("^%s*(%S+)"))
end