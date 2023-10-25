local _, addon = ...;
addon.Objects.SaturationStyle = {};
local saturationStyle = addon.Objects.SaturationStyle;

saturationStyle.__index = saturationStyle;
function saturationStyle:New(useThis, style, bordersTexture, headerBackgroundTexture, headerBackgroundCoords, getBackdropBorderColor)
    local instance = setmetatable({}, saturationStyle);
    instance.UseThis = useThis or function()
        return true;
    end;
    instance.Style = style or "normal";
    instance.BordersTexture = bordersTexture or "Interface/AchievementFrame/UI-Achievement-Borders";
    instance.HeaderBackgroundTexture = headerBackgroundTexture or instance.BordersTexture;
    instance.HeaderBackgroundCoords = {
        Saturated = headerBackgroundCoords and headerBackgroundCoords.Saturated or {0, 1, 0.66015625, 0.73828125},
        Desaturated = headerBackgroundCoords and headerBackgroundCoords.Desaturated or {0, 1, 0.91796875, 0.99609375}
    };
    instance.GetBackdropBorderColor = getBackdropBorderColor or function() return ACHIEVEMENT_GOLD_BORDER_COLOR; end
    return instance;
end