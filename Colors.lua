-- [[ Namespaces ]] --
local _, addon = ...;
addon.Colors = {};
local colors = addon.Colors;

function colors.SetTextColor(text, color)
    return string.format(color, text);
end

function colors.RemoveColor(text)
    text = string.gsub(text or "", "|c[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]", "");
    text = string.gsub(text or "", "|r", "");
    return text;
end

function colors.RGBPrct2HEX(r, g, b, a)
    if type(r) == "table" then
        -- When only r is provided, g can act as the alpha value if r only contains rgb
        a = r.A == nil and (g == nil and 1 or g) or r.A;
        b = r.B;
        g = r.G;
        r = r.R;
    end
    local hex = "";
    for _, v in next, {a, r, g, b} do
		local h = string.format("%02x", math.floor(v * 255));
		hex = hex .. h;
	end
	return hex;
end

colors.AddonBlue = "|cFF1D92C2%s|r";

colors.GreenRGB = { R = QuestDifficultyColors["standard"].r, G = QuestDifficultyColors["standard"].g, B = QuestDifficultyColors["standard"].b }
colors.LightGreenRGB = { R = QuestDifficultyHighlightColors["standard"].r, G = QuestDifficultyHighlightColors["standard"].g, B = QuestDifficultyHighlightColors["standard"].b }
colors.GreyRGB = { R = QuestDifficultyColors["trivial"].r, G = QuestDifficultyColors["trivial"].g, B = QuestDifficultyColors["trivial"].b }
colors.LightGreyRGB = { R = QuestDifficultyHighlightColors["trivial"].r, G = QuestDifficultyHighlightColors["trivial"].g, B = QuestDifficultyHighlightColors["trivial"].b }
colors.RedRGB = { R = QuestDifficultyColors["impossible"].r, G = QuestDifficultyColors["impossible"].g, B = QuestDifficultyColors["impossible"].b }
colors.LightRedRGB = { R = QuestDifficultyHighlightColors["impossible"].r, G = QuestDifficultyHighlightColors["impossible"].g, B = QuestDifficultyHighlightColors["impossible"].b }
colors.OrangeRGB = { R = QuestDifficultyColors["verydifficult"].r, G = QuestDifficultyColors["verydifficult"].g, B = QuestDifficultyColors["verydifficult"].b }
colors.LightOrangeRGB = { R = QuestDifficultyHighlightColors["verydifficult"].r, G = QuestDifficultyHighlightColors["verydifficult"].g, B = QuestDifficultyHighlightColors["verydifficult"].b }
colors.YellowRGB = { R = GetFontInfo(GameFontNormal).color.r, G = GetFontInfo(GameFontNormal).color.g, B = GetFontInfo(GameFontNormal).color.b }
colors.WhiteRGB = { R = GetFontInfo(GameFontHighlight).color.r, G = GetFontInfo(GameFontHighlight).color.g, B = GetFontInfo(GameFontHighlight).color.b }

-- Adding functions dynamically to string
local tmpColors = {};
for colorName, color in next, colors do
    if string.find(colorName, "RGB") and type(color) == "table" then
        color.Hex = colors.RGBPrct2HEX(color);
        tmpColors[colorName:sub(1, -4)] = "|c" .. color.Hex .. "%s|r";
        string["SetColor" .. colorName:sub(1, -4)] = function(self)
            return colors.SetTextColor(self, colors[colorName:sub(1, -4)]);
        end
    end
end
addon.Util.DeepCopyTable(tmpColors, colors);
tmpColors = nil;