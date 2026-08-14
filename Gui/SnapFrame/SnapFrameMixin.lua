local _, addon = ...

-- Generic mixin that lets any movable/resizable frame vertically dock ("snap") beneath another
-- frame of the same kind, forming a single-file chain: moving/resizing the top of a chain moves/
-- resizes everything below it (via native anchor propagation plus a one-level-per-frame width
-- cascade), while moving or resizing anything other than the top only detaches that frame (and
-- whatever is still snapped below IT) from whatever was above it.
--
-- Usage (see AchievementPopoutMixin.lua for a worked example):
--   Mixin(self, KrowiAF_SnapFrameMixin)
--   self:InitSnapping({
--       IsEnabled = function() return true end,                    -- optional, default always enabled
--       GetCandidates = function(self) return someFrameTable end,  -- required: frames to test proximity/occupancy against
--       Threshold = 20,                                            -- optional, pixels (number or a function returning one, for live updates)
--       OnSnapped = function(self, parent) end,                    -- optional: fired after self reparents under `parent`
--       OnUnsnapped = function(self) end,                          -- optional: fired after self detaches from its parent
--       OnClosed = function(self, oldParent, oldChild) end,        -- optional: fired from SnapFrame_Close()
--   })
--   -- From the frame's own OnDragStart, BEFORE StartMoving():
--   self:SnapFrame_OnDragStart()
--   -- From the frame's own OnDragStop, AFTER StopMovingOrSizing():
--   self:SnapFrame_OnDragStop()
--   -- From a resize handle's OnMouseDown, BEFORE StartSizing():
--   self:SnapFrame_OnResizeStart()
--   -- From the frame's own OnSizeChanged, after it has set its own width:
--   self:SnapFrame_CascadeWidthToChild()
--   -- From the frame's own OnHide/close handler:
--   self:SnapFrame_Close()

KrowiAF_SnapFrameMixin = {}

local DEFAULT_THRESHOLD = 20

function KrowiAF_SnapFrameMixin:InitSnapping(config)
	self.SnapConfig = config or {};
end

-- True if candidate is self or found while walking down self's own child chain (i.e. would cycle)
local function IsSelfOrDescendant(self, candidate)
	local node = self;
	while node do
		if node == candidate then
			return true;
		end
		node = node.SnappedChild;
	end
	return false;
end

function KrowiAF_SnapFrameMixin:SnapFrame_Freeze()
	local left, top = self:GetLeft(), self:GetTop();
	if not left or not top then
		return;
	end
	self:ClearAllPoints();
	self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top);
end

function KrowiAF_SnapFrameMixin:SnapFrame_AttachTo(parent, matchWidth)
	self:ClearAllPoints();
	self:SetPoint("TOPLEFT", parent, "BOTTOMLEFT", 0, 0);
	self.SnappedParent = parent;
	parent.SnappedChild = self;
	if matchWidth then
		self:SetWidth(parent:GetWidth());
	end
end

function KrowiAF_SnapFrameMixin:SnapFrame_DetachFromParent()
	local parent = self.SnappedParent;
	if not parent then
		return;
	end

	self:SnapFrame_Freeze();
	parent.SnappedChild = nil;
	self.SnappedParent = nil;

	local config = self.SnapConfig;
	if config and config.OnUnsnapped then
		config.OnUnsnapped(self);
	end
end

function KrowiAF_SnapFrameMixin:SnapFrame_CascadeWidthToChild()
	local child = self.SnappedChild;
	if child then
		child:SetWidth(self:GetWidth());
	end
end

-- Relinks neighbors around self (parent<->child, or promotes child to a new independent top if self was the top)
function KrowiAF_SnapFrameMixin:SnapFrame_Close()
	local parent, child = self.SnappedParent, self.SnappedChild;
	if parent then
		parent.SnappedChild = child;
	end
	if child then
		if parent then
			child:SnapFrame_AttachTo(parent, false);
		else
			-- No parent above: child takes self's own vacated spot so the rest of the chain slides up
			-- instead of leaving a gap where self used to be
			local left, top = self:GetLeft(), self:GetTop();
			if left and top then
				child:ClearAllPoints();
				child:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top);
			else
				child:SnapFrame_Freeze();
			end
			child.SnappedParent = nil;
		end
	end
	self.SnappedParent, self.SnappedChild = nil, nil;

	local config = self.SnapConfig;
	if config and config.OnClosed then
		config.OnClosed(self, parent, child);
	end
