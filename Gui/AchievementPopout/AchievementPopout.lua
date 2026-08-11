local _, addon = ...;
addon.Gui.AchievementPopout = {
	OpenPopouts = {} -- [achievementId] = popout frame
};
local achievementPopout = addon.Gui.AchievementPopout;

local function PersistenceEnabled()
	return addon.Options.db.profile.Popout.PersistAcrossSessions;
end

local function RememberSizeEnabled()
	return addon.Options.db.profile.Popout.RememberSize;
end

local function RememberLastPositionEnabled()
	return addon.Options.db.profile.Popout.RememberLastPosition;
end

local function SavedPopouts()
	KrowiAF_SavedData.AchievementPopouts = KrowiAF_SavedData.AchievementPopouts or {};
	return KrowiAF_SavedData.AchievementPopouts;
end

-- PLAYER_LOGOUT also fires on /reload; frames get hidden during teardown and must not be treated as a user close
local loggingOut = false
local logoutFrame = CreateFrame("Frame")
logoutFrame:RegisterEvent("PLAYER_LOGOUT")
logoutFrame:SetScript("OnEvent", function() loggingOut = true end)

local function CreatePopout(achievement)
	local name = "KrowiAF_AchievementPopout" .. achievement.Id;
	local popout = _G[name] or CreateFrame("Frame", name, UIParent, "KrowiAF_AchievementPopout_Template");
	popout.AchievementId = achievement.Id;
	return popout;
end

function achievementPopout:IsOpen(id)
	return self.OpenPopouts[id] ~= nil;
end

function achievementPopout:IsPopoutButton(frame, id)
	local popout = self.OpenPopouts[id];
	if not popout then
		return false;
	end
	-- Also matches the small right-click-menu overflow button, which is a direct child of the button clone
	return frame == popout.Button or (frame and frame:GetParent() == popout.Button);
end

function achievementPopout:Open(achievement)
	local existing = self.OpenPopouts[achievement.Id];
	if existing then
		existing:Raise();
		return existing;
	end

	local isFirstPopout = next(self.OpenPopouts) == nil;

	local popout = CreatePopout(achievement);
	self.OpenPopouts[achievement.Id] = popout;

	local saved = PersistenceEnabled() and SavedPopouts()[achievement.Id];
	local lastPosition = isFirstPopout and RememberLastPositionEnabled() and KrowiAF_SavedData.LastPopoutPosition;
	popout:ClearAllPoints();
	if saved and saved.Point then
		popout:SetPoint(saved.Point, UIParent, saved.RelativePoint, saved.X, saved.Y);
	elseif lastPosition and lastPosition.Point then
		popout:SetPoint(lastPosition.Point, UIParent, lastPosition.RelativePoint, lastPosition.X, lastPosition.Y);
	else
		popout:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
	end
	popout:SetWidth((RememberSizeEnabled() and saved and saved.Width) or addon.Options.db.profile.Popout.DefaultWidth);
	popout:Show();
	-- Deferred a frame: GetTop()/GetBottom() on the criteria rows need the UI to have actually
	-- rendered this frame at least once (SetPoint/Show alone isn't enough on a brand new frame)
	C_Timer.After(0, function()
		if popout:IsShown() then
			popout:PopulateAchievement(achievement);
		end
	end);

	if PersistenceEnabled() then
		SavedPopouts()[achievement.Id] = SavedPopouts()[achievement.Id] or {};
	end

	return popout;
end

function achievementPopout:Close(id)
	local popout = self.OpenPopouts[id];
	if popout then
		popout:Hide();
	end
end

local function SaveSnapParent(popout, parent)
	if not PersistenceEnabled() then
		return;
	end
	local saved = SavedPopouts()[popout.AchievementId];
	if not saved then
		return;
	end
	saved.SnappedParentId = parent and parent.AchievementId or nil;
end

function achievementPopout:OnSnapped(popout, parent)
	SaveSnapParent(popout, parent);
end

function achievementPopout:OnUnsnapped(popout)
	SaveSnapParent(popout, nil);
end

function achievementPopout:OnSnapClosed(_, oldParent, oldChild)
	if oldChild then
		SaveSnapParent(oldChild, oldParent);
		if not oldParent then
			-- oldChild was promoted to the new top of the chain; its (now-reflowed) spot is the new last position
			self:SaveLastPosition(oldChild);
		end
	end
end

function achievementPopout:OnPopoutHide(popout)
	self.OpenPopouts[popout.AchievementId] = nil;
	if loggingOut then
		return -- Keep the saved entry so Load() can reopen it next session
	end
	popout:SnapFrame_Close();
	SavedPopouts()[popout.AchievementId] = nil;
end

function achievementPopout:SavePosition(popout)
	if PersistenceEnabled() then
		local point, _, relativePoint, x, y = popout:GetPoint(1);
		local saved = SavedPopouts()[popout.AchievementId] or {};
		saved.Point = point;
		saved.RelativePoint = relativePoint;
		saved.X = x;
		saved.Y = y;
		if RememberSizeEnabled() then
			saved.Width = popout:GetWidth();
		end
		SavedPopouts()[popout.AchievementId] = saved;
	end

	-- A snapped child's screen position is a byproduct of its parent's; only a chain's top sets the last position
	if not popout.SnappedParent then
		self:SaveLastPosition(popout);
	end
end

function achievementPopout:SaveLastPosition(popout)
	if not RememberLastPositionEnabled() then
		return;
	end
	local point, _, relativePoint, x, y = popout:GetPoint(1);
	KrowiAF_SavedData.LastPopoutPosition = {Point = point, RelativePoint = relativePoint, X = x, Y = y};
end

function achievementPopout:RefreshAllChrome()
	for _, popout in pairs(self.OpenPopouts) do
		popout:RefreshChrome();
	end
end

function achievementPopout:Load()
	if not PersistenceEnabled() then
		return;
	end

	local hasSaved = next(SavedPopouts()) ~= nil;
	if not hasSaved then
		return;
	end

	-- The button/objectives templates rely on Blizzard_AchievementUI globals, which aren't guaranteed loaded yet
	if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
		C_AddOns.LoadAddOn("Blizzard_AchievementUI");
	end

	for id in next, SavedPopouts() do
		local achievement = addon.Data.Achievements[id];
		if achievement then
			self:Open(achievement);
		end
	end

	-- Re-establish snap chains now that every saved popout exists as a frame
	for id, saved in next, SavedPopouts() do
		if saved.SnappedParentId then
			local child = self.OpenPopouts[id];
			local parent = self.OpenPopouts[saved.SnappedParentId];
			if child and parent then
				child:SnapFrame_AttachTo(parent, true);
			end
		end
	end
end
