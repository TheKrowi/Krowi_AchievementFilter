KrowiAF_SearchPreviewButtonMixin = {};

function KrowiAF_SearchPreviewButtonMixin:OnShow()
    self:SetFrameLevel(self:GetParent():GetFrameLevel() + 10);
end

function KrowiAF_SearchPreviewButtonMixin:OnEnter()
    self:Highlight();
end

function KrowiAF_SearchPreviewButtonMixin:OnClick()
    if self.Achievement then
        KrowiAF_SelectAchievement(self.Achievement);
        self:GetParent():Hide();
        KrowiAF_SearchBoxFrame:ClearFocus();
	end
end

function KrowiAF_SearchPreviewButtonMixin:Highlight()
    local previewFrame = self:GetParent();
    local buttons = previewFrame.Buttons;
    for _, button in next, buttons do
        button.SelectedTexture:Hide();
        button.IsSelected = nil;
    end
    local showFullSearchResultsButton = previewFrame.ShowFullSearchResultsButton;
	showFullSearchResultsButton.SelectedTexture:Hide();
    showFullSearchResultsButton.IsSelected = nil;

    self.SelectedTexture:Show();
    self.IsSelected = true;
end