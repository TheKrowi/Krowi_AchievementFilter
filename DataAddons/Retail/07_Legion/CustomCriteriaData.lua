local _, addon = ...;
local shared = addon.Data.CustomCriteriaData.Shared;

KrowiAF.CustomCriteriaData.Legion = {
    { -- Free For All, More For Me
        11474,
        {
            NumCriteria = 4,
            ReturnFunc = function(criteriaIndex)
                local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetId, quantityString, criteriaId, eligible = KrowiAF_origGetAchievementCriteriaInfo(11474, criteriaIndex);
                criteriaString, _, _, quantity, reqQuantity, _, _, _, _, _, _ = KrowiAF_origGetAchievementCriteriaInfo(assetId, 1);
                return criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetId, quantityString, criteriaId, eligible;
            end,
        }
    },
    { -- Protector of the Argussian Reach
        12076,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_Reputation.GetFactionDataByID(2170).currentStanding);
            end,
            ReqQuantity = 42000,
        }
    },
    { -- Officer of the Light
        12081,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_Reputation.GetFactionDataByID(2165).currentStanding);
            end,
            ReqQuantity = 42000,
        }
    },
};