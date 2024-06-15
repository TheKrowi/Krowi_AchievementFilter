KrowiAF_AchievementButtonExtraIconMixin = {};

function KrowiAF_AchievementButtonExtraIconMixin:OnEnter()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	local color = self.Color or {};
	if self.Lines then
		for i = 1, #self.Lines do
			GameTooltip:AddLine(self.Lines[i], color.R, color.G, color.B);
		end
		GameTooltip:Show();
		return;
	end
	GameTooltip:SetText(self.Text, color.R, color.G, color.B, nil, true);
end

function KrowiAF_AchievementButtonExtraIconMixin:OnLeave()
	GameTooltip:Hide();
end