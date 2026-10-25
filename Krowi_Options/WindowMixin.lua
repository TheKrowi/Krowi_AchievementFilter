--[[
    Copyright (c) 2026 Krowi
    Licensed under the terms of the LICENSE file in this repository.
]]

---@diagnostic disable: undefined-global

-- The window: navigation on the left, the section's rows in the middle, the help pane on the right. Strings come from
-- the consumer (config.Strings): Overview, SearchResults, NoResults, Defaults, ResetSection (with %s), ChangedCount
-- (with %d), ReloadText, ReloadNow, ShowMe, HowItWorks, New, All, None, NotBound, PressAKey, Default (with %s),
-- NeedsReload, Changed, NotInCombat.

local navWidth, helpWidth, stripWidth = 220, 380, 30
local minWidth, minHeight = 1000, 560

-- [[ Navigation buttons ]] --
Krowi_OptionsNavButtonMixin = {}

function Krowi_OptionsNavButtonMixin:Init(element, window)
    self.Element, self.Window = element, window
    self.Label:SetText(element.Text)
    self.New:SetText(window.Strings.New)
    self.New:SetShown(element.IsNew)
    local selected = window.SectionId == element.Id and not window.Searching
    self.Selected:SetShown(selected)
    self.Label:SetFontObject(selected and "GameFontHighlight" or "GameFontNormal")
end

function Krowi_OptionsNavButtonMixin:OnClick()
    self.Window:ShowSection(self.Element.Id)
end

-- [[ Help pane blocks ]] --
Krowi_OptionsHelpTextMixin = {}

function Krowi_OptionsHelpTextMixin:Init(element)
    self.Text:SetFontObject(element.Font)
    self.Text:SetText(element.Text)
end

Krowi_OptionsHelpPictureMixin = {}

function Krowi_OptionsHelpPictureMixin:Init(element)
    self.Picture:SetTexture(element.Picture)
    self.Picture:SetSize(element.DrawWidth, element.DrawHeight)
    if element.TexCoords then self.Picture:SetTexCoord(unpack(element.TexCoords)) else self.Picture:SetTexCoord(0, 1, 0, 1) end
end

-- [[ The window ]] --
Krowi_OptionsWindowMixin = {}

local rowTemplates = {
    Header = { "Krowi_OptionsHeaderRowTemplate", 34 },
    SubHeading = { "Krowi_OptionsSubHeadingRowTemplate", 26 },
    Note = { "Krowi_OptionsNoteRowTemplate" },
    Option = { "Krowi_OptionsOptionRowTemplate", 30 },
    Sub = { "Krowi_OptionsSubRowTemplate", 28 },
    GridHeader = { "Krowi_OptionsGridHeaderRowTemplate", 34 },
    GridRow = { "Krowi_OptionsGridRowTemplate", 28 },
    TabRow = { "Krowi_OptionsTabRowTemplate", 28 },
    Link = { "Krowi_OptionsLinkRowTemplate", 26 },
}

local function InitList(window, scrollBox, scrollBar, templates, extent)
    local view = CreateScrollBoxListLinearView()
    view:SetElementFactory(function(factory, element)
        local template = templates[element.Kind]
        factory(template[1], function(frame, data) frame:Init(data, window) end)
    end)
    view:SetElementExtentCalculator(function(_, element) return extent(element) end)
    ScrollUtil.InitScrollBoxListWithScrollBar(scrollBox, scrollBar, view)
end

