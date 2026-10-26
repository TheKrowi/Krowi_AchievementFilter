--[[
    Copyright (c) 2026 Krowi
    Licensed under the terms of the LICENSE file in this repository.
]]

---@diagnostic disable: undefined-global

-- The rows of the options page. An element (see WindowMixin.lua) picks its row; an option row reads the option's
-- interface: GetLabel, GetDescription, Type, Get, Set, IsDisabled, GetValues, GetRange, GetButtonText,
-- GetNeedsReload, IsChanged, Reset, Placeholder, Confirm (a select's question before a choice is made), and for a key
-- row Slots (two options holding a key each).
-- Every change goes through window:OnOptionChanged, which redraws the rows, the dots and the reload bar.

local controlColumn = 300 -- the controls start this far from the row's right edge; labels stop short of it

-- [[ Header, sub-heading, note ]] --
Krowi_OptionsTextRowMixin = {}

function Krowi_OptionsTextRowMixin:Init(element)
    self.Text:SetText(element.Text or "")
end

-- [[ An option ]] --
Krowi_OptionsOptionRowMixin = {}

local function Forward(control, row)
    control:HookScript("OnEnter", function() row:OnEnter() end)
    control:HookScript("OnLeave", function() row:OnLeave() end)
end

-- The mouse buttons a key can be bound to, as AceGUI's keybinding widget took them; left and right start and stop
local mouseButtons = { MiddleButton = "BUTTON3", Button4 = "BUTTON4", Button5 = "BUTTON5" }

function Krowi_OptionsOptionRowMixin:OnLoad()
    self.Label:SetPoint("RIGHT", self, "RIGHT", -controlColumn - 12, 0)

    self.Dot:RegisterForClicks("RightButtonUp")
    self.Dot:SetScript("OnClick", function()
        self.Option:Reset()
        self.Window:OnOptionChanged(self.Option)
    end)

    self.Toggle:SetScript("OnClick", function()
        self.Option:Set(not self.Option:Get())
        self.Window:OnOptionChanged(self.Option)
    end)

    self.Range:RegisterCallback(MinimalSliderWithSteppersMixin.Event.OnValueChanged, function(_, value)
        if self.Updating then return end
        self.Option:Set(value)
        self.Window:OnOptionChanged(self.Option)
    end, self)

    self.Execute:SetScript("OnClick", function()
        self.Option:Set()
        self.Window:OnOptionChanged(self.Option)
    end)

    self.Input:SetScript("OnEnterPressed", function(editBox)
        self.Option:Set(editBox:GetText())
        editBox:ClearFocus()
        self.Window:OnOptionChanged(self.Option)
    end)
    self.Input:SetScript("OnEscapePressed", function(editBox)
        editBox:SetText(self.Option:Get() or "")
        editBox:ClearFocus()
    end)

    for slot, button in ipairs({ self.Key1, self.Key2 }) do
        button:SetScript("OnClick", function() self:StartKeyCapture(slot) end)
        button:SetScript("OnKeyDown", function(_, key) self:OnKeyCaptured(slot, key) end)
        button:SetScript("OnMouseDown", function(_, mouseButton)
            if mouseButtons[mouseButton] then self:OnKeyCaptured(slot, mouseButtons[mouseButton]) end
        end)
        button:SetScript("OnMouseWheel", function(_, delta) self:OnKeyCaptured(slot, delta > 0 and "MOUSEWHEELUP" or "MOUSEWHEELDOWN") end)
        button:EnableKeyboard(false)
        button:EnableMouseWheel(false)
    end

    for _, control in ipairs({ self.Dot, self.Toggle, self.Range, self.Select, self.Execute, self.Input, self.Key1, self.Key2 }) do
        Forward(control, self)
    end
end

function Krowi_OptionsOptionRowMixin:Init(element, window)
    self:EndKeyCapture() -- a recycled row must not bind the next key to its new option
    self.Element, self.Window, self.Option = element, window, element.Option
    local option = self.Option
    for _, control in ipairs({ self.Toggle, self.Range, self.Select, self.Execute, self.Input, self.Key1, self.Key2 }) do
        control:Hide()
    end
    self.Label:SetPoint("LEFT", 16 + (option.Indent or 0) * 20, 0)
    self.Label:SetText(option:GetLabel())

    local t = option.Type
    if t == "toggle" then
        self.Toggle:Show()
    elseif t == "range" then
        local min, max, step = option:GetRange()
        self.Updating = true
        local steps = step and step > 0 and math.floor((max - min) / step + 0.5) or (max - min)
        self.Range:Init(option:Get() or min, min, max, steps, {
            [MinimalSliderWithSteppersMixin.Label.Right] = CreateMinimalSliderFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
                return option.Format and option:Format(value) or tostring(math.floor(value * 100 + 0.5) / 100)
            end),
        })
        self.Updating = nil
        self.Range:Show()
    elseif t == "select" then
        self.Select:SetupMenu(function(_, root)
            for _, pair in ipairs(option:GetValues()) do
                root:CreateRadio(tostring(pair[2]), function() return option:Get() == pair[1] end, function()
                    local function Choose()
                        option:Set(pair[1])
                        window:OnOptionChanged(option)
                    end
                    -- option.Confirm(value) -> the question the window asks before the choice is made
                    if option.Confirm then window:AskConfirm(option:Confirm(pair[1]), Choose) else Choose() end
                end)
            end
        end)
        if self.Select.SetDefaultText then self.Select:SetDefaultText(option.Placeholder or "") end
        self.Select:Show()
    elseif t == "execute" then
        self.Execute:SetText(option:GetButtonText())
        self.Execute:Show()
    elseif t == "input" then
        self.Input:Show()
    elseif t == "key" then
        self.Key1:Show()
        self.Key2:SetShown(option.Slots and option.Slots[2] ~= nil)
    end
    self:Refresh()
