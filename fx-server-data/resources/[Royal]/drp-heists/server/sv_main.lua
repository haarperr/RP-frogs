RegisterServerEvent('buy:buyitem')
AddEventHandler('buy:buyitem', function(item, price, amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = user:getCash()

    if tonumber(cash) >= price then
        user:removeMoney(price)
        TriggerClientEvent('buy:success', src, item, amount)
    else
    TriggerEvent('DoLongHudText', 'You dont seem to have enough money.', 2)
    end        
end)

RegisterServerEvent('buy:buyitemPlusCostOneItem')
AddEventHandler('buy:buyitemPlusCostOneItem', function(item, price, itemItRequired, amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = user:getCash()
    if tonumber(cash) >= price then
        TriggerClientEvent('buy:checkIfItem', src, itemItRequired, amount, price)
    else
    TriggerEvent('DoLongHudText', 'You dont seem to have enough money.', 2)
    end        
end)

RegisterServerEvent("buy:removeMoney")
AddEventHandler("buy:removeMoney", function(price)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    user:removeMoney(price)
end)
