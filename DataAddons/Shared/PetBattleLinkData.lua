local _, addon = ...;
addon.Data.PetBattleLinkData = {};
addon.Data.PetBattleLinkData.Shared = {};
local shared = addon.Data.PetBattleLinkData.Shared;

shared.Link = "https://www.wow-petguide.com/"
shared.Encounter = shared.Link .. "Encounter/";
shared.Section = shared.Link .. "Section/";