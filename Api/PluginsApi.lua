KrowiAF.PluginsApi = {};
local pluginsApi = KrowiAF.PluginsApi;
pluginsApi.Plugins = {};

function pluginsApi:RegisterPlugin(pluginName, plugin)
    self.Plugins[pluginName] = plugin;
end

local loadHelper = CreateFrame("Frame");
function loadHelper:OnEvent(event, arg1, arg2)
    for _, plugin in next, pluginsApi.Plugins do
        if type(plugin.OnEvent) == "function" then
            plugin:OnEvent(event, arg1, arg2);
        end
    end
end
loadHelper:SetScript("OnEvent", loadHelper.OnEvent);

function pluginsApi:RegisterEvent(event)
    loadHelper:RegisterEvent(event);
end

function pluginsApi:LoadPluginLocalization(L)
    for _, plugin in next, self.Plugins do
        if type(plugin.LoadLocalization) == "function" then
            plugin:LoadLocalization(L);
        end
    end
end

function pluginsApi:InjectPluginOptions()
    for _, plugin in next, self.Plugins do
        if type(plugin.InjectOptions) == "function" then
            plugin:InjectOptions();
        end
    end
end

function pluginsApi:LoadPlugins()
    for _, plugin in next, self.Plugins do
        if type(plugin.Load) == "function" then
            plugin:Load();
        end
    end
end

function pluginsApi:AddAchievementRightClickMenuItems(rightClickMenu, achievement)
    for _, plugin in next, self.Plugins do
        if type(plugin.AddAchievementRightClickMenuItems) == "function" then
            plugin:AddAchievementRightClickMenuItems(rightClickMenu, achievement);
        end
    end
end