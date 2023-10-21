local _, addon = ...;
addon.Gui.FloatingAchievementTooltip = {};
local floatingAchievementTooltip = addon.Gui.FloatingAchievementTooltip;

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
        tooltip.AchievementLink:SetText("[" .. addon.L["Click here to view in achievement window"] .. "]");
        if tooltip:GetWidth() < tooltip.AchievementLink:GetFontString():GetWidth() + 24 then
            tooltip.AchievementLink:SetText("[" .. addon.L["Click here to view in achievements"] .. "]");
        end
        tooltip:SetHeight(tooltip:GetHeight() + 29);
    end);
end