function Krowi_OptionsWindowMixin:OnLoad()
    self:RegisterForDrag("LeftButton")
    if self.SetResizeBounds then self:SetResizeBounds(minWidth, minHeight) else self:SetMinResize(minWidth, minHeight) end

    self.CloseButton:SetScript("OnClick", function() self:Hide() end) -- a plain Hide: HideUIPanel refuses addon code in combat

    self.Measure = self:CreateFontString(nil, "ARTWORK", "GameFontDisable")
    self.Measure:Hide()
    self.Measure:SetJustifyH("LEFT")

    InitList(self, self.NavScrollBox, self.NavScrollBar, {
        NavHeader = { "Krowi_OptionsNavHeaderTemplate" },
        NavButton = { "Krowi_OptionsNavButtonTemplate" },
    }, function(element) return element.Kind == "NavHeader" and 28 or 22 end)
    InitList(self, self.PageScrollBox, self.PageScrollBar, rowTemplates, function(element)
        if element.Kind == "Note" then return self:MeasureText(element.Text, "GameFontDisable", self:PageWidth() - 32) + 8 end
        return rowTemplates[element.Kind][2]
    end)
    InitList(self, self.HelpScrollBox, self.HelpScrollBar, {
        HelpText = { "Krowi_OptionsHelpTextTemplate" },
        HelpPicture = { "Krowi_OptionsHelpPictureTemplate" },
    }, function(element)
        if element.Kind == "HelpPicture" then return element.DrawHeight + 10 end
        return self:MeasureText(element.Text, element.Font, helpWidth - 52) + (element.Gap or 6)
    end)

    self.SearchBox:HookScript("OnTextChanged", function(box, userInput) if userInput then self:OnSearch(box:GetText()) end end)
    self.SearchBox:HookScript("OnHide", function(box) box:SetText("") end)
    self.CollapseButton:SetScript("OnClick", function() self:SetPaneCollapsed(true) end)
    self.ExpandButton:SetScript("OnClick", function() self:SetPaneCollapsed(false) end)
    -- Show me closes the window first, then shows the feature (the help track's decision, plan-help.md)
    self.ShowMeButton:SetScript("OnClick", function()
        local help = self.Help
        if InCombatLockdown() or not (help and help.ShowMe) then return end
        self:Hide()
        help.ShowMe()
    end)
    self.DefaultsButton:SetScript("OnClick", function() self:AskDefaults() end)
    self.ReloadButton:SetScript("OnClick", function() if not InCombatLockdown() then ReloadUI() end end)
    self.ResizeButton:SetScript("OnMouseDown", function() self:StartSizing("BOTTOMRIGHT") end)
    self.ResizeButton:SetScript("OnMouseUp", function()
        self:StopMovingOrSizing()
        self.Saved.Size = { self:GetWidth(), self:GetHeight() }
        self:ReloadSection()
    end)
end

function Krowi_OptionsWindowMixin:Init(config)
    self.Config, self.Strings = config, config.Strings
    self.Saved = type(config.Saved) == "function" and config.Saved() or config.Saved
    if self.TitleContainer and self.SetTitle then self:SetTitle(config.Title) elseif self.TitleText then self.TitleText:SetText(config.Title) end
    if config.Icon and self.SetPortraitToAsset then
        self:SetPortraitToAsset(config.Icon)
    elseif ButtonFrameTemplate_HidePortrait then
        ButtonFrameTemplate_HidePortrait(self)
    end
    self.SearchBox.Instructions:SetText(self.Strings.Search or "")
    self.DefaultsButton:SetText(self.Strings.Defaults)
    self.ReloadButton:SetText(self.Strings.ReloadNow)
    self.ReloadText:SetText(self.Strings.ReloadText)
    self.ShowMeButton:SetText(self.Strings.ShowMe)

    local saved = self.Saved
    if saved.Size then self:SetSize(math.max(saved.Size[1], minWidth), math.max(saved.Size[2], minHeight)) end
    if saved.Point then
        self:ClearAllPoints()
        self:SetPoint(saved.Point[1], UIParent, saved.Point[2], saved.Point[3], saved.Point[4])
    end
    self.PaneCollapsed = saved.PaneCollapsed and true or false

    StaticPopupDialogs["KROWI_OPTIONS_DEFAULTS"] = StaticPopupDialogs["KROWI_OPTIONS_DEFAULTS"] or {
        text = "%s",
        button1 = YES,
        button2 = NO,
        OnAccept = function(_, data) data.Window:ResetSection(data.Id) end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
    }
    self:Layout()
end

function Krowi_OptionsWindowMixin:MeasureText(text, font, width)
    self.Measure:SetFontObject(font)
    self.Measure:SetWidth(math.max(width, 50))
    self.Measure:SetText(text or "")
    return math.ceil(self.Measure:GetStringHeight())
end

function Krowi_OptionsWindowMixin:PageWidth()
    return self:GetWidth() - navWidth - (self.PaneCollapsed and stripWidth or helpWidth) - 40
end

function Krowi_OptionsWindowMixin:Layout()
    local inset = self.Inset
    local right = self.PaneCollapsed and stripWidth or helpWidth

    self.NavBackground:ClearAllPoints()
    self.NavBackground:SetPoint("TOPLEFT", inset, "TOPLEFT", 3, -3)
    self.NavBackground:SetPoint("BOTTOMLEFT", inset, "BOTTOMLEFT", 3, 3)
    self.NavBackground:SetWidth(navWidth)
    self.SearchBox:ClearAllPoints()
    self.SearchBox:SetPoint("TOPLEFT", inset, "TOPLEFT", 16, -8)
    self.SearchBox:SetWidth(navWidth - 26)
    self.NavScrollBox:ClearAllPoints()
    self.NavScrollBox:SetPoint("TOPLEFT", inset, "TOPLEFT", 4, -34)
    self.NavScrollBox:SetPoint("BOTTOMLEFT", inset, "BOTTOMLEFT", 4, 4)
    self.NavScrollBox:SetWidth(navWidth - 14)
    self.NavScrollBar:ClearAllPoints()
    self.NavScrollBar:SetPoint("TOPLEFT", self.NavScrollBox, "TOPRIGHT", 0, 0)
    self.NavScrollBar:SetPoint("BOTTOMLEFT", self.NavScrollBox, "BOTTOMRIGHT", 0, 0)

    self.HelpBackground:ClearAllPoints()
    self.HelpBackground:SetPoint("TOPRIGHT", inset, "TOPRIGHT", -3, -3)
    self.HelpBackground:SetPoint("BOTTOMRIGHT", inset, "BOTTOMRIGHT", -3, 3)
    self.HelpBackground:SetWidth(right)
    self.CollapseButton:ClearAllPoints()
    self.CollapseButton:SetPoint("TOPRIGHT", inset, "TOPRIGHT", -8, -6)
    self.ExpandButton:ClearAllPoints()
    self.ExpandButton:SetPoint("TOPRIGHT", inset, "TOPRIGHT", -5, -6)
    self.HelpKicker:ClearAllPoints()
    self.HelpKicker:SetPoint("TOPLEFT", self.HelpBackground, "TOPLEFT", 16, -12)
    self.HelpScrollBox:ClearAllPoints()
    self.HelpScrollBox:SetPoint("TOPLEFT", self.HelpBackground, "TOPLEFT", 12, -32)
    self.HelpScrollBox:SetPoint("BOTTOMRIGHT", self.HelpBackground, "BOTTOMRIGHT", -24, 44)
    self.HelpScrollBar:ClearAllPoints()
    self.HelpScrollBar:SetPoint("TOPLEFT", self.HelpScrollBox, "TOPRIGHT", 4, 0)
    self.HelpScrollBar:SetPoint("BOTTOMLEFT", self.HelpScrollBox, "BOTTOMRIGHT", 4, 0)
    self.ShowMeButton:ClearAllPoints()
    self.ShowMeButton:SetPoint("BOTTOMLEFT", self.HelpBackground, "BOTTOMLEFT", 14, 12)
    self.ShowMeNote:ClearAllPoints()
    self.ShowMeNote:SetPoint("LEFT", self.ShowMeButton, "RIGHT", 8, 0)
    self.ShowMeNote:SetPoint("RIGHT", self.HelpBackground, "RIGHT", -10, 0)

    for _, region in ipairs({ self.CollapseButton, self.HelpKicker, self.HelpScrollBox, self.HelpScrollBar }) do
        region:SetShown(not self.PaneCollapsed)
    end
    self.ExpandButton:SetShown(self.PaneCollapsed)
    self:UpdateShowMe()

    self.PageTitle:ClearAllPoints()
    self.PageTitle:SetPoint("TOPLEFT", inset, "TOPLEFT", navWidth + 20, -10)
    self.PageTitle:SetPoint("RIGHT", self.HelpBackground, "LEFT", -130, 0)
    self.DefaultsButton:ClearAllPoints()
    self.DefaultsButton:SetPoint("TOPRIGHT", self.HelpBackground, "TOPLEFT", -14, -8)
    self.ChangedText:ClearAllPoints()
    self.ChangedText:SetPoint("RIGHT", self.DefaultsButton, "LEFT", -8, 0)
    self.PageScrollBox:ClearAllPoints()
    self.PageScrollBox:SetPoint("TOPLEFT", inset, "TOPLEFT", navWidth + 8, -40)
    self.PageScrollBox:SetPoint("BOTTOMRIGHT", self.HelpBackground, "BOTTOMLEFT", -20, 0)
    self.PageScrollBar:ClearAllPoints()
    self.PageScrollBar:SetPoint("TOPLEFT", self.PageScrollBox, "TOPRIGHT", 4, 0)
    self.PageScrollBar:SetPoint("BOTTOMLEFT", self.PageScrollBox, "BOTTOMRIGHT", 4, 0)

    self.ReloadBackground:ClearAllPoints()
    self.ReloadBackground:SetPoint("TOPLEFT", inset, "BOTTOMLEFT", 0, -2)
    self.ReloadBackground:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -24, 4)
    self.ReloadText:ClearAllPoints()
    self.ReloadText:SetPoint("LEFT", self.ReloadBackground, "LEFT", 12, 0)
    self.ReloadButton:ClearAllPoints()
    self.ReloadButton:SetPoint("LEFT", self.ReloadText, "RIGHT", 12, 0)
