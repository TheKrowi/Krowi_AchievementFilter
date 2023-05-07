-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.FloatingAchievementTooltip = {};
local floatingAchievementTooltip = gui.FloatingAchievementTooltip;

function floatingAchievementTooltip.Load()
    local tooltip = KrowiAF_FloatingAchievementTooltip;
    hooksecurefunc("SetItemRef", function(link)
        if IsModifiedClick() then
            return;
        end
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
        tooltip.AchievementClick:SetText("[" .. addon.L["Click here to view in achievement window"] .. "]");
        if tooltip:GetWidth() < tooltip.AchievementClick:GetFontString():GetWidth() + 24 then
            tooltip.AchievementClick:SetText("[" .. addon.L["Click here to view in achievements"] .. "]");
        end
        -- tooltip:SetWidth(max(tooltip:GetWidth(), tooltip.AchievementClick:GetFontString():GetWidth() + 24));
        tooltip:SetHeight(tooltip:GetHeight() + 29);
    end);
end

function KrowiAF_FloatingAchievementTooltip_AchievementClick_OnClick(self)
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