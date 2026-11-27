local _, addon = ...
addon.Gui.AchievementFrameHeader = {}
local header = addon.Gui.AchievementFrameHeader

local function LoadIfIsClassicWithAchievements()
    if not addon.Util.IsClassicWithAchievements then
        return
    end

    local tex = AchievementFrameHeader:CreateTexture()
    tex:SetTexture("Interface/AchievementFrame/UI-Achievement-RightDDLInset")
    tex:SetSize(128, 32)
    tex:SetPoint("TOPLEFT", 112, -56)
    tex:Hide()
    AchievementFrameHeaderLeftDDLInset = tex

    AchievementFrame.Header = AchievementFrameHeader
    AchievementFrame.Header.RightDDLInset = AchievementFrameHeaderRightDDLInset
    AchievementFrame.Header.PointBorder = AchievementFrameHeaderPointBorder
    AchievementFrame.Header.Points = AchievementFrameHeaderPoints
    AchievementFrame.Header.Title = AchievementFrameHeaderTitle
    AchievementFrame.Header.LeftDDLInset = AchievementFrameHeaderLeftDDLInset
end

local sortBy = addon.Enum.PointsSortBy
local sortFuncs = {
    [sortBy.Points] = addon.Objects.CompareFunc:New("number", "Points"),
    [sortBy.Name] = addon.Objects.CompareFunc:New("string", "Name"),
    [sortBy.Realm] = addon.Objects.CompareFunc:New("string", "Realm"),
    [sortBy.Faction] = addon.Objects.CompareFunc:New("number", "Faction"),
    [sortBy.Class] = addon.Objects.CompareFunc:New("string", "Class"),
}

