local _, addon = ...

local expansion = KrowiAF.NewBuildVersion("Shadowlands", 9)
local minor = expansion:Minor(0)
minor:Patch(1, addon.L["Shadowlands (pre-patch)"])
minor:Patch(2, addon.L["Shadowlands"])
minor:Patch(5, addon.L["Shadowlands"])
minor = expansion:Minor(1)
minor:Patch(0, addon.L["Chains of Domination"])
minor:Patch(5, addon.L["Chains of Domination"])
minor = expansion:Minor(2)
minor:Patch(0, addon.L["Eternity's End"])
minor:Patch(5, addon.L["Eternity's End"])
minor:Patch(7, addon.L["Eternity's End"])