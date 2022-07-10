-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.GameTooltipProgressBar = LibStub("Krowi_ProgressBar-1.1"):New(GameTooltip);
local progressBar = gui.GameTooltipProgressBar;

function progressBar:Add(gameTooltip, min, max, value1, value2, value3, value4, color1, color2, color3, color4, text)
	GameTooltip_AddBlankLinesToTooltip(gameTooltip, 1);
	local numLines = gameTooltip:NumLines();
	if not text then
		text = "";
	end
	self:SetPoint("LEFT", gameTooltip:GetName() .. "TextLeft" .. numLines, "LEFT", 0, -2);
	self:SetPoint("RIGHT", gameTooltip, "RIGHT", -9, 0);
	self:SetHeight(25);
	self.TextLeft:SetText(text);
	self:SetMinMaxValues(min, max);
	self:SetValues(value1, value2, value3, value4);
	self:SetColors(color1, color2, color3, color4);
	self:UpdateTextures();
end

function progressBar:Load()
    local preHookFunction = progressBar.Show;
    function progressBar:Show(gameTooltip, min, max, value1, value2, value3, value4, color1, color2, color3, color4, text)
        self:Reset();
        self:Add(gameTooltip, min, max, value1, value2, value3, value4, color1, color2, color3, color4, text);
        preHookFunction(self);
    end
    hooksecurefunc(GameTooltip, "Hide", function(self)
        if progressBar then
            progressBar:Hide();
        end
    end);
end