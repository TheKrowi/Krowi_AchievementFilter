--[[
    Copyright (c) 2026 Krowi
    Licensed under the terms of the LICENSE file in this repository.
]]

---@diagnostic disable: undefined-global

-- The search, as the game's Options window searches (Blizzard_SettingsPanel.lua, FindInitializersMatchingSearchText and
-- OnSearchTextChanged; docs/work/2026-11-03-blizzard-search): a row by its names, from the first letter, on the whole
-- text and on each of its words, the best match first, and a found row brings the row it hangs under. The broad search
-- also finds a row by its description and a section by its explanation. It reads only what every tab hands the window
-- (Groups, SectionName, GetElements, GetHelp) and draws nothing.

local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")

-- Grids, tab lists and cards draw as several rows; hidden options are left out. known: the kinds the window draws, nil
-- keeps every kind.
function lib.Flatten(elements, known)
    local list = {}
    for _, element in ipairs(elements) do
        if element.Kind == "Cards" then
            local cards, columns = element.Cards, lib.CardColumns
            for first = 1, #cards, columns do
                local row, names = { Kind = "CardRow", Cards = {} }, {}
                for i = first, math.min(first + columns - 1, #cards) do
                    row.Cards[#row.Cards + 1] = cards[i]
                    names[#names + 1] = cards[i].Name or ""
                end
                row.Key = table.concat(names, ",")
                list[#list + 1] = row
            end
        elseif element.Kind == "Grid" then
            list[#list + 1] = { Kind = "GridHeader", Columns = element.Columns }
            for _, row in ipairs(element.Rows) do
                list[#list + 1] = { Kind = "GridRow", Label = row.Label, Cells = row.Cells }
            end
        elseif element.Kind == "TabList" then
            for _, item in ipairs(element.Items) do
                list[#list + 1] = { Kind = "TabRow", Item = item }
            end
        elseif element.Kind == "Option" then
            if not element.Option:IsHidden() then list[#list + 1] = element end
        elseif not known or known[element.Kind] then
            list[#list + 1] = element
        end
    end
    return list
end

-- The text a player reads, in capitals: icons and colour codes left out, so a search for "clock" or a colour's hex
-- digits finds nothing it does not show
local function Plain(text)
    return (text:gsub("|A.-|a", ""):gsub("|T.-|t", ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):upper())
end

local function Texts(...)
    local texts = {}
    for i = 1, select("#", ...) do
        local text = select(i, ...)
        if type(text) == "string" and text ~= "" then texts[#texts + 1] = Plain(text) end
    end
    return texts
end

-- A row's names, as the game's search tags (Blizzard_SettingControls.lua): an option's, and its check box's button text
-- or slider name; a family heading's, a grid row's and a tab's
local function Names(element)
    local kind = element.Kind
    if kind == "Option" then
        local with = element.With
        local withName = with and not with:IsHidden() and (with.Type == "execute" and with:GetButtonText() or with:GetLabel()) or nil
        return Texts(element.Option:GetLabel(), withName)
    elseif kind == "Sub" then
        return Texts(element.Text)
    elseif kind == "GridRow" then
        return Texts(element.Label)
    elseif kind == "TabRow" then
        local show = element.Item.Show
        return Texts(show and show:GetLabel())
    end
end

local function Descriptions(element)
    if element.Kind ~= "Option" then return {} end
    local option, with = element.Option, element.With
    local withDescription = with and not with:IsHidden() and with.GetDescription and with:GetDescription() or nil
    return Texts(option.GetDescription and option:GetDescription(), withDescription)
end

-- How texts match the words (words[1] the whole text, the rest each of its words): how many of the words they hold
-- (the whole text counts as all of them) and the longest one they hold, or nil. Where the game takes the first word
-- that matches, this takes them all, so a row holding more of them ranks higher.
local function Match(texts, words)
    local count, longest = 0, 0
    for i, word in ipairs(words) do
        for _, text in ipairs(texts) do
            if text:find(word, 1, true) then
                if i == 1 then return math.max(#words - 1, 1), #word end
                count, longest = count + 1, math.max(longest, #word)
                break
            end
        end
    end
    if count > 0 then return count, longest end
end

-- One number per hit: a name before a description, then more words, then the longest
local function Score(inName, count, longest)
    return (inName and 1000000 or 0) + count * 1000 + longest
end

local function Copy(element, extra)
    local copy = {}
    for key, value in next, element do copy[key] = value end
    for key, value in next, extra do copy[key] = value end
    return copy
end

local function ByScore(a, b)
    if a.Score ~= b.Score then return a.Score > b.Score end
    return a.Index < b.Index
end

-- A section's found rows. A row hangs under the nearest row above it with a smaller indent (a check box's child, a
-- family's member under its heading) or, in a grid, under the column titles; it is found with that row above it, as the
-- game brings a setting's parent (OnSearchTextChanged), and a found family heading brings its members. Rows sharing a
-- root stay together in the page's order, and the blocks gather under the heading they stand under on the page.
local function SearchSection(tab, id, words, broad)
    local config = tab.Config
    local elements = lib.Flatten(config.GetElements(id) or {})
    local heading = ""
    local headingAt, parentAt, rootAt = {}, {}, {}
    local atIndent, gridHeader = {}, nil
    local blocks, blockOf = {}, {}
    for i, element in ipairs(elements) do
        local kind = element.Kind
        if kind == "Header" then
            heading, atIndent, gridHeader = element.Text or "", {}, nil
        end
        headingAt[i] = heading
        local parent
        if kind == "Option" or kind == "Sub" then
            local indent = kind == "Option" and element.Option.Indent or 0
            parent = indent > 0 and atIndent[indent - 1] or nil
            for level in next, atIndent do
                if level >= indent then atIndent[level] = nil end
            end
            atIndent[indent] = i
        elseif kind == "GridHeader" then
            gridHeader = i
        elseif kind == "GridRow" then
            parent = gridHeader
        end
        parentAt[i] = parent
        rootAt[i] = parent and rootAt[parent] or i
        local names = Names(element)
        if names then
            local count, longest = Match(names, words)
            local inName = count ~= nil
            if not count and broad then count, longest = Match(Descriptions(element), words) end
            if count then
                local root = rootAt[i]
                local block = blockOf[root]
                if not block then
                    block = { Index = root, Score = 0, Rows = {} }
                    blockOf[root] = block
                    blocks[#blocks + 1] = block
                end
                block.Score = math.max(block.Score, Score(inName, count, longest))
                local row = i
                while row do
                    block.Rows[row] = true
                    row = parentAt[row]
                end
                if kind == "Sub" then block.Family = true end
            end
        end
    end
    -- A found family heading brings every member
    for _, block in ipairs(blocks) do
        if block.Family then
            for i in ipairs(elements) do
                if rootAt[i] == block.Index then block.Rows[i] = true end
            end
        end
    end
    -- Headings by their best block, blocks within a heading by score, rows within a block in the page's order
    local headings, headingOf = {}, {}
    for _, block in ipairs(blocks) do
        local text = headingAt[block.Index]
        local group = headingOf[text]
        if not group then
            group = { Index = block.Index, Score = 0, Blocks = {} }
            headingOf[text] = group
            headings[#headings + 1] = group
        end
        group.Score = math.max(group.Score, block.Score)
        group.Blocks[#group.Blocks + 1] = block
    end
    table.sort(headings, ByScore)
    local rows, best = {}, nil
    for _, group in ipairs(headings) do
        best = best or group.Score
        table.sort(group.Blocks, ByScore)
        for _, block in ipairs(group.Blocks) do
            for i, element in ipairs(elements) do
                if block.Rows[i] then
                    rows[#rows + 1] = Copy(element, { Tab = tab, SectionId = id, Heading = headingAt[i] })
                end
            end
        end
    end
    local explained = false
    local help = broad and config.GetHelp and config.GetHelp(id)
    for _, block in ipairs(help and help.Blocks or {}) do
        if Match(Texts(block.Text, block.Heading, block.Term), words) then
            explained = true
            break
        end
    end
    if #rows == 0 and not explained then return nil end
    -- A section found only by its explanation comes after those with rows
    return { Id = id, Name = config.SectionName(id), Rows = rows, Explained = explained, Score = best or -1 }
end

-- A search of the current tab, or of every tab: { { Tab, Sections = { { Id, Name, Rows, Explained } } } } in tab order,
-- only the tabs that found something; each tab's sections by their best row. A row is a copy of its element with Tab,
-- SectionId and Heading added, so the window can tell whose it is. broad: descriptions and explanations too.
function lib.Search(text, all, current, broad)
    local whole = Plain(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if whole == "" then return {} end
    local words = { whole }
    for word in whole:gmatch("[^, ]+") do words[#words + 1] = word end
    local groups = {}
    for _, registered in ipairs(lib.Tabs) do
        if all or registered == current then
            local sections, index = {}, 0
            for _, group in ipairs(registered.Config.Groups or {}) do
                for _, id in ipairs(group.Sections) do
                    index = index + 1
                    local section = SearchSection(registered, id, words, broad)
                    if section then
                        section.Index = index
                        sections[#sections + 1] = section
                    end
                end
            end
            table.sort(sections, ByScore)
            if #sections > 0 then groups[#groups + 1] = { Tab = registered, Sections = sections } end
        end
    end
    return groups
end