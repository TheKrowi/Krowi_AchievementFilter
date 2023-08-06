local _, addon = ...;

-- addon.Options = addon.Util.Options:New(addon);
local options = addon.Options;

function options.SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = KrowiAF_GetOptions.GetTable(addon.Metadata.Title, "args.Search.args.SearchPreview.args.NumberOfSearchPreviews");
    numberOfSearchPreviews.max = 17 + math.floor(addon.Options.db.profile.Window.AchievementFrameHeightOffset / 29);
    return numberOfSearchPreviews;
end

string.KAF_InjectAddonName = function(str)
    return str:K_ReplaceVars{addonName = addon.Metadata.Title};
end

string.KAF_AddDefaultValueText = function(str, valuePath, values)
    return str:K_AddDefaultValueText(options.Defaults.profile, valuePath, values);
end