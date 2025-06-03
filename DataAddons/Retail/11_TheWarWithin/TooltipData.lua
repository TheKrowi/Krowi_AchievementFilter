local _, addon = ...;
local shared = addon.Data.TooltipData.Shared;
local type = Enum.TooltipDataType;

KrowiAF.TooltipData.TheWarWithin = {
    { -- Isle of Dorn Basic / Advanced / Reverse
        {40316, 40317, 40318, 40319, 40320, 40321, 40322, 40323, 40324}, type.Unit,
        {
            {1, 219542}, -- Dornogal Drift
            {2, 219544}, -- Storm's Watch Survey
            {3, 219547}, -- Basin Bypass
            {4, 219548}, -- The Wold Ways
            {5, 219549}, -- Thunderhead Trail
            {6, 219550}, -- Orecreg's Doglegs
        }
    },
};