-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.SummaryAchievementButton = {};

local media = "Interface\\AddOns\\Krowi_AchievementFilter\\Media\\";
local function Saturate(self)
    if self.Achievement.NotObtainable then
		self.titleBar:SetTexture(media .. "NotObtainableAchievementBorders");
		self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.saturatedStyle = "NotObtainable";
	else
		if not addon.InGuildView() and not self.accountWide then
			self:SetBackdropBorderColor(ACHIEVEMENT_GOLD_BORDER_COLOR:GetRGB());
		end
	end
end

function KrowiAF_AchievementFrameSummaryFrameAchievementButton_OnLoad(self)
    AchievementComparisonPlayerButton_OnLoad(self);

	hooksecurefunc(self, "Saturate", Saturate);
	self.dateCompleted:Show();
end

function KrowiAF_AchievementFrameSummaryFrameAchievementButton_OnClick(self, button, down)
    if self.Achievement == nil then
        return;
    end
    KrowiAF_SelectAchievementFromID(self.Achievement.Id);
end

function KrowiAF_AchievementFrameSummaryFrameAchievementButton_OnEnter(self, button, down)
    self.highlight:Show();
    if self.Achievement == nil then
        return;
    end
    GameTooltip:SetOwner(self, "ANCHOR_NONE");
    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT");
    local link = GetAchievementLink(self.Achievement.ID);
    GameTooltip:SetHyperlink(link);
    AchievementFrameAchievements_CheckGuildMembersTooltip(self);
    GameTooltip:Show();
    if GameTooltip:GetTop() > self:GetTop() then
        GameTooltip:ClearAllPoints();
        GameTooltip:SetPoint("BOTTOMLEFT", self, "BOTTOMRIGHT");
    end
end