end

function Krowi_OptionsOptionRowMixin:Refresh()
    local option = self.Option
    if not option then return end
    local disabled = option:IsDisabled()
    local strings = self.Window.Strings
    self.Label:SetFontObject(disabled and "GameFontDisable" or "GameFontNormal")

    local needsReload = option:GetNeedsReload()
    self.ReloadIcon:SetShown(needsReload)
    if needsReload then
        self.ReloadIcon:SetPoint("LEFT", self.Label, "LEFT", math.min(self.Label:GetStringWidth(), self.Label:GetWidth()) + 6, 0)
    end
    self.Dot:SetShown(option:IsChanged())

    local t = option.Type
    if t == "toggle" then
        self.Toggle:SetChecked(option:Get() and true or false)
        self.Toggle:SetEnabled(not disabled)
    elseif t == "range" then
        self.Updating = true
        self.Range:SetValue(option:Get() or 0)
        self.Updating = nil
        self.Range:SetEnabled(not disabled)
    elseif t == "select" then
        self.Select:GenerateMenu()
        self.Select:SetEnabled(not disabled)
    elseif t == "execute" then
        self.Execute:SetEnabled(not disabled)
    elseif t == "input" then
        if not self.Input:HasFocus() then self.Input:SetText(option:Get() or "") end
        self.Input:SetEnabled(not disabled)
    elseif t == "key" then
        local inCombat = self.Window:InCombat()
        for slot, button in ipairs({ self.Key1, self.Key2 }) do
            local slotOption = option.Slots and option.Slots[slot]
            if slotOption then
                local key = slotOption:Get()
                button:SetText(self.Capturing == slot and strings.PressAKey or (key and key ~= "" and GetBindingText(key)) or strings.NotBound)
                button:SetEnabled(not disabled and not inCombat)
            end
        end
    end
end

