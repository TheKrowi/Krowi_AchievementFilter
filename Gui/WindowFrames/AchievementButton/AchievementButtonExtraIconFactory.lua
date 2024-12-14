local _, addon = ...;
addon.Gui.AchievementButtonExtraIconFactory = {};
local factory = addon.Gui.AchievementButtonExtraIconFactory;

local function SetUsed(extraIcon)
    extraIcon.Used = true;
    extraIcon.Texture:SetVertexColor(1, 1, 1, 1);
    extraIcon:Show();
end

function factory.Get(self)
    if not self.ExtraIcons then
        return factory.GetNew(self);
    end
    for _, extraIcon in next, self.ExtraIcons do
        if not extraIcon.Used then
            SetUsed(extraIcon);
            return extraIcon;
        end
    end
    return factory.GetNew(self);
end

function factory.GetNew(self)
    self.ExtraIcons = self.ExtraIcons or {};
    local extraIconId = #self.ExtraIcons + 1;
    local extraIcon = CreateFrame("Frame", "ExtraIcon" .. extraIconId, self, "KrowiAF_AchievementButtonExtraIcon_Template");
    self.ExtraIcons[extraIconId] = extraIcon;

    if extraIconId == 1 then
        extraIcon:SetPoint("TOP", self.PlusMinus, "BOTTOM", 0, -5);
    elseif self.Compact then
        extraIcon:SetPoint("LEFT", self.ExtraIcons[extraIconId - 1], "RIGHT", 0, 0);
    else
        extraIcon:SetPoint("TOP", self.ExtraIcons[extraIconId - 1], "BOTTOM", 0, -1);
    end

    SetUsed(extraIcon);
    return extraIcon;
end

function factory.ResetExtraIcons(self)
    if not self.ExtraIcons then
        return;
    end
    for _, extraIcon in next, self.ExtraIcons do
        extraIcon.Used = nil;
        extraIcon.Texture:SetVertexColor(1, 1, 1, 1);
        extraIcon.Texture:SetTexCoord(0, 1, 0, 1);
        extraIcon:Hide();
    end
end

local function SetExtraIconAlwaysVisible(self, achievement)
	if not achievement.AlwaysVisible then
		return;
	end

	local extraIcon = factory.Get(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("poi-traveldirections-arrow");
	if not addon.Util.IsMainline then
		extraIcon.Texture:SetAtlas("flightpath");
	end
	extraIcon.Text = addon.L["Achievement shown temporarily"];
end

local function SetExtraIconIsWatched(self, achievement)
	if not achievement.IsWatched then
		return;
	end

	local extraIcon = factory.Get(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("groupfinder-eye-frame");
	extraIcon.Text = addon.L["Achievement is watched"]:K_ReplaceVars(addon.L["Watch List"]);
end

local function SetExtraIconIsExcluded(self, achievement)
	if not achievement.IsExcluded then
		return;
	end

	local extraIcon = factory.Get(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("XMarksTheSpot");
	extraIcon.Text = addon.L["Achievement is excluded"];
end

local function SetExtraIconRemixPandaria(self, achievement)
	if not achievement.TemporaryObtainable
	or not achievement.TemporaryObtainable.Start
	or achievement.TemporaryObtainable.Start.Function ~= "Event"
	or achievement.TemporaryObtainable.Start.Value ~= "1514" then
		return;
	end

	local extraIcon = factory.Get(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("timerunning-glues-icon");
	local text, occurrence;
	text, extraIcon.Color, occurrence = addon.Data.TemporaryObtainable:GetNotObtainableText(achievement);
	extraIcon.Lines = {
		text,
		occurrence
	};
	return true;
end

local function SetExtraIconEvent(self, achievement)
	if not addon.Options.db.profile.Achievements.ShowTemporarilyObtainableIcon or not achievement.TemporaryObtainable then
		return;
	end

	local extraIcon = factory.Get(self);
	if not extraIcon then
		return;
	end

	local text, color, occurrence = addon.Data.TemporaryObtainable:GetNotObtainableText(achievement);
	extraIcon.Color = color;
	extraIcon.Texture:SetAtlas("auctionhouse-icon-clock");
	extraIcon.Texture:SetVertexColor(color.R, color.G, color.B, 1);
	extraIcon.Lines = {
		text,
		occurrence
	};
end

local function SetExtraIconWarband(self, achievement)
	if not addon.Options.db.profile.Achievements.ShowWarbandIcon or not achievement.IsAccountWide then
		return;
	end

	local extraIcon = factory.Get(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetTexture("interface/warbands/uiwarbandsicons");
	extraIcon.Texture:SetTexCoord(0, 0.3671875, 0, 0.45);
	extraIcon.Text = addon.L["Warband Achievement"];
end

function factory.SetExtraIcons(self, achievement)
    factory.ResetExtraIcons(self);
	SetExtraIconWarband(self, achievement);
	if not SetExtraIconRemixPandaria(self, achievement) then
		SetExtraIconEvent(self, achievement);
	end
	SetExtraIconAlwaysVisible(self, achievement);
	SetExtraIconIsWatched(self, achievement);
	SetExtraIconIsExcluded(self, achievement);
end