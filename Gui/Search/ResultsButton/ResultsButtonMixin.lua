local _, addon = ...;

KrowiAF_SearchResultsButtonMixin = {};

function KrowiAF_SearchResultsButtonMixin:OnClick()
    if self.Achievement then
        self:GetParent():GetParent():GetParent():Hide();
        KrowiAF_SelectAchievement(self.Achievement);
	end
end

function KrowiAF_SearchResultsButtonMixin:SetAchievement(achievement)
    local _, name, _, completed, _, _, _, _, _, icon = addon.GetAchievementInfo(achievement.Id);
    self.Name:SetText(name);
    self.Icon:SetTexture(icon);
    self.Achievement = achievement;
    if completed then
        self.ResultType:SetText(ACHIEVEMENTFRAME_FILTER_COMPLETED);
    else
        self.ResultType:SetText(ACHIEVEMENTFRAME_FILTER_INCOMPLETE);
    end
    local category = achievement.Category;
    local categoriesTree = category:GetTree();
    local path = categoriesTree[1].Name;
    for j = 2, #categoriesTree do
        path = path .. " > " .. categoriesTree[j].Name;
    end
    self.Path:SetText(path);
end