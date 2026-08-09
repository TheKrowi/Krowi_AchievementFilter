KrowiAF_AchievementButtonExtraIconMixin = {};

function KrowiAF_AchievementButtonExtraIconMixin:OnEnter()
	Krowi_Tooltip:SetOwner(self, "ANCHOR_RIGHT");
	local color = self.Color or {};
	if self.Lines then
		for i = 1, #self.Lines do
			Krowi_Tooltip:AddLine(self.Lines[i], color.R, color.G, color.B);
		end
		Krowi_Tooltip:Show();
	else
		Krowi_Tooltip:SetText(self.Text, color.R, color.G, color.B, nil, true);
	end
	if self.OnEnterCallback then
		self.OnEnterCallback(self)
	end
end

function KrowiAF_AchievementButtonExtraIconMixin:OnLeave()
	Krowi_Tooltip:Hide();
	if self.OnLeaveCallback then
		self.OnLeaveCallback(self)
	end
end

function KrowiAF_AchievementButtonExtraIconMixin:OnMouseUp(button)
	if button == "LeftButton" and self.OnClickCallback then
		self.OnClickCallback(self)
	end
end