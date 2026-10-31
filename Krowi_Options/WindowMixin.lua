--[[
    Copyright (c) 2026 Krowi
    Licensed under the terms of the LICENSE file in this repository.
]]

---@diagnostic disable: undefined-global

-- The window: a tab per registered addon on top, the open addon's navigation on the left, the section's rows in the
-- middle, the help pane on the right, in the frame and art of the game's own Options window. Strings come from the open
-- tab's consumer (config.Strings): Search, SearchAll, HeadingLines, Overview, SearchResults, NoResults, Defaults, ResetSection (with
-- %s), ChangedCount (with %d), ReloadText, ReloadNow, ShowMe, HowItWorks, All, None, NotBound, PressAKey, Default
-- (with %s), NeedsReload, Changed, NotInCombat.

local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")

-- The navigation is as wide as the game's category list, so its header bars (199 px) end at the divider
local navWidth, helpWidth, stripWidth = 199, 380, 30
local minWidth, minHeight = 1000, 560

-- [[ Navigation ]] --
-- The game's category list (Blizzard_CategoryList.lua): a group under a header bar, a section gold, the selected one
-- white on the active bar, the hovered one on the hover bar
Krowi_OptionsNavButtonMixin = {}

function Krowi_OptionsNavButtonMixin:Init(element, window)
    self.Element, self.Window = element, window
    self.Label:SetText(element.Text)
    self.NewFeature:SetShown(element.IsNew)
    self.Selected = window.SectionId == element.Id and not window.Searching
    self.Over = self:IsMouseOver()
    self:UpdateState()
end

function Krowi_OptionsNavButtonMixin:UpdateState()
    self.Label:SetFontObject(self.Selected and "GameFontHighlight" or "GameFontNormal")
    if self.Selected or self.Over then
        self.Texture:SetAtlas(self.Selected and "Options_List_Active" or "Options_List_Hover", true)
        self.Texture:Show()
    else
        self.Texture:Hide()
    end
end

function Krowi_OptionsNavButtonMixin:OnEnter()
    self.Over = true
    self:UpdateState()
end

function Krowi_OptionsNavButtonMixin:OnLeave()
    self.Over = nil
    self:UpdateState()
end

function Krowi_OptionsNavButtonMixin:OnClick()
    self.Window:ShowSection(self.Element.Id)
end

Krowi_OptionsNavHeaderMixin = {}

function Krowi_OptionsNavHeaderMixin:Init(element)
    self.Label:SetText(element.Text)
    self.Background:SetAtlas("Options_CategoryHeader_" .. element.Index, true)
end

-- [[ Help pane blocks ]] --
Krowi_OptionsHelpTextMixin = {}

function Krowi_OptionsHelpTextMixin:Init(element)
    self.Text:SetFontObject(element.Font)
    self.Text:SetText(element.Text)
end