local function GetSortedCharacters()
    local characters = {}
    for guid, character in next, KrowiAF_SavedData.CharacterList do
        tinsert(characters, {
            Name = character.Name,
            Realm = character.Realm,
            Class = character.Class,
            Faction = character.Faction,
            Points = character.Points,
            ExcludeFromHeaderTooltip = character.ExcludeFromHeaderTooltip,
            Guid = guid
        })
    end

    local priority = addon.Settings.GetObject("tooltips.points.sortPriority")
    local reverse = addon.Settings.GetObject("tooltips.points.sortReverse")
    for index, sortFunc in next, priority do
        sortFuncs[sortFunc].Reverse = reverse[index]
    end

    local sortFunc = sortFuncs[priority[1]]
    for i = 1, #priority - 1 do
        sortFuncs[priority[i]].Fallback = sortFuncs[priority[i + 1]]
    end
    sortFuncs[priority[#priority]]:SetDefaultFallback()

    table.sort(characters, function(a, b)
        return sortFunc:Compare(a, b)
    end)
    return characters
end

local function LimitNumCharacters(characters)
    local maxNumCharacters = addon.Settings.Get("tooltips.points.maxNumCharacters")
    local trimmedCharacters = {}

    if not addon.Settings.Get("tooltips.points.keepCurrentCharacter") then -- We can just take the 1st x characters and return
        for i = 1, maxNumCharacters do
            tinsert(trimmedCharacters, characters[i])
        end
        return trimmedCharacters
    end

    -- Here we need to check if we added the current character or not
    local currentCharacterAdded = false
    local playerGUID = UnitGUID("player")
    for i = 1, #characters do
        if not characters[i].ExcludeFromHeaderTooltip then
            if characters[i].Guid == playerGUID then
                tinsert(trimmedCharacters, characters[i])
                currentCharacterAdded = true
            elseif currentCharacterAdded or #trimmedCharacters < maxNumCharacters - 1 then
                tinsert(trimmedCharacters, characters[i])
            end
            if #trimmedCharacters >= maxNumCharacters then
                return trimmedCharacters
            end
        end
    end
    return trimmedCharacters
end

local function AddFactionIcon(name, faction)
    if addon.Settings.Get("tooltips.points.showFaction") then
        local icon
        if faction == KrowiAF.Enum.Faction.Alliance then
            icon = "|A:worldquest-icon-alliance:15:16|a"
        elseif faction == KrowiAF.Enum.Faction.Horde then
            icon = "|A:worldquest-icon-horde:15:16|a"
        else -- Neutral
            icon = "|A:worldquest-questmarker-questionmark:15:16|a"
        end
        name = icon .. "|T:1:8|t" .. name
    end
    return name
end

local function OnEnter(frame)
    Krowi_Tooltip:SetOwner(frame, "ANCHOR_TOPLEFT")
    Krowi_Tooltip:SetText(addon.L["Achievement points earned by"])
    local characters = GetSortedCharacters()
    characters = LimitNumCharacters(characters)
    for _, character in next, characters do
        local r, g, b = GetClassColor(character.Class)
        local name = character.Name
        if addon.Settings.Get("tooltips.points.alwaysShowRealm") or character.Realm ~= (select(2, UnitFullName("player"))) then
            name = name .. " - " .. character.Realm
        end
        name = AddFactionIcon(name, character.Faction)
        Krowi_Tooltip:AddDoubleLine(name, tostring(BreakUpLargeNumbers(character.Points or -1)), r, g, b, 1, 1, 1)
    end
    Krowi_Tooltip:Show()
end

local function CreateTooltip()
    local frame = CreateFrame("Button", "KrowiAF_AchievementFrameHeaderButton", AchievementFrame.Header)
    frame:SetPoint("TOPLEFT", AchievementFrame.Header.PointBorder, 11, -10)
    frame:SetPoint("BOTTOMRIGHT", AchievementFrame.Header.PointBorder, -10, 8)
    frame:SetScript("OnEnter", OnEnter)
    frame:SetScript("OnLeave", function()
        Krowi_Tooltip:Hide()
    end)
    frame:SetScript("OnClick", function()
        KrowiAF_DataManagerFrame:Show()
    end)
end

function header:AnchorHeader()
    if not AchievementFrame.HeaderDetails then -- Newer layouts already place the dropdown above the list; only old layouts need it pulled onto the Header banner
        AchievementFrameFilterDropdown:ClearAllPoints()
        AchievementFrameFilterDropdown:SetPoint("BOTTOMLEFT", AchievementFrame.Header, "BOTTOMLEFT", 123, 17)
    end

    AchievementFrame.Header:ClearAllPoints()
    if addon.Settings.Get("window.centerHeader") then
        AchievementFrame.Header:SetPoint("BOTTOM", AchievementFrame, "TOP", 0, -38)
    else
        AchievementFrame.Header:SetPoint("BOTTOMLEFT", AchievementFrame, "TOPLEFT", 26, -38)
    end
end

function header:Load()
    LoadIfIsClassicWithAchievements()
    CreateTooltip()
    self:AnchorHeader()
end

local headerSortPriorities = {
    [sortBy.Points] = addon.L["Points"],
    [sortBy.Name] = addon.L["Name"],
    [sortBy.Realm] = addon.L["Realm"],
    [sortBy.Faction] = addon.L["Faction"],
    [sortBy.Class] = addon.L["Class"]
}

-- Swaps the two places the value is at, in the sort priority and its reverse flags (two live lists, in place)
local function SetPriority(index, value)
    local priorities = addon.Settings.GetObject("tooltips.points.sortPriority")
    local reverse = addon.Settings.GetObject("tooltips.points.sortReverse")
    local otherIndex
    for i, prio in next, priorities do
        if prio == value then
            otherIndex = i
        end
    end
    local currentValue = priorities[index]
    priorities[index] = value
    priorities[otherIndex] = currentValue
    local currentReverse = reverse[index]
    reverse[index] = reverse[otherIndex]
    reverse[otherIndex] = currentReverse
end

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus
local AdjustedWidth = addon.InjectOptions.AdjustedWidth
function header:InjectDynamicOptions()
    local numSlots = 0 -- one priority slot per choice; counted, as the choices' numbers need not run 1 to n
    for _ in next, headerSortPriorities do numSlots = numSlots + 1 end
    for i = 1, numSlots do
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Priority" .. i, {
            order = OrderPP(), type = "select", width = AdjustedWidth(0.95),
            name = "",
            values = headerSortPriorities,
            get = function() return addon.Settings.GetObject("tooltips.points.sortPriority")[i] end,
            set = function (_, value) SetPriority(i, value); end
        })
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Blank1" .. i, {
            order = OrderPP(), type = "description", width = AdjustedWidth(0.1),
            name = ""
        })
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Reverse" .. i, {
            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.95),
            name = addon.L["Reverse Sort"],
            desc = (""):KAF_AddDefaultValueText("tooltips.points.sortReverse", nil, i),
            get = function() return addon.Settings.GetObject("tooltips.points.sortReverse")[i] end,
            set = function(_, value) addon.Settings.GetObject("tooltips.points.sortReverse")[i] = value end
        })
        addon.InjectOptions:AddTable("Layout.args.Header.args.Tooltip.args.SortPriority.args", "Blank2" .. i, {
            order = OrderPP(), type = "description", width = AdjustedWidth(0.80),
            name = ""
        })
    end
end

local processHook = true
function header:HookSetPointsText()
    AchievementFrame.Header.Points:SetPoint("TOP", AchievementFrame.Header.PointBorder, "TOP", -10, -13)
    AchievementFrame.Header.PointBorder:SetWidth(175)

    hooksecurefunc(AchievementFrame.Header.Points, "SetText", function()
        if not processHook then
            return
        end

        if addon.InGuildView() then
            processHook = false
            AchievementFrame.Header.Points:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints(true) or -1))
            processHook = true
            return
        end

        processHook = false
        local points = KrowiAF_SavedData.CharacterList[UnitGUID("player")].Points
        local pointsFormat = addon.Enum.PointsFormat
        if addon.Settings.Get("window.pointsFormat") == pointsFormat.Account then
        elseif addon.Settings.Get("window.pointsFormat") == pointsFormat.CharacterAndAccount then
            AchievementFrame.Header.Points:SetText(BreakUpLargeNumbers(points or -1) .. " / " .. BreakUpLargeNumbers(GetTotalAchievementPoints() or -1))
        elseif addon.Settings.Get("window.pointsFormat") == pointsFormat.Character then
            AchievementFrame.Header.Points:SetText(BreakUpLargeNumbers(points or -1))
        end
        processHook = true
    end)
end