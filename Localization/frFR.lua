-- [[ Exported at 2022-10-16 10-12-17 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ French translation by Renko, 2022-08-22 ]] --

-- [[ Namespaces ]] --
local addonName, addon = ...;
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "frFR");
if not L then return end

local tab = "|T:1:8|t";
L["TAB"] = tab;

-- Load strings into the localization that are already localized by Blizzard
addon.ExtraWrathStrings.frFR.Load(L);
addon.GlobalStrings.Load(L);
addon.Plugins:LoadLocalization(L);


