local _, addon = ...

addon.Gui.MapVerifier = {}
local mapVerifier = addon.Gui.MapVerifier

-- [[ Constants ]] --

local RANGE_DEFAULT_START = 1
local RANGE_DEFAULT_END = 3000

local verdictColors = {
    Zone         = { 0.27, 1.00, 0.27 },
    City         = { 1.00, 0.45, 0.65 },
    Continent    = { 0.50, 0.90, 1.00 },
    Dungeon      = { 0.40, 0.60, 1.00 },
    Raid         = { 0.80, 0.40, 1.00 },
    Delve        = { 1.00, 0.60, 0.20 },
    ClassHall    = { 1.00, 0.84, 0.00 },
    Battleground = { 1.00, 0.20, 0.20 },
    Scenario     = { 0.20, 0.90, 0.70 },
    Skip         = { 0.55, 0.55, 0.55 },
    Unknown      = { 0.80, 0.80, 0.80 },
}

local verdictDisplayNames = {
    ClassHall    = "Class Hall",
    Battleground = "BG",
}

local mapTypeNames = {
    [0] = "Cosmic",
    [1] = "World",
    [2] = "Continent",
    [3] = "Zone",
    [4] = "Dungeon",
    [5] = "Micro",
    [6] = "Orphan",
}

local verdictList = { "Zone", "City", "Continent", "Dungeon", "Raid", "Delve", "ClassHall", "Battleground", "Scenario", "Skip" }
local verdictRows = {
    { "Zone", "City", "Continent", "Dungeon", "Raid" },
    { "Delve", "ClassHall", "Battleground", "Scenario", "Skip" },
}

local expansionColors = {
    Vanilla  = { 0.90, 0.75, 0.40 },
    TBC      = { 0.55, 0.85, 0.55 },
    WotLK    = { 0.55, 0.80, 0.95 },
    Cata     = { 1.00, 0.50, 0.20 },
    MoP      = { 0.40, 0.85, 0.45 },
    WoD      = { 0.85, 0.65, 0.35 },
    Legion   = { 0.45, 0.95, 0.45 },
    BfA      = { 0.30, 0.55, 0.90 },
    SL       = { 0.70, 0.40, 0.95 },
    DF       = { 0.35, 0.80, 0.95 },
    TWW      = { 0.90, 0.60, 0.25 },
    Midnight = { 0.25, 0.30, 0.90 },
    Cross    = { 1.00, 0.90, 0.25 },
}

local expansionRows = {
    { "Vanilla", "TBC", "WotLK", "Cata", "MoP", "WoD" },
    { "Legion", "BfA", "SL", "DF", "TWW", "Midnight" },
    { "Cross" },
}

-- [[ Saved Variable ]] --

local function GetData()
    KrowiAF_MapVerifier = KrowiAF_MapVerifier or {}
    local d = KrowiAF_MapVerifier
    d.Cursor         = d.Cursor         or RANGE_DEFAULT_START
    d.RangeStart     = d.RangeStart     or RANGE_DEFAULT_START
    d.RangeEnd       = d.RangeEnd       or RANGE_DEFAULT_END
    d.Maps           = d.Maps           or {}
    d.ParentOverrides = d.ParentOverrides or {}
    d.Links           = d.Links           or {}
    d.Expansions      = d.Expansions      or {}
    return d
end

-- [[ Valid ID Cache ]] --

local validIds = {}
local cachedRangeStart, cachedRangeEnd

local function BuildValidIdsCache()
    local d = GetData()
    if cachedRangeStart == d.RangeStart and cachedRangeEnd == d.RangeEnd and #validIds > 0 then
        return
    end
    wipe(validIds)
    for id = d.RangeStart, d.RangeEnd do
        if C_Map.GetMapInfo(id) then
            tinsert(validIds, id)
        end
    end
    cachedRangeStart = d.RangeStart
    cachedRangeEnd   = d.RangeEnd
end

local function FindNext(fromId, unreviewedOnly, expansionModeOnly)
    local d = GetData()
    for _, id in next, validIds do
        if id > fromId then
            local include = true
            if expansionModeOnly then
                local v = d.Maps[id]
                if not v or v == "Skip" then
                    include = false
                end
            end
            if include and unreviewedOnly then
                if expansionModeOnly then
                    if d.Expansions[id] then
                        include = false
                    end
                else
                    if d.Maps[id] or d.Links[id] then
                        include = false
                    end
                end
            end
            if include then
                return id
            end
        end
    end
end

local function FindPrev(fromId, expansionModeOnly)
    local d = GetData()
    for i = #validIds, 1, -1 do
        local id = validIds[i]
        if id < fromId then
            if not expansionModeOnly then
                return id
            end
            local v = d.Maps[id]
            if v and v ~= "Skip" then
                return id
            end
        end
    end
end

