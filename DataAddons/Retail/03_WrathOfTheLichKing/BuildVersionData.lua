local _, addon = ...

local expansion = KrowiAF.NewBuildVersion("WrathOfTheLichKing", 3)
local minor = expansion:Minor(0)
minor:Patch(2, addon.L["Wrath of the Lich King"])
minor = expansion:Minor(1)
minor:Patch(0, addon.L["Secrets of Ulduar"])
minor = expansion:Minor(2)
minor:Patch(0, addon.L["Call of the Crusade"])
minor:Patch(2, addon.L["Call of the Crusade"])
minor = expansion:Minor(3)
minor:Patch(0, addon.L["Fall of the Lich King"])
minor:Patch(3, addon.L["Fall of the Lich King"])
minor:Patch(5, addon.L["Defending the Ruby Sanctum"])