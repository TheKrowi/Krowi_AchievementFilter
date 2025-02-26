local _, addon = ...;

KrowiAF.TabData = {};

function KrowiAF.InjectTabDataDynamicOptions()
    KrowiAF.RegisterTabDataOptions{"Blizzard_AchievementUI", addon.L["Blizzard"], "Achievements", addon.L["Achievements"], "TOGGLEACHIEVEMENT", false};
    KrowiAF.RegisterTabDataOptions{"Blizzard_AchievementUI", addon.L["Blizzard"], "Guild", addon.L["Guild"], "KrowiAF_OPEN_TAB_Guild", true};
    KrowiAF.RegisterTabDataOptions{"Blizzard_AchievementUI", addon.L["Blizzard"], "Statistics", addon.L["Statistics"], "TOGGLESTATISTICS", true};

    -- Always load KAF tabs first before plugins
    for _, tab in next, KrowiAF.TabData.Base do
        KrowiAF.RegisterTabDataOptions(tab);
    end

    -- Load the plugins
    for _, tabData in next, KrowiAF.TabData do
        for _, tab in next, tabData do
            KrowiAF.RegisterTabDataOptions(tab);
        end
    end
end

local function GetIndexOrInsertTab(addonName, addonDisplayName, tabName, tabDisplayName, bindingName)
    local index;
    for i, tab in next, KrowiAF_SavedData.Tabs do
        if tab.AddonName == addonName and tab.Name == tabName then
            index = i;
        end
    end
    if index == nil then
        tinsert(KrowiAF_SavedData.Tabs, addon.Objects.Tab:NewSavedData(addonName, tabName, bindingName));
        tinsert(KrowiAF_SavedData.TabKeys, addonDisplayName .. " - " .. tabDisplayName);
        index = #KrowiAF_SavedData.TabKeys;
    end
    return index;
end

local function InjectOptionsDefaults(addonName, tabName, showByDefault)
    if showByDefault == nil then
        showByDefault = false;
    end
    if not addon.InjectOptions:DefaultsExists("Tabs." .. addonName) then
        addon.InjectOptions:AddDefaults("Tabs", addonName, { });
    end
    addon.InjectOptions:AddDefaults("Tabs." .. addonName, tabName, {
        Show = showByDefault
    });
end

local function SetOptionsOrder(addonName, tabName, index)
    local options;
    if addon.Options.Defaults then -- Pre options loaded
        options = addon.Options.Defaults.profile.Tabs;
    else -- Post options loaderdata
        options = addon.Options.db.profile.Tabs;
    end
    options[addonName] = options[addonName] or {};
    options[addonName][tabName] = options[addonName][tabName] or {};
    options[addonName][tabName].Order = index;
end

local function SetKeybind(value, command, index)
    local key = select(index, GetBindingKey(command));
    if key then
        SetBinding(key);
    end
    SetBinding(value, command, index);
    SaveBindings(GetCurrentBindingSet());
end

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = addon.InjectOptions.AdjustedWidth;
local function InjectKeyBindingOptionsTable(addonName, addonDisplayName, tabDisplayName, bindingName)
    if not bindingName then
        return;
    end

    if not addon.InjectOptions:TableExists("General.args.KeyBinding.args.Keybindings.args.Tabs.args." .. addonName .. "Header") then
        addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", addonName .. "Header", {
            order = OrderPP(), type = "header",
            name = addonDisplayName
        });
    end
    addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", "Binding" .. OrderPP() .. "Name", {
        order = OrderPP(), type = "description", width = AdjustedWidth(0.93),
        name = addon.L["Toggle"] .. " " .. tabDisplayName .. " "  .. addon.L["tab"]
    });
    addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", "Binding" .. OrderPP() .. "Key1", {
        order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.93),
        name = "", desc = "",
        get = function() return GetBindingKey(bindingName); end,
        set = function(_, value)
            SetKeybind(value, bindingName, 1);
        end
    });
    addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", "Binding" .. OrderPP() .. "Key2", {
        order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.93),
        name = "", desc = "",
        get = function() return select(2, GetBindingKey(bindingName)); end,
        set = function(_, value)
            SetKeybind(value, bindingName, 2);
        end
    });
end

local function GetOrder(index)
    addon.Gui:TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up
    for addonName2, tabs in next, addon.Options.db.profile.Tabs do
        for tabName, tab in next, tabs do
            if tab.Order == index then
                for i, tab2 in next, KrowiAF_SavedData.Tabs do
                    if tab2.AddonName == addonName2 and tab2.Name == tabName then
                        return i;
                    end
                end
            end
        end
    end