end

function Krowi_OptionsWindowMixin:SetPaneCollapsed(collapsed)
    self.PaneCollapsed = collapsed
    self.Saved.PaneCollapsed = collapsed
    self:Layout()
    self:ReloadSection()
end

function Krowi_OptionsWindowMixin:OnShow()
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
end

function Krowi_OptionsWindowMixin:OnHide()
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE)
    self:UnregisterEvent("PLAYER_REGEN_DISABLED")
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    self:HideTooltip()
    self:ReleaseShowMe()
end

-- PLAYER_REGEN_DISABLED runs just before the lockdown starts, so InCombatLockdown() is still false inside it
function Krowi_OptionsWindowMixin:OnEvent(event)
    self.CombatStarting = event == "PLAYER_REGEN_DISABLED"
    self:Refresh()
    self.CombatStarting = nil
end

function Krowi_OptionsWindowMixin:InCombat()
    return self.CombatStarting or InCombatLockdown()
end

function Krowi_OptionsWindowMixin:OnSizeChanged() end

function Krowi_OptionsWindowMixin:OnDragStart()
    self:StartMoving()
end

function Krowi_OptionsWindowMixin:OnDragStop()
    self:StopMovingOrSizing()
    local point, _, relativePoint, x, y = self:GetPoint(1)
    self.Saved.Point = { point, relativePoint, x, y }
