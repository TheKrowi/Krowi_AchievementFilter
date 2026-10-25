local _, addon = ...
addon.Options.Window = addon.Options.Window or {}
local window = addon.Options.Window
window.Model = {}
local model = window.Model
local source = window.Source

-- What the options suite (Tests/Options.lua) asks of the window without drawing it. Every check that changes a value
-- puts the player's own value back before it returns, so the same checks run in game and headlessly.

local optionTypes = { toggle = true, range = true, select = true, execute = true, input = true, keybinding = true }
local replacedKeys = { SelectAll = true, DeselectAll = true } -- the All/None of a heading replaces them

local function Join(base, key)
    return base .. ".args." .. key
end

-- every option node under a path, recursively, by path
local function CollectLeaves(path, node, out)
    for _, child in ipairs(source.Children(node)) do
        local childPath = Join(path, child.Key)
        if child.Node.type == "group" then
            CollectLeaves(childPath, child.Node, out)
        elseif optionTypes[child.Node.type] then
            out[childPath] = child.Key
        end
    end
    return out
end

local function AllLeaves()
    local out = {}
    for _, page in ipairs(source.Children({ args = addon.Options.OptionsTable.args })) do
        if page.Node.type == "group" then CollectLeaves(page.Key, page.Node, out) end
    end
    return out
end

