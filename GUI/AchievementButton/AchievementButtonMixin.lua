-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AchievementButtonMixin = {};

local media = "Interface/AddOns/Krowi_AchievementFilter/Media/";

local function SetTsunamis(self)
	if addon.Options.db.Achievements.Compact then
		return;
	end

	local notObtainable = self.Achievement.NotObtainable;
	local texture = notObtainable and (media .. "NotObtainableAchievementBorders") or "Interface/AchievementFrame/UI-Achievement-Borders";

	self.BottomTsunami:SetTexture(texture);
	self.BottomTsunami:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
	self.BottomTsunami:SetAlpha(0.35);
	self.TopTsunami:SetTexture(texture);
	self.TopTsunami:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
	self.TopTsunami:SetAlpha(0.3);
end

function KrowiAF_AchievementButtonMixin:UpdatePlusMinusTexture()
	local id = self.Id;
	if not id then
		return; -- This happens when we create buttons
	end

	local display = false;
	if addon.Options.db.Achievements.Compact then
		display = true;
	elseif GetAchievementNumCriteria(id) ~= 0 then
		display = true;
	elseif self.IsCompletd and GetPreviousAchievement(id) then
		display = true;
	elseif not self.IsCompletd and GetAchievementGuildRep(id) then
		display = true;
	end

	if not display then
		self.PlusMinus:Hide();
		return;
	end

	self.PlusMinus:Show();
	if self.IsCollapsed and self.SaturatedStyle then
		self.PlusMinus:SetTexCoord(0, 0.5, 0, 0.25);
	elseif self.IsCollapsed then
		self.PlusMinus:SetTexCoord(0.5, 1, 0, 0.25);
	elseif self.SaturatedStyle then
		self.PlusMinus:SetTexCoord(0, 0.5, 0.25, 0.50);
	else
		self.PlusMinus:SetTexCoord(0.5, 1, 0.25, 0.50);
	end
end

function KrowiAF_AchievementButtonMixin:Collapse()
    if self.IsCollapsed then
		return;
	end
	self.IsCollapsed = true;
	self:UpdatePlusMinusTexture();
    local buttonCollapsedHeight = addon.Options.db.Achievements.ButtonCollapsedHeight;
	self:SetHeight(buttonCollapsedHeight);
	self.Background:SetTexCoord(0, 1, 1 - (buttonCollapsedHeight / 256), 1);
	if not self.Tracked:GetChecked() then
		self.Tracked:Hide();
	end
end

function KrowiAF_AchievementButtonMixin:Expand(height)
    if not self.IsCollapsed then
		return;
	end
	self.IsCollapsed = nil;
	self:UpdatePlusMinusTexture();
	self:SetHeight(height);
	self.Background:SetTexCoord(0, 1, max(0, 1 - (height / 256)), 1);
end

