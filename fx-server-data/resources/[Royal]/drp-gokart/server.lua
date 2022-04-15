RegisterNetEvent("drp-gokart:pay")
AddEventHandler("drp-gokart:pay", function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= 500 then
        user:removeMoney(500)
		TriggerClientEvent("drp-gokart:recievekart", source)
    else
        TriggerClientEvent('DoLongHudText', source, 'You need 500$', 2)
	end
end)