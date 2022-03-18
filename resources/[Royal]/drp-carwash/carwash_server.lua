RegisterServerEvent('drp-carwash:checkmoney')
AddEventHandler('drp-carwash:checkmoney', function()
	local src = source
	local player = exports["drp-base"]:getModule("Player"):GetUser(src)
	local costs = 70

	if player:getCash() >= costs then
		TriggerClientEvent("drp-carwash:success", src, costs)
		player:removeMoney(costs)
	else
		moneyleft = costs - player:getCash()
		TriggerClientEvent('drp-carwash:notenoughmoney', src, moneyleft)
	end
end)