end

function KrowiAF_SnapFrameMixin:SnapFrame_ShowIndicator()
	if not self.SnapFrame_Indicator then
		local indicator = self:CreateTexture(nil, "OVERLAY");
		indicator:SetColorTexture(1, 0.82, 0, 0.9);
		indicator:SetHeight(2);
		indicator:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, -1);
		indicator:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, -1);
		self.SnapFrame_Indicator = indicator;
	end
	self.SnapFrame_Indicator:Show();
end

function KrowiAF_SnapFrameMixin:SnapFrame_HideIndicator()
	if self.SnapFrame_Indicator then
		self.SnapFrame_Indicator:Hide();
	end
end

local function FindSnapTarget(self, threshold)
	local config = self.SnapConfig;
	local candidates = config.GetCandidates and config.GetCandidates(self);
	if not candidates then
		return nil;
	end

	local selfLeft, selfTop, selfRight = self:GetLeft(), self:GetTop(), self:GetRight();
	if not selfLeft or not selfTop or not selfRight then
		return nil;
	end

	local closest, closestGap;
	for _, other in pairs(candidates) do
		if not IsSelfOrDescendant(self, other) then
			local otherBottom, otherLeft, otherRight = other:GetBottom(), other:GetLeft(), other:GetRight();
			if otherBottom and otherLeft and otherRight and selfLeft < otherRight and selfRight > otherLeft then
				local gap = abs(selfTop - otherBottom);
				if gap <= threshold and (not closestGap or gap < closestGap) then
					closest, closestGap = other, gap;
				end
			end
		end
	end
	return closest;
end

local function ClearHighlight(self)
	if self.SnapFrame_HighlightedTarget then
		self.SnapFrame_HighlightedTarget:SnapFrame_HideIndicator();
		self.SnapFrame_HighlightedTarget = nil;
	end
end

-- Detection/highlight runs continuously while dragging; the actual reparent is applied on release
-- (avoids fighting the native StartMoving() cursor-follow every frame)
local function OnDragUpdate(self)
	local config = self.SnapConfig;
	if (config.IsEnabled and not config.IsEnabled()) or IsAltKeyDown() then
		ClearHighlight(self);
		self.SnapFrame_PendingTarget = nil;
		return;
	end

	local threshold = config.Threshold;
	if type(threshold) == "function" then
		threshold = threshold();
	end
	local target = FindSnapTarget(self, threshold or DEFAULT_THRESHOLD);
	if target ~= self.SnapFrame_HighlightedTarget then
		ClearHighlight(self);
		if target then
			target:SnapFrame_ShowIndicator();
			self.SnapFrame_HighlightedTarget = target;
		end
	end
	self.SnapFrame_PendingTarget = target;
end

function KrowiAF_SnapFrameMixin:SnapFrame_OnDragStart()
	self:SnapFrame_DetachFromParent();
	self:SetScript("OnUpdate", OnDragUpdate);
end

function KrowiAF_SnapFrameMixin:SnapFrame_OnDragStop()
	self:SetScript("OnUpdate", nil);
	ClearHighlight(self);

	local target = self.SnapFrame_PendingTarget;
	self.SnapFrame_PendingTarget = nil;
	if not target then
		return;
	end

	local displacedChild = target.SnappedChild;
	self:SnapFrame_AttachTo(target, true);
	if displacedChild and displacedChild ~= self then
		displacedChild:SnapFrame_AttachTo(self, true);
		-- displacedChild's own parent link changed too; without this its persisted SnappedParentId
		-- would keep pointing at target, eventually producing a stale/cyclic saved chain
		local displacedConfig = displacedChild.SnapConfig;
		if displacedConfig and displacedConfig.OnSnapped then
			displacedConfig.OnSnapped(displacedChild, self);
		end
	end

	local config = self.SnapConfig;
	if config and config.OnSnapped then
		config.OnSnapped(self, target);
	end
end

function KrowiAF_SnapFrameMixin:SnapFrame_OnResizeStart()
	self:SnapFrame_DetachFromParent();
end