local function FindLastTaggedPrimary(fromId)
    local d = GetData()
    for i = #validIds, 1, -1 do
        local id = validIds[i]
        if id < fromId and d.Maps[id] and not d.Links[id] then
            return id
        end
    end
end

local function GetReviewedCount()
    local d = GetData()
    local count = 0
    for _, id in next, validIds do
        if d.Maps[id] or d.Links[id] then
            count = count + 1
        end
    end
    return count
end

-- [[ Display & Navigation ]] --

KrowiAF_MapVerifierMixin = {}
local mapVerifierFrame

local function UpdateDisplay()
    if not mapVerifierFrame then return end
    local f = mapVerifierFrame
    local d = GetData()
    local id = d.Cursor
    local info = C_Map.GetMapInfo(id)

    if not info then
        local nextId = FindNext(id - 1, false)
        if nextId then
            d.Cursor = nextId
            UpdateDisplay()
        else
            f.IdText:SetText("ID: " .. id .. " — no valid maps in range")
            f.NameText:SetText("Name:    —")
            f.TypeText:SetText("Type:    —")
            f.ParentText:SetText("Parent:  —")
            f.FlagsText:SetText("Flags:   —")
            f.VerdictText:SetText("Verdict: —")
            f.ExpansionText:SetText("Expansion: —")
            f.ProgressText:SetText("Progress: —")
            f.CursorText:SetText("Cursor: " .. id)
            f.ParentOverrideBox:SetText("")
            f.LinkText:SetText("Link:    -")
            f.LinkBox:SetText("")
            f.SuggestLinkBtn:SetText("No suggestion")
            f.SuggestLinkBtn:Disable()
        end
        return
    end

    local typeName  = mapTypeNames[info.mapType] or ("Unknown(" .. tostring(info.mapType) .. ")")
    local parentStr
    if info.parentMapID and info.parentMapID > 0 then
        local pi = C_Map.GetMapInfo(info.parentMapID)
        parentStr = info.parentMapID .. (pi and (" — " .. pi.name) or "")
    else
        parentStr = "0 — None"
    end
    local overrideParentId = d.ParentOverrides[id]
    if overrideParentId then
        local opi = C_Map.GetMapInfo(overrideParentId)
        parentStr = parentStr .. "  →  |cFFFFCC00" .. overrideParentId .. (opi and (" — " .. opi.name) or "") .. "|r"
    end

    local verdict, vc
    local ownVerdict = d.Maps[id]
    if not ownVerdict and d.Links[id] then
        local primaryVerdict = d.Maps[d.Links[id]]
        if primaryVerdict then
            verdict = "Linked - " .. (verdictDisplayNames[primaryVerdict] or primaryVerdict)
            vc = verdictColors[primaryVerdict]
        else
            verdict = "Linked"
            vc = verdictColors.Unknown
        end
    else
        verdict = ownVerdict or "Unknown"
        vc = verdictColors[verdict] or verdictColors.Unknown
    end
    local verdictColored = string.format("|cFF%02X%02X%02X%s|r", vc[1] * 255, vc[2] * 255, vc[3] * 255, verdict)

    local totalValid    = #validIds
    local totalReviewed = GetReviewedCount()
    local pct           = totalValid > 0 and (totalReviewed / totalValid * 100) or 0

    f.IdText:SetText("ID:      " .. id)
    f.NameText:SetText("Name:    " .. info.name)
    f.TypeText:SetText("Type:    " .. info.mapType .. " — " .. typeName)
    f.ParentText:SetText("Parent:  " .. parentStr)
    f.FlagsText:SetText("Flags:   " .. (info.flags and tostring(info.flags) or "0"))
    f.VerdictText:SetText("Verdict: " .. verdictColored)
    local expansion = d.Expansions[id]
    if not expansion and d.Links[id] then
        expansion = d.Expansions[d.Links[id]]
    end
    local expansionColored
    if expansion then
        local ec = expansionColors[expansion] or { 0.80, 0.80, 0.80 }
        expansionColored = string.format("|cFF%02X%02X%02X%s|r", ec[1] * 255, ec[2] * 255, ec[3] * 255, expansion)
    else
        expansionColored = "|cFFCCCCCCUnknown|r"
    end
    f.ExpansionText:SetText("Expansion: " .. expansionColored)
    f.ProgressText:SetText(string.format(
        "Progress: %d / %d valid IDs reviewed  (%.1f%%)", totalReviewed, totalValid, pct))
    f.CursorText:SetText(string.format(
        "Cursor: %d  |  Range: %d – %d", id, d.RangeStart, d.RangeEnd))

    f.ParentOverrideBox:SetText(overrideParentId and tostring(overrideParentId) or "")

    local linkPrimaryId = d.Links[id]
    local linkStr
    if linkPrimaryId then
        local lpi = C_Map.GetMapInfo(linkPrimaryId)
        local group = {linkPrimaryId, id}
        for otherId, primId in next, d.Links do
            if primId == linkPrimaryId and otherId ~= id then
                tinsert(group, otherId)
            end
        end
        table.sort(group)
        linkStr = "Link:    subzone of " .. linkPrimaryId .. (lpi and (" - " .. lpi.name) or "") .. "  {" .. table.concat(group, ", ") .. "}"
    else
        local secondaries = {}
        for otherId, primId in next, d.Links do
            if primId == id then
                tinsert(secondaries, otherId)
            end
        end
        if #secondaries > 0 then
            table.sort(secondaries)
            local allIds = {id}
            for _, sid in next, secondaries do tinsert(allIds, sid) end
            table.sort(allIds)
            linkStr = "Link:    primary  group: {" .. table.concat(allIds, ", ") .. "}"
        else
            linkStr = "Link:    -"
        end
    end
    f.LinkText:SetText(linkStr)
    f.LinkBox:SetText(linkPrimaryId and tostring(linkPrimaryId) or "")

    local suggestedId = FindLastTaggedPrimary(id)
    if suggestedId then
        local spi = C_Map.GetMapInfo(suggestedId)
        f.SuggestLinkBtn:SetText(suggestedId .. (spi and (" - " .. spi.name) or ""))
        f.SuggestLinkBtn:Enable()
    else
        f.SuggestLinkBtn:SetText("No suggestion")
        f.SuggestLinkBtn:Disable()
    end

    f.RangeStartBox:SetText(tostring(d.RangeStart))
    f.RangeEndBox:SetText(tostring(d.RangeEnd))

    if WorldMapFrame:IsShown() then
        WorldMapFrame:SetMapID(id)
    end
