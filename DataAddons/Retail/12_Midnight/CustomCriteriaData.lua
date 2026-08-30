local _, addon = ...;
local shared = addon.Data.CustomCriteriaData.Shared;

KrowiAF.CustomCriteriaData.Midnight = {
    { -- Captain Tokka's Crew
        63631,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                -- standing is cumulative over all ranks, unlike the per rank bar the default UI draws
                local friendship = C_GossipInfo.GetFriendshipReputation(2773)
                return friendship and friendship.standing or 0
            end,
            ReqQuantity = 8400 -- Sum of all 5 ranks, no API exposes it
        }
    },
};