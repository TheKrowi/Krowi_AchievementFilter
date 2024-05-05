local _, addon = ...;
local objects = addon.Objects;
local fac = objects.Faction;
local tdt = objects.TooltipDataType;
local data = addon.Data;
data.ExportedTooltipData = {};
local exportedTooltipData = data.ExportedTooltipData;

local function AddD(d, id, type, achId, criIdx, nComplTxt, complTxt, faction, decorator)
    d[id] = d[id] or {TooltipLines = {}};
    tinsert(d[id].TooltipLines, {AchievementId = achId, Type = type, CriteriaIndex = criIdx, NotCompletedText = nComplTxt, CompletedText = complTxt, Faction = faction, Decorator = decorator});
end

function exportedTooltipData.Load(d)
    for i, _ in next, d do
        d[i] = nil;
    end

    local t = {};
    t[2] = addon.L["Already /loved for achievement"];
    t[6] = addon.L["Already cooked for achievement"];
    t[8] = addon.L["Already eaten for achievement"];
    t[4] = addon.L["Already killed for achievement"];
    t[10] = addon.L["Already drank for achievement"];
    t[16] = addon.L["Already completed for achievement"];
    t[14] = addon.L["Already petted for achievement"];
    t[12] = addon.L["Already defeated for achievement"];
    t[1] = addon.L["Needs /love for achievement"];
    t[5] = addon.L["Needs to be cooked for achievement"];
    t[7] = addon.L["Needs to be eaten for achievement"];
    t[3] = addon.L["Needs to be killed for achievement"];
    t[9] = addon.L["Needs to be drunk for achievement"];
    t[15] = addon.L["Needs to be completed for achievement"];
    t[13] = addon.L["Needs to be petted for achievement"];
    t[11] = addon.L["Needs to be defeated for achievement"];

    AddD(d, 190123, tdt.Unit, 15696, 0, t[15], t[16]); -- Ruby Lifeshrine Loop: Bronze
    AddD(d, 190123, tdt.Unit, 15697, 0, t[15], t[16]); -- Ruby Lifeshrine Loop: Silver
    AddD(d, 190123, tdt.Unit, 15698, 0, t[15], t[16]); -- Ruby Lifeshrine Loop: Gold
    AddD(d, 190123, tdt.Unit, 15702, 0, t[15], t[16]); -- Ruby Lifeshrine Loop Advanced: Bronze
    AddD(d, 190123, tdt.Unit, 15703, 0, t[15], t[16]); -- Ruby Lifeshrine Loop Advanced: Silver
    AddD(d, 190123, tdt.Unit, 15704, 0, t[15], t[16]); -- Ruby Lifeshrine Loop Advanced: Gold
    AddD(d, 190326, tdt.Unit, 15705, 0, t[15], t[16]); -- Flashfrost Flyover: Bronze
    AddD(d, 190326, tdt.Unit, 15706, 0, t[15], t[16]); -- Flashfrost Flyover: Silver
    AddD(d, 190326, tdt.Unit, 15707, 0, t[15], t[16]); -- Flashfrost Flyover: Gold
    AddD(d, 190326, tdt.Unit, 15709, 0, t[15], t[16]); -- Flashfrost Flyover Advanced: Bronze
    AddD(d, 190326, tdt.Unit, 15710, 0, t[15], t[16]); -- Flashfrost Flyover Advanced: Silver
    AddD(d, 190326, tdt.Unit, 15711, 0, t[15], t[16]); -- Flashfrost Flyover Advanced: Gold
    AddD(d, 190473, tdt.Unit, 15712, 0, t[15], t[16]); -- Wild Preserve Slalom: Bronze
    AddD(d, 190473, tdt.Unit, 15713, 0, t[15], t[16]); -- Wild Preserve Slalom: Silver
    AddD(d, 190473, tdt.Unit, 15714, 0, t[15], t[16]); -- Wild Preserve Slalom: Gold
    AddD(d, 190473, tdt.Unit, 15715, 0, t[15], t[16]); -- Wild Preserve Slalom Advanced: Bronze
    AddD(d, 190473, tdt.Unit, 15716, 0, t[15], t[16]); -- Wild Preserve Slalom Advanced: Silver
    AddD(d, 190473, tdt.Unit, 15717, 0, t[15], t[16]); -- Wild Preserve Slalom Advanced: Gold
    AddD(d, 190503, tdt.Unit, 15718, 0, t[15], t[16]); -- Wild Preserve Circuit: Bronze
    AddD(d, 190503, tdt.Unit, 15719, 0, t[15], t[16]); -- Wild Preserve Circuit: Silver
    AddD(d, 190503, tdt.Unit, 15720, 0, t[15], t[16]); -- Wild Preserve Circuit: Gold
    AddD(d, 190503, tdt.Unit, 15721, 0, t[15], t[16]); -- Wild Preserve Circuit Advanced: Bronze
    AddD(d, 190503, tdt.Unit, 15722, 0, t[15], t[16]); -- Wild Preserve Circuit Advanced: Silver
    AddD(d, 190503, tdt.Unit, 15723, 0, t[15], t[16]); -- Wild Preserve Circuit Advanced: Gold
    AddD(d, 190519, tdt.Unit, 15724, 0, t[15], t[16]); -- Emberflow Flight: Bronze
    AddD(d, 190519, tdt.Unit, 15725, 0, t[15], t[16]); -- Emberflow Flight: Silver
    AddD(d, 190519, tdt.Unit, 15726, 0, t[15], t[16]); -- Emberflow Flight: Gold
    AddD(d, 190519, tdt.Unit, 15727, 0, t[15], t[16]); -- Emberflow Flight Advanced: Bronze
    AddD(d, 190519, tdt.Unit, 15728, 0, t[15], t[16]); -- Emberflow Flight Advanced: Silver
    AddD(d, 190519, tdt.Unit, 15729, 0, t[15], t[16]); -- Emberflow Flight Advanced: Gold
    AddD(d, 190551, tdt.Unit, 15730, 0, t[15], t[16]); -- Apex Canopy River Run: Bronze
    AddD(d, 190551, tdt.Unit, 15731, 0, t[15], t[16]); -- Apex Canopy River Run: Silver
    AddD(d, 190551, tdt.Unit, 15732, 0, t[15], t[16]); -- Apex Canopy River Run: Gold
    AddD(d, 190551, tdt.Unit, 15733, 0, t[15], t[16]); -- Apex Canopy River Run Advanced: Bronze
    AddD(d, 190551, tdt.Unit, 15734, 0, t[15], t[16]); -- Apex Canopy River Run Advanced: Silver
    AddD(d, 190551, tdt.Unit, 15735, 0, t[15], t[16]); -- Apex Canopy River Run Advanced: Gold
    AddD(d, 190667, tdt.Unit, 15736, 0, t[15], t[16]); -- Uktulut Coaster: Bronze
    AddD(d, 190667, tdt.Unit, 15737, 0, t[15], t[16]); -- Uktulut Coaster: Silver
    AddD(d, 190667, tdt.Unit, 15738, 0, t[15], t[16]); -- Uktulut Coaster: Gold
    AddD(d, 190667, tdt.Unit, 15739, 0, t[15], t[16]); -- Uktulut Coaster Advanced: Bronze
    AddD(d, 190667, tdt.Unit, 15740, 0, t[15], t[16]); -- Uktulut Coaster Advanced: Silver
    AddD(d, 190667, tdt.Unit, 15741, 0, t[15], t[16]); -- Uktulut Coaster Advanced: Gold
    AddD(d, 190753, tdt.Unit, 15742, 0, t[15], t[16]); -- Wingrest Roundabout: Bronze
    AddD(d, 190753, tdt.Unit, 15743, 0, t[15], t[16]); -- Wingrest Roundabout: Silver
    AddD(d, 190753, tdt.Unit, 15744, 0, t[15], t[16]); -- Wingrest Roundabout: Gold
    AddD(d, 190753, tdt.Unit, 15745, 0, t[15], t[16]); -- Wingrest Roundabout Advanced: Bronze
    AddD(d, 190753, tdt.Unit, 15746, 0, t[15], t[16]); -- Wingrest Roundabout Advanced: Silver
    AddD(d, 190753, tdt.Unit, 15747, 0, t[15], t[16]); -- Wingrest Roundabout Advanced: Gold
    AddD(d, 190928, tdt.Unit, 15757, 0, t[15], t[16]); -- Sundapple Copse Circuit: Bronze
    AddD(d, 190928, tdt.Unit, 15758, 0, t[15], t[16]); -- Sundapple Copse Circuit: Silver
    AddD(d, 190928, tdt.Unit, 15759, 0, t[15], t[16]); -- Sundapple Copse Circuit: Gold
    AddD(d, 190928, tdt.Unit, 15760, 0, t[15], t[16]); -- Sundapple Copse Circuit Advanced: Bronze
    AddD(d, 190928, tdt.Unit, 15761, 0, t[15], t[16]); -- Sundapple Copse Circuit Advanced: Silver
    AddD(d, 190928, tdt.Unit, 15762, 0, t[15], t[16]); -- Sundapple Copse Circuit Advanced: Gold
    AddD(d, 191121, tdt.Unit, 15763, 0, t[15], t[16]); -- Fen Flythrough: Bronze
    AddD(d, 191121, tdt.Unit, 15764, 0, t[15], t[16]); -- Fen Flythrough: Silver
    AddD(d, 191121, tdt.Unit, 15765, 0, t[15], t[16]); -- Fen Flythrough: Gold
    AddD(d, 191121, tdt.Unit, 15766, 0, t[15], t[16]); -- Fen Flythrough Advanced: Bronze
    AddD(d, 191121, tdt.Unit, 15767, 0, t[15], t[16]); -- Fen Flythrough Advanced: Silver
    AddD(d, 191121, tdt.Unit, 15768, 0, t[15], t[16]); -- Fen Flythrough Advanced: Gold
    AddD(d, 191165, tdt.Unit, 15769, 0, t[15], t[16]); -- Ravine River Run: Bronze
    AddD(d, 191165, tdt.Unit, 15770, 0, t[15], t[16]); -- Ravine River Run: Silver
    AddD(d, 191165, tdt.Unit, 15771, 0, t[15], t[16]); -- Ravine River Run: Gold
    AddD(d, 191165, tdt.Unit, 15772, 0, t[15], t[16]); -- Ravine River Run Advanced: Bronze
    AddD(d, 191165, tdt.Unit, 15773, 0, t[15], t[16]); -- Ravine River Run Advanced: Silver
    AddD(d, 191165, tdt.Unit, 15774, 0, t[15], t[16]); -- "Ravine River Ru, Advanced: Gold"
    AddD(d, 191247, tdt.Unit, 15775, 0, t[15], t[16]); -- Emerald Garden Ascent: Bronze
    AddD(d, 191247, tdt.Unit, 15776, 0, t[15], t[16]); -- Emerald Garden Ascent: Silver
    AddD(d, 191247, tdt.Unit, 15777, 0, t[15], t[16]); -- Emerald Garden Ascent: Gold
    AddD(d, 191247, tdt.Unit, 15778, 0, t[15], t[16]); -- Emerald Garden Ascent Advanced: Bronze
    AddD(d, 191247, tdt.Unit, 15779, 0, t[15], t[16]); -- Emerald Garden Ascent Advanced: Silver
    AddD(d, 191247, tdt.Unit, 15780, 0, t[15], t[16]); -- Emerald Garden Ascent Advanced: Gold
    AddD(d, 191572, tdt.Unit, 15788, 0, t[15], t[16]); -- The Azure Span Sprint: Bronze
    AddD(d, 191572, tdt.Unit, 15789, 0, t[15], t[16]); -- The Azure Span Sprint: Silver
    AddD(d, 191572, tdt.Unit, 15790, 0, t[15], t[16]); -- The Azure Span Sprint: Gold
    AddD(d, 191572, tdt.Unit, 15791, 0, t[15], t[16]); -- The Azure Span Sprint Advanced: Bronze
    AddD(d, 191572, tdt.Unit, 15792, 0, t[15], t[16]); -- The Azure Span Sprint Advanced: Silver
    AddD(d, 191572, tdt.Unit, 15793, 0, t[15], t[16]); -- The Azure Span Sprint Advanced: Gold
    AddD(d, 191947, tdt.Unit, 15799, 0, t[15], t[16]); -- The Azure Span Slalom: Bronze
    AddD(d, 191947, tdt.Unit, 15800, 0, t[15], t[16]); -- The Azure Span Slalom: Silver
    AddD(d, 191947, tdt.Unit, 15801, 0, t[15], t[16]); -- The Azure Span Slalom: Gold
    AddD(d, 191947, tdt.Unit, 15802, 0, t[15], t[16]); -- The Azure Span Slalom Advanced: Bronze
    AddD(d, 191947, tdt.Unit, 15803, 0, t[15], t[16]); -- The Azure Span Slalom Advanced: Silver
    AddD(d, 191947, tdt.Unit, 15804, 0, t[15], t[16]); -- The Azure Span Slalom Advanced: Gold
    AddD(d, 192115, tdt.Unit, 15818, 0, t[15], t[16]); -- The Vakthros Ascent: Bronze
    AddD(d, 192115, tdt.Unit, 15819, 0, t[15], t[16]); -- The Vakthros Ascent: Silver
    AddD(d, 192115, tdt.Unit, 15820, 0, t[15], t[16]); -- The Vakthros Ascent: Gold
    AddD(d, 192115, tdt.Unit, 15821, 0, t[15], t[16]); -- The Vakthros Ascent Advanced: Bronze
    AddD(d, 192115, tdt.Unit, 15822, 0, t[15], t[16]); -- The Vakthros Ascent Advanced: Silver
    AddD(d, 192115, tdt.Unit, 15823, 0, t[15], t[16]); -- The Vakthros Ascent Advanced: Gold
    AddD(d, 192555, tdt.Unit, 15827, 0, t[15], t[16]); -- The Flowing Forest Flight: Bronze
    AddD(d, 192555, tdt.Unit, 15828, 0, t[15], t[16]); -- The Flowing Forest Flight: Silver
    AddD(d, 192555, tdt.Unit, 15829, 0, t[15], t[16]); -- The Flowing Forest Flight: Gold
    AddD(d, 192555, tdt.Unit, 15830, 0, t[15], t[16]); -- The Flowing Forest Flight Advanced: Bronze
    AddD(d, 192555, tdt.Unit, 15831, 0, t[15], t[16]); -- The Flowing Forest Flight Advanced: Silver
    AddD(d, 192555, tdt.Unit, 15832, 0, t[15], t[16]); -- The Flowing Forest Flight Advanced: Gold
    AddD(d, 192886, tdt.Unit, 15835, 0, t[15], t[16]); -- Iskaara Tour: Bronze
    AddD(d, 192886, tdt.Unit, 15836, 0, t[15], t[16]); -- Iskaara Tour: Silver
    AddD(d, 192886, tdt.Unit, 15837, 0, t[15], t[16]); -- Iskaara Tour: Gold
    AddD(d, 192886, tdt.Unit, 15838, 0, t[15], t[16]); -- Iskaara Tour Advanced: Bronze
    AddD(d, 192886, tdt.Unit, 15839, 0, t[15], t[16]); -- Iskaara Tour Advanced: Silver
    AddD(d, 192886, tdt.Unit, 15840, 0, t[15], t[16]); -- Iskaara Tour Advanced: Gold
    AddD(d, 192945, tdt.Unit, 15841, 0, t[15], t[16]); -- Frostland Flyover: Bronze
    AddD(d, 192945, tdt.Unit, 15842, 0, t[15], t[16]); -- Frostland Flyover: Silver
    AddD(d, 192945, tdt.Unit, 15843, 0, t[15], t[16]); -- Frostland Flyover: Gold
    AddD(d, 192945, tdt.Unit, 15844, 0, t[15], t[16]); -- Frostland Flyover Advanced: Bronze
    AddD(d, 192945, tdt.Unit, 15845, 0, t[15], t[16]); -- Frostland Flyover Advanced: Silver
    AddD(d, 192945, tdt.Unit, 15846, 0, t[15], t[16]); -- Frostland Flyover Advanced: Gold
    AddD(d, 193027, tdt.Unit, 15847, 0, t[15], t[16]); -- Archive Ambit: Bronze
    AddD(d, 193027, tdt.Unit, 15848, 0, t[15], t[16]); -- Archive Ambit: Silver
    AddD(d, 193027, tdt.Unit, 15849, 0, t[15], t[16]); -- Archive Ambit: Gold
    AddD(d, 193027, tdt.Unit, 15850, 0, t[15], t[16]); -- Archive Ambit Advanced: Bronze
    AddD(d, 193027, tdt.Unit, 15851, 0, t[15], t[16]); -- Archive Ambit Advanced: Silver
    AddD(d, 193027, tdt.Unit, 15852, 0, t[15], t[16]); -- Archive Ambit Advanced: Gold
    AddD(d, 193651, tdt.Unit, 15855, 0, t[15], t[16]); -- Tyrhold Trial: Bronze
    AddD(d, 193651, tdt.Unit, 15856, 0, t[15], t[16]); -- Tyrhold Trial: Silver
    AddD(d, 193651, tdt.Unit, 15857, 0, t[15], t[16]); -- Tyrhold Trial: Gold
    AddD(d, 193651, tdt.Unit, 15858, 0, t[15], t[16]); -- Tyrhold Trial Advanced: Bronze
    AddD(d, 193651, tdt.Unit, 15859, 0, t[15], t[16]); -- Tyrhold Trial Advanced: Silver
    AddD(d, 193651, tdt.Unit, 15860, 0, t[15], t[16]); -- Tyrhold Trial Advanced: Gold
    AddD(d, 193911, tdt.Unit, 15891, 0, t[15], t[16]); -- Cliffside Circuit: Bronze
    AddD(d, 193911, tdt.Unit, 15892, 0, t[15], t[16]); -- Cliffside Circuit: Silver
    AddD(d, 193911, tdt.Unit, 15893, 0, t[15], t[16]); -- Cliffside Circuit: Gold
    AddD(d, 193911, tdt.Unit, 15894, 0, t[15], t[16]); -- Cliffside Circuit Advanced: Bronze
    AddD(d, 193911, tdt.Unit, 15895, 0, t[15], t[16]); -- Cliffside Circuit Advanced: Silver
    AddD(d, 193911, tdt.Unit, 15896, 0, t[15], t[16]); -- Cliffside Circuit Advanced: Gold
    AddD(d, 193951, tdt.Unit, 15897, 0, t[15], t[16]); -- Academy Ascent: Bronze
    AddD(d, 193951, tdt.Unit, 15898, 0, t[15], t[16]); -- Academy Ascent: Silver
    AddD(d, 193951, tdt.Unit, 15899, 0, t[15], t[16]); -- Academy Ascent: Gold
    AddD(d, 193951, tdt.Unit, 15900, 0, t[15], t[16]); -- Academy Ascent Advanced: Bronze
    AddD(d, 193951, tdt.Unit, 15901, 0, t[15], t[16]); -- Academy Ascent Advanced: Silver
    AddD(d, 193951, tdt.Unit, 15902, 0, t[15], t[16]); -- Academy Ascent Advanced: Gold
    AddD(d, 194348, tdt.Unit, 15903, 0, t[15], t[16]); -- Garden Gallivant: Bronze
    AddD(d, 194348, tdt.Unit, 15904, 0, t[15], t[16]); -- Garden Gallivant: Silver
    AddD(d, 194348, tdt.Unit, 15905, 0, t[15], t[16]); -- Garden Gallivant: Gold
    AddD(d, 194348, tdt.Unit, 15906, 0, t[15], t[16]); -- Garden Gallivant Advanced: Bronze
    AddD(d, 194348, tdt.Unit, 15907, 0, t[15], t[16]); -- Garden Gallivant Advanced: Silver
    AddD(d, 194348, tdt.Unit, 15908, 0, t[15], t[16]); -- Garden Gallivant Advanced: Gold
    AddD(d, 194372, tdt.Unit, 15909, 0, t[15], t[16]); -- Caverns Criss-Cross: Bronze
    AddD(d, 194372, tdt.Unit, 15910, 0, t[15], t[16]); -- Caverns Criss-Cross: Silver
    AddD(d, 194372, tdt.Unit, 15911, 0, t[15], t[16]); -- Caverns Criss-Cross: Gold
    AddD(d, 194372, tdt.Unit, 15912, 0, t[15], t[16]); -- Caverns Criss-Cross Advanced: Bronze
    AddD(d, 194372, tdt.Unit, 15913, 0, t[15], t[16]); -- Caverns Criss-Cross Advanced: Silver
    AddD(d, 194372, tdt.Unit, 15914, 0, t[15], t[16]); -- Caverns Criss-Cross Advanced: Gold
    AddD(d, 196092, tdt.Unit, 16302, 0, t[15], t[16]); -- River Rapids Route: Bronze
    AddD(d, 196092, tdt.Unit, 16303, 0, t[15], t[16]); -- River Rapids Route: Silver
    AddD(d, 196092, tdt.Unit, 16304, 0, t[15], t[16]); -- River Rapids Route: Gold
    AddD(d, 196092, tdt.Unit, 16305, 0, t[15], t[16]); -- River Rapids Route Advanced: Bronze
    AddD(d, 196092, tdt.Unit, 16306, 0, t[15], t[16]); -- River Rapids Route Advanced: Silver
    AddD(d, 196092, tdt.Unit, 16307, 0, t[15], t[16]); -- River Rapids Route Advanced: Gold

    AddD(d, 190123, tdt.Unit, 17120, 0, t[15], t[16]); -- Ruby Lifeshrine Loop Reverse: Bronze
    AddD(d, 190123, tdt.Unit, 17121, 0, t[15], t[16]); -- Ruby Lifeshrine Loop Reverse: Silver
    AddD(d, 190123, tdt.Unit, 17122, 0, t[15], t[16]); -- Ruby Lifeshrine Loop Reverse: Gold
    AddD(d, 190473, tdt.Unit, 17123, 0, t[15], t[16]); -- Wild Preserve Slalom Reverse: Bronze
    AddD(d, 190473, tdt.Unit, 17124, 0, t[15], t[16]); -- Wild Preserve Slalom Reverse: Silver
    AddD(d, 190473, tdt.Unit, 17125, 0, t[15], t[16]); -- Wild Preserve Slalom Reverse: Gold
    AddD(d, 190519, tdt.Unit, 17126, 0, t[15], t[16]); -- Emberflow Flight Reverse: Bronze
    AddD(d, 190519, tdt.Unit, 17127, 0, t[15], t[16]); -- Emberflow Flight Reverse: Silver
    AddD(d, 190519, tdt.Unit, 17128, 0, t[15], t[16]); -- Emberflow Flight Reverse: Gold
    AddD(d, 190551, tdt.Unit, 17129, 0, t[15], t[16]); -- Apex Canopy River Run Reverse: Bronze
    AddD(d, 190551, tdt.Unit, 17130, 0, t[15], t[16]); -- Apex Canopy River Run Reverse: Silver
    AddD(d, 190551, tdt.Unit, 17131, 0, t[15], t[16]); -- Apex Canopy River Run Reverse: Gold
    AddD(d, 190667, tdt.Unit, 17132, 0, t[15], t[16]); -- Uktulut Coaster Reverse: Bronze
    AddD(d, 190667, tdt.Unit, 17133, 0, t[15], t[16]); -- Uktulut Coaster Reverse: Silver
    AddD(d, 190667, tdt.Unit, 17134, 0, t[15], t[16]); -- Uktulut Coaster Reverse: Gold
    AddD(d, 190753, tdt.Unit, 17135, 0, t[15], t[16]); -- Wingrest Roundabout Reverse: Bronze
    AddD(d, 190753, tdt.Unit, 17136, 0, t[15], t[16]); -- Wingrest Roundabout Reverse: Silver
    AddD(d, 190753, tdt.Unit, 17137, 0, t[15], t[16]); -- Wingrest Roundabout Reverse: Gold
    AddD(d, 190326, tdt.Unit, 17138, 0, t[15], t[16]); -- Flashfrost Flyover Reverse: Bronze
    AddD(d, 190326, tdt.Unit, 17139, 0, t[15], t[16]); -- Flashfrost Flyover Reverse: Silver
    AddD(d, 190326, tdt.Unit, 17140, 0, t[15], t[16]); -- Flashfrost Flyover Reverse: Gold
    AddD(d, 190503, tdt.Unit, 17141, 0, t[15], t[16]); -- Wild Preserve Circuit Reverse: Bronze
    AddD(d, 190503, tdt.Unit, 17142, 0, t[15], t[16]); -- Wild Preserve Circuit Reverse: Silver
    AddD(d, 190503, tdt.Unit, 17143, 0, t[15], t[16]); -- Wild Preserve Circuit Reverse: Gold
    AddD(d, 190928, tdt.Unit, 17144, 0, t[15], t[16]); -- Sundapple Copse Circuit Reverse: Bronze
    AddD(d, 190928, tdt.Unit, 17145, 0, t[15], t[16]); -- Sundapple Copse Circuit Reverse: Silver
    AddD(d, 190928, tdt.Unit, 17146, 0, t[15], t[16]); -- Sundapple Copse Circuit Reverse: Gold
    AddD(d, 191121, tdt.Unit, 17147, 0, t[15], t[16]); -- Fen Flythrough Reverse: Bronze
    AddD(d, 191121, tdt.Unit, 17148, 0, t[15], t[16]); -- Fen Flythrough Reverse: Silver
    AddD(d, 191121, tdt.Unit, 17149, 0, t[15], t[16]); -- Fen Flythrough Reverse: Gold
    AddD(d, 191165, tdt.Unit, 17150, 0, t[15], t[16]); -- Ravine River Run Reverse: Bronze
    AddD(d, 191165, tdt.Unit, 17151, 0, t[15], t[16]); -- Ravine River Run Reverse: Silver
    AddD(d, 191165, tdt.Unit, 17152, 0, t[15], t[16]); -- Ravine River Run Reverse: Gold
    AddD(d, 191247, tdt.Unit, 17153, 0, t[15], t[16]); -- Emerald Garden Ascent Reverse: Bronze
    AddD(d, 191247, tdt.Unit, 17154, 0, t[15], t[16]); -- Emerald Garden Ascent Reverse: Silver
    AddD(d, 191247, tdt.Unit, 17155, 0, t[15], t[16]); -- Emerald Garden Ascent Reverse: Gold
    AddD(d, 196092, tdt.Unit, 17156, 0, t[15], t[16]); -- River Rapids Route Reverse: Bronze
    AddD(d, 196092, tdt.Unit, 17157, 0, t[15], t[16]); -- River Rapids Route Reverse: Silver
    AddD(d, 196092, tdt.Unit, 17158, 0, t[15], t[16]); -- River Rapids Route Reverse: Gold
    AddD(d, 191572, tdt.Unit, 17159, 0, t[15], t[16]); -- The Azure Span Sprint Reverse: Bronze
    AddD(d, 191572, tdt.Unit, 17160, 0, t[15], t[16]); -- The Azure Span Sprint Reverse: Silver
    AddD(d, 191572, tdt.Unit, 17161, 0, t[15], t[16]); -- The Azure Span Sprint Reverse: Gold
    AddD(d, 191947, tdt.Unit, 17162, 0, t[15], t[16]); -- The Azure Span Slalom Reverse: Bronze
    AddD(d, 191947, tdt.Unit, 17163, 0, t[15], t[16]); -- The Azure Span Slalom Reverse: Silver
    AddD(d, 191947, tdt.Unit, 17164, 0, t[15], t[16]); -- The Azure Span Slalom Reverse: Gold
    AddD(d, 192115, tdt.Unit, 17165, 0, t[15], t[16]); -- The Vakthros Ascent Reverse: Bronze
    AddD(d, 192115, tdt.Unit, 17166, 0, t[15], t[16]); -- The Vakthros Ascent Reverse: Silver
    AddD(d, 192115, tdt.Unit, 17167, 0, t[15], t[16]); -- The Vakthros Ascent Reverse: Gold
    AddD(d, 192886, tdt.Unit, 17168, 0, t[15], t[16]); -- Iskaara Tour Reverse: Bronze
    AddD(d, 192886, tdt.Unit, 17169, 0, t[15], t[16]); -- Iskaara Tour Reverse: Silver
    AddD(d, 192886, tdt.Unit, 17170, 0, t[15], t[16]); -- Iskaara Tour Reverse: Gold
    AddD(d, 192945, tdt.Unit, 17171, 0, t[15], t[16]); -- Frostland Flyover Reverse: Bronze
    AddD(d, 192945, tdt.Unit, 17172, 0, t[15], t[16]); -- Frostland Flyover Reverse: Silver
    AddD(d, 192945, tdt.Unit, 17173, 0, t[15], t[16]); -- Frostland Flyover Reverse: Gold
    AddD(d, 193027, tdt.Unit, 17174, 0, t[15], t[16]); -- Archive Ambit Reverse: Bronze
    AddD(d, 193027, tdt.Unit, 17175, 0, t[15], t[16]); -- Archive Ambit Reverse: Silver
    AddD(d, 193027, tdt.Unit, 17176, 0, t[15], t[16]); -- Archive Ambit Reverse: Gold
    AddD(d, 192555, tdt.Unit, 17177, 0, t[15], t[16]); -- The Flowing Forest Flight Reverse: Bronze
    AddD(d, 192555, tdt.Unit, 17178, 0, t[15], t[16]); -- The Flowing Forest Flight Reverse: Silver
    AddD(d, 192555, tdt.Unit, 17179, 0, t[15], t[16]); -- The Flowing Forest Flight Reverse: Gold
    AddD(d, 193651, tdt.Unit, 17180, 0, t[15], t[16]); -- Tyrhold Trial Reverse: Bronze
    AddD(d, 193651, tdt.Unit, 17181, 0, t[15], t[16]); -- Tyrhold Trial Reverse: Silver
    AddD(d, 193651, tdt.Unit, 17182, 0, t[15], t[16]); -- Tyrhold Trial Reverse: Gold
    AddD(d, 193911, tdt.Unit, 17183, 0, t[15], t[16]); -- Cliffside Circuit Reverse: Bronze
    AddD(d, 193911, tdt.Unit, 17184, 0, t[15], t[16]); -- Cliffside Circuit Reverse: Silver
    AddD(d, 193911, tdt.Unit, 17185, 0, t[15], t[16]); -- Cliffside Circuit Reverse: Gold
    AddD(d, 193951, tdt.Unit, 17186, 0, t[15], t[16]); -- Academy Ascent Reverse: Bronze
    AddD(d, 193951, tdt.Unit, 17187, 0, t[15], t[16]); -- Academy Ascent Reverse: Silver
    AddD(d, 193951, tdt.Unit, 17188, 0, t[15], t[16]); -- Academy Ascent Reverse: Gold
    AddD(d, 194348, tdt.Unit, 17189, 0, t[15], t[16]); -- Garden Gallivant Reverse: Bronze
    AddD(d, 194348, tdt.Unit, 17190, 0, t[15], t[16]); -- Garden Gallivant Reverse: Silver
    AddD(d, 194348, tdt.Unit, 17191, 0, t[15], t[16]); -- Garden Gallivant Reverse: Gold
    AddD(d, 194372, tdt.Unit, 17192, 0, t[15], t[16]); -- Caverns Criss-Cross Reverse: Bronze
    AddD(d, 194372, tdt.Unit, 17193, 0, t[15], t[16]); -- Caverns Criss-Cross Reverse: Silver
    AddD(d, 194372, tdt.Unit, 17194, 0, t[15], t[16]); -- Caverns Criss-Cross Reverse: Gold
    AddD(d, 200183, tdt.Unit, 17214, 0, t[15], t[16]); -- Stormsunder Crater Circuit: Bronze
    AddD(d, 200183, tdt.Unit, 17215, 0, t[15], t[16]); -- Stormsunder Crater Circuit: Silver
    AddD(d, 200183, tdt.Unit, 17216, 0, t[15], t[16]); -- Stormsunder Crater Circuit: Gold
    AddD(d, 200183, tdt.Unit, 17217, 0, t[15], t[16]); -- Stormsunder Crater Circuit Advanced: Bronze
    AddD(d, 200183, tdt.Unit, 17218, 0, t[15], t[16]); -- Stormsunder Crater Circuit Advanced: Silver
    AddD(d, 200183, tdt.Unit, 17219, 0, t[15], t[16]); -- Stormsunder Crater Circuit Advanced: Gold
    AddD(d, 200183, tdt.Unit, 17220, 0, t[15], t[16]); -- Stormsunder Crater Circuit Reverse: Bronze
    AddD(d, 200183, tdt.Unit, 17221, 0, t[15], t[16]); -- Stormsunder Crater Circuit Reverse: Silver
    AddD(d, 200183, tdt.Unit, 17222, 0, t[15], t[16]); -- Stormsunder Crater Circuit Reverse: Gold
    AddD(d, 200212, tdt.Unit, 17223, 0, t[15], t[16]); -- Morqut Ascent: Bronze
    AddD(d, 200212, tdt.Unit, 17224, 0, t[15], t[16]); -- Morqut Ascent: Silver
    AddD(d, 200212, tdt.Unit, 17225, 0, t[15], t[16]); -- Morqut Ascent: Gold
    AddD(d, 200212, tdt.Unit, 17237, 0, t[15], t[16]); -- Morqut Ascent Advanced: Bronze
    AddD(d, 200212, tdt.Unit, 17238, 0, t[15], t[16]); -- Morqut Ascent Advanced: Silver
    AddD(d, 200212, tdt.Unit, 17239, 0, t[15], t[16]); -- Morqut Ascent Advanced: Gold
    AddD(d, 200212, tdt.Unit, 17240, 0, t[15], t[16]); -- Morqut Ascent Reverse: Bronze
    AddD(d, 200212, tdt.Unit, 17241, 0, t[15], t[16]); -- Morqut Ascent Reverse: Silver
    AddD(d, 200212, tdt.Unit, 17242, 0, t[15], t[16]); -- Morqut Ascent Reverse: Gold
    AddD(d, 200236, tdt.Unit, 17243, 0, t[15], t[16]); -- Aerie Chasm Cruise: Bronze
    AddD(d, 200236, tdt.Unit, 17244, 0, t[15], t[16]); -- Aerie Chasm Cruise: Silver
    AddD(d, 200236, tdt.Unit, 17245, 0, t[15], t[16]); -- Aerie Chasm Cruise: Gold
    AddD(d, 200236, tdt.Unit, 17246, 0, t[15], t[16]); -- Aerie Chasm Cruise Advanced: Bronze
    AddD(d, 200236, tdt.Unit, 17247, 0, t[15], t[16]); -- Aerie Chasm Cruise Advanced: Silver
    AddD(d, 200236, tdt.Unit, 17248, 0, t[15], t[16]); -- Aerie Chasm Cruise Advanced: Gold
    AddD(d, 200236, tdt.Unit, 17249, 0, t[15], t[16]); -- Aerie Chasm Cruise Reverse: Bronze
    AddD(d, 200236, tdt.Unit, 17250, 0, t[15], t[16]); -- Aerie Chasm Cruise Reverse: Silver
    AddD(d, 200236, tdt.Unit, 17251, 0, t[15], t[16]); -- Aerie Chasm Cruise Reverse: Gold
    AddD(d, 200247, tdt.Unit, 17252, 0, t[15], t[16]); -- Southern Reach Route: Bronze
    AddD(d, 200247, tdt.Unit, 17253, 0, t[15], t[16]); -- Southern Reach Route: Silver
    AddD(d, 200247, tdt.Unit, 17254, 0, t[15], t[16]); -- Southern Reach Route: Gold
    AddD(d, 200247, tdt.Unit, 17255, 0, t[15], t[16]); -- Southern Reach Route Advanced: Bronze
    AddD(d, 200247, tdt.Unit, 17256, 0, t[15], t[16]); -- Southern Reach Route Advanced: Silver
    AddD(d, 200247, tdt.Unit, 17257, 0, t[15], t[16]); -- Southern Reach Route Advanced: Gold
    AddD(d, 200247, tdt.Unit, 17258, 0, t[15], t[16]); -- Southern Reach Route Reverse: Bronze
    AddD(d, 200247, tdt.Unit, 17259, 0, t[15], t[16]); -- Southern Reach Route Reverse: Silver
    AddD(d, 200247, tdt.Unit, 17260, 0, t[15], t[16]); -- Southern Reach Route Reverse: Gold
    AddD(d, 200316, tdt.Unit, 17261, 0, t[15], t[16]); -- Caldera Coaster: Bronze
    AddD(d, 200316, tdt.Unit, 17262, 0, t[15], t[16]); -- Caldera Coaster: Silver
    AddD(d, 200316, tdt.Unit, 17263, 0, t[15], t[16]); -- Caldera Coaster: Gold
    AddD(d, 200316, tdt.Unit, 17264, 0, t[15], t[16]); -- Caldera Coaster Advanced: Bronze
    AddD(d, 200316, tdt.Unit, 17265, 0, t[15], t[16]); -- Caldera Coaster Advanced: Silver
    AddD(d, 200316, tdt.Unit, 17266, 0, t[15], t[16]); -- Caldera Coaster Advanced: Gold
    AddD(d, 200316, tdt.Unit, 17267, 0, t[15], t[16]); -- Caldera Coaster Reverse: Bronze
    AddD(d, 200316, tdt.Unit, 17268, 0, t[15], t[16]); -- Caldera Coaster Reverse: Silver
    AddD(d, 200316, tdt.Unit, 17269, 0, t[15], t[16]); -- Caldera Coaster Reverse: Gold
    AddD(d, 200417, tdt.Unit, 17270, 0, t[15], t[16]); -- Forbidden Reach Rush: Bronze
    AddD(d, 200417, tdt.Unit, 17271, 0, t[15], t[16]); -- Forbidden Reach Rush: Silver
    AddD(d, 200417, tdt.Unit, 17272, 0, t[15], t[16]); -- Forbidden Reach Rush: Gold
    AddD(d, 200417, tdt.Unit, 17273, 0, t[15], t[16]); -- Forbidden Reach Rush Advanced: Bronze
    AddD(d, 200417, tdt.Unit, 17274, 0, t[15], t[16]); -- Forbidden Reach Rush Advanced: Silver
    AddD(d, 200417, tdt.Unit, 17275, 0, t[15], t[16]); -- Forbidden Reach Rush Advanced: Gold
    AddD(d, 200417, tdt.Unit, 17276, 0, t[15], t[16]); -- Forbidden Reach Rush Reverse: Bronze
    AddD(d, 200417, tdt.Unit, 17277, 0, t[15], t[16]); -- Forbidden Reach Rush Reverse: Silver
    AddD(d, 200417, tdt.Unit, 17278, 0, t[15], t[16]); -- Forbidden Reach Rush Reverse: Gold

    AddD(d, 202524, tdt.Unit, 17429, 0, t[15], t[16]); -- Crystal Circuit: Bronze
    AddD(d, 202524, tdt.Unit, 17430, 0, t[15], t[16]); -- Crystal Circuit: Silver
    AddD(d, 202524, tdt.Unit, 17431, 0, t[15], t[16]); -- Crystal Circuit: Gold
    AddD(d, 202524, tdt.Unit, 17432, 0, t[15], t[16]); -- Crystal Circuit Advanced: Bronze
    AddD(d, 202524, tdt.Unit, 17433, 0, t[15], t[16]); -- Crystal Circuit Advanced: Silver
    AddD(d, 202524, tdt.Unit, 17434, 0, t[15], t[16]); -- Crystal Circuit Advanced: Gold
    AddD(d, 202524, tdt.Unit, 17435, 0, t[15], t[16]); -- Crystal Circuit Reverse: Bronze
    AddD(d, 202524, tdt.Unit, 17436, 0, t[15], t[16]); -- Crystal Circuit Reverse: Silver
    AddD(d, 202524, tdt.Unit, 17437, 0, t[15], t[16]); -- Crystal Circuit Reverse: Gold
    AddD(d, 202676, tdt.Unit, 17438, 0, t[15], t[16]); -- Caldera Cruise: Bronze
    AddD(d, 202676, tdt.Unit, 17439, 0, t[15], t[16]); -- Caldera Cruise: Silver
    AddD(d, 202676, tdt.Unit, 17440, 0, t[15], t[16]); -- Caldera Cruise: Gold
    AddD(d, 202676, tdt.Unit, 17441, 0, t[15], t[16]); -- Caldera Cruise Advanced: Bronze
    AddD(d, 202676, tdt.Unit, 17442, 0, t[15], t[16]); -- Caldera Cruise Advanced: Silver
    AddD(d, 202676, tdt.Unit, 17443, 0, t[15], t[16]); -- Caldera Cruise Advanced: Gold
    AddD(d, 202676, tdt.Unit, 17444, 0, t[15], t[16]); -- Caldera Cruise Reverse: Bronze
    AddD(d, 202676, tdt.Unit, 17445, 0, t[15], t[16]); -- Caldera Cruise Reverse: Silver
    AddD(d, 202676, tdt.Unit, 17446, 0, t[15], t[16]); -- Caldera Cruise Reverse: Gold
    AddD(d, 202749, tdt.Unit, 17447, 0, t[15], t[16]); -- Brimstone Scramble: Bronze
    AddD(d, 202749, tdt.Unit, 17448, 0, t[15], t[16]); -- Brimstone Scramble: Silver
    AddD(d, 202749, tdt.Unit, 17449, 0, t[15], t[16]); -- Brimstone Scramble: Gold
    AddD(d, 202749, tdt.Unit, 17450, 0, t[15], t[16]); -- Brimstone Scramble Advanced: Bronze
    AddD(d, 202749, tdt.Unit, 17451, 0, t[15], t[16]); -- Brimstone Scramble Advanced: Silver
    AddD(d, 202749, tdt.Unit, 17452, 0, t[15], t[16]); -- Brimstone Scramble Advanced: Gold
    AddD(d, 202749, tdt.Unit, 17453, 0, t[15], t[16]); -- Brimstone Scramble Reverse: Bronze
    AddD(d, 202749, tdt.Unit, 17454, 0, t[15], t[16]); -- Brimstone Scramble Reverse: Silver
    AddD(d, 202749, tdt.Unit, 17455, 0, t[15], t[16]); -- Brimstone Scramble Reverse: Gold
    AddD(d, 202772, tdt.Unit, 17456, 0, t[15], t[16]); -- Shimmering Slalom: Bronze
    AddD(d, 202772, tdt.Unit, 17457, 0, t[15], t[16]); -- Shimmering Slalom: Silver
    AddD(d, 202772, tdt.Unit, 17458, 0, t[15], t[16]); -- Shimmering Slalom: Gold
    AddD(d, 202772, tdt.Unit, 17459, 0, t[15], t[16]); -- Shimmering Slalom Advanced: Bronze
    AddD(d, 202772, tdt.Unit, 17460, 0, t[15], t[16]); -- Shimmering Slalom Advanced: Silver
    AddD(d, 202772, tdt.Unit, 17461, 0, t[15], t[16]); -- Shimmering Slalom Advanced: Gold
    AddD(d, 202772, tdt.Unit, 17462, 0, t[15], t[16]); -- Shimmering Slalom Reverse: Bronze
    AddD(d, 202772, tdt.Unit, 17463, 0, t[15], t[16]); -- Shimmering Slalom Reverse: Silver
    AddD(d, 202772, tdt.Unit, 17464, 0, t[15], t[16]); -- Shimmering Slalom Reverse: Gold
    AddD(d, 202795, tdt.Unit, 17465, 0, t[15], t[16]); -- Loamm Roamm: Bronze
    AddD(d, 202795, tdt.Unit, 17466, 0, t[15], t[16]); -- Loamm Roamm: Silver
    AddD(d, 202795, tdt.Unit, 17467, 0, t[15], t[16]); -- Loamm Roamm: Gold
    AddD(d, 202795, tdt.Unit, 17468, 0, t[15], t[16]); -- Loamm Roamm Advanced: Bronze
    AddD(d, 202795, tdt.Unit, 17469, 0, t[15], t[16]); -- Loamm Roamm Advanced: Silver
    AddD(d, 202795, tdt.Unit, 17470, 0, t[15], t[16]); -- Loamm Roamm Advanced: Gold
    AddD(d, 202795, tdt.Unit, 17471, 0, t[15], t[16]); -- Loamm Roamm Reverse: Bronze
    AddD(d, 202795, tdt.Unit, 17472, 0, t[15], t[16]); -- Loamm Roamm Reverse: Silver
    AddD(d, 202795, tdt.Unit, 17473, 0, t[15], t[16]); -- Loamm Roamm Reverse: Gold
    AddD(d, 202973, tdt.Unit, 17474, 0, t[15], t[16]); -- Sulfur Sprint: Bronze
    AddD(d, 202973, tdt.Unit, 17475, 0, t[15], t[16]); -- Sulfur Sprint: Silver
    AddD(d, 202973, tdt.Unit, 17476, 0, t[15], t[16]); -- Sulfur Sprint: Gold
    AddD(d, 202973, tdt.Unit, 17477, 0, t[15], t[16]); -- Sulfur Sprint Advanced: Bronze
    AddD(d, 202973, tdt.Unit, 17478, 0, t[15], t[16]); -- Sulfur Sprint Advanced: Silver
    AddD(d, 202973, tdt.Unit, 17479, 0, t[15], t[16]); -- Sulfur Sprint Advanced: Gold
    AddD(d, 202973, tdt.Unit, 17480, 0, t[15], t[16]); -- Sulfur Sprint Reverse: Bronze
    AddD(d, 202973, tdt.Unit, 17481, 0, t[15], t[16]); -- Sulfur Sprint Reverse: Silver
    AddD(d, 202973, tdt.Unit, 17482, 0, t[15], t[16]); -- Sulfur Sprint Reverse: Gold

end