end

function Krowi_OptionsWindowMixin:Open(sectionId)
    self:Show()
    self:ShowSection(sectionId or self.Config.Landing())
end

-- [[ Navigation and the page ]] --
function Krowi_OptionsWindowMixin:RefreshNav()
    local config = self.Config
    local list = { { Kind = "NavButton", Id = "overview", Text = self.Strings.Overview, IsNew = false } }
    for _, group in ipairs(config.Groups) do
        list[#list + 1] = { Kind = "NavHeader", Text = group.Name }
        for _, id in ipairs(group.Sections) do
            list[#list + 1] = { Kind = "NavButton", Id = id, Text = config.SectionName(id), IsNew = config.IsNew(id) }
        end
    end
    self.NavScrollBox:SetDataProvider(CreateDataProvider(list), ScrollBoxConstants.RetainScrollPosition)
end

-- Grids and tab lists draw as several rows; hidden options are left out
local function Flatten(elements)
    local list = {}
    for _, element in ipairs(elements) do
        if element.Kind == "Grid" then
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
        elseif rowTemplates[element.Kind] then
            list[#list + 1] = element
        end
    end
    return list
end

function Krowi_OptionsWindowMixin:ShowSection(id, optionId)
    local config = self.Config
    self.SectionId = id
    self.Searching = nil
    self.Saved.LastSection = id
    if self.SearchBox:GetText() ~= "" then self.SearchBox:SetText("") end
    config.OnSectionShown(id)
    self.PageTitle:SetText(id == "overview" and self.Strings.Overview or config.SectionName(id))
    self.DefaultsButton:SetShown(id ~= "overview")
    self:RefreshNav()
    self:FillPage(ScrollBoxConstants.DiscardScrollPosition)
    self:ShowSectionHelp()
    if optionId then self:ScrollToOption(optionId) end
end

function Krowi_OptionsWindowMixin:FillPage(scrollPosition)
    self.Elements = Flatten(self.Config.GetElements(self.SectionId))
    self.PageScrollBox:SetDataProvider(CreateDataProvider(self.Elements), scrollPosition)
    self:RefreshFooter()
end

-- Rebuilds the page in place, keeping the scroll position: after a change that can show or hide options
function Krowi_OptionsWindowMixin:ReloadSection()
    if not self:IsShown() or not self.SectionId then return end
    if self.Searching then
        self:OnSearch(self.SearchBox:GetText())
        return
    end
    self:FillPage(ScrollBoxConstants.RetainScrollPosition)
end

function Krowi_OptionsWindowMixin:Refresh()
    if not self:IsShown() then return end
    self.PageScrollBox:ForEachFrame(function(frame)
        if frame.Refresh then frame:Refresh() end
    end)
    self:RefreshFooter()
    self:UpdateShowMe()
end

function Krowi_OptionsWindowMixin:RefreshFooter()
    local count = (not self.Searching and self.SectionId ~= "overview") and self.Config.ChangedCount(self.SectionId) or 0
    self.ChangedText:SetText(count > 0 and self.Strings.ChangedCount:format(count) or "")
    self.DefaultsButton:SetEnabled(count > 0)
    local reload = self.ReloadPending and true or false
    self.ReloadBackground:SetShown(reload)
    self.ReloadText:SetShown(reload)
    self.ReloadButton:SetShown(reload)
    self.ReloadButton:SetEnabled(not self:InCombat())
end

function Krowi_OptionsWindowMixin:OnOptionChanged(option)
    if option and option.GetNeedsReload and option:GetNeedsReload() then self.ReloadPending = true end
    self:ReloadSection()
    self:RefreshNav()
end

function Krowi_OptionsWindowMixin:ScrollToOption(optionId)
    for _, element in ipairs(self.Elements or {}) do
        if element.Option and element.Option.Id == optionId then
            self.PageScrollBox:ScrollToElementData(element, ScrollBoxConstants.AlignCenter)
            return
        end
    end
end

function Krowi_OptionsWindowMixin:AskDefaults()
    local id = self.SectionId
    if not id or id == "overview" then return end
    StaticPopup_Show("KROWI_OPTIONS_DEFAULTS", self.Strings.ResetSection:format(self.Config.SectionName(id)), nil, { Window = self, Id = id })
end

function Krowi_OptionsWindowMixin:ResetSection(id)
    self.Config.ResetSection(id)
    self:ReloadSection()
end

-- [[ Search ]] --
function Krowi_OptionsWindowMixin:OnSearch(text)
    text = text and text:gsub("^%s+", ""):gsub("%s+$", "") or ""
    if #text < 2 then
        if self.Searching then self:ShowSection(self.SectionId) end
        return
    end
    self.Searching = true
    self.PageTitle:SetText(self.Strings.SearchResults)
    self.DefaultsButton:Hide()
    self.ChangedText:SetText("")
    local list = {}
    for _, result in ipairs(self.Config.Search(text)) do
        list[#list + 1] = {
            Kind = "Link", Text = result.Label, Detail = result.Path,
            OnClick = function() self:ShowSection(result.SectionId, result.OptionId) end,
        }
    end
    if #list == 0 then list[1] = { Kind = "Note", Text = self.Strings.NoResults } end
    self.Elements = list
    self.PageScrollBox:SetDataProvider(CreateDataProvider(list), ScrollBoxConstants.DiscardScrollPosition)
    self:RefreshNav()
end

-- [[ The help pane, or the tooltip while the pane is collapsed ]] --
local function TextBlock(text, font, gap)
    return { Kind = "HelpText", Text = text, Font = font, Gap = gap }
end

function Krowi_OptionsWindowMixin:FillHelp(blocks)
    self.HelpScrollBox:SetDataProvider(CreateDataProvider(blocks), ScrollBoxConstants.DiscardScrollPosition)
end

function Krowi_OptionsWindowMixin:ShowSectionHelp()
    self.HoverOption = nil
    local help = self.Config.GetHelp(self.SectionId)
    self.Help = help
    self.HelpKicker:SetText(self.Strings.HowItWorks)
    local blocks = {}
    local title = help and help.Title or (self.SectionId == "overview" and self.Strings.Overview or self.Config.SectionName(self.SectionId))
    blocks[#blocks + 1] = TextBlock(title, "GameFontNormalLarge", 10)
    local innerWidth = helpWidth - 52
    for _, block in ipairs(help and help.Blocks or {}) do
        if block.Picture then
            local width = math.min(block.Width or innerWidth, innerWidth)
            local height = (block.Height or width) * width / (block.Width or width)
            blocks[#blocks + 1] = { Kind = "HelpPicture", Picture = block.Picture, DrawWidth = width, DrawHeight = height, TexCoords = block.TexCoords }
        elseif block.Heading then
            blocks[#blocks + 1] = TextBlock(block.Heading, "GameFontHighlight", 4)
        elseif block.Term then
            blocks[#blocks + 1] = TextBlock(NORMAL_FONT_COLOR:WrapTextInColorCode(block.Term) .. ": " .. (block.Text or ""), "GameFontHighlightSmall", 6)
        elseif block.Text then
            blocks[#blocks + 1] = TextBlock(block.Text, "GameFontHighlightSmall", 8)
        end
    end
    self:FillHelp(blocks)
    self:UpdateShowMe()
end

-- Show me: help.ShowMe (a plain function), or help.ShowMeSecure(button, close) for a feature that needs a secure
-- button laid over ours (the map's). ShowMeSecure is called only while that section's own help is drawn and
-- ShowMeSecure(nil) releases its button as soon as it is not (another section, an option's description, the pane
-- collapsed, the window hidden). In combat it releases its button itself and returns true: ours stays, greyed. It returns
-- false when it cannot lay one over at all; then ours hides and help.ShowMeNote (a string or a function returning one)
-- explains what to do instead.
function Krowi_OptionsWindowMixin:ReleaseShowMe()
    if self.SecureHelp then
        self.SecureHelp.ShowMeSecure(nil)
        self.SecureHelp = nil
    end
end

function Krowi_OptionsWindowMixin:UpdateShowMe()
    local help = self.Help
    local visible = self:IsShown() and not self.PaneCollapsed and not self.HoverOption and help and (help.ShowMe ~= nil or help.ShowMeSecure ~= nil)
    local secure = visible and help.ShowMeSecure and help or nil
    if self.SecureHelp ~= secure then self:ReleaseShowMe() end
    local note
    local showButton = visible and true or false
    if secure then
        showButton = help.ShowMeSecure(self.ShowMeButton, function() self:Hide() end) ~= false
        self.SecureHelp = showButton and help or nil
    end
    if visible and not showButton and help.ShowMeNote then
        note = type(help.ShowMeNote) == "function" and help.ShowMeNote() or help.ShowMeNote
    end
    local inCombat = self:InCombat()
    if showButton and inCombat then note = self.Strings.NotInCombat end
    self.ShowMeButton:SetShown(showButton)
    self.ShowMeButton:SetEnabled(not inCombat)
    self.ShowMeNote:ClearAllPoints()
    if showButton then
        self.ShowMeNote:SetPoint("LEFT", self.ShowMeButton, "RIGHT", 8, 0)
    else
        self.ShowMeNote:SetPoint("BOTTOMLEFT", self.HelpBackground, "BOTTOMLEFT", 16, 16)
    end
    self.ShowMeNote:SetPoint("RIGHT", self.HelpBackground, "RIGHT", -10, 0)
    self.ShowMeNote:SetText(note or "")
    self.ShowMeNote:SetShown(note ~= nil)
end

local function OptionHelpLines(window, option)
    local strings = window.Strings
    local lines = {}
    local desc = option.GetDescription and option:GetDescription() or ""
    local hasDefault, default = false, nil
    if option.GetDefault then hasDefault, default = option:GetDefault() end
    if hasDefault then
        local text = option.FormatValue and option:FormatValue(default) or tostring(default)
        lines[#lines + 1] = strings.Default:format(text)
    end
    if option.GetNeedsReload and option:GetNeedsReload() then lines[#lines + 1] = strings.NeedsReload end
    if option.IsChanged and option:IsChanged() then lines[#lines + 1] = strings.Changed end
    return desc, lines
end

function Krowi_OptionsWindowMixin:OnRowEnter(option, row)
    if not option then return end
    local desc, lines = OptionHelpLines(self, option)
    if self.PaneCollapsed then
        local tooltip = Krowi_Tooltip or GameTooltip
        tooltip:SetOwner(row, "ANCHOR_RIGHT")
        tooltip:AddLine(option:GetLabel(), 1, 1, 1)
        if desc ~= "" then tooltip:AddLine(desc, nil, nil, nil, true) end
        for _, line in ipairs(lines) do tooltip:AddLine(line, 0.6, 0.6, 0.6, true) end
        tooltip:Show()
        self.TooltipShown = tooltip
        return
    end
    self.HoverOption = option
    self.HelpKicker:SetText(self.Config.SectionName(self.SectionId) or "")
    local blocks = { TextBlock(option:GetLabel(), "GameFontNormalLarge", 10) }
    if desc ~= "" then blocks[#blocks + 1] = TextBlock(desc, "GameFontHighlightSmall", 10) end
    for _, line in ipairs(lines) do blocks[#blocks + 1] = TextBlock(line, "GameFontDisableSmall", 4) end
    self:FillHelp(blocks)
    self:UpdateShowMe()
end

function Krowi_OptionsWindowMixin:OnRowLeave()
    if self.PaneCollapsed then
        self:HideTooltip()
        return
    end
    if self.HoverOption then self:ShowSectionHelp() end
end

function Krowi_OptionsWindowMixin:HideTooltip()
    if self.TooltipShown then
        self.TooltipShown:Hide()
        self.TooltipShown = nil
    end
end