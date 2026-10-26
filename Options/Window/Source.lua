local _, addon = ...
addon.Options.Window = addon.Options.Window or {}
local window = addon.Options.Window
window.Source = {}
local source = window.Source

-- Stage 1 of docs/work/2026-10-25-options-revamp: the options window draws the AceConfig tables the six option pages
-- register, through Map.lua. This file turns a map entry into the window's elements and an AceConfig node into an
-- option object (Label, Desc, Get, Set, Default, ...). It follows AceConfig's own rules: get, set, func, disabled and
-- hidden inherit from the nearest group that has them, and a hidden or disabled group hides or disables its options.

local function Root()
    return addon.Options.OptionsTable.args
end

-- path "Layout.args.Search.args.SearchField" -> node, chain (page .. node), keys (without "args")
function source.Resolve(path)
    local node, chain, keys = nil, {}, {}
    for segment in path:gmatch("[^%.]+") do
        if segment ~= "args" then
            local parent = node and node.args or Root()
            node = parent and parent[segment]
            if not node then return nil end
            chain[#chain + 1] = node
            keys[#keys + 1] = segment
        end
    end
    return node, chain, keys
end

local function Evaluate(value, info)
    if type(value) == "function" then return value(info) end
    return value
end

local function Order(node, info)
    local order = Evaluate(node.order, info)
    return type(order) == "number" and order or 100
end

-- children of a group in AceConfig's order: by order, then by key
function source.Children(node)
    local list = {}
    for key, child in next, node.args or {} do
        list[#list + 1] = { Key = key, Node = child }
    end
    table.sort(list, function(a, b)
        local oa, ob = Order(a.Node), Order(b.Node)
        if oa ~= ob then return oa < ob end
        return tostring(a.Key) < tostring(b.Key)
    end)
    return list
end

-- Description suffixes, taken from the strings their builders produce (Libs/Krowi_Util/Strings.lua), with a plain-text
-- fallback for a copy of Krowi_Util that coloured "Requires a reload" differently (Localization/Shared.lua:26)
local function Plain(text)
    return (text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
end
local reloadSuffix, defaultPrefix, reloadPlain
local function Suffixes()
    if not reloadSuffix then
        reloadSuffix = string.K_AddReloadRequired("")
        defaultPrefix = string.K_AddDefaultValueText("", { v = "" }, "v")
        reloadPlain = Plain(reloadSuffix):gsub("^%s+", "")
    end
end

-- desc -> cleaned text, needs reload, default value text (as the description named it)
function source.CleanDescription(desc)
    if type(desc) ~= "string" or desc == "" then return "", false, nil end
    Suffixes()
    local needsReload, defaultText = false, nil
    local s, e = desc:find(reloadSuffix, 1, true)
    if s then
        desc = desc:sub(1, s - 1) .. desc:sub(e + 1)
        needsReload = true
    else
        local plain = Plain(desc)
        local ps, pe = plain:find(reloadPlain, 1, true)
        if ps then
            desc = plain:sub(1, ps - 1) .. plain:sub(pe + 1)
            needsReload = true
        end
    end
    s, e = desc:find(defaultPrefix, 1, true)
    if s then
        local rest = desc:sub(e + 1)
        local stop = rest:find("\n\n", 1, true)
        defaultText = stop and rest:sub(1, stop - 1) or rest
        desc = desc:sub(1, s - 1) .. (stop and rest:sub(stop) or "")
    end
    desc = desc:gsub("^%s+", ""):gsub("%s+$", "")
    return desc, needsReload, defaultText
end

local typeByAce = { toggle = "toggle", range = "range", select = "select", execute = "execute", input = "input", keybinding = "key" }

local Option = {}
Option.__index = Option
window.OptionMixin = Option

local function Inherited(chain, field)
    for i = #chain, 1, -1 do
        if chain[i][field] ~= nil then return chain[i][field] end
    end
    return nil
end

function source.NewOption(path, node, chain, keys, entry)
    entry = entry or {}
    local option = setmetatable({
        Id = path,
        Path = path,
        Node = node,
        Chain = chain,
        Type = typeByAce[node.type],
        Entry = entry,
        Indent = entry.Indent,
        Retail = entry.Retail,
        Placeholder = entry.Placeholder,
    }, Option)
    local info = { options = addon.Options.OptionsTable, option = node, arg = node.arg, type = node.type, uiType = "dialog", uiName = "Krowi_Options" }
    for i, key in ipairs(keys) do info[i] = key end
    option.Info = info
    if entry.Parent then
        option.ParentPath = entry.Parent
        option.Indent = option.Indent or 1
    end
    option.ShowIfPath = entry.ShowIf
    return option
end

function Option:GetLabel()
    return self.Entry.Label or Evaluate(self.Node.name, self.Info) or ""
end

function Option:GetDescription()
    local ok, raw = pcall(Evaluate, self.Node.desc, self.Info)
    local desc, needsReload, defaultText = source.CleanDescription(ok and raw or nil)
    self.NeedsReload, self.DefaultText = needsReload, defaultText
    return desc
end

function Option:GetNeedsReload()
    self:GetDescription()
    return self.NeedsReload
end

function Option:GetButtonText()
    return self.Entry.Button or self:GetLabel()
end

function Option:GetRange()
    local node = self.Node
    return node.softMin or node.min or 0, node.softMax or node.max or 100, node.bigStep or node.step or 1
end

-- a value as the window shows it: a check box as Checked or Unchecked, a choice as its text
function Option:FormatValue(value)
    if type(value) == "boolean" then return value and addon.Util.L["Checked"] or addon.Util.L["Unchecked"] end
    if self.Type == "select" then
        for _, pair in ipairs(self:GetValues()) do
            if pair[1] == value then return tostring(pair[2]) end
        end
    end
    return tostring(value)
end

function Option:Get()
    local get = Inherited(self.Chain, "get")
    if type(get) == "function" then return get(self.Info) end
end

-- AceConfig calls a set only with a new value, and some setters rely on that: a tab's show toggle flips the tab whatever
-- value it gets (Api/TabDataApi.lua InjectTabsShowOptionsTable). So a value the option already holds is not set again.
function Option:Set(value)
    if self.Type == "execute" then
        local func = Inherited(self.Chain, "func")
        if type(func) == "function" then func(self.Info) end
        return
    end
    if self:Get() == value then return end
    local set = Inherited(self.Chain, "set")
    if type(set) == "function" then set(self.Info, value) end
end

function Option:CanSet()
    return type(Inherited(self.Chain, self.Type == "execute" and "func" or "set")) == "function"
end

local function AnyTrue(chain, field, info)
    for _, node in ipairs(chain) do
        if Evaluate(node[field], info) then return true end
    end
    return false
end

function Option:IsHidden()
    if self.Retail and not addon.Util.IsMainline then return true end
    if self.ShowIfPath then
        local switch = source.OptionAt(self.ShowIfPath)
        if switch and not switch:Get() then return true end
    end
    return AnyTrue(self.Chain, "hidden", self.Info)
end

function Option:IsDisabled()
    if self.ParentPath then
        local parent = source.OptionAt(self.ParentPath)
        if parent and not parent:Get() then return true end
    end
    return AnyTrue(self.Chain, "disabled", self.Info)
end

-- values as an ordered list of { key, text }: AceConfig's sorting list, else numeric keys ascending, else by text
function Option:GetValues()
    local values = Evaluate(self.Node.values, self.Info) or {}
    local sorting = Evaluate(self.Node.sorting, self.Info)
    local list = {}
    if type(sorting) == "table" then
        for _, key in ipairs(sorting) do list[#list + 1] = { key, values[key] } end
        return list
    end
    local numeric = true
    for key, text in next, values do
        list[#list + 1] = { key, text }
        if type(key) ~= "number" then numeric = false end
    end
    table.sort(list, function(a, b)
        if numeric then return a[1] < b[1] end
        return tostring(a[2]) < tostring(b[2])
    end)
    return list
end

-- The default: the option's own get, called against a defaults-only profile (design decision 1 of plan.md). An option
-- has one only when its get read that profile and it has a set; the real profile is back on every path.
local function DeepCopy(t)
    local copy = {}
    for k, v in next, t do copy[k] = type(v) == "table" and DeepCopy(v) or v end
    return copy
end

function Option:ComputeDefault()
    if self.DefaultComputed then return end
    self.DefaultComputed = true
    if self.Type == "execute" or self.Type == "key" or self.Entry.NoDefault or not self:CanSet() then return end
    local db = addon.Options.db
    local real = rawget(db, "profile")
    local copy = DeepCopy(addon.Options.Defaults.profile)
    local touched = false
    local proxy = setmetatable({}, { __index = function(_, k) touched = true return copy[k] end })
    rawset(db, "profile", proxy)
    local ok, value = pcall(self.Get, self)
    rawset(db, "profile", real)
    if ok and touched and value ~= nil then
        self.HasDefault, self.Default = true, value
    end
end

function Option:GetDefault()
    self:ComputeDefault()
    return self.HasDefault, self.Default
end

function Option:IsChanged()
    local hasDefault, default = self:GetDefault()
    return hasDefault and self:Get() ~= default or false
end

function Option:Reset()
    local hasDefault, default = self:GetDefault()
    if hasDefault and self:Get() ~= default then self:Set(default) end
end

-- Key binding rows: a description with its two keybinding nodes behind it, one row with two slots
function source.NewKeyOption(label, slots)
    local option = setmetatable({ Id = slots[1].Id, Type = "key", Entry = { Label = label }, Slots = slots, Chain = slots[1].Chain, Info = slots[1].Info, Node = slots[1].Node }, Option)
    return option
end

-- --- profiles, drawn on AceDB's own API (AceDBOptions' tables call handler methods the window does not emulate) ----
local Custom = setmetatable({}, { __index = Option })
Custom.__index = Custom

function Custom:GetLabel() return self.Label end
function Custom:GetDescription() return self.Desc or "" end
function Custom:GetNeedsReload() return false end
function Custom:GetButtonText() return self.Button or self.Label end
function Custom:Get() return self.GetFunc and self.GetFunc() end
function Custom:Set(value) if self.SetFunc then self.SetFunc(value) end end
function Custom:CanSet() return self.SetFunc ~= nil end
function Custom:IsHidden() return false end
function Custom:IsDisabled() return self.DisabledFunc and self.DisabledFunc() or false end
function Custom:GetValues() return self.ValuesFunc and self.ValuesFunc() or {} end
function Custom:GetDefault() return false end
function Custom:IsChanged() return false end
function Custom:Reset() end

local function ProfileOptions(database)
    local db = database == "Filters" and addon.Filters.db or addon.Options.db
    local L = addon.L
    local function Profiles(excludeCurrent)
        local list = {}
        local current = db:GetCurrentProfile()
        for _, name in ipairs((db:GetProfiles({}))) do
            if not (excludeCurrent and name == current) then list[#list + 1] = { name, name } end
        end
        table.sort(list, function(a, b) return a[1] < b[1] end)
        return list
    end
    local function New(fields)
        fields.Id = "profiles." .. database .. "." .. fields.Key
        return setmetatable(fields, Custom)
    end
    return {
        New{ Key = "current", Type = "select", Label = L["Current profile"], GetFunc = function() return db:GetCurrentProfile() end,
            SetFunc = function(name) db:SetProfile(name) end, ValuesFunc = function() return Profiles(false) end },
        New{ Key = "new", Type = "input", Label = L["New profile"], GetFunc = function() return "" end,
            SetFunc = function(name) if name and name ~= "" then db:SetProfile(name) end end },
        New{ Key = "copy", Type = "select", Label = L["Copy From"], Placeholder = L["Choose a profile"], GetFunc = function() return nil end,
            SetFunc = function(name) db:CopyProfile(name) end, ValuesFunc = function() return Profiles(true) end },
        New{ Key = "delete", Type = "select", Label = L["Delete a Profile"], Placeholder = L["Choose a profile"], GetFunc = function() return nil end,
            SetFunc = function(name) db:DeleteProfile(name) end, ValuesFunc = function() return Profiles(true) end,
            Confirm = function(_, name) return L["Delete a Profile"] .. ": " .. name .. "?" end }, -- AceDBOptions asked too
        New{ Key = "reset", Type = "execute", Label = L["Reset Profile"], Button = L["Reset"], SetFunc = function() db:ResetProfile() end },
    }
end

-- --- options by path, built once per session -------------------------------------------------------------------
local byPath = {}
function source.OptionAt(path, entry)
    if byPath[path] then return byPath[path] end
    local node, chain, keys = source.Resolve(path)
    if not node or not typeByAce[node.type] then return nil end
    byPath[path] = source.NewOption(path, node, chain, keys, entry)
    return byPath[path]
end

local function Join(base, key)
    return base .. ".args." .. key
end

-- --- expanding map entries into elements -------------------------------------------------------------------------
-- Elements: { Kind = "Header"|"SubHeading"|"Note", Text } | { Kind = "Option", Option } | { Kind = "Sub", Text, Members }
-- | { Kind = "Grid", Columns, Rows } | { Kind = "TabList", Items } | { Kind = "Profiles", Database }
local skippedKeys = { SelectAll = true, DeselectAll = true }

local function Leaves(groupPath, header)
    local node = source.Resolve(groupPath)
    if not node then return {} end
    local out, inSlice = {}, header == nil or header == ""
    for _, child in ipairs(source.Children(node)) do
        local n = child.Node
        if n.type == "header" then
            if header ~= nil then inSlice = header ~= "" and child.Key == header end
            if header == nil then out[#out + 1] = { Key = child.Key, Node = n, Path = Join(groupPath, child.Key) } end
        elseif n.type ~= "group" and inSlice then
            out[#out + 1] = { Key = child.Key, Node = n, Path = Join(groupPath, child.Key) }
        end
    end
    return out
end
source.Leaves = Leaves

local function AddLeaves(elements, leaves, entry)
    local i = 1
    while i <= #leaves do
        local leaf = leaves[i]
        local n = leaf.Node
        if skippedKeys[leaf.Key] then
            i = i + 1
        elseif n.type == "header" then
            local text = Evaluate(n.name)
            if text and text ~= "" then elements[#elements + 1] = { Kind = "SubHeading", Text = text } end
            i = i + 1
        elseif n.type == "description" then
            local slots = {}
            local j = i + 1
            while leaves[j] and leaves[j].Node.type == "keybinding" do
                slots[#slots + 1] = source.OptionAt(leaves[j].Path, entry)
                j = j + 1
            end
            local text = Evaluate(n.name)
            if #slots > 0 then
                elements[#elements + 1] = { Kind = "Option", Option = source.NewKeyOption(text, slots) }
            elseif text and text:gsub("%s", "") ~= "" then
                elements[#elements + 1] = { Kind = "Note", Text = text }
            end
            i = j
        else
            local option = source.OptionAt(leaf.Path, entry)
            if option then elements[#elements + 1] = { Kind = "Option", Option = option } end
            i = i + 1
        end
    end
end

local function ExpandFamilies(elements, path, entry)
    local node = source.Resolve(path)
    if not node then return end
    for _, family in ipairs(source.Children(node)) do
        if family.Node.type == "group" then
            local familyPath = Join(path, family.Key)
            local toggles = {}
            for _, leaf in ipairs(Leaves(familyPath)) do
                if leaf.Node.type == "toggle" then toggles[#toggles + 1] = source.OptionAt(leaf.Path, { Retail = entry.Retail }) end
            end
            local name = Evaluate(family.Node.name)
            if #toggles == 1 and toggles[1]:GetLabel() == name then
                elements[#elements + 1] = { Kind = "Option", Option = toggles[1] }
            else
                elements[#elements + 1] = { Kind = "Sub", Text = name, Members = toggles }
                for _, toggle in ipairs(toggles) do
                    toggle.Indent = 1
                    elements[#elements + 1] = { Kind = "Option", Option = toggle }
                end
            end
        end
    end
end

-- The tab list draws today's order dropdowns and show toggles: slot i's dropdown holds the saved tab index shown i-th
-- (Api/TabDataApi.lua GetOrder/SetOrder), and moving a tab sets that slot to its neighbour's tab, which swaps them.
local function TabList(group)
    local items = {}
    local slots = {}
    for _, leaf in ipairs(Leaves(group.Order)) do
        if leaf.Node.type == "select" then slots[#slots + 1] = source.OptionAt(leaf.Path) end
    end
    table.sort(slots, function(a, b) return (tonumber(a.Info[#a.Info]) or 0) < (tonumber(b.Info[#b.Info]) or 0) end)
    for position, slot in ipairs(slots) do
        local index = slot:Get()
        local tab = index and KrowiAF_SavedData.Tabs[index]
        local show = tab and source.OptionAt(Join(group.Show, tab.AddonName .. tab.Name))
        items[#items + 1] = {
            Position = position,
            Slot = slot,
            Show = show,
            Source = tab and tab.AddonName == "Blizzard_AchievementUI" and addon.L["Blizzard"] or nil,
        }
    end
    for i, item in ipairs(items) do
        item.MoveUp = items[i - 1] and function() item.Slot:Set(items[i - 1].Slot:Get()) end
        item.MoveDown = items[i + 1] and function() item.Slot:Set(items[i + 1].Slot:Get()) end
    end
    return { Kind = "TabList", Items = items }
end

local function Grid(group)
    local rows = {}
    for _, row in ipairs(group.Rows) do
        local cells = {}
        for _, leaf in ipairs(Leaves(row.Group, row.Header)) do
            if leaf.Node.type == "toggle" then cells[#cells + 1] = source.OptionAt(leaf.Path) end
        end
        rows[#rows + 1] = { Label = row.Label, Cells = cells }
    end
    return { Kind = "Grid", Columns = group.Columns, Rows = rows }
end

local function EachChild(elements, path)
    local node = source.Resolve(path)
    if not node then return end
    for _, child in ipairs(source.Children(node)) do
        if child.Node.type == "group" then
            elements[#elements + 1] = { Kind = "Header", Text = Evaluate(child.Node.name) }
            AddLeaves(elements, Leaves(Join(path, child.Key)), {})
        end
    end
end

-- A plugin that greys out options says why in a description it injects into their group, keyed <Plugin>Comment
-- (Plugins/ElvUI.lua DisableOptions). A group mapped whole draws it as a note; for an option mapped alone it is drawn
-- above the first option of that group, once per draw.
local function AddPluginNotes(elements, path, added)
    local groupPath = path:match("^(.+)%.args%.[^%.]+$")
    if not groupPath or added[groupPath] then return end
    added[groupPath] = true
    local group = source.Resolve(groupPath)
    for _, child in ipairs(group and source.Children(group) or {}) do
        if child.Node.type == "description" and tostring(child.Key):find("Comment$") then
            local text = Evaluate(child.Node.name)
            if text and text ~= "" then elements[#elements + 1] = { Kind = "Note", Text = text } end
        end
    end
end

-- section id -> elements, built fresh each draw, so injected and hidden options are current
function source.Elements(section)
    local elements = {}
    local notesAdded = {}
    for _, group in ipairs(section.Groups) do
        if group.Kind == "EachChild" then
            EachChild(elements, group.Group)
        else
            elements[#elements + 1] = { Kind = "Header", Text = group.Header }
            if group.Note then elements[#elements + 1] = { Kind = "Note", Text = group.Note } end
            if group.Kind == "Grid" then
                elements[#elements + 1] = Grid(group)
            elseif group.Kind == "TabList" then
                elements[#elements + 1] = TabList(group)
            elseif group.Kind == "Profiles" then
                for _, option in ipairs(ProfileOptions(group.Database)) do
                    elements[#elements + 1] = { Kind = "Option", Option = option }
                end
            else
                local before = #elements
                for _, entry in ipairs(group.Entries) do
                    if entry.Families then
                        ExpandFamilies(elements, entry.Families, entry)
                    elseif entry.Group then
                        AddLeaves(elements, Leaves(entry.Group, entry.Header), entry)
                    else
                        local option = source.OptionAt(entry.Path, entry)
                        if option then
                            AddPluginNotes(elements, entry.Path, notesAdded)
                            elements[#elements + 1] = { Kind = "Option", Option = option }
                        end
                    end
                end
                if group.AllNone then
                    local members = {}
                    for i = before + 1, #elements do
                        local option = elements[i].Option
                        if option and option.Type == "toggle" then members[#members + 1] = option end
                    end
                    table.insert(elements, before + 1, { Kind = "Sub", Text = group.AllNone, Members = members })
                end
            end
        end
    end
    return elements
end

function source.Section(id)
    for _, section in ipairs(window.Map.Sections) do
        if section.Id == id then return section end
    end
end