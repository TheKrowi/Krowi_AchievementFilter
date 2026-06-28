KrowiAF_AchievementButtonExtraIconMixin = {};

function KrowiAF_AchievementButtonExtraIconMixin:OnEnter()
	Krowi_Tooltip:SetOwner(self, "ANCHOR_RIGHT");
	local color = self.Color or {};
	if self.Lines then
		for i = 1, #self.Lines do
			Krowi_Tooltip:AddLine(self.Lines[i], color.R, color.G, color.B);
		end
		Krowi_Tooltip:Show();
		return;
	end
	Krowi_Tooltip:SetText(self.Text, color.R, color.G, color.B, nil, true);
end

function KrowiAF_AchievementButtonExtraIconMixin:OnLeave()
	Krowi_Tooltip:Hide();
end