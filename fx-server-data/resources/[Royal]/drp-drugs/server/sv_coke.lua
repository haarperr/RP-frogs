
local RoyalCocainePlaneCanBeStarted = true

RegisterServerEvent('drp-cocaine:plane:start')
AddEventHandler('drp-cocaine:plane:start', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)

	if user:getCash() >= money then
        
        if RoyalCocainePlaneCanBeStarted then
            user:removeMoney(money)
            RoyalCocainePlaneCanBeStarted = false
            TriggerClientEvent('drp-cocaine:shitfuckoff', src)
        else
            TriggerClientEvent('DoLongHudText', src, 'Someone is already out on a job cuz', 2)
        end
    else
        TriggerClientEvent('DoLongHudText', src, 'You do not have enough cash for this !', 2)
    end
end)

RegisterServerEvent('drp-cocaine:plane:shit')
AddEventHandler('drp-cocaine:plane:shit', function()
    RoyalCocainePlaneCanBeStarted = true
end)