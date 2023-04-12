-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_FloatingAchievementTooltipMixin = {};


function KrowiAF_FloatingAchievementTooltipMixin:OnLoad()
	GameTooltip_OnLoad(self);
	self:RegisterForDrag("LeftButton");
end

function KrowiAF_FloatingAchievementTooltipMixin:OnDragStart()
	self:StartMoving();
end

function KrowiAF_FloatingAchievementTooltipMixin:OnDragStop()
	self:StopMovingOrSizing();
	ValidateFramePosition(self);
end

function KrowiAF_FloatingAchievementTooltipMixin:ItemRefSetHyperlink(link)
	self:SetPadding(0, 0);
	self:SetHyperlink(link);
	local title = _G[self:GetName().."TextLeft1"];
	if title and title:GetRight() - self.CloseButton:GetLeft() > 0 then
		local xPadding = 16;
		self:SetPadding(xPadding, 0);
	end
end

function KrowiAF_FloatingAchievementTooltipMixin:SetHyperlink(...)
	-- it's the same hyperlink as current data, close instead
	if self.info and self.info.getterName == "GetHyperlink" then
		local getterArgs = {...};
		if tCompare(self.info.getterArgs, getterArgs) then
			self:Hide();
			return false;
		end
	end
	local tooltipInfo = CreateBaseTooltipInfo("GetHyperlink", ...);
	return self:ProcessInfo(tooltipInfo);
end