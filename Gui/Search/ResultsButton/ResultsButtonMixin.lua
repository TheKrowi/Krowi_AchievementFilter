KrowiAF_SearchResultsButtonMixin = {};

function KrowiAF_SearchResultsButtonMixin:OnClick()
    if self.Achievement then
        self:GetParent():GetParent():GetParent():Hide();
        KrowiAF_SelectAchievement(self.Achievement);
	end
end