end

local function SetOrder(index, value)
    addon.Gui:TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up

    -- We get the addon name and tab name for the selected tab
    local tab = KrowiAF_SavedData.Tabs[value];
    -- print(value, tab.AddonName, tab.Name, addon.Options.db.profile.Tabs[tab.AddonName][tab.Name].Order);

    -- Get the current order
    local order = addon.Options.db.profile.Tabs[tab.AddonName][tab.Name].Order;

    -- This order is new order for old selection
    local aName, tName;
    for addonName2, tabs in next, addon.Options.db.profile.Tabs do
        for tabName, tab2 in next, tabs do
            if tab2.Order == index then
                aName = addonName2;
                tName = tabName;
            end
        end
    end

    addon.Options.db.profile.Tabs[aName][tName].Order = order;
    addon.Options.db.profile.Tabs[tab.AddonName][tab.Name].Order = index;

    addon.Gui:ShowHideTabs();
end

local function InjectTabsOrderOptionsTable(index)
    addon.InjectOptions:AddTable("Layout.args.Tabs.args.Order.args.Order.args", tostring(index), {
        order = index, type = "select", width = AdjustedWidth(1.95),
        name = "",
        values = function() return addon.Gui:TabsOrderGetActiveKeys(); end,
        get = function() return GetOrder(index); end,
        set = function (_, value)
            SetOrder(index, value);
        end
    });
end

local function InjectTabsShowOptionsTable(addonName, addonDisplayName, tabName, tabDisplayName)
    if not addon.InjectOptions:TableExists("Layout.args.Tabs.args.Show.args.Show.args." .. addonName) then
        addon.InjectOptions:AddTable("Layout.args.Tabs.args.Show.args.Show.args", addonName, {
            order = OrderPP(), type = "header",
            name = addonDisplayName
        });
    end
    addon.InjectOptions:AddTable("Layout.args.Tabs.args.Show.args.Show.args", addonName .. tabName, {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(0.95),
        name = tabDisplayName,
        desc = (""):KAF_AddDefaultValueText("Tabs." .. addonName .. "." .. tabName .. ".Show"),
        get = function() return addon.Options.db.profile.Tabs[addonName][tabName].Show; end,
        set = function() addon.Gui:ShowHideTabs(addonName, tabName); end
    });
end

local function InjectOptionsTable(addonName, addonDisplayName, tabName, tabDisplayName, bindingName, index)
    InjectKeyBindingOptionsTable(addonName, addonDisplayName, tabDisplayName, bindingName);
    InjectTabsOrderOptionsTable(index);
    InjectTabsShowOptionsTable(addonName, addonDisplayName, tabName, tabDisplayName);
end

function KrowiAF.RegisterTabDataOptions(tab)
    if tab.IsRegistered then
        return;
    end

    -- Make sure all tables exist
    KrowiAF_SavedData = KrowiAF_SavedData or {};
    KrowiAF_SavedData.TabKeys = KrowiAF_SavedData.TabKeys or {};
    KrowiAF_SavedData.Tabs = KrowiAF_SavedData.Tabs or {};

    local addonName, addonDisplayName, tabName, tabDisplayName, bindingName, showByDefault = unpack(tab);

    local index = GetIndexOrInsertTab(addonName, addonDisplayName, tabName, tabDisplayName, bindingName);

    InjectOptionsDefaults(addonName, tabName, showByDefault);
    SetOptionsOrder(addonName, tabName, index);
    InjectOptionsTable(addonName, addonDisplayName, tabName, tabDisplayName, bindingName, index);

    if bindingName then
        _G["BINDING_NAME_" .. bindingName] = addon.L["Toggle"] .. " " .. tabDisplayName .. " "  .. addon.L["tab"];
    end

    tab.IsRegistered = true;
end

addon.Tabs = {};
addon.TabsOrder = {};
function KrowiAF.LoadTabs()
    -- Always load KAF tabs first before plugins
    for _, tab in next, KrowiAF.TabData.Base do
        KrowiAF.AddTabData(tab);
    end

    -- Load the plugins
    for _, tabData in next, KrowiAF.TabData do
        for _, tab in next, tabData do
            KrowiAF.AddTabData(tab);
        end
    end
end

function KrowiAF.AddTabData(tab)
    if tab.IsLoaded then
        return;
    end

    local _, _, tabName, tabDisplayName, _, _ = unpack(tab);

    addon.Tabs[tabName] = addon.Objects.Tab:New(tabName, tabDisplayName);
    tinsert(addon.TabsOrder, tabName);

    tab.IsLoaded = true;
end