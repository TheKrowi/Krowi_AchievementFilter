local addonName, addon = ...

KROWI_LIBMAN:NewAddon(addonName, addon, {
    SetCurrent = true,
    SetUtil = true,
    SetMenuBuilder = true,
    SetMetaData = true,
    InitLocalization = true,
    SilentLocalization = true,
})
addon.ProgressBarLib = KROWI_LIBMAN:GetLibrary('Krowi_ProgressBar_2')
addon.TutorialsLib = KROWI_LIBMAN:GetLibrary('Krowi_Tutorials_3')