end

local function NavigateTo(id)
    GetData().Cursor = id
    UpdateDisplay()
end

local function SetVerdict(v)
    local d = GetData()
    local currentId = d.Cursor
    d.Maps[currentId] = v
    local unreviewedOnly = mapVerifierFrame and mapVerifierFrame.UnreviewedCheck:GetChecked() or false
    local expansionModeOnly = mapVerifierFrame and mapVerifierFrame.ExpansionModeCheck:GetChecked() or false
    local nextId = FindNext(currentId, unreviewedOnly, expansionModeOnly)
    if nextId then
        NavigateTo(nextId)
    else
        UpdateDisplay()
        print("|cFF88CCFFKrowiAF Map Verifier:|r Reached end of range in current mode.")
    end
end

local function SetExpansion(e)
    local d = GetData()
    local currentId = d.Cursor
    d.Expansions[currentId] = e
    local unreviewedOnly = mapVerifierFrame and mapVerifierFrame.UnreviewedCheck:GetChecked() or false
    local expansionModeOnly = mapVerifierFrame and mapVerifierFrame.ExpansionModeCheck:GetChecked() or false
    local nextId = FindNext(currentId, unreviewedOnly, expansionModeOnly)
    if nextId then
        NavigateTo(nextId)
    else
        UpdateDisplay()
        print("|cFF88CCFFKrowiAF Map Verifier:|r Reached end of range in current mode.")
    end
end

-- [[ Export ]] --

local CSV_HEADER_MAPS   = "id,name,type,expansion,link,parentOverride"
local CSV_HEADER_GROUPS = "primaryId,primaryName,subIds"

local function EscapeCSV(v)
    local s = tostring(v or "")
    if s:find('[,"\n\r]') then
        return '"' .. s:gsub('"', '""') .. '"'
    end
    return s
end

local function CSVRow(...)
    local parts = {}
    for i = 1, select("#", ...) do
        parts[i] = EscapeCSV((select(i, ...)))
    end
    return table.concat(parts, ",")
end

local function BuildExportCSV_Active()
    local d = GetData()
    BuildValidIdsCache()
    local lines = { CSV_HEADER_MAPS }

    local ids = {}
    for id, verdict in next, d.Maps do
        if verdict ~= "Skip" then
            ids[id] = true
        end
    end
    for id, primaryId in next, d.Links do
        local primaryVerdict = d.Maps[primaryId]
        if primaryVerdict and primaryVerdict ~= "Skip" then
            ids[id] = true
        end
    end

    local sortedIds = {}
    for id in next, ids do tinsert(sortedIds, id) end
    table.sort(sortedIds)

    for _, id in next, sortedIds do
        local info     = C_Map.GetMapInfo(id)
        local name     = info and info.name or "?"
        local type_    = d.Maps[id] or ""
        local primId   = d.Links[id]
        local expansion = d.Expansions[id] or (primId and d.Expansions[primId]) or ""
        local override = d.ParentOverrides[id] or ""
        tinsert(lines, CSVRow(id, name, type_, expansion, primId or "", override))
    end

    return table.concat(lines, "\n")
end

