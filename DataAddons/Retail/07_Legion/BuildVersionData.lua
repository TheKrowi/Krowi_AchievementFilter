local _, addon = ...

local expansion = KrowiAF.NewBuildVersion("Legion", 7)
local minor = expansion:Minor(0)
minor:Patch(3, addon.L["Legion"])
minor = expansion:Minor(2)
minor:Patch(0, addon.L["The Tomb of Sargeras"])
minor:Patch(5, addon.L["The Tomb of Sargeras"])
minor = expansion:Minor(3)
minor:Patch(0, addon.L["Shadows of Argus"])
minor:Patch(2, addon.L["Shadows of Argus"])
minor:Patch(5, addon.L["Shadows of Argus"])
expansion:Register()