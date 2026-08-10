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
        extraIcon.Text = nil
        extraIcon.Lines = nil
        extraIcon.Color = nil
        extraIcon.AchievementId = nil
        extraIcon.RewardEntry = nil
        extraIcon.RewardGroup = nil
        extraIcon.OnEnterCallback = nil
        extraIcon.OnLeaveCallback = nil
        extraIcon.OnClickCallback = nil
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

local function SetExtraIconRemix(self, achievement)
	if not achievement.TemporaryObtainable then
		return;
	end

	local remixRecord;
	for _, record in next, achievement.TemporaryObtainable do
		if record.Start and record.Start.Function == "Event" and (record.Start.Value == 1514 or  record.Start.Value == 1640) then
			remixRecord = record;
		end
	end

	if not remixRecord then
		return;
	end

	local extraIcon = factory.Get(self);
	if not extraIcon then
		return;
	end

	extraIcon.Texture:SetAtlas("timerunning-glues-icon");
	local text, occurrence;
	text, extraIcon.Color, occurrence = addon.Data.TemporaryObtainable:GetNotObtainableText(remixRecord);
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

	local record = achievement.TemporaryObtainable[#achievement.TemporaryObtainable];
	local text, color, occurrence = addon.Data.TemporaryObtainable:GetNotObtainableText(record);
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

local function RewardPreviewOnEnter(icon)
	if not addon.Options.db.profile.Achievements.RewardPreviewMouseoverShow then
		return
	end
	local frame = KrowiAF_RewardPreview
	local button = icon:GetParent()
	if frame:IsShown() and frame.Pinned then
		if frame.OwnerButton ~= button then
			return -- something else is pinned; ignore hover elsewhere
		end
		if frame.OwnerEntry == icon.RewardEntry then
			return -- already showing this pinned reward
		end
	end
	addon.Gui.RewardPreview:ShowUnpinned(button, icon.AchievementId, icon.RewardEntry)
end

local function RewardPreviewOnLeave(icon)
	if not addon.Options.db.profile.Achievements.RewardPreviewMouseoverShow then
		return
	end
	addon.Gui.RewardPreview:HideIfUnpinned(icon:GetParent())
end

local function RewardPreviewOnClick(icon)
	-- Sibling entries are only threaded through on click so Prev/Next appear once pinned, not while merely hovering
	local entries = addon.RewardPreviewData.GetPreviewableEntries(icon.AchievementId)
	local entryList = entries and #entries > 1 and entries or nil
	addon.Gui.RewardPreview:TogglePin(icon:GetParent(), icon.AchievementId, icon.RewardEntry, entryList)
end

local function RewardPreviewGroupOnClick(icon)
	addon.Gui.RewardPreview:ShowChooser(icon, icon.AchievementId, icon.RewardGroup)
end

-- One extra icon per previewable reward, so achievements with multiple rewards can all be previewed.
-- Achievements with more than a handful of options (e.g. a "choose any of ~50 mounts" item reward) collapse into a single chooser icon instead.
local function SetExtraIconRewardPreview(self, achievement)
	if not addon.Options.db.profile.Achievements.ShowRewardPreviewIcon then
		return
	end
	if not addon.RewardPreviewData then
		return
	end
	local groups = addon.RewardPreviewData.GetIconGroups(achievement.Id)
	if not groups then
		return
	end

	for _, group in next, groups do
		local extraIcon = factory.Get(self);
		if not extraIcon then
			return
		end

		if group.IsGroup then
			extraIcon.Texture:SetAtlas("crosshair_inspect_32")
			if not addon.Util.IsMainline then
				extraIcon.Texture:SetAtlas("common-search-magnifyingglass")
			end
			extraIcon.Lines = {
				addon.L["Preview Reward"],
				addon.L["Choose one of {count} rewards"]:K_ReplaceVars(tostring(#group.Entries))
			}
			extraIcon.AchievementId = achievement.Id
			extraIcon.RewardGroup = group.Entries
			extraIcon.OnClickCallback = RewardPreviewGroupOnClick
		else
			local entry = group.Entries[1]
			extraIcon.Texture:SetAtlas("crosshair_inspect_32")
			if not addon.Util.IsMainline then
				extraIcon.Texture:SetAtlas("common-search-magnifyingglass")
			end
			extraIcon.Lines = {
				addon.L["Preview Reward"],
				addon.RewardPreviewData.GetLabel(entry)
			}
			extraIcon.AchievementId = achievement.Id
			extraIcon.RewardEntry = entry
			extraIcon.OnEnterCallback = RewardPreviewOnEnter
			extraIcon.OnLeaveCallback = RewardPreviewOnLeave
			extraIcon.OnClickCallback = RewardPreviewOnClick
		end
	end
end

function factory.SetExtraIcons(self, achievement)
    factory.ResetExtraIcons(self);
	SetExtraIconWarband(self, achievement);
	if not SetExtraIconRemix(self, achievement) then
		SetExtraIconEvent(self, achievement);
	end
	SetExtraIconAlwaysVisible(self, achievement);
	SetExtraIconIsWatched(self, achievement);
	SetExtraIconIsExcluded(self, achievement);
	SetExtraIconRewardPreview(self, achievement); -- Always last
end