local chicken = vehicleBaseRepairCost / 3

RegisterServerEvent('drp-bennys:attemptPurchase')
AddEventHandler('drp-bennys:attemptPurchase', function(type, upgradeLevel)
	local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    
    if type == "repair" then
        if user:getCash() >= chicken  then
            user:removeMoney(chicken)
            TriggerClientEvent('drp-bennys:purchaseSuccessful', src, chicken)
        else
            TriggerClientEvent('drp-bennys:purchaseFailed', src)
        end
    elseif type == "performance" then
        if user:getCash() >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('drp-bennys:purchaseSuccessful', src, vehicleCustomisationPrices[type].prices[upgradeLevel])
            user:removeMoney(vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('drp-bennys:purchaseFailed', src)
        end
    else
        if user:getCash() >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('drp-bennys:purchaseSuccessful', src, vehicleCustomisationPrices[type].price)
            user:removeMoney(vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('drp-bennys:purchaseFailed', src)
        end
    end
end)

RegisterServerEvent('drp-bennys:updateRepairCost')
AddEventHandler('drp-bennys:updateRepairCost', function(cost)
    chicken = cost
end)


RegisterServerEvent('royal:bennys:pay1')
AddEventHandler('royal:bennys:pay1', function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)

    if user:getCash() >= 350 then
        user:removeMoney(350)
        TriggerClientEvent('bennys:civ:repair:cl', src)
        TriggerEvent('DoLongHudText', "You Have Been Charged For: $350!", 2)
    else
        TriggerClientEvent('DoLongHudText', src, 'You need $350', 2)
    end
end)
