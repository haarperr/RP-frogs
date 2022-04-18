RegisterServerEvent("drp-chopshop:vehicle_loot")
AddEventHandler("drp-chopshop:vehicle_loot", function(string)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local Reward= math.random(1500, 2000)
    if string == "tyre" then
        TriggerClientEvent("player:receiveItem", src, "recyclablematerial", math.random(5, 10), false)
    elseif string == "door" then
        TriggerClientEvent("player:receiveItem", src, "recyclablematerial", math.random(7, 12), false)
    elseif string == "remains" then
        local roll = math.random(1, 2)
        if roll == 1 then
            TriggerClientEvent('DoLongHudText', src, 'Well this one was bad wasnt it ...', 2)
            TriggerClientEvent('player:receiveItem', src, 'recyclablematerial', math.random(12, 20))
        elseif roll == 2 then
            TriggerClientEvent('DoLongHudText', src, 'Well this was good wasnt it ...', 1)
            TriggerClientEvent('player:receiveItem', src, 'recyclablematerial', math.random(20, 35))
        end
    end
end)

RegisterServerEvent("drp-chopshop:registerCar")
AddEventHandler("drp-chopshop:registerCar", function(vehicle)
    TriggerClientEvent("drp-chopchop:markCar", -1, vehicle)
end)