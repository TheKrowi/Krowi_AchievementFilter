local _, addon = ...;
local menuUtil = addon.Gui.MenuUtil;

local rootMenu = LibStub("Krowi_Menu-1.0");

KrowiAF_AchievementFrameFilterButtonClassicMixin = CreateFromMixins(KrowiAF_AchievementFrameFilterButtonMixin);

function KrowiAF_AchievementFrameFilterButtonClassicMixin:OnMouseDown()
    UIMenuButtonStretchMixin.OnMouseDown(self);
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);

    rootMenu:Clear();

    self:CreateMenu(rootMenu);

    rootMenu:Toggle(self, 96, 15);
end

function KrowiAF_AchievementFrameFilterButtonClassicMixin:CreateCheckbox(menu, text, filters, keys, checkTabs)
    menu:AddFull({
        Text = self:GetCheckBoxStateText(text, filters, keys),
        Checked = function()
            return self:KeyIsTrue(filters, keys);
        end,
        Func = function()
            self:OnCheckboxSelect(filters, keys, checkTabs);
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
        end,
        IsNotRadio = true,
        NotCheckable = false,
        KeepShownOnClick = true
    });
end

function KrowiAF_AchievementFrameFilterButtonClassicMixin:CreateRadio(menu, text, filters, keys, checkTabs)
    menu:AddFull({
        Text = text,
        Checked = function()
            return self:KeyEqualsText(text, filters, keys);
        end,
        Func = function()
            self:OnRadioSelect(text, filters, keys, checkTabs);
            rootMenu:SetSelectedName(text);
        end,
        NotCheckable = false,
        KeepShownOnClick = true
    });
end

do -- BuildVersionFilter
    function KrowiAF_AchievementFrameFilterButtonClassicMixin:CreateMinorVersionGroup(majorGroup, filters, major, minor)
        return majorGroup:AddFull({
            Text = major.Major .. "." .. minor.Minor .. ".x",
            Checked = function()
                return self:IsMinorVersionChecked(filters, minor);
            end,
            Func = function()
                self:OnMinorVersionSelect(filters, minor);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            IsNotRadio = true,
            NotCheckable = false,
            KeepShownOnClick = true
        });
    end

    function KrowiAF_AchievementFrameFilterButtonClassicMixin:CreateMajorVersionGroup(version, filters, major)
        return version:AddFull({
            Text = major.Major .. ".x.x",
            Checked = function()
                return self:IsMajorVersionChecked(filters, major);
            end,
            Func = function()
                self:OnMajorVersionSelect(filters, major);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            IsNotRadio = true,
            NotCheckable = false,
            KeepShownOnClick = true
        });
    end

    function KrowiAF_AchievementFrameFilterButtonClassicMixin:CreateSelectDeselectAllVersions(version, filters)
        menuUtil:CreateDivider(version);
        version:AddFull({
            Text = addon.L["Select All"],
            Func = function()
                self:OnAllVersionsSelect(filters, true);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            KeepShownOnClick = true
        });
        version:AddFull({
            Text = addon.L["Deselect All"],
            Func = function()
                self:OnAllVersionsSelect(filters, false);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            KeepShownOnClick = true
        });
    end

    function KrowiAF_AchievementFrameFilterButtonClassicMixin:CreateBuildVersionFilter(menu, filters)
        local version = addon.Objects.MenuItem:New(addon.L["Version"]);
        self:CreateBuildVersionFilterGroups(version, filters);
        menu:Add(version);
    end
end

function KrowiAF_AchievementFrameFilterButtonClassicMixin:CreateSelectDeselectAllFactions(menu, text, filters, value)
    menu:AddFull({
        Text = text,
        Func = function()
            self:SetFactionFilters(filters, value);
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
        end,
        KeepShownOnClick = true
    });
end

function KrowiAF_AchievementFrameFilterButtonClassicMixin:HelpShowTutorial(index)
    rootMenu:Close();
    addon.Tutorials.FeaturesTutorial:ShowTutorial(index);
end