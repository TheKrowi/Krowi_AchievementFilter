-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.FloatingAchievementTooltip = {};
local floatingAchievementTooltip = gui.FloatingAchievementTooltip;

function floatingAchievementTooltip.Load()
    local tooltip = KrowiAF_FloatingAchievementTooltip;
    hooksecurefunc("SetItemRef", function(link)
        local type = strsplit(":", link);
        if type ~= "achievement" then
            tooltip:Hide();
            return;
        end
		HideUIPanel(ItemRefTooltip);
        tooltip:Show();
        if not tooltip:IsShown() then
			tooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
		end
        tooltip:ItemRefSetHyperlink(link);
        tooltip:SetHeight(tooltip:GetHeight() + 29);
    end);
end

function KrowiAF_FloatingAchievementTooltip_AchievementClick_OnClick(self)
    local parent = self:GetParent();
    if not parent then
        return;
    end

    local id = parent.info and parent.info.tooltipData and parent.info.tooltipData.id;
    if not id then
        return;
    end

    KrowiAF_SelectAchievementFromID(id);
end