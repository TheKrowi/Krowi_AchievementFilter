-- [[ Namespaces ]] --
local addonName, addon = ...;
addon.MetaData = {};
local metaData = addon.MetaData;

metaData.Title = GetAddOnMetadata(addonName, "Title");
metaData.Build = GetBuildInfo();
metaData.Version = GetAddOnMetadata(addonName, "Version");
metaData.BuildVersion = metaData.Build .. "." .. metaData.Version;

metaData.Author = GetAddOnMetadata(addonName, "Author");
metaData.DiscordInviteLink = GetAddOnMetadata(addonName, "X-Discord-Invite-Link");
metaData.DiscordServerName = GetAddOnMetadata(addonName, "X-Discord-Server-Name");
metaData.CurseForge = GetAddOnMetadata(addonName, "X-CurseForge");
metaData.Wago = GetAddOnMetadata(addonName, "X-Wago");
metaData.WoWInterface = GetAddOnMetadata(addonName, "X-WoWInterface");