function KrowiAF_AchievementButtonMixin:Saturate()
    self.Background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal");

    if self.Achievement.NotObtainable then
		self.HeaderBackground:SetTexture(media .. "NotObtainableAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
	else
        if self.Achievement.AccountWide then
            self.HeaderBackground:SetTexture("Interface/AchievementFrame/AccountLevel-AchievementHeader");
            self.HeaderBackground:SetTexCoord(0, 1, 0, 0.375);
            self:SetBackdropBorderColor(ACHIEVEMENT_BLUE_BORDER_COLOR:GetRGB());
        else
            self.HeaderBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
            self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
            self:SetBackdropBorderColor(ACHIEVEMENT_GOLD_BORDER_COLOR:GetRGB());
        end
	end

	self.Header:SetVertexColor(1, 1, 1);
	self.Glow:SetVertexColor(1.0, 1.0, 1.0);
	self.Description:SetTextColor(0, 0, 0, 1);
	self.Description:SetShadowOffset(0, 0);
    self.RewardBackground:SetVertexColor(1, 1, 1);
	self.Reward:SetVertexColor(1, 0.82, 0);
	self.Icon.Frame:SetVertexColor(1, 1, 1, 1);
	self.Icon.Texture:SetVertexColor(1, 1, 1, 1);
	self.Shield.Background:SetTexCoord(0, 0.5, 0, 0.5);
    self.Shield.Points:SetVertexColor(1, 1, 1);

	self:UpdatePlusMinusTexture();

	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:Desaturate()
	self.SaturatedStyle = nil;
    self.Background:SetTexture("Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal-Desaturated");

    if self.Achievement.NotObtainable then
		self.HeaderBackground:SetTexture(media .. "NotObtainableAchievementBorders");
		self.HeaderBackground:SetTexCoord(0, 1, 0.91796875, 0.99609375);
	else
        if self.Achievement.AccountWide then
            self.HeaderBackground:SetTexture("Interface/AchievementFrame/AccountLevel-AchievementHeader");
            self.HeaderBackground:SetTexCoord(0, 1, 0.40625, 0.78125);
        else
            self.HeaderBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
            self.HeaderBackground:SetTexCoord(0, 1, 0.91796875, 0.99609375);
        end
    end

	self.Header:SetVertexColor(0.65, 0.65, 0.65);
	self.Glow:SetVertexColor(0.22, 0.17, 0.13);
	self.Description:SetTextColor(1, 1, 1, 1);
	self.Description:SetShadowOffset(1, -1);
    self.RewardBackground:SetVertexColor(0.35, 0.35, 0.35);
	self.Reward:SetVertexColor(0.8, 0.8, 0.8);
	self.Icon.Frame:SetVertexColor(0.75, 0.75, 0.75, 1);
	self.Icon.Texture:SetVertexColor(0.55, 0.55, 0.55, 1);
	self.Shield.Background:SetTexCoord(0.5, 1, 0, 0.5);
	self.Shield.Points:SetVertexColor(0.65, 0.65, 0.65);
	self:SetBackdropBorderColor(0.5, 0.5, 0.5);

	self:UpdatePlusMinusTexture();

	SetTsunamis(self);
end

function KrowiAF_AchievementButtonMixin:SaturatePartial()
	self:Desaturate();

	self.HeaderBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-Borders");
	self.HeaderBackground:SetTexCoord(0, 1, 0.66015625, 0.73828125);
	self.Glow:SetVertexColor(0.1, 0.1, 0.1);
    self.RewardBackground:SetVertexColor(1, 1, 1);
	self.Reward:SetVertexColor(1, 0.82, 0);
	self.Icon.Frame:SetVertexColor(1, 1, 1, 1);
	self.Icon.Texture:SetVertexColor(1, 1, 1, 1);
	self.Shield.Background:SetTexCoord(0, 0.5, 0, 0.5);
    self.Shield.Points:SetVertexColor(1, 1, 1);

	SetTsunamis(self);
end

local function UpdateStatic(self, achievement, id, name, points, completed, month, day, year, description, icon, rewardText, wasEarnedByMe)
    if self.Id == id then
        return;
    end

    -- A new achievement is assigned
    self.Achievement = achievement;
    self.Id = id;
    self.Header:SetText(name);

    if GetPreviousAchievement(id) then -- If this is a progressive achievement, show the total score.			
        AchievementShield_SetPoints(AchievementButton_GetProgressivePoints(id), self.Shield.Points, AchievementPointsFont, AchievementPointsFontSmall);
    else
        AchievementShield_SetPoints(points, self.Shield.Points, AchievementPointsFont, AchievementPointsFontSmall);
    end
    local texture = points > 0 and "Interface/AchievementFrame/UI-Achievement-Shields" or "Interface/AchievementFrame/UI-Achievement-Shields-NoPoints";
    self.Shield.Background:SetTexture(texture);
    self.Description:SetText(description);
    self.HiddenDescription:SetText(description);
    self.numLines = ceil(self.HiddenDescription:GetHeight() / self.FontHeight);
    self.Icon.Texture:SetTexture(icon);

    local saturatedStyle;
    if achievement.NotObtainable then
        saturatedStyle = "NotObtainable";
    else
        if achievement.AccountWide then
            saturatedStyle = "Account";
        else
            saturatedStyle = "Normal";
        end
    end
    local earnedByFilter = addon.Filters.db.EarnedBy;
    if earnedByFilter == addon.Filters.Account and completed or wasEarnedByMe then
        self.IsCompletd = true;
        self.DateCompleted:SetText(FormatShortDate(day, month, year));
        self.DateCompleted:Show();
        self:Saturate();
    elseif (earnedByFilter == addon.Filters.CharacterAccount and completed and not wasEarnedByMe) then
        self.IsCompletd = true;
        self.DateCompleted:SetText(FormatShortDate(day, month, year));
        self.DateCompleted:Show();
        self:SaturatePartial();
    else
        self.IsCompletd = nil;
        self.DateCompleted:SetText(nil);
        self.DateCompleted:Hide();
        self:Desaturate();
    end
    self.SaturatedStyle = saturatedStyle;

    if rewardText == "" then
        self.Reward:SetText(nil);
        self.Reward:Hide();
        self.RewardBackground:Hide();
    else
        self.Reward:SetText(rewardText);
        self.Reward:Show();
        self.RewardBackground:Show();
    end
end

local function UpdateTracked(self, id)
    if IsTrackedAchievement(id) then -- Issue #10 : Fix
		self.Check:Show();
		self.Tracked:SetChecked(true);
		self.Tracked:Show();
	else
		self.Check:Hide();
		self.Tracked:SetChecked(false);
		self.Tracked:Hide();
	end

	self:UpdatePlusMinusTexture();
end

function KrowiAF_AchievementButtonMixin:SetAchievement(achievement)
    local id, name, points, completed, month, day, year, description, _, icon, rewardText, _, wasEarnedByMe, _ = addon.GetAchievementInfo(achievement.Id);

    UpdateStatic(self, achievement, id, name, points, completed, month, day, year, description, icon, rewardText, wasEarnedByMe);
    UpdateTracked(self, id);
end