-- Key capture, as AceGUI's keybinding widget did it: the button takes the next key, mouse button 3 to 5 or wheel turn;
-- Escape clears the binding, a second click cancels. One button captures at a time in the whole window. Out of combat
-- only (the game blocks binding changes in combat, and the buttons are greyed out there).
function Krowi_OptionsOptionRowMixin:StartKeyCapture(slot)
    local cancel = self.Capturing == slot
    self.Window:EndKeyCaptures()
    if cancel or InCombatLockdown() then
        self:Refresh()
        return
    end
    self.Capturing = slot
    local button = slot == 1 and self.Key1 or self.Key2
    button:EnableKeyboard(true)
    button:EnableMouseWheel(true)
    self:Refresh()
end

function Krowi_OptionsOptionRowMixin:EndKeyCapture()
    if not self.Capturing then return end
    self.Capturing = nil
    for _, button in ipairs({ self.Key1, self.Key2 }) do
        button:EnableKeyboard(false)
        button:EnableMouseWheel(false)
    end
    if self.Option then self:Refresh() end
end

local ignoredKeys = { LSHIFT = true, RSHIFT = true, LCTRL = true, RCTRL = true, LALT = true, RALT = true, UNKNOWN = true }
function Krowi_OptionsOptionRowMixin:OnKeyCaptured(slot, key)
    if self.Capturing ~= slot or ignoredKeys[key] then return end
    self:EndKeyCapture()
    if InCombatLockdown() then return end
    local combo = key == "ESCAPE" and "" or (IsAltKeyDown() and "ALT-" or "") .. (IsControlKeyDown() and "CTRL-" or "") .. (IsShiftKeyDown() and "SHIFT-" or "") .. key
    self.Option.Slots[slot]:Set(combo)
    self.Window:OnOptionChanged(self.Option)
end

function Krowi_OptionsOptionRowMixin:OnEnter()
    self.Hover:Show()
    self.Window:OnRowEnter(self.Option, self)
end

function Krowi_OptionsOptionRowMixin:OnLeave()
    self.Hover:Hide()
    self.Window:OnRowLeave(self.Option)
end

