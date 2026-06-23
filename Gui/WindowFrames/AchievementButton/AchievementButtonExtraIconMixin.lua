KrowiAF_AchievementButtonExtraIconMixin = {};

function KrowiAF_AchievementButtonExtraIconMixin:OnEnter()
	KrowiAF_Tooltip:SetOwner(self, "ANCHOR_RIGHT");
	local color = self.Color or {};
	if self.Lines then
		for i = 1, #self.Lines do
			KrowiAF_Tooltip:AddLine(self.Lines[i], color.R, color.G, color.B);
		end
		KrowiAF_Tooltip:Show();
		return;
	end
	KrowiAF_Tooltip:SetText(self.Text, color.R, color.G, color.B, nil, true);
end

function KrowiAF_AchievementButtonExtraIconMixin:OnLeave()
	KrowiAF_Tooltip:Hide();
end