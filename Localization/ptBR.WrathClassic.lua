local addonName, addon = ...;
if not addon.Util.IsClassicWithAchievements then
    return;
end
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "ptBR");
if not L then return end

-- [[ https://legacy.curseforge.com/wow/addons/krowi-achievement-filter/localization ]] --
-- [[ Everything after this line is automatically generated from CurseForge and is not meant for manual edit - SOURCETOKEN - AUTOGENTOKEN ]] --

-- [[ Exported at 2025-05-17 22-07-53 ]] --
L["Completed"] = "Completos"
L["EJ_GetInstanceInfo230"] = "Gládio Cruel"
L["EJ_GetInstanceInfo246"] = "Scolomântia"
L["EJ_GetInstanceInfo247"] = "Catacumbas Auchenai"
L["EJ_GetInstanceInfo248"] = "Muralha Fogo do Inferno"
L["EJ_GetInstanceInfo249"] = "Terraço dos Magísteres"