local function BuildExportCSV_Skip()
    local d = GetData()
    BuildValidIdsCache()
    local lines = { CSV_HEADER_MAPS }

    local ids = {}
    for id, verdict in next, d.Maps do
        if verdict == "Skip" then
            ids[id] = true
        end
    end
    for id, primaryId in next, d.Links do
        if d.Maps[primaryId] == "Skip" then
            ids[id] = true
        end
    end
    for _, id in next, validIds do
        if not d.Maps[id] and not d.Links[id] then
            ids[id] = true
        end
    end

    local sortedIds = {}
    for id in next, ids do tinsert(sortedIds, id) end
    table.sort(sortedIds)

    for _, id in next, sortedIds do
        local info     = C_Map.GetMapInfo(id)
        local name     = info and info.name or "?"
        local type_    = d.Maps[id] or "Unknown"
        local primId   = d.Links[id]
        local expansion = d.Expansions[id] or (primId and d.Expansions[primId]) or ""
        local override = d.ParentOverrides[id] or ""
        tinsert(lines, CSVRow(id, name, type_, expansion, primId or "", override))
    end

    return table.concat(lines, "\n")
end

local function BuildExportCSV_LinkGroups()
    local d = GetData()
    local lines = { CSV_HEADER_GROUPS }

    local groups = {}
    for secId, primId in next, d.Links do
        groups[primId] = groups[primId] or {}
        tinsert(groups[primId], secId)
    end

    local groupPrimaries = {}
    for primId in next, groups do tinsert(groupPrimaries, primId) end
    table.sort(groupPrimaries)

    for _, primId in next, groupPrimaries do
        local secs = groups[primId]
        table.sort(secs)
        local pinfo = C_Map.GetMapInfo(primId)
        local pname = pinfo and pinfo.name or "?"
        tinsert(lines, CSVRow(primId, pname, table.concat(secs, "|")))
    end

    return table.concat(lines, "\n")
end

-- [[ OnLoad ]] --

