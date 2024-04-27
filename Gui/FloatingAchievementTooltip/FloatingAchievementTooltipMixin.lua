local _, addon = ...;

KrowiAF_FloatingAchievementTooltipCloseButtonMixin = {};

function KrowiAF_FloatingAchievementTooltipCloseButtonMixin:OnLoad()
	addon.Gui:RegisterSafeCloseButtonDuringCombat(self);
end

function KrowiAF_FloatingAchievementTooltipCloseButtonMixin:OnClick()
	self:GetParent():Hide();
end

function KrowiAF_FloatingAchievementTooltipCloseButtonMixin:OnKeyDown(key)
	addon.Gui.HandleCloseButtonOnKeyDown(self, key);
end

KrowiAF_FloatingAchievementTooltipAchievementLinkMixin = {};

function KrowiAF_FloatingAchievementTooltipAchievementLinkMixin:OnClick()
	local parent = self:GetParent();
    if not parent then
        return;
    end

    local info = parent:GetPrimaryTooltipInfo();
    local id = info and info.tooltipData and info.tooltipData.id;
    if not id then
        return;
    end

    KrowiAF_SelectAchievementFromID(id);
end

KrowiAF_FloatingAchievementTooltipMixin = {};

function KrowiAF_FloatingAchievementTooltipMixin:OnLoad()
	GameTooltip_OnLoad(self);
	self:RegisterForDrag("LeftButton");
end

function KrowiAF_FloatingAchievementTooltipMixin:OnMouseUp(button)
	if button ~= "RightButton" then
		return;
	end

	local info = self:GetPrimaryTooltipInfo();
	local id = info and info.tooltipData and info.tooltipData.id;
	if not id then
		return;
	end

	addon.Gui.RightClickMenu.AchievementMenu:Open(addon.Data.Achievements[id], nil, nil, nil, nil, nil, "TOOLTIP");
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
	if addon.Util.IsClassicWithAchievements then
		local _, id = strsplit(":", link);
		self.info = {
			tooltipData = {
				id = tonumber(id)
			}
		};
	end
	local title = _G[self:GetName().."TextLeft1"];
	if title and title:GetRight() - self.CloseButton:GetLeft() > 0 then
		local xPadding = 16;
		self:SetPadding(xPadding, 0);
	end
end

if not addon.Util.IsClassicWithAchievements then
	function KrowiAF_FloatingAchievementTooltipMixin:SetHyperlink(...)
		-- it's the same hyperlink as current data, close instead
		local info = self:GetPrimaryTooltipInfo();
		if info and info.getterName == "GetHyperlink" then
			local getterArgs = {...};
			if tCompare(info.getterArgs, getterArgs) then
				self:Hide();
				return false;
			end
		end
		local tooltipInfo = CreateBaseTooltipInfo("GetHyperlink", ...);
		return self:ProcessInfo(tooltipInfo);
	end
else
	function KrowiAF_FloatingAchievementTooltipMixin:GetPrimaryTooltipInfo()
		return self.info;
	end
end