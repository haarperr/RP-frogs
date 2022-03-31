local chicken = vehicleBaseRepairCost / 2

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
        if user:getCash() >= vehicleCustomisationPrices["performance"].prices[upgradeLevel] then
            if exports['drp-inventory']:hasEnoughOfItem('enginekit', 1) then
                TriggerEvent("inventory:removeItem","enginekit", 1)
                TriggerClientEvent('drp-bennys:purchaseSuccessful', src, vehicleCustomisationPrices["performance"].prices[upgradeLevel])
                user:removeMoney(vehicleCustomisationPrices["performance"].prices[upgradeLevel])
            else
                TriggerClientEvent('drp-bennys:purchaseFailed', src)
            end
        else
            TriggerClientEvent('drp-bennys:purchaseFailed', src)
        end
    elseif type == "brake" then
        if user:getCash() >= vehicleCustomisationPrices["performance"].prices[upgradeLevel] then
            if exports['drp-inventory']:hasEnoughOfItem('brakingkit', 1) then
                TriggerEvent("inventory:removeItem","brakingkit", 1)
                TriggerClientEvent('drp-bennys:purchaseSuccessful', src, vehicleCustomisationPrices["performance"].prices[upgradeLevel])
                user:removeMoney(vehicleCustomisationPrices["performance"].prices[upgradeLevel])
            else
                TriggerClientEvent('drp-bennys:purchaseFailed', src)
            end
        else
            TriggerClientEvent('drp-bennys:purchaseFailed', src)
        end
    elseif type == "transmission" then
        if user:getCash() >= vehicleCustomisationPrices["performance"].prices[upgradeLevel] then
            if exports['drp-inventory']:hasEnoughOfItem('transmissionkit', 1) then
                TriggerEvent("inventory:removeItem","transmissionkit", 1)
                TriggerClientEvent('drp-bennys:purchaseSuccessful', src, vehicleCustomisationPrices["performance"].prices[upgradeLevel])
                user:removeMoney(vehicleCustomisationPrices["performance"].prices[upgradeLevel])
            else
                TriggerClientEvent('drp-bennys:purchaseFailed', src)
            end
        else
            TriggerClientEvent('drp-bennys:purchaseFailed', src)
        end
    elseif type == "sussypention" then
        if user:getCash() >= vehicleCustomisationPrices["performance"].prices[upgradeLevel] then
            if exports['drp-inventory']:hasEnoughOfItem('suspensionkit', 1) then
                TriggerEvent("inventory:removeItem","suspensionkit", 1)
                TriggerClientEvent('drp-bennys:purchaseSuccessful', src, vehicleCustomisationPrices["performance"].prices[upgradeLevel])
                user:removeMoney(vehicleCustomisationPrices["performance"].prices[upgradeLevel])
            else
                TriggerClientEvent('drp-bennys:purchaseFailed', src)
            end
        else
            TriggerClientEvent('drp-bennys:purchaseFailed', src)
        end
    elseif type == "turbo" then
        if user:getCash() >= vehicleCustomisationPrices["performance"].prices[upgradeLevel] then
            if exports['drp-inventory']:hasEnoughOfItem('turbokit', 1) then
                TriggerEvent("inventory:removeItem","turbokit", 1)
                TriggerClientEvent('drp-bennys:purchaseSuccessful', src, vehicleCustomisationPrices["performance"].prices[upgradeLevel])
                user:removeMoney(vehicleCustomisationPrices["performance"].prices[upgradeLevel])
            else
                TriggerClientEvent('drp-bennys:purchaseFailed', src)
            end
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