function KrowiAF_MapVerifierMixin:OnLoad()
    mapVerifierFrame = self

    addon.Gui:RegisterFrameForClosing(self)
    addon.MakeMovable(self, "MapVerifier", nil, "CENTER")
    self.CloseButton:SetScript("OnClick", function() self:Hide() end)
    ButtonFrameTemplate_HideAttic(self)
    ButtonFrameTemplate_HidePortrait(self)

    if addon.Util.IsClassicWithAchievements then
        self.TitleText:SetText("Map Verifier")
    else
        self:SetTitle("Map Verifier")
    end

    local inset   = self.Inset
    local padLeft = 8
    local lineH   = 16
    local y       = -10

    -- Info lines
    local function AddInfoLine(yOff)
        local fs = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, yOff)
        fs:SetJustifyH("LEFT")
        fs:SetWidth(472)
        return fs
    end

    self.IdText       = AddInfoLine(y); y = y - lineH
    self.NameText     = AddInfoLine(y); y = y - lineH
    self.TypeText     = AddInfoLine(y); y = y - lineH
    self.ParentText   = AddInfoLine(y); y = y - lineH
    self.FlagsText    = AddInfoLine(y); y = y - lineH
    self.VerdictText   = AddInfoLine(y); y = y - lineH
    self.ExpansionText = AddInfoLine(y); y = y - lineH
    self.ProgressText  = AddInfoLine(y); y = y - lineH
    self.CursorText    = AddInfoLine(y); y = y - lineH
    self.LinkText     = AddInfoLine(y); y = y - (lineH + 6)

    -- Remap parent row
    local remapLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    remapLabel:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y)
    remapLabel:SetText("Remap parent:")

    self.ParentOverrideBox = CreateFrame("EditBox", nil, inset, "InputBoxTemplate")
    self.ParentOverrideBox:SetSize(70, 20)
    self.ParentOverrideBox:SetPoint("LEFT", remapLabel, "RIGHT", 6, 0)
    self.ParentOverrideBox:SetAutoFocus(false)
    self.ParentOverrideBox:SetMaxLetters(6)
    self.ParentOverrideBox:SetNumeric(true)

    local setParentBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    setParentBtn:SetSize(50, 22)
    setParentBtn:SetText("Set")
    setParentBtn:SetPoint("LEFT", self.ParentOverrideBox, "RIGHT", 6, 0)
    setParentBtn:SetScript("OnClick", function()
        local d = GetData()
        local id = d.Cursor
        local newParent = self.ParentOverrideBox:GetNumber()
        if newParent == 0 then return end
        if not C_Map.GetMapInfo(newParent) then
            print("|cFF88CCFFKrowiAF Map Verifier:|r ID " .. newParent .. " is not a valid map.")
            return
        end
        d.ParentOverrides[id] = newParent
        UpdateDisplay()
    end)
    self.ParentOverrideBox:SetScript("OnEnterPressed", function() setParentBtn:Click() end)

    local clearParentBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    clearParentBtn:SetSize(60, 22)
    clearParentBtn:SetText("Clear")
    clearParentBtn:SetPoint("LEFT", setParentBtn, "RIGHT", 4, 0)
    clearParentBtn:SetScript("OnClick", function()
        local d = GetData()
        d.ParentOverrides[d.Cursor] = nil
        self.ParentOverrideBox:SetText("")
        UpdateDisplay()
    end)

    y = y - 30

    -- Link row
    local linkLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    linkLabel:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y)
    linkLabel:SetText("Link to ID:")

    self.LinkBox = CreateFrame("EditBox", nil, inset, "InputBoxTemplate")
    self.LinkBox:SetSize(70, 20)
    self.LinkBox:SetPoint("LEFT", linkLabel, "RIGHT", 6, 0)
    self.LinkBox:SetAutoFocus(false)
    self.LinkBox:SetMaxLetters(6)
    self.LinkBox:SetNumeric(true)

    local linkBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    linkBtn:SetSize(60, 22)
    linkBtn:SetText("Link")
    linkBtn:SetPoint("LEFT", self.LinkBox, "RIGHT", 6, 0)
    linkBtn:SetScript("OnClick", function()
        local d = GetData()
        local id = d.Cursor
        local targetId = self.LinkBox:GetNumber()
        if targetId == 0 then return end
        if targetId == id then
            print("|cFF88CCFFKrowiAF Map Verifier:|r Cannot link a map to itself.")
            return
        end
        if not C_Map.GetMapInfo(targetId) then
            print("|cFF88CCFFKrowiAF Map Verifier:|r ID " .. targetId .. " is not a valid map.")
            return
        end
        if d.Links[targetId] then
            print("|cFF88CCFFKrowiAF Map Verifier:|r ID " .. targetId .. " is already a subzone; link to its primary instead.")
            return
        end
        -- If this id was a primary, re-home its secondaries to the new primary
        for otherId, primId in next, d.Links do
            if primId == id then
                d.Links[otherId] = targetId
            end
        end
        d.Links[id] = targetId
        local unreviewedOnly = self.UnreviewedCheck:GetChecked()
        local expansionModeOnly = self.ExpansionModeCheck:GetChecked()
        local nextId = FindNext(id, unreviewedOnly, expansionModeOnly)
        if nextId then
            NavigateTo(nextId)
        else
            UpdateDisplay()
        end
    end)
    self.LinkBtn = linkBtn
    self.LinkBox:SetScript("OnEnterPressed", function() linkBtn:Click() end)

    local unlinkBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    unlinkBtn:SetSize(70, 22)
    unlinkBtn:SetText("Unlink")
    unlinkBtn:SetPoint("LEFT", linkBtn, "RIGHT", 4, 0)
    unlinkBtn:SetScript("OnClick", function()
        local d = GetData()
        local id = d.Cursor
        -- If this is a primary, unlink all its secondaries too
        for otherId, primId in next, d.Links do
            if primId == id then
                d.Links[otherId] = nil
            end
        end
        d.Links[id] = nil
        self.LinkBox:SetText("")
        UpdateDisplay()
    end)

    self.SuggestLinkBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    self.SuggestLinkBtn:SetSize(160, 22)
    self.SuggestLinkBtn:SetText("No suggestion")
    self.SuggestLinkBtn:SetPoint("LEFT", unlinkBtn, "RIGHT", 6, 0)
    self.SuggestLinkBtn:SetScript("OnClick", function()
        local d = GetData()
        local suggestedId = FindLastTaggedPrimary(d.Cursor)
        if suggestedId then
            self.LinkBox:SetText(tostring(suggestedId))
            self.LinkBtn:Click()
        end
    end)

    y = y - 30

    -- Pin row
    local pinLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    pinLabel:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y)
    pinLabel:SetText("Pin to ID:")

    self.PinBox = CreateFrame("EditBox", nil, inset, "InputBoxTemplate")
    self.PinBox:SetSize(70, 20)
    self.PinBox:SetPoint("LEFT", pinLabel, "RIGHT", 6, 0)
    self.PinBox:SetAutoFocus(false)
    self.PinBox:SetMaxLetters(6)
    self.PinBox:SetNumeric(true)

    local pinBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    pinBtn:SetSize(80, 22)
    pinBtn:SetText("Link to Pin")
    pinBtn:SetPoint("LEFT", self.PinBox, "RIGHT", 6, 0)
    pinBtn:SetScript("OnClick", function()
        local d = GetData()
        local id = d.Cursor
        local targetId = self.PinBox:GetNumber()
        if targetId == 0 then return end
        if targetId == id then
            print("|cFF88CCFFKrowiAF Map Verifier:|r Cannot link a map to itself.")
            return
        end
        if not C_Map.GetMapInfo(targetId) then
            print("|cFF88CCFFKrowiAF Map Verifier:|r ID " .. targetId .. " is not a valid map.")
            return
        end
        if d.Links[targetId] then
            print("|cFF88CCFFKrowiAF Map Verifier:|r ID " .. targetId .. " is already a subzone; link to its primary instead.")
            return
        end
        -- If this id was a primary, re-home its secondaries to the new primary
        for otherId, primId in next, d.Links do
            if primId == id then
                d.Links[otherId] = targetId
            end
        end
        d.Links[id] = targetId
        local unreviewedOnly = self.UnreviewedCheck:GetChecked()
        local expansionModeOnly = self.ExpansionModeCheck:GetChecked()
        local nextId = FindNext(id, unreviewedOnly, expansionModeOnly)
        if nextId then
            NavigateTo(nextId)
        else
            UpdateDisplay()
        end
    end)
    self.PinBox:SetScript("OnEnterPressed", function() pinBtn:Click() end)

    y = y - 30

    -- Divider 1
    local div1 = inset:CreateTexture(nil, "ARTWORK")
    div1:SetColorTexture(0.4, 0.4, 0.4, 0.8)
    div1:SetPoint("TOPLEFT", inset, "TOPLEFT", 4, y)
    div1:SetSize(472, 1)
    y = y - 10

    -- Range row
    local rangeLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    rangeLabel:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y)
    rangeLabel:SetText("Range:")

    self.RangeStartBox = CreateFrame("EditBox", nil, inset, "InputBoxTemplate")
    self.RangeStartBox:SetSize(60, 20)
    self.RangeStartBox:SetPoint("LEFT", rangeLabel, "RIGHT", 6, 0)
    self.RangeStartBox:SetAutoFocus(false)
    self.RangeStartBox:SetMaxLetters(6)
    self.RangeStartBox:SetNumeric(true)
    self.RangeStartBox:SetText(tostring(RANGE_DEFAULT_START))

    local toLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    toLabel:SetPoint("LEFT", self.RangeStartBox, "RIGHT", 6, 0)
    toLabel:SetText("to")

    self.RangeEndBox = CreateFrame("EditBox", nil, inset, "InputBoxTemplate")
    self.RangeEndBox:SetSize(60, 20)
    self.RangeEndBox:SetPoint("LEFT", toLabel, "RIGHT", 6, 0)
    self.RangeEndBox:SetAutoFocus(false)
    self.RangeEndBox:SetMaxLetters(6)
    self.RangeEndBox:SetNumeric(true)
    self.RangeEndBox:SetText(tostring(RANGE_DEFAULT_END))

    local applyBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    applyBtn:SetSize(110, 22)
    applyBtn:SetText("Apply Range")
    applyBtn:SetPoint("LEFT", self.RangeEndBox, "RIGHT", 10, 0)
    applyBtn:SetScript("OnClick", function()
        local d = GetData()
        local s = self.RangeStartBox:GetNumber()
        local e = self.RangeEndBox:GetNumber()
        d.RangeStart = max(1, s > 0 and s or RANGE_DEFAULT_START)
        d.RangeEnd   = max(d.RangeStart, e > 0 and e or RANGE_DEFAULT_END)
        cachedRangeStart = nil
        BuildValidIdsCache()
        UpdateDisplay()
    end)

    local function TriggerApply() applyBtn:Click() end
    self.RangeStartBox:SetScript("OnEnterPressed", TriggerApply)
    self.RangeEndBox:SetScript("OnEnterPressed", TriggerApply)

    y = y - 28

    -- Jump-to-ID row
    local jumpLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    jumpLabel:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y)
    jumpLabel:SetText("Jump to ID:")

    self.JumpBox = CreateFrame("EditBox", nil, inset, "InputBoxTemplate")
    self.JumpBox:SetSize(70, 20)
    self.JumpBox:SetPoint("LEFT", jumpLabel, "RIGHT", 6, 0)
    self.JumpBox:SetAutoFocus(false)
    self.JumpBox:SetMaxLetters(6)
    self.JumpBox:SetNumeric(true)

    local goBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    goBtn:SetSize(50, 22)
    goBtn:SetText("Go")
    goBtn:SetPoint("LEFT", self.JumpBox, "RIGHT", 6, 0)
    goBtn:SetScript("OnClick", function()
        local id = self.JumpBox:GetNumber()
        if id == 0 then return end
        if not C_Map.GetMapInfo(id) then
            print("|cFF88CCFFKrowiAF Map Verifier:|r ID " .. id .. " is not a valid map.")
            return
        end
        NavigateTo(id)
    end)
    self.JumpBox:SetScript("OnEnterPressed", function() goBtn:Click() end)

    y = y - 28

    -- Unreviewed-only checkbox
    self.UnreviewedCheck = CreateFrame("CheckButton", nil, inset, "UICheckButtonTemplate")
    self.UnreviewedCheck:SetSize(24, 24)
    self.UnreviewedCheck:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y + 2)
    self.UnreviewedCheck:SetChecked(false)

    local unreviewedLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    unreviewedLabel:SetPoint("LEFT", self.UnreviewedCheck, "RIGHT", 4, 0)
    unreviewedLabel:SetText("Next skips already-reviewed IDs")

    y = y - 28

    -- Expansion mode checkbox
    self.ExpansionModeCheck = CreateFrame("CheckButton", nil, inset, "UICheckButtonTemplate")
    self.ExpansionModeCheck:SetSize(24, 24)
    self.ExpansionModeCheck:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y + 2)
    self.ExpansionModeCheck:SetChecked(false)

    local expansionModeLabel = inset:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    expansionModeLabel:SetPoint("LEFT", self.ExpansionModeCheck, "RIGHT", 4, 0)
    expansionModeLabel:SetText("Expansion mode: only reviewed non-Skip maps")

    y = y - 28

    -- Divider 2
    local div2 = inset:CreateTexture(nil, "ARTWORK")
    div2:SetColorTexture(0.4, 0.4, 0.4, 0.8)
    div2:SetPoint("TOPLEFT", inset, "TOPLEFT", 4, y)
    div2:SetSize(472, 1)
    y = y - 10

    -- Navigation row
    local prevBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    prevBtn:SetSize(100, 26)
    prevBtn:SetText("<< Prev")
    prevBtn:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y)
    prevBtn:SetScript("OnClick", function()
        local expansionModeOnly = self.ExpansionModeCheck:GetChecked()
        local prevId = FindPrev(GetData().Cursor, expansionModeOnly)
        if prevId then
            NavigateTo(prevId)
        else
            print("|cFF88CCFFKrowiAF Map Verifier:|r Already at the first valid ID.")
        end
    end)

    local openMapBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    openMapBtn:SetSize(160, 26)
    openMapBtn:SetText("Open World Map")
    openMapBtn:SetPoint("TOP", inset, "TOP", 0, y)
    openMapBtn:SetScript("OnClick", function()
        local id = GetData().Cursor
        if not WorldMapFrame:IsShown() then
            WorldMapFrame:Show()
        end
        WorldMapFrame:SetMapID(id)
    end)

    local nextBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    nextBtn:SetSize(100, 26)
    nextBtn:SetText("Next >>")
    nextBtn:SetPoint("TOPRIGHT", inset, "TOPRIGHT", -padLeft, y)
    nextBtn:SetScript("OnClick", function()
        local unreviewedOnly = self.UnreviewedCheck:GetChecked()
        local expansionModeOnly = self.ExpansionModeCheck:GetChecked()
        local nextId = FindNext(GetData().Cursor, unreviewedOnly, expansionModeOnly)
        if nextId then
            NavigateTo(nextId)
        else
            print("|cFF88CCFFKrowiAF Map Verifier:|r No more IDs in current mode.")
        end
    end)

    y = y - 36

    -- Verdict buttons row (two rows: 4 + 3)
    self.VerdictButtons = {}
    local btnW = 90

    for rowIdx, row in ipairs(verdictRows) do
        local rowW   = #row * btnW + (#row - 1) * 4
        local startX = (480 - rowW) / 2
        for i, v in ipairs(row) do
            local vc      = verdictColors[v]
            local hexCol  = string.format("%02X%02X%02X", vc[1] * 255, vc[2] * 255, vc[3] * 255)
            local display = verdictDisplayNames[v] or v
            local btn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
            btn:SetSize(btnW, 26)
            btn:SetText("|cFF" .. hexCol .. display .. "|r")
            btn:SetPoint("TOPLEFT", inset, "TOPLEFT", startX + (i - 1) * (btnW + 4), y)
            btn:SetScript("OnClick", function() SetVerdict(v) end)
            btn.verdict = v
            tinsert(self.VerdictButtons, btn)
        end
        if rowIdx < #verdictRows then
            y = y - 30
        end
    end

    y = y - 30

    -- Clear Verdict button
    local clearVerdictBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    clearVerdictBtn:SetSize(100, 22)
    clearVerdictBtn:SetText("Clear Verdict")
    clearVerdictBtn:SetPoint("TOPLEFT", inset, "TOPLEFT", (480 - 100) / 2, y)
    clearVerdictBtn:SetScript("OnClick", function()
        local d = GetData()
        local id = d.Cursor
        d.Maps[id] = nil
        UpdateDisplay()
    end)

    y = y - 30

    -- Expansion buttons
    self.ExpansionButtons = {}
    local expBtnW = 72
    for rowIdx, row in ipairs(expansionRows) do
        local rowW   = #row * expBtnW + (#row - 1) * 4
        local startX = (480 - rowW) / 2
        for i, e in ipairs(row) do
            local ec     = expansionColors[e]
            local hexCol = string.format("%02X%02X%02X", ec[1] * 255, ec[2] * 255, ec[3] * 255)
            local btn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
            btn:SetSize(expBtnW, 26)
            btn:SetText("|cFF" .. hexCol .. e .. "|r")
            btn:SetPoint("TOPLEFT", inset, "TOPLEFT", startX + (i - 1) * (expBtnW + 4), y)
            btn:SetScript("OnClick", function() SetExpansion(e) end)
            tinsert(self.ExpansionButtons, btn)
        end
        if rowIdx < #expansionRows then
            y = y - 30
        end
    end

    y = y - 30

    -- Clear Expansion button
    local clearExpansionBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    clearExpansionBtn:SetSize(120, 22)
    clearExpansionBtn:SetText("Clear Expansion")
    clearExpansionBtn:SetPoint("TOPLEFT", inset, "TOPLEFT", (480 - 120) / 2, y)
    clearExpansionBtn:SetScript("OnClick", function()
        local d = GetData()
        local id = d.Cursor
        d.Expansions[id] = nil
        UpdateDisplay()
    end)

    y = y - 30

    -- Divider 3
    local div3 = inset:CreateTexture(nil, "ARTWORK")
    div3:SetColorTexture(0.4, 0.4, 0.4, 0.8)
    div3:SetPoint("TOPLEFT", inset, "TOPLEFT", 4, y)
    div3:SetSize(472, 1)
    y = y - 10

    -- Bottom row: Reset Range (left) + 3 Export buttons (right)
    local resetBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    resetBtn:SetSize(110, 22)
    resetBtn:SetText("Reset Range")
    resetBtn:SetPoint("TOPLEFT", inset, "TOPLEFT", padLeft, y)
    resetBtn:SetScript("OnClick", function()
        local d = GetData()
        d.RangeStart = RANGE_DEFAULT_START
        d.RangeEnd   = RANGE_DEFAULT_END
        self.RangeStartBox:SetText(tostring(RANGE_DEFAULT_START))
        self.RangeEndBox:SetText(tostring(RANGE_DEFAULT_END))
        cachedRangeStart = nil
        BuildValidIdsCache()
        UpdateDisplay()
    end)

    local exportGroupsBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    exportGroupsBtn:SetSize(95, 22)
    exportGroupsBtn:SetText("Exp Groups")
    exportGroupsBtn:SetPoint("TOPRIGHT", inset, "TOPRIGHT", -padLeft, y)
    exportGroupsBtn:SetScript("OnClick", function()
        local textFrame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
        textFrame:Init("Map Verifier Export — Link Groups")
        textFrame.Input:SetText(BuildExportCSV_LinkGroups())
        textFrame:Show()
    end)

    local exportSkipBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    exportSkipBtn:SetSize(95, 22)
    exportSkipBtn:SetText("Exp Skip")
    exportSkipBtn:SetPoint("RIGHT", exportGroupsBtn, "LEFT", -4, 0)
    exportSkipBtn:SetScript("OnClick", function()
        local textFrame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
        textFrame:Init("Map Verifier Export — Skip / Unknown")
        textFrame.Input:SetText(BuildExportCSV_Skip())
        textFrame:Show()
    end)

    local exportActiveBtn = CreateFrame("Button", nil, inset, "UIPanelButtonTemplate")
    exportActiveBtn:SetSize(95, 22)
    exportActiveBtn:SetText("Exp Active")
    exportActiveBtn:SetPoint("RIGHT", exportSkipBtn, "LEFT", -4, 0)
    exportActiveBtn:SetScript("OnClick", function()
        local textFrame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
        textFrame:Init("Map Verifier Export — Active Maps")
        textFrame.Input:SetText(BuildExportCSV_Active())
        textFrame:Show()
    end)
end

-- [[ OnShow / ResetPosition ]] --

function KrowiAF_MapVerifierMixin:OnShow()
    addon.Gui:SetFrameToLastPosition(self, "MapVerifier")
    BuildValidIdsCache()
    local d = GetData()
    if not C_Map.GetMapInfo(d.Cursor) then
        local nextId = FindNext(d.Cursor - 1, false)
        if nextId then d.Cursor = nextId end
    end
    UpdateDisplay()
end

function KrowiAF_MapVerifierMixin:ResetPosition()
    self:ClearAllPoints()
    self:SetPoint("CENTER", 0, 0)
end

-- [[ Public API ]] --

function mapVerifier.Open()
    if not addon.Diagnostics.DebugEnabled() then
        print("|cFF88CCFFKrowiAF Map Verifier:|r Enable debug mode first (Options → General → Debug).")
        return
    end
    local frame = KrowiAF_MapVerifierFrame or CreateFrame("Frame", "KrowiAF_MapVerifierFrame", UIParent, "KrowiAF_MapVerifier_Template")
    frame:Show()
end
