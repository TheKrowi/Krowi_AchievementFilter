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

local function GetChainEnd(popout)
	local node = popout;
	while node.SnappedChild do
		node = node.SnappedChild;
	end
	return node;
end

-- exclude is the just-created popout itself, which is already in OpenPopouts by the time this runs
local function FindOpenRoot(self, exclude)
	for _, popout in pairs(self.OpenPopouts) do
		if popout ~= exclude and not popout.SnappedParent then
			return popout;
		end
	end
	return nil;
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
	if PersistenceEnabled() then
		-- Created up front (rather than after positioning) so OnSnapped below has a table to save SnappedParentId into
		SavedPopouts()[achievement.Id] = saved or {};
	end
	popout:ClearAllPoints();
	if saved and saved.Point then
		popout:SetPoint(saved.Point, UIParent, saved.RelativePoint, saved.X, saved.Y);
		popout:SetWidth((RememberSizeEnabled() and saved.Width) or addon.Options.db.profile.Popout.DefaultWidth);
		-- A saved raw screen position can fall outside the current resolution/UI scale (e.g. after
		-- changing monitors or UIParent scale) and would otherwise silently restore off-screen
		ValidateFramePosition(popout);
	else
		-- Opening a new one while others are already up stacks it onto the end of a chain instead of
		-- reopening dead-center: prefer the chain most recently moved, else any other currently open chain
		local lastRootId = KrowiAF_SavedData.LastPopoutPosition and KrowiAF_SavedData.LastPopoutPosition.AchievementId;
		local root = not isFirstPopout and RememberLastPositionEnabled()
			and ((lastRootId ~= achievement.Id and self.OpenPopouts[lastRootId]) or FindOpenRoot(self, popout));
		local attachTarget = root and GetChainEnd(root);

		if attachTarget then
			popout:SnapFrame_AttachTo(attachTarget, true); -- also force-matches the chain's width
			self:OnSnapped(popout, attachTarget);
		else
			local lastPosition = isFirstPopout and RememberLastPositionEnabled() and KrowiAF_SavedData.LastPopoutPosition;
			if lastPosition and lastPosition.Point then
				popout:SetPoint(lastPosition.Point, UIParent, lastPosition.RelativePoint, lastPosition.X, lastPosition.Y);
			else
				popout:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
			end
			popout:SetWidth((RememberSizeEnabled() and saved and saved.Width) or addon.Options.db.profile.Popout.DefaultWidth);
		end
	end
	popout:Show();
	-- Deferred a frame: GetTop()/GetBottom() on the criteria rows need the UI to have actually
	-- rendered this frame at least once (SetPoint/Show alone isn't enough on a brand new frame)
	C_Timer.After(0, function()
		if popout:IsShown() then
			popout:PopulateAchievement(achievement);
		end
	end);

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
	KrowiAF_SavedData.LastPopoutPosition = {Point = point, RelativePoint = relativePoint, X = x, Y = y, AchievementId = popout.AchievementId};
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
		else
			-- Leave the saved entry in place (rather than silently dropping it) in case this is a
			-- transient data-load timing issue rather than a genuinely removed/renamed achievement id
			addon.Diagnostics.Debug("AchievementPopout:Load - achievement " .. id .. " not found, skipping restore");
		end
	end

	-- Re-establish snap chains now that every saved popout exists as a frame
	local saved = SavedPopouts();

	-- A stale/cyclic SnappedParentId (e.g. from a since-fixed bug) would make SetPoint anchor a
	-- frame to a region dependent on itself; detect via the saved ids (before any live attaching) and break it
	for id, savedEntry in next, saved do
		if savedEntry.SnappedParentId then
			local seen, current = {[id] = true}, savedEntry.SnappedParentId;
			local isCyclic = false;
			while current do
				if seen[current] then
					isCyclic = true;
					break;
				end
				seen[current] = true;
				current = saved[current] and saved[current].SnappedParentId;
			end
			if isCyclic then
				addon.Diagnostics.Debug("AchievementPopout:Load - broke cyclic SnappedParentId chain at " .. id, true);
				savedEntry.SnappedParentId = nil;
			end
		end
	end

	for id, savedEntry in next, saved do
		if savedEntry.SnappedParentId then
			local child = self.OpenPopouts[id];
			local parent = self.OpenPopouts[savedEntry.SnappedParentId];
			if child and parent then
				child:SnapFrame_AttachTo(parent, true);
			end
		end
	end
end
