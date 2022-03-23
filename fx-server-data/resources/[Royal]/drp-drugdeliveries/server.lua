RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= money then
        user:removeMoney(money)

		TriggerClientEvent("oxydelivery:startDealing", source)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough money little stupid fucking bitch.', 2)
	end
end)

RegisterServerEvent('mission:completed')
AddEventHandler('mission:completed', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)
    user:addMoney(money)
end)


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
end)