-- A picture enlarges on click (the window's lightbox); the magnifier cursor says so
Krowi_OptionsHelpPictureMixin = {}

function Krowi_OptionsHelpPictureMixin:Init(element, window)
    self.Element, self.Window = element, window
    self.Picture:SetTexture(element.Picture)
    self.Picture:SetSize(element.DrawWidth, element.DrawHeight)
    if element.TexCoords then self.Picture:SetTexCoord(unpack(element.TexCoords)) else self.Picture:SetTexCoord(0, 1, 0, 1) end
end

function Krowi_OptionsHelpPictureMixin:OnClick()
    self.Window:ShowPicture(self.Element)
end

function Krowi_OptionsHelpPictureMixin:OnEnter()
    SetCursor("INSPECT_CURSOR")
end

function Krowi_OptionsHelpPictureMixin:OnLeave()
    ResetCursor()
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

-- leftPad and spacing as the game's category list uses them (Blizzard_CategoryList.lua): its scroll box reaches 50 px
-- left of the list, so a NEW label hanging left of a section is not clipped, and the rows move back by as much
local function InitList(window, scrollBox, scrollBar, templates, extent, leftPad, spacing)
    local view = CreateScrollBoxListLinearView(0, 0, leftPad or 0, 0, spacing or 0)
    view:SetElementFactory(function(factory, element)
        local template = templates[element.Kind]
        factory(template[1], function(frame, data) if frame.Init then frame:Init(data, window) end end)
    end)
    view:SetElementExtentCalculator(function(_, element) return extent(element) end)
    ScrollUtil.InitScrollBoxListWithScrollBar(scrollBox, scrollBar, view)
    return ScrollUtil.AddManagedScrollBarVisibilityBehavior(scrollBox, scrollBar)
end

local navExtents = { NavHeader = 30, NavButton = 20, NavSpacer = 18 }
local navLeftPad = 50

-- [[ The inner frame ]] --
-- The game's own inner frame (Options_InnerFrame, 886 x 618 and the same on every client), which
-- Blizzard_SettingsPanel.xml draws at its size in a window of fixed size. Ours is wider for the help pane and resizable,
-- so it is drawn in slices: the shaded edges and the 2 px divider keep their size and only the flat parts stretch, and
-- the divider is drawn at the end of the navigation and again at the start of the help pane. The cuts were measured on
-- the atlas with the kit's Get-Atlas.ps1: x from, x to, and y from, y to, in its pixels.
local innerColumns = { Left = { 0, 30 }, Nav = { 30, 199 }, Divider = { 199, 201 }, Flat = { 201, 856 }, Right = { 856, 886 } }
local innerRows = { Top = { 0, 90 }, Middle = { 90, 440 }, Bottom = { 440, 618 } }
local innerSlices = { -- left to right: a slice's piece of the atlas
    { Key = "Left", Atlas = "Left" }, { Key = "Nav", Atlas = "Nav" }, { Key = "Divider", Atlas = "Divider" },
    { Key = "Page", Atlas = "Flat" }, { Key = "HelpDivider", Atlas = "Divider" }, { Key = "Help", Atlas = "Flat" },
    { Key = "Right", Atlas = "Right" },
}

function Krowi_OptionsWindowMixin:CreateInnerFrame()
    local info = C_Texture.GetAtlasInfo("Options_InnerFrame")
    if not info then return end
    local function U(x) return info.leftTexCoord + (info.rightTexCoord - info.leftTexCoord) * x / info.width end
    local function V(y) return info.topTexCoord + (info.bottomTexCoord - info.topTexCoord) * y / info.height end
    self.InnerSlices = {}
    for _, column in ipairs(innerSlices) do
        local x = innerColumns[column.Atlas]
        for row, y in next, innerRows do
            -- Under the window's own text (the page title, the labels): the game draws its text in child frames above the art
            local slice = self:CreateTexture(nil, "BACKGROUND", nil, 1)
            slice:SetTexture(info.file or info.filename)
            slice:SetTexCoord(U(x[1]), U(x[2]), V(y[1]), V(y[2]))
            self.InnerSlices[column.Key .. row] = slice
        end
    end
end

-- Each slice spans an edge and offset of the inner frame to another, across and down
local innerRowAnchors = { Top = { "TOP", 0, "TOP", -90 }, Middle = { "TOP", -90, "BOTTOM", 178 }, Bottom = { "BOTTOM", 178, "BOTTOM", 0 } }

function Krowi_OptionsWindowMixin:LayoutInnerFrame(navEnd, right)
    if not self.InnerSlices then return end
    -- The frame starts 1 px left of the body: the divider's 2 px straddle the navigation's end and the help pane's start
    local divider, help = navEnd, right + 2
    local columns = {
        Left = { "LEFT", 0, "LEFT", 30 },
        Nav = { "LEFT", 30, "LEFT", divider },
        Divider = { "LEFT", divider, "LEFT", divider + 2 },
        Page = { "LEFT", divider + 2, "RIGHT", -help },
        HelpDivider = { "RIGHT", -help, "RIGHT", -help + 2 },
        Help = { "RIGHT", -help + 2, "RIGHT", -30 },
        Right = { "RIGHT", -30, "RIGHT", 0 },
    }
    local frame = self.InnerFrame
    for key, x in next, columns do
        for row, y in next, innerRowAnchors do
            local slice = self.InnerSlices[key .. row]
            slice:ClearAllPoints()
            slice:SetPoint("TOPLEFT", frame, y[1] .. x[1], x[2], y[2])
            slice:SetPoint("BOTTOMRIGHT", frame, y[3] .. x[3], x[4], y[4])
            slice:SetShown(key ~= "Help" or -help + 2 < -30) -- a collapsed pane leaves no room between its divider and the edge
        end
    end
end

function Krowi_OptionsWindowMixin:OnLoad()
    self:RegisterForDrag("LeftButton")
    if self.SetResizeBounds then self:SetResizeBounds(minWidth, minHeight) else self:SetMinResize(minWidth, minHeight) end

    -- A plain Hide on both: HideUIPanel, the template's own, refuses addon code in combat
    self.ClosePanelButton:SetScript("OnClick", function() self:Hide() end)
    self.CloseButton:SetScript("OnClick", function() self:Hide() end)
    self.CloseButton:SetText(CLOSE)
    self.NineSlice.Text:SetText(SETTINGS_TITLE) -- the game's own Options window's title
    self.TabButtons = {}
    self:CreateInnerFrame()

    self.Measure = self:CreateFontString(nil, "ARTWORK", "GameFontDisable")
    self.Measure:Hide()
    self.Measure:SetJustifyH("LEFT")

    local navBar = InitList(self, self.NavScrollBox, self.NavScrollBar, {
        NavHeader = { "Krowi_OptionsNavHeaderTemplate" },
        NavButton = { "Krowi_OptionsNavButtonTemplate" },
        NavSpacer = { "Krowi_OptionsNavSpacerTemplate" },
    }, function(element) return navExtents[element.Kind] end, navLeftPad, 2)
    self.NavScrollShown = self.NavScrollBar:IsShown()
    navBar:RegisterCallback(ManagedScrollBarVisibilityBehaviorMixin.Event.OnVisibilityChanged, function(_, shown) self:OnNavScrollBarShown(shown) end, self)
    InitList(self, self.PageScrollBox, self.PageScrollBar, rowTemplates, function(element)
        if element.Kind == "Note" then return self:MeasureText(element.Text, "GameFontDisable", self:PageWidth() - 32) + 8 end
        return rowTemplates[element.Kind][2]
    end)
    self.HelpBar = InitList(self, self.HelpScrollBox, self.HelpScrollBar, {
        HelpText = { "Krowi_OptionsHelpTextTemplate" },
        HelpPicture = { "Krowi_OptionsHelpPictureTemplate" },
    }, function(element)
        if element.Kind == "HelpPicture" then return element.DrawHeight + 10 end
        return self:MeasureText(element.Text, element.Font, helpWidth - 52) + (element.Gap or 6)
    end)
    -- The help is filled while the pane is collapsed too, and its scroll bar would then show on the strip
    self.HelpBar:RegisterCallback(ManagedScrollBarVisibilityBehaviorMixin.Event.OnVisibilityChanged, function(_, shown)
        if shown and self.PaneCollapsed then self.HelpScrollBar:Hide() end
    end, self)

    -- The lightbox dims the screen above everything of the window (and a secure Show me button laid over it); a click
    -- closes it, and the consumer's Escape handling can close it like a window (OnCreated gets frame.Lightbox)
    self.Lightbox:SetAllPoints(UIParent)
    self.Lightbox:SetScript("OnClick", function(lightbox) lightbox:Hide() end)

    -- The search follows what the player types; the box's clear button and the window's OnHide empty it without user
    -- input, which ends a search too
    self.SearchBox:HookScript("OnTextChanged", function(box, userInput) if userInput or self.Searching then self:OnSearch(box:GetText()) end end)
    self.SearchBox:HookScript("OnHide", function(box) box:SetText("") end)
    -- Every tab instead of the selected one (unticked by default); kept for every addon like the window's place
    self.SearchAll:SetScript("OnClick", function(button)
        self.SearchEveryTab = button:GetChecked() and true or false
        lib.SetShared("SearchAll", self.SearchEveryTab)
        if self.Searching then self:OnSearch(self.SearchBox:GetText()) end
    end)
    -- Lines under the page's group headings, the player's choice, kept for every addon like the window's place
    self.HeadingLines:SetScript("OnClick", function(button)
        self.ShowHeadingLines = button:GetChecked() and true or false
        lib.SetShared("HeadingLines", self.ShowHeadingLines)
        self:ReloadSection()
    end)
    self.CollapseButton:SetScript("OnClick", function() self:SetPaneCollapsed(true) end)
    self.ExpandButton:SetScript("OnClick", function() self:SetPaneCollapsed(false) end)
    -- » hides the pane, « brings it back; gold, white under the mouse, as the window's other links
    self.CollapseButton.Arrow:SetText("\194\187")
    self.ExpandButton.Arrow:SetText("\194\171")
    self.ExpandButton.Label:SetRotation(-math.pi / 2) -- reads downwards
    for _, button in ipairs({ self.CollapseButton, self.ExpandButton }) do
        button:SetScript("OnEnter", function()
            button.Arrow:SetFontObject("GameFontHighlightLarge")
            if button.Label then button.Label:SetFontObject("GameFontHighlightSmall") end
        end)
        button:SetScript("OnLeave", function()
            button.Arrow:SetFontObject("GameFontNormalLarge")
            if button.Label then button.Label:SetFontObject("GameFontDisableSmall") end
        end)
    end
    -- Show me closes the window first, then shows the feature (the help track's decision, plan-help.md). The window stays
    -- while help.CanShowMe() is false (the data still loading), and comes back when ShowMe returns false (its scene had
    -- nothing to open, such as no tab shown).
    self.ShowMeButton:SetScript("OnClick", function()
        local help = self.Help
        if InCombatLockdown() or not (help and help.ShowMe) then return end
        if help.CanShowMe and not help.CanShowMe() then return end
        self:Hide()
        if help.ShowMe() == false then self:Show() end
    end)
    self.DefaultsButton:SetScript("OnClick", function() self:OnDefaultsClick() end)
    self.CancelButton:SetScript("OnClick", function() self:CancelConfirm() end)
    self.ReloadButton:SetScript("OnClick", function() if not InCombatLockdown() then ReloadUI() end end)
    self.ResizeButton:SetScript("OnMouseDown", function() self:StartSizing("BOTTOMRIGHT") end)
    self.ResizeButton:SetScript("OnMouseUp", function()
        self:StopMovingOrSizing()
        lib.SetShared("Size", { self:GetWidth(), self:GetHeight() })
        self:SavePoint() -- sizing re-anchors the window
        self:ReloadSection()
        self:UpdateShowMe() -- a secure Show me button placed over ours follows it
    end)
end

-- The window's own state, from the saved table of the addon that opened it first; every addon keeps a copy (lib.SetShared)
function Krowi_OptionsWindowMixin:Init(saved)
    if saved.Size then self:SetSize(math.max(saved.Size[1], minWidth), math.max(saved.Size[2], minHeight)) end
    if saved.Point then
        self:ClearAllPoints()
        self:SetPoint(saved.Point[1], UIParent, saved.Point[2], saved.Point[3], saved.Point[4])
    end
    self.PaneCollapsed = saved.PaneCollapsed and true or false
    self.SearchEveryTab = saved.SearchAll and true or false
    self.SearchAll:SetChecked(self.SearchEveryTab)
    self.ShowHeadingLines = saved.HeadingLines and true or false
    self.HeadingLines:SetChecked(self.ShowHeadingLines)
    self:Layout()
end

-- [[ Tabs ]] --
-- A tab per registered addon where the game's window has Game and AddOns (Blizzard_SettingsPanel.xml). Our own click
-- replaces MinimalTabTemplate's, which would let a click on the open tab unselect it.
function Krowi_OptionsWindowMixin:RefreshTabs()
    local tabs = lib.Tabs
    for i, tab in ipairs(tabs) do
        local button = self.TabButtons[i]
        if not button then
            button = CreateFrame("Button", nil, self, "MinimalTabTemplate")
            button:SetHeight(37)
            if i == 1 then
                button:SetPoint("TOPLEFT", self, "TOPLEFT", 32, -27)
            else
                button:SetPoint("TOPLEFT", self.TabButtons[i - 1], "TOPRIGHT", 5, 0)
            end
            button:SetScript("OnClick", function(clicked)
                if clicked.Tab == self.Tab then return end
                PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
                self:ShowTab(clicked.Tab)
            end)
            self.TabButtons[i] = button
        end
        button.Tab = tab
        button.Text:SetText(tab.Config.TabName)
        button:SetWidth(button.Text:GetStringWidth() + 40)
        button:SetSelected(tab == self.Tab)
        button:Show()
    end
    for i = #tabs + 1, #self.TabButtons do
        self.TabButtons[i]:Hide()
    end
    -- The open tab went (a test's): the first one takes its place
    if self.Tab and not tContains(tabs, self.Tab) then
        self.Tab = nil
        if self:IsShown() and tabs[1] then self:ShowTab(tabs[1]) end
    end
end

-- Shows the window on an addon's tab: its sections, strings and saved table, at sectionId or the addon's landing section
function Krowi_OptionsWindowMixin:ShowTab(tab, sectionId, optionId)
    if self.Tab ~= tab then
        self:EndKeyCaptures()
        self:ReleaseShowMe()
        self.Tab = tab
        self.Config, self.Strings, self.Saved = tab.Config, tab.Config.Strings, tab:GetSaved()
        self.SectionId, self.Help, self.Searching, self.Confirming = nil, nil, nil, nil
        self:ApplyStrings()
        self:RefreshTabs()
    end
    self:Show()
    self:ShowSection(sectionId or self.Config.Landing(), optionId)
end

function Krowi_OptionsWindowMixin:ApplyStrings()
    local strings = self.Strings
    self.SearchBox.Instructions:SetText(strings.Search or "")
    self.SearchAllLabel:SetText(strings.SearchAll or "")
    self.SearchAll:SetHitRectInsets(0, -(self.SearchAllLabel:GetStringWidth() + 4), 0, 0) -- the label ticks it too
    self.HeadingLinesLabel:SetText(strings.HeadingLines or "")
    self.HeadingLines:SetHitRectInsets(0, -(self.HeadingLinesLabel:GetStringWidth() + 4), 0, 0)
    -- The collapsed pane's strip: the chevron, then the pane's name down the strip; the whole strip brings the pane back.
    -- A turned text turns about its centre, so it hangs below the chevron by half its length; its letters sit off the
    -- line's middle, so it moves right to stand under the chevron (measured in game, 2026-10-30)
    local label = self.ExpandButton.Label
    label:SetText(strings.HowItWorks or "") -- as the open pane writes it; upper() would leave non-English letters small
    local length = label:GetStringWidth()
    label:ClearAllPoints()
    label:SetPoint("CENTER", self.ExpandButton, "TOP", 6, -(28 + length / 2))
    self.ExpandButton:SetHeight(34 + length)
    self.DefaultsButton:SetText(strings.Defaults)
    self.ReloadButton:SetText(strings.ReloadNow)
    self.ReloadText:SetText(strings.ReloadText)
    self.ShowMeButton:SetText(strings.ShowMe)
    self.CancelButton:SetText(strings.No or NO)
end

function Krowi_OptionsWindowMixin:MeasureText(text, font, width)
    self.Measure:SetFontObject(font)
    self.Measure:SetWidth(math.max(width, 50))
    self.Measure:SetText(text or "")
    return math.ceil(self.Measure:GetStringHeight())
end

-- The body: under the tabs and above the bottom row, where the game's window has its category list and its settings
-- (Blizzard_SettingsPanel.xml: the list at 18, -76, the bottom buttons at 16)
local bodyInsets = { Left = 18, Top = -76, Right = -18, Bottom = 46 }
local navBarSpace = 16 -- what the game's list keeps for its scroll bar; the divider and the page move right by it while it shows
-- The list's scroll bar, 8 wide, from the list's end: halfway between the edge of the header art (197, measured on the
-- atlas) and the divider (214 while the bar shows)
local navBarX = 2.5

-- Where the navigation ends and its divider stands: right after the list, where the game's window has it, or past the
-- list's scroll bar while not all of it fits
function Krowi_OptionsWindowMixin:NavEnd()
    return self.NavScrollShown and navWidth + navBarSpace or navWidth
end

function Krowi_OptionsWindowMixin:OnNavScrollBarShown(shown)
    if self.NavScrollShown == shown then return end
    self.NavScrollShown = shown
    -- Showing a section or a search fills the page after the navigation, already at the new width: it lays out once
    -- it is done (EndFill), instead of building the page twice
    if self.Filling then
        self.LayoutPending = true
        return
    end
    self:Layout()
    self:ReloadSection() -- the page is wider or narrower, so its notes are measured again
end

function Krowi_OptionsWindowMixin:EndFill()
    self.Filling = nil
    if self.LayoutPending then
        self.LayoutPending = nil
        self:Layout()
    end
end

-- The page's scroll box as Layout anchors it: from 8 past the navigation's end to 16 before the help pane
local pageInsets = { Left = 8, Right = 16 }

function Krowi_OptionsWindowMixin:PageWidth()
    return self:GetWidth() - (bodyInsets.Left - bodyInsets.Right) - self:NavEnd() - (self.PaneCollapsed and stripWidth or helpWidth)
        - pageInsets.Left - pageInsets.Right
end

function Krowi_OptionsWindowMixin:Layout()
    local body = self.Body
    local right = self.PaneCollapsed and stripWidth or helpWidth
    local navEnd = self:NavEnd()

    body:ClearAllPoints()
    body:SetPoint("TOPLEFT", self, "TOPLEFT", bodyInsets.Left, bodyInsets.Top)
    body:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", bodyInsets.Right, bodyInsets.Bottom)
    self:LayoutInnerFrame(navEnd, right)

    -- The search box sits in the tab row at the right, as the game's does
    self.SearchBox:ClearAllPoints()
    self.SearchBox:SetPoint("BOTTOMRIGHT", body, "TOPRIGHT", 0, 20)

    -- The scroll bars sit as the game's lists place theirs (Blizzard_CategoryList.xml, Blizzard_SettingsList.xml), each
    -- just inside the divider or edge after its list, apart from the navigation's, which stands halfway to its divider
    self.NavScrollBox:ClearAllPoints()
    self.NavScrollBox:SetPoint("TOPLEFT", body, "TOPLEFT", -navLeftPad, -4)
    self.NavScrollBox:SetPoint("BOTTOMLEFT", body, "BOTTOMLEFT", -navLeftPad, 4)
    self.NavScrollBox:SetWidth(navLeftPad + navWidth)
    self.NavScrollBar:ClearAllPoints()
    self.NavScrollBar:SetPoint("TOPLEFT", self.NavScrollBox, "TOPRIGHT", navBarX, 2)
    self.NavScrollBar:SetPoint("BOTTOMLEFT", self.NavScrollBox, "BOTTOMRIGHT", navBarX, 7)

    self.HelpBackground:ClearAllPoints()
    self.HelpBackground:SetPoint("TOPRIGHT", body, "TOPRIGHT")
    self.HelpBackground:SetPoint("BOTTOMRIGHT", body, "BOTTOMRIGHT")
    self.HelpBackground:SetWidth(right)
    self.CollapseButton:ClearAllPoints()
    self.CollapseButton:SetPoint("TOPRIGHT", body, "TOPRIGHT", -5, -3)
    self.ExpandButton:ClearAllPoints()
    self.ExpandButton:SetPoint("TOP", self.HelpBackground, "TOP", 0, -3)
    self.HelpKicker:ClearAllPoints()
    self.HelpKicker:SetPoint("TOPLEFT", self.HelpBackground, "TOPLEFT", 16, -12)
    self.HelpScrollBox:ClearAllPoints()
    self.HelpScrollBox:SetPoint("TOPLEFT", self.HelpBackground, "TOPLEFT", 12, -32)
    self.HelpScrollBox:SetPoint("BOTTOMRIGHT", self.HelpBackground, "BOTTOMRIGHT", -22, 44)
    self.HelpScrollBar:ClearAllPoints()
    self.HelpScrollBar:SetPoint("TOPLEFT", self.HelpScrollBox, "TOPRIGHT", 0, -4)
    self.HelpScrollBar:SetPoint("BOTTOMLEFT", self.HelpScrollBox, "BOTTOMRIGHT", -1, 7)
    self.ShowMeButton:ClearAllPoints()
    self.ShowMeButton:SetPoint("BOTTOMLEFT", self.HelpBackground, "BOTTOMLEFT", 14, 12)
    self.ShowMeNote:ClearAllPoints()
    self.ShowMeNote:SetPoint("LEFT", self.ShowMeButton, "RIGHT", 8, 0)
    self.ShowMeNote:SetPoint("RIGHT", self.HelpBackground, "RIGHT", -10, 0)

    for _, region in ipairs({ self.CollapseButton, self.HelpKicker, self.HelpScrollBox }) do
        region:SetShown(not self.PaneCollapsed)
    end
    -- The help's scroll bar hides with the pane, and comes back only when the help is longer than the pane
    if self.PaneCollapsed then
        self.HelpScrollBar:Hide()
    elseif self.HelpBar then
        self.HelpBar:EvaluateVisibility(true)
    end
    self.ExpandButton:SetShown(self.PaneCollapsed)
    self:UpdateShowMe()

    -- The page's header as the game's settings list draws it (Blizzard_SettingsList.xml): the title, Defaults at its
    -- right and the divider under both
    self.PageTitle:ClearAllPoints()
    self.PageTitle:SetPoint("TOPLEFT", body, "TOPLEFT", navEnd + 20, -22)
    self.PageTitle:SetPoint("RIGHT", self.HelpBackground, "LEFT", -130, 0)
    self.DefaultsButton:ClearAllPoints()
    self.DefaultsButton:SetPoint("TOPRIGHT", self.HelpBackground, "TOPLEFT", -14, -16)
    self.CancelButton:ClearAllPoints()
    self.CancelButton:SetPoint("RIGHT", self.DefaultsButton, "LEFT", -6, 0)
    self.Divider:ClearAllPoints()
    self.Divider:SetPoint("TOPLEFT", body, "TOPLEFT", navEnd + 8, -50)
    self.Divider:SetPoint("TOPRIGHT", self.HelpBackground, "TOPLEFT", -8, -50)
    self.PageScrollBox:ClearAllPoints()
    self.PageScrollBox:SetPoint("TOPLEFT", body, "TOPLEFT", navEnd + pageInsets.Left, -58)
    self.PageScrollBox:SetPoint("BOTTOMRIGHT", self.HelpBackground, "BOTTOMLEFT", -pageInsets.Right, 0)
    self.PageScrollBar:ClearAllPoints()
    self.PageScrollBar:SetPoint("TOPLEFT", self.PageScrollBox, "TOPRIGHT", 0, -4)
    self.PageScrollBar:SetPoint("BOTTOMLEFT", self.PageScrollBox, "BOTTOMRIGHT", -1, 7)

    -- The bottom row: the reload bar, the search scope and heading lines check boxes, and Close
    self.HeadingLinesLabel:ClearAllPoints()
    self.HeadingLinesLabel:SetPoint("RIGHT", self.CloseButton, "LEFT", -16, 0)
    self.HeadingLines:ClearAllPoints()
    self.HeadingLines:SetPoint("RIGHT", self.HeadingLinesLabel, "LEFT", -2, 0)
    self.SearchAllLabel:ClearAllPoints()
    self.SearchAllLabel:SetPoint("RIGHT", self.HeadingLines, "LEFT", -16, 0)
    self.SearchAll:ClearAllPoints()
    self.SearchAll:SetPoint("RIGHT", self.SearchAllLabel, "LEFT", -2, 0)
    self.ReloadBackground:ClearAllPoints()
    self.ReloadBackground:SetPoint("TOPLEFT", body, "BOTTOMLEFT", 0, -6)
    self.ReloadBackground:SetPoint("BOTTOMRIGHT", self.SearchAll, "BOTTOMLEFT", -12, -2)
    self.ReloadText:ClearAllPoints()
    self.ReloadText:SetPoint("LEFT", self.ReloadBackground, "LEFT", 12, 0)
    self.ReloadButton:ClearAllPoints()
    self.ReloadButton:SetPoint("LEFT", self.ReloadText, "RIGHT", 12, 0)
end

function Krowi_OptionsWindowMixin:SetPaneCollapsed(collapsed)
    self.PaneCollapsed = collapsed
    lib.SetShared("PaneCollapsed", collapsed)
    self:Layout()
    self:ReloadSection()
end

-- Events only while shown: combat greys what cannot run in it, a scale or resolution change moves a secure Show me
-- button laid over ours along
local shownEvents = { "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED", "UI_SCALE_CHANGED", "DISPLAY_SIZE_CHANGED" }

function Krowi_OptionsWindowMixin:OnShow()
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
    for _, event in ipairs(shownEvents) do self:RegisterEvent(event) end
    -- Shown again with its parent (the interface back after Alt+Z): OnHide released Show me, so lay it over again
    if self.SectionId then self:UpdateShowMe() end
end

-- A key capture ends with the window, at the start of combat, when another key button starts one and when its row is
-- reused
function Krowi_OptionsWindowMixin:EndKeyCaptures()
    self.PageScrollBox:ForEachFrame(function(frame)
        if frame.EndKeyCapture then frame:EndKeyCapture() end
    end)
end

function Krowi_OptionsWindowMixin:OnHide()
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE)
    for _, event in ipairs(shownEvents) do self:UnregisterEvent(event) end
    self:EndKeyCaptures()
    self.Confirming = nil
    self:HideTooltip()
    self:ReleaseShowMe()
end

-- PLAYER_REGEN_DISABLED runs just before the lockdown starts, so InCombatLockdown() is still false inside it
function Krowi_OptionsWindowMixin:OnEvent(event)
    if event == "UI_SCALE_CHANGED" or event == "DISPLAY_SIZE_CHANGED" then
        self:UpdateShowMe()
        return
    end
    self.CombatStarting = event == "PLAYER_REGEN_DISABLED"
    if self.CombatStarting then self:EndKeyCaptures() end
    self:Refresh()
    self.CombatStarting = nil
end

function Krowi_OptionsWindowMixin:InCombat()
    return self.CombatStarting or InCombatLockdown()
end

function Krowi_OptionsWindowMixin:OnSizeChanged()
    if self:IsShown() then self:UpdateShowMe() end -- also when the screen clamps the window
end

function Krowi_OptionsWindowMixin:OnDragStart()
    self:StartMoving()
end

function Krowi_OptionsWindowMixin:OnDragStop()
    self:StopMovingOrSizing()
    self:SavePoint()
    self:UpdateShowMe() -- a secure Show me button placed over ours follows it
end

function Krowi_OptionsWindowMixin:SavePoint()
    local point, _, relativePoint, x, y = self:GetPoint(1)
    lib.SetShared("Point", { point, relativePoint, x, y })
end

-- On the open tab, or the first one before any is open
function Krowi_OptionsWindowMixin:Open(sectionId)
    self:ShowTab(self.Tab or lib.Tabs[1], sectionId)
end

-- [[ Navigation and the page ]] --
-- The header bars take turns over Blizzard's three, as the game's list does (Blizzard_CategoryList.lua)
function Krowi_OptionsWindowMixin:RefreshNav()
    local config = self.Config
    local list = { { Kind = "NavButton", Id = "overview", Text = self.Strings.Overview, IsNew = false } }
    for i, group in ipairs(config.Groups) do
        list[#list + 1] = { Kind = "NavSpacer" }
        list[#list + 1] = { Kind = "NavHeader", Text = group.Name, Index = ((i - 1) % 3) + 1 }
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

-- keepSearchText: a search ended by emptying the box down to one letter keeps that letter
function Krowi_OptionsWindowMixin:ShowSection(id, optionId, keepSearchText)
    local config = self.Config
    self.SectionId = id
    self.Searching = nil
    self.Confirming = nil
    self.Saved.LastSection = id
    if not keepSearchText and self.SearchBox:GetText() ~= "" then self.SearchBox:SetText("") end
    config.OnSectionShown(id)
    self.PageTitle:SetText(id == "overview" and self.Strings.Overview or config.SectionName(id))
    self.DefaultsButton:SetShown(id ~= "overview")
    self.Filling = true
    self:RefreshNav()
    self:FillPage(ScrollBoxConstants.DiscardScrollPosition)
    self:ShowSectionHelp()
    self:EndFill()
    if optionId then self:ScrollToOption(optionId) end
end

-- The rows a page shows, to tell after a change whether the same rows stay
local function Signature(elements)
    local parts = {}
    for i, element in ipairs(elements) do
        local option = element.Option or (element.Item and element.Item.Show)
        parts[i] = element.Kind .. ":" .. (option and ((option.Id or "") .. "|" .. option:GetLabel()) or tostring(element.Text or element.Label or ""))
    end
    return table.concat(parts, "\n")
end

function Krowi_OptionsWindowMixin:FillPage(scrollPosition, elements)
    self.Elements = elements or Flatten(self.Config.GetElements(self.SectionId))
    self.Signature = Signature(self.Elements)
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

-- The page's header: the section's changed count and Defaults, or while the window asks, the question with Yes and No
function Krowi_OptionsWindowMixin:RefreshFooter()
    local confirming = self:ConfirmingHere()
    if not confirming then self.Confirming = nil end
    self.CancelButton:SetShown(confirming)
    self.PageTitle:SetShown(not confirming)
    self.ChangedText:ClearAllPoints()
    self.ChangedText:SetPoint("RIGHT", confirming and self.CancelButton or self.DefaultsButton, "LEFT", -8, 0)
    if confirming then
        self.ChangedText:SetPoint("LEFT", self.PageTitle, "LEFT")
        self.ChangedText:SetFontObject("GameFontHighlight")
        self.ChangedText:SetText(confirming.Text)
        self.DefaultsButton:SetText(self.Strings.Yes or YES)
        self.DefaultsButton:SetEnabled(true)
    else
        local count = (not self.Searching and self.SectionId ~= "overview") and self.Config.ChangedCount(self.SectionId) or 0
        self.ChangedText:SetFontObject("GameFontDisableSmall")
        self.ChangedText:SetText(count > 0 and self.Strings.ChangedCount:format(count) or "")
        self.DefaultsButton:SetText(self.Strings.Defaults)
        self.DefaultsButton:SetEnabled(count > 0)
    end
    local reload = self.ReloadPending and true or false
    self.ReloadBackground:SetShown(reload)
    self.ReloadText:SetShown(reload)
    self.ReloadButton:SetShown(reload)
    self.ReloadButton:SetEnabled(not self:InCombat())
end

-- The rows refresh in place while the page keeps the same rows: rebuilding it re-initialises every row, which ends the
-- drag of a slider that changes its option on every step. Only a change that shows or hides rows rebuilds the page.
function Krowi_OptionsWindowMixin:OnOptionChanged(option)
    if option and option.GetNeedsReload and option:GetNeedsReload() then self.ReloadPending = true end
    if self.Searching or not self.SectionId then
        self:Refresh()
        return
    end
    local elements = Flatten(self.Config.GetElements(self.SectionId))
    if Signature(elements) ~= self.Signature then
        self:FillPage(ScrollBoxConstants.RetainScrollPosition, elements)
        self:UpdateShowMe()
    else
        self:Refresh()
    end
end

function Krowi_OptionsWindowMixin:ScrollToOption(optionId)
    for _, element in ipairs(self.Elements or {}) do
        if element.Option and element.Option.Id == optionId then
            self.PageScrollBox:ScrollToElementData(element, ScrollBoxConstants.AlignCenter)
            return
        end
    end
end

-- The window asks inside itself (Defaults, and an option with Confirm such as deleting a profile): Defaults turns into
-- Yes, with No and the question beside it. A StaticPopup would write the dialog into Blizzard's shared popup frames and
-- list, where a Blizzard dialog shown at the same time (deleting an item, a summon, a battleground port) reads it and
-- then runs its protected accept tainted.
function Krowi_OptionsWindowMixin:AskConfirm(text, onYes)
    if not self.SectionId or self.Searching then return end
    self.Confirming = { SectionId = self.SectionId, Text = text, OnYes = onYes }
    self:RefreshFooter()
end

function Krowi_OptionsWindowMixin:ConfirmingHere()
    local confirming = self.Confirming
    return confirming and confirming.SectionId == self.SectionId and not self.Searching and confirming or nil
end

function Krowi_OptionsWindowMixin:CancelConfirm()
    self.Confirming = nil
    self:RefreshFooter()
end

function Krowi_OptionsWindowMixin:OnDefaultsClick()
    local confirming = self:ConfirmingHere()
    if confirming then
        self.Confirming = nil
        confirming.OnYes()
        self:RefreshFooter()
        return
    end
    local id = self.SectionId
    if not id or id == "overview" then return end
    self:AskConfirm(self.Strings.ResetSection:format(self.Config.SectionName(id)), function() self:ResetSection(id) end)
end

-- Config.ResetSection returns true when an option it set back needs a reload
function Krowi_OptionsWindowMixin:ResetSection(id)
    if self.Config.ResetSection(id) then self.ReloadPending = true end
    self:ReloadSection()
end

-- [[ Search ]] --
function Krowi_OptionsWindowMixin:OnSearch(text)
    text = text and text:gsub("^%s+", ""):gsub("%s+$", "") or ""
    if #text < 2 then
        if self.Searching then self:ShowSection(self.SectionId, nil, true) end
        return
    end
    self.Searching = true
    self.Confirming = nil
    self.PageTitle:SetText(self.Strings.SearchResults)
    self.PageTitle:Show()
    self.DefaultsButton:Hide()
    self.CancelButton:Hide()
    self.ChangedText:SetText("")
    -- The selected tab, or with "Search all tabs" ticked every tab, each under its addon's name; a result of another addon opens
    -- its tab first
    local everyTab = self.SearchEveryTab and #lib.Tabs > 1
    local list = {}
    for _, group in ipairs(lib.Search(text, everyTab, self.Tab)) do
        if everyTab then list[#list + 1] = { Kind = "SubHeading", Text = group.Tab.Config.TabName } end
        for _, result in ipairs(group.Results) do
            list[#list + 1] = {
                Kind = "Link", Text = result.Label, Detail = result.Path,
                OnClick = function() self:ShowTab(group.Tab, result.SectionId, result.OptionId) end,
            }
        end
    end
    if #list == 0 then list[1] = { Kind = "Note", Text = self.Strings.NoResults } end
    self.Elements = list
    self.PageScrollBox:SetDataProvider(CreateDataProvider(list), ScrollBoxConstants.DiscardScrollPosition)
    self.Filling = true
    self:RefreshNav()
    self:EndFill()
end

-- [[ The help pane, or the tooltip while the pane is collapsed ]] --
local function TextBlock(text, font, gap)
    return { Kind = "HelpText", Text = text, Font = font, Gap = gap }
end

-- A help picture at its own size, smaller only where the screen is
function Krowi_OptionsWindowMixin:ShowPicture(element)
    local lightbox = self.Lightbox
    local scale = math.min(1, (UIParent:GetWidth() - 80) / element.Width, (UIParent:GetHeight() - 80) / element.Height)
    lightbox.Picture:SetTexture(element.Picture)
    if element.TexCoords then lightbox.Picture:SetTexCoord(unpack(element.TexCoords)) else lightbox.Picture:SetTexCoord(0, 1, 0, 1) end
    lightbox.Picture:SetSize(element.Width * scale, element.Height * scale)
    lightbox.Picture:ClearAllPoints()
    lightbox.Picture:SetPoint("CENTER", UIParent, "CENTER")
    lightbox:Show()
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
            blocks[#blocks + 1] = { Kind = "HelpPicture", Picture = block.Picture, DrawWidth = width, DrawHeight = height, TexCoords = block.TexCoords,
                Width = block.Width or width, Height = block.Height or height }
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
        local tooltip = Krowi_Tooltip -- the addon's own tooltip, never GameTooltip (Krowi_Util creates it wherever KROWI_LIBMAN exists)
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