-- the options of every section, in order
function model.Options()
    local list = {}
    for _, section in ipairs(window.Map.Sections) do
        for _, element in ipairs(source.Elements(section)) do
            if element.Option then
                list[#list + 1] = { Section = section.Id, Option = element.Option }
            elseif element.Kind == "Grid" then
                for _, row in ipairs(element.Rows) do
                    for _, cell in ipairs(row.Cells) do list[#list + 1] = { Section = section.Id, Option = cell } end
                end
            elseif element.Kind == "TabList" then
                for _, item in ipairs(element.Items) do
                    if item.Show then list[#list + 1] = { Section = section.Id, Option = item.Show } end
                end
            end
        end
    end
    return list
end

local function Claim(claims, path)
    claims[path] = (claims[path] or 0) + 1
end

function model.Coverage()
    local claims, missing = {}, {}
    local isRetail = addon.Util.IsMainline
    local function Check(path, entry)
        if path and not source.Resolve(path) and not (entry and entry.Retail and not isRetail) then missing[#missing + 1] = path end
    end
    for _, section in ipairs(window.Map.Sections) do
        for _, group in ipairs(section.Groups) do
            Check(group.Group, group)
            Check(group.Order, group)
            Check(group.Show, group)
            for _, entry in ipairs(group.Entries or {}) do
                Check(entry.Path or entry.Group or entry.Families, entry)
                Check(entry.Parent, entry)
                Check(entry.ShowIf, entry)
            end
            for _, row in ipairs(group.Rows or {}) do Check(row.Group, row) end
            if group.Kind == "Profiles" then
                local path = "Profiles.args." .. group.Database
                local node = source.Resolve(path)
                if node then for leaf in next, CollectLeaves(path, node, {}) do Claim(claims, leaf) end end
            elseif group.Kind == "TabList" then
                for _, path in ipairs({ group.Order, group.Show }) do
                    local node = source.Resolve(path)
                    if node then for leaf in next, CollectLeaves(path, node, {}) do Claim(claims, leaf) end end
                end
            end
        end
        for _, element in ipairs(source.Elements(section)) do
            local option = element.Option
            if option and option.Slots then
                for _, slot in ipairs(option.Slots) do Claim(claims, slot.Path) end
            elseif option and element.Kind == "Option" then
                Claim(claims, option.Path)
            elseif element.Kind == "Grid" then
                for _, row in ipairs(element.Rows) do
                    for _, cell in ipairs(row.Cells) do Claim(claims, cell.Path) end
                end
            end
        end
    end
    local unmapped, double = {}, {}
    for path, key in next, AllLeaves() do
        local count = claims[path] or 0
        if count == 0 and not replacedKeys[key] then unmapped[#unmapped + 1] = path end
        if count > 1 then double[#double + 1] = path end
    end
    table.sort(unmapped)
    table.sort(double)
    table.sort(missing)
    return { Unmapped = unmapped, Double = double, MissingPaths = missing }
end

-- a value other than the current one, or nil when the option offers none
local function OtherValue(option, current)
    if option.Type == "toggle" then return not current end
    if option.Type == "range" then
        local node = option.Node
        if current ~= node.min then return node.min end
        return node.max
    end
    if option.Type == "select" then
        for _, pair in ipairs(option:GetValues()) do
            if pair[1] ~= current then return pair[1] end
        end
        return nil
    end
    if option.Type == "input" then return (current or "") .. "x" end
end

local function Settable(option)
    local t = option.Type
    return (t == "toggle" or t == "range" or t == "select" or t == "input") and option:CanSet() and not option.Entry.Locked
end

-- Setting an option through the window and reading it back gives the value set; the player's value goes back after.
-- A setter's side effect that errors (a frame the headless load does not build) is listed apart: it does not decide
-- whether the value was stored, and in game the run's BugGrabber step reports it.
function model.CheckRoundTrip()
    local mismatches, sideEffects = {}, {}
    for _, item in ipairs(model.Options()) do
        local option = item.Option
        if Settable(option) and not option:IsHidden() and not option:IsDisabled() then
            local before = option:Get()
            local value = OtherValue(option, before)
            if value ~= nil then
                local ok, err = pcall(option.Set, option, value)
                if not ok then sideEffects[#sideEffects + 1] = option.Id .. ": " .. tostring(err) end
                local got = option:Get()
                pcall(option.Set, option, before)
                if got ~= value then mismatches[#mismatches + 1] = ("%s: set %s, read %s"):format(option.Id, tostring(value), tostring(got)) end
            end
        end
    end
    return mismatches, sideEffects
end

-- Ids, types and derived defaults of every option: stage 2's definitions must give the same fingerprint
local function Hash(text)
    local h = 5381
    for i = 1, #text do h = (h * 33 + text:byte(i)) % 4294967296 end
    return ("%08x"):format(h)
end

function model.Fingerprint()
    local parts = {}
    for _, item in ipairs(model.Options()) do
        local option = item.Option
        local hasDefault, default = option:GetDefault()
        parts[#parts + 1] = table.concat({ item.Section, option.Id, option.Type or "?", hasDefault and tostring(default) or "-" }, "|")
    end
    table.sort(parts) -- the tab list follows the player's own tab order, which must not change the fingerprint
    return #parts, Hash(table.concat(parts, "\n"))
end

-- After a section's Defaults every option with a default reads its default again; the player's values go back after
function model.CheckDefaults()
    local differences = {}
    local saved = {}
    local list = model.Options()
    for _, item in ipairs(list) do
        local option = item.Option
        if Settable(option) and option:GetDefault() then
            local before = option:Get()
            saved[#saved + 1] = { option, before }
            local value = OtherValue(option, before)
            if value ~= nil then pcall(option.Set, option, value) end
        end
    end
    for _, section in ipairs(window.Map.Sections) do model.ResetSection(section.Id) end
    for _, pair in ipairs(saved) do
        local option = pair[1]
        local _, default = option:GetDefault()
        local got = option:Get()
        if got ~= default then differences[#differences + 1] = ("%s: %s, default %s"):format(option.Id, tostring(got), tostring(default)) end
    end
    for _, pair in ipairs(saved) do pcall(pair[1].Set, pair[1], pair[2]) end
    return differences
end

function model.ResetSection(sectionId)
    for _, item in ipairs(model.Options()) do
        if item.Section == sectionId and Settable(item.Option) then pcall(item.Option.Reset, item.Option) end
    end
end

-- The derived default against the "Default value:" text of the option's own description
local function DefaultAsText(option, default)
    local L = addon.Util.L
    if type(default) == "boolean" then return { default and L["Checked"] or L["Unchecked"] } end
    local texts = { tostring(default) }
    if option.Type == "select" then
        for _, pair in ipairs(option:GetValues()) do
            if pair[1] == default then texts[#texts + 1] = tostring(pair[2]) end
        end
    end
    return texts
end

function model.CheckDerivedDefaults()
    local mismatches, withoutDefault = {}, {}
    for _, item in ipairs(model.Options()) do
        local option = item.Option
        if Settable(option) then
            option:GetDescription()
            local hasDefault, default = option:GetDefault()
            if not hasDefault then
                withoutDefault[#withoutDefault + 1] = option.Id
            elseif option.DefaultText then
                local match = false
                for _, text in ipairs(DefaultAsText(option, default)) do
                    if text == option.DefaultText then match = true end
                end
                if not match then mismatches[#mismatches + 1] = ("%s: derived %s, text %s"):format(option.Id, tostring(default), option.DefaultText) end
            end
        end
    end
    return mismatches, withoutDefault
end

-- The changed dot: shown after a change, gone after setting the default; the player's value goes back after
function model.CheckChangedDots()
    local wrong = {}
    for _, item in ipairs(model.Options()) do
        local option = item.Option
        if Settable(option) and option:GetDefault() then
            local before = option:Get()
            local _, default = option:GetDefault()
            local value = OtherValue(option, default)
            if value ~= nil then
                pcall(option.Set, option, value)
                local shown = option:IsChanged()
                pcall(option.Set, option, default)
                local gone = not option:IsChanged()
                pcall(option.Set, option, before)
                if not (shown and gone) then wrong[#wrong + 1] = option.Id end
            end
        end
    end
    return wrong
end

function model.PluginGroups()
    local names = {}
    local node = source.Resolve("Plugins")
    for _, child in ipairs(node and source.Children(node) or {}) do
        if child.Node.type == "group" then
            local name = child.Node.name
            if type(name) == "function" then name = name() end
            names[#names + 1] = tostring(name)
        end
    end
    table.sort(names)
    return names
end

function model.VisibleRetailOnly()
    local visible = {}
    if addon.Util.IsMainline then return visible end
    for _, item in ipairs(model.Options()) do
        if item.Option.Retail and not item.Option:IsHidden() then visible[#visible + 1] = item.Option.Id end
    end
    return visible
end