local _, addon = ...;
local savedData = addon.Data.SavedData;
savedData.CharacterData = {};
local characterData = savedData.CharacterData;

function characterData.Load()
    KrowiAF_SavedData.CharacterList = KrowiAF_SavedData.CharacterList or {};
end

function characterData.Upsert(characterGuid)
    KrowiAF_SavedData.CharacterList[characterGuid] = KrowiAF_SavedData.CharacterList[characterGuid] or {};

    local character = KrowiAF_SavedData.CharacterList[characterGuid];
    character.Name = (UnitFullName("player"));
    character.Realm = (select(2, UnitFullName("player")));
    character.Class = (select(2, UnitClass("player")));
    character.Faction = KrowiAF.Enum.Faction[(UnitFactionGroup("player"))];
    character.Points = character.Points or -1;

    return character;
end

function characterData.AddPoints(characterGuid, points)
    KrowiAF_SavedData.CharacterList[characterGuid].Points = KrowiAF_SavedData.CharacterList[characterGuid].Points + points;
end

function characterData.Delete(characterGuid)
    KrowiAF_SavedData.CharacterList[characterGuid] = nil;
end