RegisterServerEvent('buy:buyitem')
AddEventHandler('buy:buyitem', function(item, price, amount)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cash = user:getCash()

    if tonumber(cash) >= price then
        user:removeMoney(price)
        TriggerEvent('player:receiveItem', item, amount)
    else
    TriggerEvent('DoLongHudText', 'You dont seem to have enough money.', 2)
    end        
end)
