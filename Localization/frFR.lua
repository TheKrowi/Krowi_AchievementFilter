-- [[ Exported at 2022-11-04 16-53-52 ]] --
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

L["Achievement points earned by"] = "Points de Hauts faits obtenus par";
L["Achievements"] = "Hauts faits";
L["Expansions"] = "Extensions";
L["Events"] = "Évènements";
L["PvP"] = "Joueur contre Joueur";
L["Specials"] = "Spécifique";
L["Merge Small Categories"] = "Fusionner les catégories mineures";
L["Obtainable"] = "Obtenable";
L["Not Obtainable"] = "Non Obtenable";
L["Covenant"] = "Congrégation";
L["ID"] = "ID";
L["Earned By"] = "Obtenu par";
L["Account"] = "Compte";
L["Character only"] = "Personnage uniquement";
L["Tabs"] = "Onglets";
L["Special Categories"] = "Catégorie Spéciale";
L["Current Zone"] = "Zone Actuelle";
L["Selected Zone"] = "Zone Sélectionnée";

