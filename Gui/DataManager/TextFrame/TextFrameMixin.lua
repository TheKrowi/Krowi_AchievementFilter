---@diagnostic disable: invisible
local _, addon = ...

KrowiAF_TextFrameButton1Mixin = {}

local button1OnClickFunc
function KrowiAF_TextFrameButton1Mixin:OnClick()
    button1OnClickFunc(self:GetParent().Input:GetText())
end

KrowiAF_TextFrameMixin = {}

function KrowiAF_TextFrameMixin:OnLoad()
    addon.Gui:RegisterFrameForClosing(self)

    addon.MakeMovable(self, "TextFrame", nil, "CENTER")
    self.CloseButton:SetScript("OnClick", function(selfFunc)
		selfFunc:GetParent():Hide()
	end)

    ButtonFrameTemplate_HideAttic(self)
    ButtonFrameTemplate_HidePortrait(self)

    local dataManager = addon.Gui.DataManager
    self.Input = dataManager.NewTextBox(self, self.Inset)

    -- TEMPORARY (docs/work/2026-11-25-leave-acegui, look gate): cycles the boxes' look, the log tab's too
    local look = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
    look:SetSize(220, 22)
    look:SetPoint("BOTTOMLEFT", 4, 4)
    local function Label()
        look:SetText("Look: " .. dataManager.BoxLookNames[dataManager.BoxLook])
    end
    look:SetScript("OnClick", function()
        dataManager.NextBoxLook()
        Label()
    end)
    look:SetScript("OnShow", Label)
    Label()
    self.LookButton = look
end

function KrowiAF_TextFrameMixin:OnShow()
    self:ResetPosition()
end

function KrowiAF_TextFrameMixin:Init(title, newButton1Text, newButton1OnClickFunc)
    if addon.Util.IsClassicWithAchievements then
		self.TitleText:SetText(title)
	else
    	self:SetTitle(title)
	end
    if not newButton1OnClickFunc then
        self.Button1:Hide()
        return
    end
    self.Button1:Show()
    self.Button1:SetText(newButton1Text)
    button1OnClickFunc = newButton1OnClickFunc
end

function KrowiAF_TextFrameMixin:ResetPosition()
    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {}
    KrowiAF_SavedData.RememberLastPosition["TextFrame"] = {
        X = 0,
        Y = 0,
        Point = "CENTER"
    }
	addon.Gui:SetFrameToLastPosition(self, "TextFrame")
end