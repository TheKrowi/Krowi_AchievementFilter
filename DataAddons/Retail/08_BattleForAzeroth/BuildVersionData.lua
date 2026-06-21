local _, addon = ...

local expansion = KrowiAF.NewBuildVersion("BattleForAzeroth", 8)
local minor = expansion:Minor(0)
minor:Patch(1, addon.L["Battle for Azeroth"])
minor = expansion:Minor(1)
minor:Patch(0, addon.L["Tides of Vengeance"])
minor:Patch(5, addon.L["Tides of Vengeance"])
minor = expansion:Minor(2)
minor:Patch(0, addon.L["Rise of Azshara"])
minor:Patch(5, addon.L["Rise of Azshara"])
minor = expansion:Minor(3)
minor:Patch(0, addon.L["Visions of N'Zoth"])