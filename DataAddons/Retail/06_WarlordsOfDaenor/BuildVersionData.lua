local _, addon = ...

local expansion = KrowiAF.NewBuildVersion("WarlordsOfDaenor", 6)
local minor = expansion:Minor(0)
minor:Patch(2, addon.L["Warlords of Draenor"])
minor = expansion:Minor(1)
minor:Patch(0, addon.L["Garrisons Update"])
minor = expansion:Minor(2)
minor:Patch(0, addon.L["Fury of Hellfire"])
minor:Patch(2, addon.L["Fury of Hellfire"])
expansion:Register()