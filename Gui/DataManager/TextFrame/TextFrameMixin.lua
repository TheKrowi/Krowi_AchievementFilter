local _, addon = ...;

KrowiAF_TextFrameButton1Mixin = {};

local button1OnClickFunc;
function KrowiAF_TextFrameButton1Mixin:OnClick()
    button1OnClickFunc(self:GetParent().Input:GetText());
end

KrowiAF_TextFrameMixin = {};

function KrowiAF_TextFrameMixin:OnLoad()
    addon.MakeMovable(self, "TextFrame", nil, "CENTER");
    self.CloseButton:SetScript("OnClick", function(selfFunc)
		selfFunc:GetParent():Hide();
	end);
	addon.Gui:RegisterSafeCloseButtonDuringCombat(self.CloseButton);
	self.CloseButton:SetScript("OnKeyDown", addon.Gui.HandleCloseButtonOnKeyDown);

    ButtonFrameTemplate_HideAttic(self);
    ButtonFrameTemplate_HidePortrait(self);

    local input = LibStub("AceGUI-3.0"):Create("MultiLineEditBox");
    input.frame:SetParent(self);
    input:DisableButton(true);
    input:SetLabel("");
    input.frame:SetPoint("TOPLEFT", self.Inset ,"TOPLEFT", 0, 4);
    input.frame:SetPoint("BOTTOMRIGHT", self.Inset ,"BOTTOMRIGHT", -3, -5);
    input.frame:Show();
    self.Input = input;
end

function KrowiAF_TextFrameMixin:OnShow()
    self:ResetPosition();
end

function KrowiAF_TextFrameMixin:Init(title, newButton1Text, newButton1OnClickFunc)
    if addon.IsClassicWithAchievements then
		self.TitleText:SetText(title);
	else
    	self:SetTitle(title);
	end
    if not newButton1OnClickFunc then
        self.Button1:Hide();
        return
    end
    self.Button1:Show();
    self.Button1:SetText(newButton1Text)
    button1OnClickFunc = newButton1OnClickFunc;
end

function KrowiAF_TextFrameMixin:ResetPosition()
    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
    KrowiAF_SavedData.RememberLastPosition["TextFrame"] = {
        X = 0,
        Y = 0,
        Point = "CENTER"
    };
	addon.Gui:SetFrameToLastPosition(self, "TextFrame");
end