local addonName, addon = ...

KROWI_LIBMAN:NewAddon(addonName, addon, {
    SetCurrent = true,
    SetUtil = true,
    SetMenuBuilder = true,
    SetMetaData = true,
    InitLocalization = true,
})