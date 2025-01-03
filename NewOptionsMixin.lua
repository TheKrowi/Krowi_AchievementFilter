local _, addon = ...;

KrowiAF_NewOptionsFrameTabButtonMixin = {};

function KrowiAF_NewOptionsFrameTabButtonMixin:OnClick(button)
    PanelTemplates_SetTab(self:GetParent(), self:GetID());

    self:GetParent():UpdateSelectedTab();
end

KrowiAF_NewOptionsMixin = {};

function KrowiAF_NewOptionsMixin:OnLoad()
    -- self:SetTitle(addon.MetaData.Title);
    self:SetPortraitToAsset(134070);

    self.Tab1.Text:SetText(addon.L["General"]);
    self.Tab2.Text:SetText(addon.L["Layout"]);

    PanelTemplates_SetNumTabs(self, 2);
	PanelTemplates_SetTab(self, 1);
    PanelTemplates_AnchorTabs(self);
end

function KrowiAF_NewOptionsMixin:OnDragStart()
	self:StartMoving();
end

function KrowiAF_NewOptionsMixin:OnDragStop()
	self:StopMovingOrSizing();
end

function KrowiAF_NewOptionsMixin:OnShow()
    self:UpdateSelectedTab();
end

function KrowiAF_NewOptionsMixin:UpdateSelectedTab()
    local selectedTab = PanelTemplates_GetSelectedTab(self);

    KrowiAF_NewOptionsGeneralFrame:SetShown(selectedTab == 1);
    KrowiAF_NewOptionsLayoutFrame:SetShown(selectedTab == 2);
end

-- local offset = 10;
-- function KrowiAF_NewOptionsMixin:SetChildPoints(child)
--     child:SetPoint("TOPLEFT", self.Inset, "TOPLEFT", offset, -offset);
--     child:SetPoint("BOTTOMRIGHT", self.Inset, "BOTTOMRIGHT", -offset, offset);
-- end

KrowiAF_NewOptionsGeneralFrameTabButtonMixin = {};

function KrowiAF_NewOptionsGeneralFrameTabButtonMixin:OnClick(button)
    PanelTemplates_SetTab(self:GetParent(), self:GetID());

    self:GetParent():UpdateSelectedTab();
end

KrowiAF_NewOptionsGeneralMixin = {};

function KrowiAF_NewOptionsGeneralMixin:OnLoad()
    -- self:GetParent():SetChildPoints(self);
    PanelTabButtonMixin.OnLoad(self);

    self.Tab1.Text:SetText(addon.L["Info"]);
    self.Tab2.Text:SetText(addon.L["Icon"]);
    self.Tab3.Text:SetText(addon.L["Key Binding"]);
    self.Tab4.Text:SetText(addon.L["Filters"]);
    self.Tab5.Text:SetText(addon.L["Debug"]);

    PanelTemplates_SetNumTabs(self, 5);
	PanelTemplates_SetTab(self, 1);
    PanelTemplates_AnchorTabs(self);
end

function KrowiAF_NewOptionsGeneralMixin:OnShow()
    self:UpdateSelectedTab();
    -- self.Text:SetText("General");
    for k, v in next, self do
        print(k, v);
    end
end

function KrowiAF_NewOptionsGeneralMixin:UpdateSelectedTab()
    local selectedTab = PanelTemplates_GetSelectedTab(self);

    -- KrowiAF_NewOptionsGeneralFrame:SetShown(selectedTab == 1);
    -- KrowiAF_NewOptionsLayoutFrame:SetShown(selectedTab == 2);
end

KrowiAF_NewOptionsLayoutMixin = {};

function KrowiAF_NewOptionsLayoutMixin:OnLoad()
    PanelTabButtonMixin.OnLoad(self);

    self:GetParent():Show();
end

function KrowiAF_NewOptionsLayoutMixin:OnShow()
    -- self.Text:SetText("Layout");
end