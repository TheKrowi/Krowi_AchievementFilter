local _, addon = ...

local expansion = KrowiAF.NewBuildVersion("Midnight", 12)
local minor = expansion:Minor(0)
minor:Patch(0, addon.L["Midnight"])
minor:Patch(5, addon.L["Lingering Shadows"])
minor:Patch(7, addon.L["Revelations"])
expansion:Register()