-- [[ A family heading or a group's All / None ]] --
Krowi_OptionsSubRowMixin = {}

function Krowi_OptionsSubRowMixin:OnLoad()
    local function SetAll(value)
        local reloadMember -- one that needs a reload, so the window shows the reload bar
        for _, option in ipairs(self.Element.Members) do
            if not option:IsDisabled() then
                option:Set(value)
                if option:GetNeedsReload() then reloadMember = option end
            end
        end
        self.Window:OnOptionChanged(reloadMember)
    end
    self.All:SetScript("OnClick", function() SetAll(true) end)
    self.None:SetScript("OnClick", function() SetAll(false) end)
end

function Krowi_OptionsSubRowMixin:Init(element, window)
    self.Element, self.Window = element, window
    self.Text:SetText(element.Text or "")
    self.All:SetText(window.Strings.All)
    self.None:SetText(window.Strings.None)
end

-- [[ A grid: column titles, then a row of check boxes per line ]] --
local gridLeft, gridColumn, gridColumns = 200, 72, 5

Krowi_OptionsGridHeaderRowMixin = {}

function Krowi_OptionsGridHeaderRowMixin:OnLoad()
    self.Columns = {}
    for i = 1, gridColumns do
        local text = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
        text:SetSize(gridColumn, 30)
        text:SetPoint("BOTTOMLEFT", gridLeft + (i - 1) * gridColumn, 2)
        text:SetJustifyV("BOTTOM")
        self.Columns[i] = text
    end
end

function Krowi_OptionsGridHeaderRowMixin:Init(element)
    for i, text in ipairs(self.Columns) do
        text:SetText(element.Columns[i] or "")
    end
end

Krowi_OptionsGridRowMixin = {}

function Krowi_OptionsGridRowMixin:OnLoad()
    self.Cells = {}
    for i = 1, gridColumns do
        local cell = CreateFrame("CheckButton", nil, self, "Krowi_OptionsCheckButtonTemplate")
        cell:SetPoint("CENTER", self, "LEFT", gridLeft + (i - 0.5) * gridColumn, 0)
        cell:SetScript("OnClick", function()
            local option = self.Element.Cells[i]
            option:Set(not option:Get())
            self.Window:OnOptionChanged(option)
        end)
        cell:HookScript("OnEnter", function() self:OnEnter(i) end)
        cell:HookScript("OnLeave", function() self:OnLeave() end)
        self.Cells[i] = cell
    end
end

function Krowi_OptionsGridRowMixin:Init(element, window)
    self.Element, self.Window = element, window
    self.Label:SetText(element.Label or "")
    self:Refresh()
end

function Krowi_OptionsGridRowMixin:Refresh()
    for i, cell in ipairs(self.Cells) do
        local option = self.Element.Cells[i]
        cell:SetShown(option ~= nil)
        if option then
            cell:SetChecked(option:Get() and true or false)
            cell:SetEnabled(not option:IsDisabled())
        end
    end
end

-- column: the hovered check box's; the row itself (its script passes the motion flag) describes the first one
function Krowi_OptionsGridRowMixin:OnEnter(column)
    self.Hover:Show()
    self.Window:OnRowEnter(self.Element.Cells[type(column) == "number" and column or 1], self)
end

function Krowi_OptionsGridRowMixin:OnLeave()
    self.Hover:Hide()
    self.Window:OnRowLeave()
end

-- [[ The tab list: a tab's position, whether it shows, and arrows to move it ]] --
-- The check box is ShowCheck, not Show: a child key named Show replaces the row's own Show method.
Krowi_OptionsTabRowMixin = {}

function Krowi_OptionsTabRowMixin:OnLoad()
    self.ShowCheck:SetScript("OnClick", function()
        local option = self.Element.Item.Show
        option:Set(not option:Get())
        self.Window:OnOptionChanged(option)
    end)
    self.Up:SetScript("OnClick", function()
        self.Element.Item.MoveUp()
        self.Window:ReloadSection()
    end)
    self.Down:SetScript("OnClick", function()
        self.Element.Item.MoveDown()
        self.Window:ReloadSection()
    end)
    for _, control in ipairs({ self.ShowCheck, self.Up, self.Down }) do
        control:HookScript("OnEnter", function() self:OnEnter() end)
        control:HookScript("OnLeave", function() self:OnLeave() end)
    end
end

function Krowi_OptionsTabRowMixin:Init(element, window)
    self.Element, self.Window = element, window
    local item = element.Item
    self.Position:SetText(item.Position)
    self.Label:SetText(item.Show and item.Show:GetLabel() or "?")
    self.Source:SetText(item.Source or "")
    self.Up:SetEnabled(item.MoveUp ~= nil)
    self.Down:SetEnabled(item.MoveDown ~= nil)
    self:Refresh()
end

function Krowi_OptionsTabRowMixin:Refresh()
    local option = self.Element.Item.Show
    if option then
        self.ShowCheck:SetChecked(option:Get() and true or false)
        self.ShowCheck:SetEnabled(not option:IsDisabled())
    end
end

function Krowi_OptionsTabRowMixin:OnEnter()
    self.Hover:Show()
    self.Window:OnRowEnter(self.Element.Item.Show, self)
end

function Krowi_OptionsTabRowMixin:OnLeave()
    self.Hover:Hide()
    self.Window:OnRowLeave()
end

-- [[ A link: a search result, a New section, an overview entry ]] --
Krowi_OptionsLinkRowMixin = {}

function Krowi_OptionsLinkRowMixin:Init(element)
    self.Element = element
    self.Text:SetText(element.Text or "")
    self.Detail:SetText(element.Detail or "")
end

function Krowi_OptionsLinkRowMixin:OnClick()
    if self.Element.OnClick then self.Element.OnClick() end
end