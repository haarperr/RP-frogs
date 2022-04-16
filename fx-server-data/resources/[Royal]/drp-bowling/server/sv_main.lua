RPC = {}


RPC.register("drp-bowling:purchaseItem", function(key, lane)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local money = tonumber(user:getCash())    
    if(lane == true) then
        if money >= tonumber(25) then
            user:removeMoney(25)
            info = {
                lane = key
            }
            TriggerClientEvent("player:receiveItem", src, "bowlingreceipt", 1, true, info)
            value = true
        else
            TriggerClientEvent("DoLongHudText", src, "Not Enough Money", 2)
        end
    else
        if money >= tonumber(50) then
            value = true
            user:removeMoney(50)
            TriggerClientEvent('player:receiveItem', src, 'bowlingball', 1)
        else
            TriggerClientEvent("DoLongHudText", src, "Not Enough Money", 2)
        end
    end
    return value
end)


RPC.register("drp-bowling:getLaneAccess", function(currentid)
    local value = false
    if(currentid == info.lane) then
        value = true
    end
    return value

end)



RegisterServerEvent("drp-bowling:usebowlingball")
AddEventHandler("drp-bowling:usebowlingball" , function()
    TriggerClientEvent('drp-bowling:client:itemused', source)
end)